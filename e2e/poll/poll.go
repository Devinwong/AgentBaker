package poll

import (
	"context"
	"fmt"
	"log"
	"strings"
	"time"

	"github.com/Azure/agentbakere2e/client"
	"github.com/Azure/agentbakere2e/exec"
	azureutils "github.com/Azure/agentbakere2e/utils/azure"
	corev1 "k8s.io/api/core/v1"
	metav1 "k8s.io/apimachinery/pkg/apis/meta/v1"
	"k8s.io/apimachinery/pkg/util/wait"
)

const (
	sshErrorExitCode = "255"
)

const (
	// Polling intervals
	execOnVMPollInterval                 = 10 * time.Second
	execOnPodPollInterval                = 10 * time.Second
	extractClusterParametersPollInterval = 10 * time.Second
	extractVMLogsPollInterval            = 10 * time.Second
	getVMPrivateIPAddressPollInterval    = 5 * time.Second

	// Polling timeouts
	execOnVMPollingTimeout                 = 3 * time.Minute
	execOnPodPollingTimeout                = 2 * time.Minute
	extractClusterParametersPollingTimeout = 3 * time.Minute
	extractVMLogsPollingTimeout            = 5 * time.Minute
	getVMPrivateIPAddressPollingTimeout    = 1 * time.Minute
)

func ExecOnVM(ctx context.Context, executor *exec.RemoteCommandExecutor, command string) (*exec.Result, error) {
	var execResult *exec.Result
	err := wait.PollImmediateWithContext(ctx, execOnVMPollInterval, execOnVMPollingTimeout, func(ctx context.Context) (bool, error) {
		res, err := executor.OnVM(command)
		if err != nil {
			log.Printf("unable to execute command on VM: %s", err)

			// fail hard on non-retriable error
			if strings.Contains(err.Error(), "error extracting exit code") {
				return false, err
			}
			return false, nil
		}

		// this denotes a retriable SSH failure
		if res.ExitCode == sshErrorExitCode {
			return false, nil
		}

		execResult = res
		return true, nil
	})

	if err != nil {
		return nil, err
	}

	return execResult, nil
}

// Wraps exctracLogsFromVM and dumpFileMapToDir in a poller with a 15-second wait interval and 5-minute timeout
func ExtractVMLogs(ctx context.Context, executor *exec.RemoteCommandExecutor) (map[string]string, error) {
	var logFiles map[string]string
	err := wait.PollImmediateWithContext(ctx, extractVMLogsPollInterval, extractVMLogsPollingTimeout, func(ctx context.Context) (bool, error) {
		log.Println("attempting to extract VM logs...")

		files, err := exec.ExtractLogsFromVM(ctx, executor)
		if err != nil {
			log.Printf("error extracting VM logs: %q", err)
			return false, nil
		}

		logFiles = files
		return true, nil
	})

	if err != nil {
		return nil, err
	}

	return logFiles, nil
}

func ExecOnPod(ctx context.Context, executor *exec.RemoteCommandExecutor, command []string) (*exec.Result, error) {
	var execResult *exec.Result
	err := wait.PollImmediateWithContext(ctx, execOnPodPollInterval, execOnPodPollingTimeout, func(ctx context.Context) (bool, error) {
		res, err := executor.OnPod(command)
		if err != nil {
			log.Printf("unable to execute command on pod: %s", err)

			// fail hard on non-retriable error
			if strings.Contains(err.Error(), "error extracting exit code") {
				return false, err
			}
			return false, nil
		}

		execResult = res
		return true, nil
	})

	if err != nil {
		return nil, err
	}

	return execResult, nil
}

func ExecOnPriviledgedPod(ctx context.Context, executor *exec.RemoteCommandExecutor, command string) (*exec.Result, error) {
	var execResult *exec.Result
	err := wait.PollImmediateWithContext(ctx, execOnPodPollInterval, execOnPodPollingTimeout, func(ctx context.Context) (bool, error) {
		res, err := executor.OnPrivilegedPod(command)
		if err != nil {
			log.Printf("unable to execute command on priviledged pod: %s", err)

			// fail hard on non-retriable error
			if strings.Contains(err.Error(), "error extracting exit code") {
				return false, err
			}
			return false, nil
		}

		execResult = res
		return true, nil
	})

	if err != nil {
		return nil, err
	}

	return execResult, nil
}

// Wraps extractClusterParameters in a poller with a 10-second wait interval and 3-minute timeout
func ExtractClusterParameters(ctx context.Context, kube *client.Kube, namespace, podName string) (map[string]string, error) {
	var clusterParams map[string]string
	err := wait.PollImmediateWithContext(ctx, extractClusterParametersPollInterval, extractClusterParametersPollingTimeout, func(ctx context.Context) (bool, error) {
		params, err := exec.ExtractClusterParameters(ctx, kube, namespace, podName)
		if err != nil {
			log.Printf("error extracting cluster parameters: %q", err)
			return false, nil
		}
		clusterParams = params
		return true, nil
	})

	if err != nil {
		return nil, err
	}

	return clusterParams, nil
}

func GetVMPrivateIPAddress(ctx context.Context, azureClient *client.Azure, subscription, resourceGroup, vmssName string) (string, error) {
	var vmPrivateIP string
	err := wait.PollImmediateWithContext(ctx, getVMPrivateIPAddressPollInterval, getVMPrivateIPAddressPollingTimeout, func(ctx context.Context) (bool, error) {
		pip, err := azureutils.GetVMPrivateIPAddress(ctx, azureClient, subscription, resourceGroup, vmssName)
		if err != nil {
			log.Printf("encountered an error while getting VM private IP address: %s", err)
			return false, nil
		}
		vmPrivateIP = pip
		return true, nil
	})

	if err != nil {
		return "", err
	}

	return vmPrivateIP, nil
}

func GetNodeName(ctx context.Context, kube *client.Kube, vmssName string) (string, error) {
	var nodeName string
	err := wait.PollImmediateWithContext(ctx, 5*time.Second, 5*time.Minute, func(ctx context.Context) (bool, error) {
		nodes, err := kube.Typed.CoreV1().Nodes().List(ctx, metav1.ListOptions{})
		if err != nil {
			return false, err
		}

		for _, node := range nodes.Items {
			if strings.HasPrefix(node.Name, vmssName) {
				for _, cond := range node.Status.Conditions {
					if cond.Type == corev1.NodeReady && cond.Status == corev1.ConditionTrue {
						nodeName = node.Name
						return true, nil
					}
				}
			}
		}

		return false, nil
	})

	if err != nil {
		return "", fmt.Errorf("failed to find or wait for node to be ready: %w", err)
	}

	return nodeName, nil
}