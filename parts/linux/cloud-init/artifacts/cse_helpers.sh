#!/bin/bash
# ERR_SYSTEMCTL_ENABLE_FAIL=3 Service could not be enabled by systemctl -- DEPRECATED
ERR_SYSTEMCTL_START_FAIL=4 # Service could not be started or enabled by systemctl
ERR_CLOUD_INIT_TIMEOUT=5 # Timeout waiting for cloud-init runcmd to complete
ERR_FILE_WATCH_TIMEOUT=6 # Timeout waiting for a file
ERR_HOLD_WALINUXAGENT=7 # Unable to place walinuxagent apt package on hold during install
ERR_RELEASE_HOLD_WALINUXAGENT=8 # Unable to release hold on walinuxagent apt package after install
ERR_APT_INSTALL_TIMEOUT=9 # Timeout installing required apt packages
ERR_DOCKER_INSTALL_TIMEOUT=20 # Timeout waiting for docker install
ERR_DOCKER_DOWNLOAD_TIMEOUT=21 # Timout waiting for docker downloads
ERR_DOCKER_KEY_DOWNLOAD_TIMEOUT=22 # Timeout waiting to download docker repo key
ERR_DOCKER_APT_KEY_TIMEOUT=23 # Timeout waiting for docker apt-key
ERR_DOCKER_START_FAIL=24 # Docker could not be started by systemctl
ERR_MOBY_APT_LIST_TIMEOUT=25 # Timeout waiting for moby apt sources
ERR_MS_GPG_KEY_DOWNLOAD_TIMEOUT=26 # Timeout waiting for MS GPG key download
ERR_MOBY_INSTALL_TIMEOUT=27 # Timeout waiting for moby-docker install
ERR_CONTAINERD_INSTALL_TIMEOUT=28 # Timeout waiting for moby-containerd install
ERR_RUNC_INSTALL_TIMEOUT=29 # Timeout waiting for moby-runc install
ERR_K8S_RUNNING_TIMEOUT=30 # Timeout waiting for k8s cluster to be healthy
ERR_K8S_DOWNLOAD_TIMEOUT=31 # Timeout waiting for Kubernetes downloads
ERR_KUBECTL_NOT_FOUND=32 # kubectl client binary not found on local disk
ERR_IMG_DOWNLOAD_TIMEOUT=33 # Timeout waiting for img download
ERR_KUBELET_START_FAIL=34 # kubelet could not be started by systemctl
ERR_DOCKER_IMG_PULL_TIMEOUT=35 # Timeout trying to pull a Docker image
ERR_CONTAINERD_CTR_IMG_PULL_TIMEOUT=36 # Timeout trying to pull a containerd image via cli tool ctr
ERR_CONTAINERD_CRICTL_IMG_PULL_TIMEOUT=37 # Timeout trying to pull a containerd image via cli tool crictl
ERR_CONTAINERD_INSTALL_FILE_NOT_FOUND=38 # Unable to locate containerd debian pkg file
ERR_CONTAINERD_VERSION_INVALID=39 # Containerd version is invalid
ERR_CNI_DOWNLOAD_TIMEOUT=41 # Timeout waiting for CNI downloads
ERR_MS_PROD_DEB_DOWNLOAD_TIMEOUT=42 # Timeout waiting for https://packages.microsoft.com/config/ubuntu/16.04/packages-microsoft-prod.deb
ERR_MS_PROD_DEB_PKG_ADD_FAIL=43 # Failed to add repo pkg file
# ERR_FLEXVOLUME_DOWNLOAD_TIMEOUT=44 Failed to add repo pkg file -- DEPRECATED
ERR_ORAS_DOWNLOAD_ERROR=45 # Unable to install oras
ERR_SYSTEMD_INSTALL_FAIL=48 # Unable to install required systemd version
ERR_MODPROBE_FAIL=49 # Unable to load a kernel module using modprobe
ERR_OUTBOUND_CONN_FAIL=50 # Unable to establish outbound connection
ERR_K8S_API_SERVER_CONN_FAIL=51 # Unable to establish connection to k8s api serve
ERR_K8S_API_SERVER_DNS_LOOKUP_FAIL=52 # Unable to resolve k8s api server name
ERR_K8S_API_SERVER_AZURE_DNS_LOOKUP_FAIL=53 # Unable to resolve k8s api server name due to Azure DNS issue
ERR_KATA_KEY_DOWNLOAD_TIMEOUT=60 # Timeout waiting to download kata repo key
ERR_KATA_APT_KEY_TIMEOUT=61 # Timeout waiting for kata apt-key
ERR_KATA_INSTALL_TIMEOUT=62 # Timeout waiting for kata install
ERR_VHD_FILE_NOT_FOUND=65 # VHD log file not found on VM built from VHD distro (previously classified as exit code 124)
ERR_CONTAINERD_DOWNLOAD_TIMEOUT=70 # Timeout waiting for containerd downloads
ERR_RUNC_DOWNLOAD_TIMEOUT=71 # Timeout waiting for runc downloads
ERR_CUSTOM_SEARCH_DOMAINS_FAIL=80 # Unable to configure custom search domains
ERR_GPU_DOWNLOAD_TIMEOUT=83 # Timeout waiting for GPU driver download
ERR_GPU_DRIVERS_START_FAIL=84 # nvidia-modprobe could not be started by systemctl
ERR_GPU_DRIVERS_INSTALL_TIMEOUT=85 # Timeout waiting for GPU drivers install
ERR_GPU_DEVICE_PLUGIN_START_FAIL=86 # nvidia device plugin could not be started by systemctl
ERR_GPU_INFO_ROM_CORRUPTED=87 # info ROM corrupted error when executing nvidia-smi
ERR_SGX_DRIVERS_INSTALL_TIMEOUT=90 # Timeout waiting for SGX prereqs to download
ERR_SGX_DRIVERS_START_FAIL=91 # Failed to execute SGX driver binary
ERR_APT_DAILY_TIMEOUT=98 # Timeout waiting for apt daily updates
ERR_APT_UPDATE_TIMEOUT=99 # Timeout waiting for apt-get update to complete
ERR_CSE_PROVISION_SCRIPT_NOT_READY_TIMEOUT=100 # Timeout waiting for cloud-init to place this script on the vm
ERR_APT_DIST_UPGRADE_TIMEOUT=101 # Timeout waiting for apt-get dist-upgrade to complete
ERR_APT_PURGE_FAIL=102 # Error purging distro packages
ERR_SYSCTL_RELOAD=103 # Error reloading sysctl config
ERR_CIS_ASSIGN_ROOT_PW=111 # Error assigning root password in CIS enforcement
ERR_CIS_ASSIGN_FILE_PERMISSION=112 # Error assigning permission to a file in CIS enforcement
ERR_PACKER_COPY_FILE=113 # Error writing a file to disk during VHD CI
ERR_CIS_APPLY_PASSWORD_CONFIG=115 # Error applying CIS-recommended passwd configuration
ERR_SYSTEMD_DOCKER_STOP_FAIL=116 # Error stopping dockerd
ERR_CRICTL_DOWNLOAD_TIMEOUT=117 # Timeout waiting for crictl downloads
ERR_CRICTL_OPERATION_ERROR=118 # Error executing a crictl operation
ERR_CTR_OPERATION_ERROR=119 # Error executing a ctr containerd cli operation

# Azure Stack specific errors
ERR_AZURE_STACK_GET_ARM_TOKEN=120 # Error generating a token to use with Azure Resource Manager
ERR_AZURE_STACK_GET_NETWORK_CONFIGURATION=121 # Error fetching the network configuration for the node
ERR_AZURE_STACK_GET_SUBNET_PREFIX=122 # Error fetching the subnet address prefix for a subnet ID

# Error code 124 is returned when a `timeout` command times out, and --preserve-status is not specified: https://man7.org/linux/man-pages/man1/timeout.1.html
ERR_VHD_BUILD_ERROR=125 # Reserved for VHD CI exit conditions

ERR_SWAP_CREATE_FAIL=130 # Error allocating swap file
ERR_SWAP_CREATE_INSUFFICIENT_DISK_SPACE=131 # Error insufficient disk space for swap file creation

ERR_TELEPORTD_DOWNLOAD_ERR=150 # Error downloading teleportd binary
ERR_TELEPORTD_INSTALL_ERR=151 # Error installing teleportd binary
ERR_ARTIFACT_STREAMING_DOWNLOAD=152 # Error downloading mirror proxy and overlaybd components
ERR_ARTIFACT_STREAMING_INSTALL=153 # Error installing mirror proxy and overlaybd components

ERR_HTTP_PROXY_CA_CONVERT=160 # Error converting http proxy ca cert from pem to crt format
ERR_UPDATE_CA_CERTS=161 # Error updating ca certs to include user-provided certificates
ERR_DOWNLOAD_SECURE_TLS_BOOTSTRAP_KUBELET_EXEC_PLUGIN_TIMEOUT=169 # Timeout waiting for secure TLS bootrstrap kubelet exec plugin download

ERR_DISBALE_IPTABLES=170 # Error disabling iptables service

ERR_KRUSTLET_DOWNLOAD_TIMEOUT=171 # Timeout waiting for krustlet downloads
ERR_DISABLE_SSH=172 # Error disabling ssh service
ERR_PRIMARY_NIC_IP_NOT_FOUND=173 # Error fetching primary NIC IP address
ERR_INSERT_IMDS_RESTRICTION_RULE_INTO_MANGLE_TABLE=174 # Error insert imds restriction rule into mangle table
ERR_INSERT_IMDS_RESTRICTION_RULE_INTO_FILTER_TABLE=175 # Error insert imds restriction rule into filter table
ERR_DELETE_IMDS_RESTRICTION_RULE_FROM_MANGLE_TABLE=176 # Error delete imds restriction rule from mangle table
ERR_DELETE_IMDS_RESTRICTION_RULE_FROM_FILTER_TABLE=177 # Error delete imds restriction rule from filter table

ERR_VHD_REBOOT_REQUIRED=200 # Reserved for VHD reboot required exit condition
ERR_NO_PACKAGES_FOUND=201 # Reserved for no security packages found exit condition
ERR_SNAPSHOT_UPDATE_START_FAIL=202 # snapshot-update could not be started by systemctl

ERR_PRIVATE_K8S_PKG_ERR=203 # Error downloading (at build-time) or extracting (at run-time) private kubernetes packages
ERR_K8S_INSTALL_ERR=204 # Error installing or setting up kubernetes binaries on disk

ERR_SYSTEMCTL_MASK_FAIL=2 # Service could not be masked by systemctl

ERR_CREDENTIAL_PROVIDER_DOWNLOAD_TIMEOUT=205 # Timeout waiting for credential provider downloads

ERR_CNI_VERSION_INVALID=206 # reference CNI (not azure cni) needs a valid version in components.json

# For both Ubuntu and Mariner/AzureLinux, /etc/*-release should exist.
# In AzureLinux 3.0, /etc/*-release are symlinks to /usr/lib/*-release, so the find command includes -type f,l.

ERR_ORAS_PULL_K8S_FAIL=207 # Error pulling kube-node artifact via oras from registry
ERR_ORAS_PULL_CREDENTIAL_PROVIDER=208 # Error pulling credential provider artifact with oras from registry
ERR_ORAS_PULL_CONTAINERD_WASM=209 # Error pulling containerd wasm artifact with oras from registry
ERR_ORAS_IMDS_TIMEOUT=210 # Error timeout waiting for IMDS response
ERR_ORAS_PULL_NETWORK_TIMEOUT=211 # Error pulling oras tokens for login
ERR_ORAS_PULL_UNAUTHORIZED=212 # Error pulling artifact with oras from registry with authorization issue

# Error checking nodepools tags for whether we need to disable kubelet serving certificate rotation
ERR_LOOKUP_DISABLE_KUBELET_SERVING_CERTIFICATE_ROTATION_TAG=213

# Error either getting the install mode or cleaning up container images
ERR_CLEANUP_CONTAINER_IMAGES=214

ERR_DNS_HEALTH_FAIL=215 # Error checking DNS health

# ------------------------------ Used by localdns -----------------------------------
ERR_LOCALDNS_FAIL=216 # Unable to start localdns systemd unit.
ERR_LOCALDNS_COREFILE_NOTFOUND=217 # Localdns corefile not found.
ERR_LOCALDNS_SLICEFILE_NOTFOUND=218 # Localdns slicefile not found.
ERR_LOCALDNS_BINARY_ERR=219 # Localdns binary not found or not executable.
# ----------------------------------------------------------------------------------

# For both Ubuntu and Mariner, /etc/*-release should exist.
# For unit tests, the OS and OS_VERSION will be set in the unit test script.
# So whether it's if or else actually doesn't matter to our unit test.
if find /etc -type f,l -name "*-release" -print -quit 2>/dev/null | grep -q '.'; then
    OS=$(sort -r /etc/*-release | gawk 'match($0, /^(ID_LIKE=(coreos)|ID=(.*))$/, a) { print toupper(a[2] a[3]); exit }')
    OS_VERSION=$(sort -r /etc/*-release | gawk 'match($0, /^(VERSION_ID=(.*))$/, a) { print toupper(a[2] a[3]); exit }' | tr -d '"')
else
# This is only for unit test purpose. For example, a Mac OS dev box doesn't have /etc/*-release, then the unit test will continue.
    echo "/etc/*-release not found"
fi

UBUNTU_OS_NAME="UBUNTU"
MARINER_OS_NAME="MARINER"
MARINER_KATA_OS_NAME="MARINERKATA"
AZURELINUX_OS_NAME="AZURELINUX"
KUBECTL=/usr/local/bin/kubectl
DOCKER=/usr/bin/docker
# this will be empty during VHD build
# but vhd build runs with `set -o nounset`
# so needs a default value
# prefer empty string to avoid potential "it works but did something weird" scenarios
export GPU_DV="${GPU_DRIVER_VERSION:=}"
export GPU_DEST=/usr/local/nvidia
DOCKER_VERSION=1.13.1-1
export NVIDIA_DRIVER_IMAGE_SHA="${GPU_IMAGE_SHA:=}"
export NVIDIA_DRIVER_IMAGE_TAG="${GPU_DV}-${NVIDIA_DRIVER_IMAGE_SHA}"
export NVIDIA_GPU_DRIVER_TYPE="${GPU_DRIVER_TYPE:=}"
export NVIDIA_DRIVER_IMAGE="mcr.microsoft.com/aks/aks-gpu-${NVIDIA_GPU_DRIVER_TYPE}"
export CTR_GPU_INSTALL_CMD="ctr -n k8s.io run --privileged --rm --net-host --with-ns pid:/proc/1/ns/pid --mount type=bind,src=/opt/gpu,dst=/mnt/gpu,options=rbind --mount type=bind,src=/opt/actions,dst=/mnt/actions,options=rbind"
export DOCKER_GPU_INSTALL_CMD="docker run --privileged --net=host --pid=host -v /opt/gpu:/mnt/gpu -v /opt/actions:/mnt/actions --rm"
APT_CACHE_DIR=/var/cache/apt/archives/
PERMANENT_CACHE_DIR=/root/aptcache/
EVENTS_LOGGING_DIR=/var/log/azure/Microsoft.Azure.Extensions.CustomScript/events/
CURL_OUTPUT=/tmp/curl_verbose.out
ORAS_OUTPUT=/tmp/oras_verbose.out
ORAS_REGISTRY_CONFIG_FILE=/etc/oras/config.yaml # oras registry auth config file, not used, but have to define to avoid error "Error: failed to get user home directory: $HOME is not defined" 

# Internal helper function for retry logic
# Not intended for direct use. Use retrycmd or retrycmd_silent based on your needs
_retrycmd_internal() {
    local retries=$1; shift
    local wait_sleep=$1; shift
    local timeout_val=$1; shift # Renamed to avoid conflict with timeout command
    local shouldLog=$1; shift
    local cmdToRun=("$@") # Capture command for logging/reporting
    local exit_status=0

    for i in $(seq 1 "$retries"); do
        # Execute the command with timeout
        timeout "$timeout_val" "${@}"
        exit_status=$?

        # Check if successful
        if [ "$exit_status" -eq 0 ]; then
            break # Success, exit loop
        fi

        # Check if it's the last retry
        if [ "$i" -eq "$retries" ]; then
            if [ "$shouldLog" = "true" ]; then
                echo "Executed \"${cmdToRun[*]}\" $i times; giving up (last exit status: $exit_status)." >&2
            fi
            # Return the last exit status on final failure
            return 1
        fi

        # Wait before next retry
        sleep "$wait_sleep"
    done

    # Log success if not silent and command succeeded
    if [ "$shouldLog" = "true" ] && [ "$exit_status" -eq 0 ]; then
        echo "Executed \"${cmdToRun[*]}\" $i times."
    fi

    return $exit_status
}

# Retry a command with logging.
# Usage: retrycmd_if_failure <retries> <wait_sleep> <timeout> <command...>
retrycmd_if_failure() {
    _retrycmd_internal "$1" "$2" "$3" "true" "${@:4}"
}

# Retry a command without logging information during retrying.
# Usage: retrycmd_silent <retries> <wait_sleep> <timeout> <command...>
retrycmd_silent() {
    _retrycmd_internal "$1" "$2" "$3" "false" "${@:4}"
}

retrycmd_nslookup() {
    wait_sleep=$1; timeout=$2; total_timeout=$3; record=$4
    start_time=$(date +%s)
    while true; do
        nslookup -timeout=$timeout -retry=0 $record && break || \
        current_time=$(date +%s)
        # Check if the total_timeout has been reached
        if [ "$((current_time - start_time))" -ge "$total_timeout" ]; then
            echo "Total timeout $total_timeout reached, nslookup -timeout=$timeout -retry=0 $record failed"
            return 1
        fi
        sleep $wait_sleep
    done
    current_time=$(date +%s)
    echo "Executed nslookup -timeout=$timeout -retry=0 $record for $((current_time - start_time)) seconds";
}
retrycmd_get_tarball() {
    tar_retries=$1; wait_sleep=$2; tarball=$3; url=$4
    echo "${tar_retries} retries"
    for i in $(seq 1 $tar_retries); do
        [ -f "$tarball" ] && tar -tzf "$tarball" && break || \
        if [ "$i" -eq "$tar_retries" ]; then
            return 1
        else
            timeout 60 curl -fsSLv $url -o $tarball > $CURL_OUTPUT 2>&1
            if [ "$?" -ne 0 ]; then
                cat $CURL_OUTPUT
            fi
            sleep $wait_sleep
        fi
    done
}
retrycmd_get_tarball_from_registry_with_oras() {
    tar_retries=$1; wait_sleep=$2; tarball=$3; url=$4
    tar_folder=$(dirname "$tarball")
    echo "${tar_retries} retries"
    for i in $(seq 1 $tar_retries); do
        [ -f "$tarball" ] && tar -tzf "$tarball" && break || \
        if [ "$i" -eq "$tar_retries" ]; then
            return 1
        else
            timeout 60 oras pull $url -o $tar_folder --registry-config ${ORAS_REGISTRY_CONFIG_FILE} > $ORAS_OUTPUT 2>&1
            if [ "$?" -ne 0 ]; then
                cat $ORAS_OUTPUT
            fi
            sleep $wait_sleep
        fi
    done
}
retrycmd_get_access_token_for_oras() {
    retries=$1; wait_sleep=$2; url=$3
    for i in $(seq 1 $retries); do
        response=$(timeout 60 curl -v -s -H "Metadata:true" --noproxy "*" "$url" -w "\n%{http_code}")
        ACCESS_TOKEN_OUTPUT=$(echo "$response" | sed '$d')
        http_code=$(echo "$response" | tail -n1)
        if [ -n "$ACCESS_TOKEN_OUTPUT" ] && [ "$http_code" -eq 200 ]; then 
            echo "$ACCESS_TOKEN_OUTPUT"
            return 0
        fi
        sleep $wait_sleep
    done
    if [ -n "$http_code" ]; then
        echo "failed to retrieve kubelet identity token from IMDS, http code: $http_code, msg: $ACCESS_TOKEN_OUTPUT"
        return $ERR_ORAS_PULL_UNAUTHORIZED
    fi
    echo "timeout waiting for IMDS response to retrieve kubelet identity token"
    return $ERR_ORAS_IMDS_TIMEOUT
}
retrycmd_get_refresh_token_for_oras() {
    retries=$1; wait_sleep=$2; acr_url=$3; tenant_id=$4; ACCESS_TOKEN=$5
    for i in $(seq 1 $retries); do
        REFRESH_TOKEN_OUTPUT=$(timeout 60 curl -v -s -X POST -H "Content-Type: application/x-www-form-urlencoded" \
            -d "grant_type=access_token&service=$acr_url&tenant=$tenant_id&access_token=$ACCESS_TOKEN" \
            https://$acr_url/oauth2/exchange)
        if [ -n "$REFRESH_TOKEN_OUTPUT" ]; then 
            echo "$REFRESH_TOKEN_OUTPUT"
            return 0
        fi
        sleep $wait_sleep
    done
    return $ERR_ORAS_PULL_NETWORK_TIMEOUT
}
retrycmd_oras_login() {
    retries=$1; wait_sleep=$2; acr_url=$3; REFRESH_TOKEN=$4
    for i in $(seq 1 $retries); do
        ORAS_LOGIN_OUTPUT=$(oras login "$acr_url" --identity-token-stdin --registry-config "${ORAS_REGISTRY_CONFIG_FILE}" <<< "$REFRESH_TOKEN" 2>&1)
        exit_code=$?
        if [ "$exit_code" -eq 0 ]; then
            echo "$ORAS_LOGIN_OUTPUT"
            return 0
        fi
        sleep "$wait_sleep"
    done
    return $exit_code
}
retrycmd_get_binary_from_registry_with_oras() {
    binary_retries=$1; wait_sleep=$2; binary_path=$3; url=$4
    binary_folder=$(dirname "$binary_path")
    echo "${binary_retries} retries"
    
    for i in $(seq 1 $binary_retries); do
        if [ -f "$binary_path" ]; then
            break
        else
            if [ $i -eq $binary_retries ]; then
                return 1
            else
                # TODO: support private acr via kubelet identity
                timeout 60 oras pull $url -o $binary_folder --registry-config ${ORAS_REGISTRY_CONFIG_FILE} > $ORAS_OUTPUT 2>&1
                if [ "$?" -ne 0 ]; then
                    cat $ORAS_OUTPUT
                fi
                sleep $wait_sleep
            fi
        fi
    done
}
retrycmd_can_oras_ls_acr() {
    retries=$1; wait_sleep=$2; url=$3
    for i in $(seq 1 $retries); do
        output=$(timeout 60 oras repo ls "$url" --registry-config "$ORAS_REGISTRY_CONFIG_FILE" 2>&1)
        if [ "$?" -eq 0 ]; then
            echo "acr is reachable"
            return 0
        fi
        # shellcheck disable=SC3010
        if [[ "$output" == *"unauthorized: authentication required"* ]]; then
            echo "ACR is not reachable: $output"
            return 1
        fi
    done
    echo "unexpected response from acr: $output"
    return $ERR_ORAS_PULL_NETWORK_TIMEOUT
}
retrycmd_curl_file() {
    curl_retries=$1; wait_sleep=$2; timeout=$3; filepath=$4; url=$5
    echo "${curl_retries} retries"
    for i in $(seq 1 $curl_retries); do
        [ -f "$filepath" ] && break
        if [ "$i" -eq "$curl_retries" ]; then
            return 1
        else
            timeout $timeout curl -fsSLv $url -o $filepath > $CURL_OUTPUT 2>&1
            if [ "$?" -ne 0 ]; then
                cat $CURL_OUTPUT
            fi
            sleep $wait_sleep
        fi
    done
}
# base systemctl retry command, should not be called directly - use systemctl_restart, systemctl_stop, systemctl_disable
_systemctl_retry_svc_operation() {
    retries=$1; wait_sleep=$2; timeout=$3 operation=$4 svcname=$5 shouldLogRetryInfo=${6:-false}
    for i in $(seq 1 $retries); do
        timeout $timeout systemctl daemon-reload
        timeout $timeout systemctl $operation $svcname && break || \
        if [ $i -eq $retries ]; then
            return 1
        else
          if [ "$shouldLogRetryInfo" = "true" ]; then
              systemctl status $svcname --no-pager -l
              journalctl -u $svcname
          fi
            sleep $wait_sleep
        fi
    done
}
systemctl_restart() {
    _systemctl_retry_svc_operation "$1" "$2" "$3" "restart" "$4" true
}
systemctl_stop() {
    _systemctl_retry_svc_operation "$1" "$2" "$3" "stop" "$4" 
}
systemctl_disable() {
    _systemctl_retry_svc_operation "$1" "$2" "$3" "disable" "$4" 
}
sysctl_reload() {
    retrycmd_silent $1 $2 $3 "false" sysctl --system
}
version_gte() {
  test "$(printf '%s\n' "$@" | sort -rV | head -n 1)" == "$1"
}

systemctlEnableAndStart() {
    service=$1; timeout=$2    
    systemctl_restart 100 5 $2 $1
    RESTART_STATUS=$?
    systemctl status $1 --no-pager -l > /var/log/azure/$1-status.log
    if [ $RESTART_STATUS -ne 0 ]; then
        echo "$1 could not be started"
        return 1
    fi
    if ! retrycmd_if_failure 120 5 25 systemctl enable $1; then
        echo "$1 could not be enabled by systemctl"
        return 1
    fi
}

systemctlDisableAndStop() {
    if systemctl list-units --full --all | grep -q "$1.service"; then
        systemctl_stop 20 5 25 $1 || echo "$1 could not be stopped"
        systemctl_disable 20 5 25 $1 || echo "$1 could not be disabled"
    fi
}

# return true if a >= b
semverCompare() {
    VERSION_A=$(echo $1 | cut -d "+" -f 1)
    VERSION_B=$(echo $2 | cut -d "+" -f 1)
    [ "${VERSION_A}" = "${VERSION_B}" ] && return 0
    sorted=$(echo ${VERSION_A} ${VERSION_B} | tr ' ' '\n' | sort -V )
    highestVersion=$(IFS= echo "${sorted}" | cut -d$'\n' -f2)
    [ "${VERSION_A}" = ${highestVersion} ] && return 0
    return 1
}
apt_get_download() {
  retries=$1; wait_sleep=$2; shift && shift;
  local ret=0
  pushd $APT_CACHE_DIR || return 1
  for i in $(seq 1 $retries); do
    dpkg --configure -a --force-confdef
    wait_for_apt_locks
    apt-get -o Dpkg::Options::=--force-confold download -y "${@}" && break
    if [ $i -eq $retries ]; then ret=1; else sleep $wait_sleep; fi
  done
  popd || return 1
  return $ret
}
getCPUArch() {
    arch=$(uname -m)
    # shellcheck disable=SC3010
    if [[ ${arch,,} == "aarch64" || ${arch,,} == "arm64"  ]]; then
        echo "arm64"
    else
        echo "amd64"
    fi
}
isARM64() {
    if [ "$(getCPUArch)" = "arm64" ]; then
        echo 1
    else
        echo 0
    fi
}

isRegistryUrl() {
    local binary_url=$1
    registry_regex='^.+\/.+\/.+:.+$'
    # shellcheck disable=SC3010
    if [[ ${binary_url} =~ $registry_regex ]]; then # check if the binary_url is in the format of mcr.microsoft.com/componant/binary:1.0"
        return 0 # true
    fi
    return 1 # false
}

logs_to_events() {
    # local vars here allow for nested function tracking
    # installContainerRuntime for example
    local task=$1; shift
    local eventsFileName=$(date +%s%3N)

    local startTime=$(date +"%F %T.%3N")
    ${@}
    ret=$?
    local endTime=$(date +"%F %T.%3N")

    # arg names are defined by GA and all these are required to be correctly read by GA
    # EventPid, EventTid are required to be int. No use case for them at this point.
    json_string=$( jq -n \
        --arg Timestamp   "${startTime}" \
        --arg OperationId "${endTime}" \
        --arg Version     "1.23" \
        --arg TaskName    "${task}" \
        --arg EventLevel  "Informational" \
        --arg Message     "Completed: $*" \
        --arg EventPid    "0" \
        --arg EventTid    "0" \
        '{Timestamp: $Timestamp, OperationId: $OperationId, Version: $Version, TaskName: $TaskName, EventLevel: $EventLevel, Message: $Message, EventPid: $EventPid, EventTid: $EventTid}'
    )
    mkdir -p ${EVENTS_LOGGING_DIR}
    if [ -f ${EVENTS_LOGGING_DIR}${eventsFileName}.json ]; then
        echo ${json_string} >> ${EVENTS_LOGGING_DIR}${eventsFileName}.json
    fi

    # this allows an error from the command at ${@} to be returned and correct code assigned in cse_main
    if [ "$ret" -ne 0 ]; then
      return $ret
    fi
}

should_skip_nvidia_drivers() {
    set -x
    body=$(curl -fsSL -H "Metadata: true" --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2021-02-01")
    ret=$?
    if [ "$ret" -ne 0 ]; then
      return $ret
    fi
    should_skip=$(echo "$body" | jq -e '.compute.tagsList | map(select(.name | test("SkipGpuDriverInstall"; "i")))[0].value // "false" | test("true"; "i")')
    echo "$should_skip"
}

should_disable_kubelet_serving_certificate_rotation() {
    set -x
    body=$(curl -fsSL -H "Metadata: true" --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2021-02-01")
    ret=$?
    if [ "$ret" -ne 0 ]; then
      return $ret
    fi
    should_disable=$(echo "$body" | jq -r '.compute.tagsList[] | select(.name == "aks-disable-kubelet-serving-certificate-rotation") | .value')
    echo "${should_disable,,}"
}

should_skip_binary_cleanup() {
    set -x
    body=$(curl -fsSL -H "Metadata: true" --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2021-02-01")
    ret=$?
    if [ "$ret" -ne 0 ]; then
      return $ret
    fi
    should_skip=$(echo "$body" | jq -r '.compute.tagsList[] | select(.name == "SkipBinaryCleanup") | .value')
    echo "${should_skip,,}"
}

isMarinerOrAzureLinux() {
    local os=$1
    if [ "$os" = "$MARINER_OS_NAME" ] || [ "$os" = "$MARINER_KATA_OS_NAME" ] || [ "$os" = "$AZURELINUX_OS_NAME" ]; then
        return 0
    fi
    return 1
}

evalPackageDownloadURL() {
    local url=${1:-}
    if [ -n "$url" ]; then
         eval "result=${url}"
         echo $result
         return
    fi
    echo ""
}

installJq() {
    # jq is not available until downloaded in install-dependencies.sh with the installDeps function
    # but it is needed earlier to call the capture_benchmarks function in pre-install-dependencies.sh
    if command -v jq &> /dev/null; then
        return 0
    fi
    if isMarinerOrAzureLinux "$OS"; then
        sudo tdnf install -y jq && echo "jq was installed: $(jq --version)"
    else
        apt_get_install 5 1 60 jq && echo "jq was installed: $(jq --version)"
    fi
}

# sets RELEASE to proper release metadata for the package based on the os and osVersion
# e.g., For os UBUNTU 18.04, if there is a release "r1804" defined in components.json, then set RELEASE to "r1804".
# Otherwise set RELEASE to "current"
updateRelease() {
    local package="$1"
    local os="$2"
    local osVersion="$3"
    RELEASE="current"
    local osLowerCase=$(echo "${os}" | tr '[:upper:]' '[:lower:]')
    #For UBUNTU, if $osVersion is 18.04 and "r1804" is also defined in components.json, then $release is set to "r1804"
    #Similarly for 20.04 and 22.04. Otherwise $release is set to .current.
    #For MARINER, the release is always set to "current" now.
    #For AZURELINUX, if $osVersion is 3.0 and "v3.0" is also defined in components.json, then $RELEASE is set to "v3.0"
    if isMarinerOrAzureLinux "${os}"; then
        if [ "$(echo "${package}" | jq -r ".downloadURIs.${osLowerCase}.\"v${osVersion}\"" 2>/dev/null)" != "null" ]; then
            RELEASE="\"v${osVersion}\""
        fi
        return 0
    fi
    local osVersionWithoutDot=$(echo "${osVersion}" | sed 's/\.//g')
    if [ "$(echo "${package}" | jq -r ".downloadURIs.ubuntu.r${osVersionWithoutDot}" 2>/dev/null)" != "null" ]; then
        RELEASE="\"r${osVersionWithoutDot}\""
    fi
}

# sets PACKAGE_VERSIONS to the versions of the package based on the os and osVersion
updatePackageVersions() {
    local package="$1"
    local os="$2"
    local osVersion="$3"
    RELEASE="current"
    updateRelease "${package}" "${os}" "${osVersion}"
    local osLowerCase=$(echo "${os}" | tr '[:upper:]' '[:lower:]')
    PACKAGE_VERSIONS=()

    # if .downloadURIs.${osLowerCase} doesn't exist, it will get the versions from .downloadURIs.default.
    # Otherwise get the versions from .downloadURIs.${osLowerCase
    if [ "$(echo "${package}" | jq -r ".downloadURIs.${osLowerCase}" 2>/dev/null)" = "null" ]; then
        osLowerCase="default"
    fi

    # jq the versions from the package. If downloadURIs.$osLowerCase.$release.versionsV2 is not null, then get the versions from there.
    # Otherwise get the versions from .downloadURIs.$osLowerCase.$release.versions
    if [ "$(echo "${package}" | jq -r ".downloadURIs.${osLowerCase}.${RELEASE}.versionsV2")" != "null" ]; then
        local latestVersions=($(echo "${package}" | jq -r ".downloadURIs.${osLowerCase}.${RELEASE}.versionsV2[] | select(.latestVersion != null) | .latestVersion"))
        local previousLatestVersions=($(echo "${package}" | jq -r ".downloadURIs.${osLowerCase}.${RELEASE}.versionsV2[] | select(.previousLatestVersion != null) | .previousLatestVersion"))
        for version in "${latestVersions[@]}"; do
            PACKAGE_VERSIONS+=("${version}")
        done
        for version in "${previousLatestVersions[@]}"; do
            PACKAGE_VERSIONS+=("${version}")
        done
        return 0
    fi

    # Fallback to versions if versionsV2 is null
    if [ "$(echo "${package}" | jq -r ".downloadURIs.${osLowerCase}.${RELEASE}.versions")" = "null" ]; then
        return 0
    fi
    local versions=($(echo "${package}" | jq -r ".downloadURIs.${osLowerCase}.${RELEASE}.versions[]"))
    for version in "${versions[@]}"; do
        PACKAGE_VERSIONS+=("${version}")
    done
    return 0
}

# sets MULTI_ARCH_VERSIONS to multiArchVersionsV2 if it exists, otherwise multiArchVersions
updateMultiArchVersions() {
  local imageToBePulled="$1"

  #jq the MultiArchVersions from the containerImages. If ContainerImages[i].multiArchVersionsV2 is not null, return that, else return ContainerImages[i].multiArchVersions
  if [ "$(echo "${imageToBePulled}" | jq .multiArchVersionsV2)" != "null" ]; then
    local latestVersions=($(echo "${imageToBePulled}" | jq -r ".multiArchVersionsV2[] | select(.latestVersion != null) | .latestVersion"))
    local previousLatestVersions=($(echo "${imageToBePulled}" | jq -r ".multiArchVersionsV2[] | select(.previousLatestVersion != null) | .previousLatestVersion"))
    for version in "${latestVersions[@]}"; do
      MULTI_ARCH_VERSIONS+=("${version}")
    done
    for version in "${previousLatestVersions[@]}"; do
      MULTI_ARCH_VERSIONS+=("${version}")
    done
    return
  fi

  local versions=($(echo "${imageToBePulled}" | jq -r ".multiArchVersions[]"))
  for version in "${versions[@]}"; do
    MULTI_ARCH_VERSIONS+=("${version}")
  done
}

updatePackageDownloadURL() {
    local package=$1
    local os=$2
    local osVersion=$3
    RELEASE="current"
    updateRelease "${package}" "${os}" "${osVersion}"
    local osLowerCase=$(echo "${os}" | tr '[:upper:]' '[:lower:]')
    
    #if .downloadURIs.${osLowerCase} exist, then get the downloadURL from there.
    #otherwise get the downloadURL from .downloadURIs.default 
    if [ "$(echo "${package}" | jq -r ".downloadURIs.${osLowerCase}")" != "null" ]; then
        downloadURL=$(echo "${package}" | jq ".downloadURIs.${osLowerCase}.${RELEASE}.downloadURL" -r)
        [ "${downloadURL}" = "null" ] && PACKAGE_DOWNLOAD_URL="" || PACKAGE_DOWNLOAD_URL="${downloadURL}"
        return
    fi
    downloadURL=$(echo "${package}" | jq ".downloadURIs.default.${RELEASE}.downloadURL" -r)
    [ "${downloadURL}" = "null" ] && PACKAGE_DOWNLOAD_URL="" || PACKAGE_DOWNLOAD_URL="${downloadURL}"
    return    
}

# adds the specified LABEL_STRING (which should be in the form of 'label=value') to KUBELET_NODE_LABELS
addKubeletNodeLabel() {
    local LABEL_STRING=$1
    if grep -i "$LABEL_STRING" <<< "$KUBELET_NODE_LABELS" > /dev/null 2>&1; then
        echo "kubelet node label $LABEL_STRING is already present, nothing to add"
        return 0
    fi

    echo "adding label $LABEL_STRING to kubelet node labels..."
    if [ -n "$KUBELET_NODE_LABELS" ]; then
        KUBELET_NODE_LABELS="${KUBELET_NODE_LABELS},${LABEL_STRING}"
    else
        # node labels shouldn't ever be empty, but we guard against it to be safe
        KUBELET_NODE_LABELS=$LABEL_STRING
    fi
}

# removes the specified LABEL_STRING (which should be in the form of 'label=value') from KUBELET_NODE_LABELS
removeKubeletNodeLabel() {
    local LABEL_STRING=$1
    if grep -e ",${LABEL_STRING}" <<< "$KUBELET_NODE_LABELS" > /dev/null 2>&1; then
        KUBELET_NODE_LABELS="${KUBELET_NODE_LABELS/,${LABEL_STRING}/}"
    elif grep -e "${LABEL_STRING}," <<< "$KUBELET_NODE_LABELS" > /dev/null 2>&1; then
        KUBELET_NODE_LABELS="${KUBELET_NODE_LABELS/${LABEL_STRING},/}"
    elif grep -e "${LABEL_STRING}" <<< "$KUBELET_NODE_LABELS" > /dev/null 2>&1; then
        KUBELET_NODE_LABELS="${KUBELET_NODE_LABELS/${LABEL_STRING}/}"
    fi
}

# generate kubenode binary registry url from acs-mirror url
updateKubeBinaryRegistryURL() {
    # if rp already passes registry url, then directly use the registry url that rp passes
    # this path should have not catch for now, but keep it for future 
    if [ -n "${KUBE_BINARY_URL}" ] && isRegistryUrl "${KUBE_BINARY_URL}"; then
        echo "KUBE_BINARY_URL is a registry url, will use it to pull the kube binary"
        KUBE_BINARY_REGISTRY_URL="${KUBE_BINARY_URL}"
    else
        # however, the kubelet and kubectl binary version may different with kubernetes version due to hotfix or beta
        # so that we still need to extract the binary version from kube_binary_url
        url_regex='https://[^/]+/kubernetes/v[0-9]+\.[0-9]+\..+/binaries/.+'

        if [ -n "${KUBE_BINARY_URL}" ]; then
            binary_version="v${KUBERNETES_VERSION}" # by default use Kubernetes versions
            # shellcheck disable=SC3010
            if [[ ${KUBE_BINARY_URL} =~ $url_regex ]]; then
                version_with_prefix="${KUBE_BINARY_URL#*kubernetes/}"
                # Extract the version part
                binary_version="${version_with_prefix%%/*}"
                echo "Extracted version: $binary_version from KUBE_BINARY_URL: ${KUBE_BINARY_URL}"
            else
                echo "KUBE_BINARY_URL is formatted unexpectedly, will use the kubernetes version as binary version: $binary_version"
            fi
        fi
        KUBE_BINARY_REGISTRY_URL="${BOOTSTRAP_PROFILE_CONTAINER_REGISTRY_SERVER}/${K8S_REGISTRY_REPO}/kubernetes-node:${binary_version}-linux-${CPU_ARCH}"
    fi
}

# removes the specified FLAG_STRING (which should be in the form of 'key=value') from KUBELET_FLAGS
removeKubeletFlag() {
    local FLAG_STRING=$1
    if grep -e ",${FLAG_STRING}" <<< "$KUBELET_FLAGS" > /dev/null 2>&1; then
        KUBELET_FLAGS="${KUBELET_FLAGS/,${FLAG_STRING}/}"
    elif grep -e "${FLAG_STRING}," <<< "$KUBELET_FLAGS" > /dev/null 2>&1; then
        KUBELET_FLAGS="${KUBELET_FLAGS/${FLAG_STRING},/}"
    elif grep -e "${FLAG_STRING}" <<< "$KUBELET_FLAGS" > /dev/null 2>&1; then
        KUBELET_FLAGS="${KUBELET_FLAGS/${FLAG_STRING}/}"
    fi
}

verify_DNS_health(){
    local domain_name=$1
    if [ -z "$domain_name" ]; then
        echo "DNS domain is empty"
        return $ERR_DNS_HEALTH_FAIL
    fi

    dig_check_no_domain=$(dig +norec +short +tries=5 +timeout=5 .)
    if [ "$?" -ne 0 ]; then
        echo "Failed to resolve root domain '.'"
        return $ERR_DNS_HEALTH_FAIL
    fi

    dig_check_domain=$(dig +tries=5 +timeout=5 +short $domain_name)
    ret_code=$?
    if [ "$ret_code" -ne 0 ] || [ -z "$dig_check_domain" ]; then
        echo "Failed to resolve domain $domain_name return code: $ret_code"
        return $ERR_DNS_HEALTH_FAIL
    fi
    echo "DNS health check passed"
}

resolve_packages_source_url() {
    local retries=5
    local wait_sleep=1

    PACKAGE_DOWNLOAD_BASE_URL="packages.aks.azure.com"
    for i in $(seq 1 $retries); do
      # Confirm that we can establish connectivity to packages.aks.azure.com before node provisioning starts
      response_code=$(curl -s -o /dev/null -w "%{http_code}" --max-time 5 --noproxy "*" https://packages.aks.azure.com/acs-mirror/healthz)
      if [ "${response_code}" -eq 200 ]; then
        echo "Established connectivity to $PACKAGE_DOWNLOAD_BASE_URL."
        break
      else
        if [ $i -eq $retries ]; then
          # If we can not establish connectivity to packages.aks.azure.com, fallback to old CDN URL
          PACKAGE_DOWNLOAD_BASE_URL="acs-mirror.azureedge.net"
          echo "Setting PACKAGE_DOWNLOAD_BASE_URL to $PACKAGE_DOWNLOAD_BASE_URL. Please check to ensure cluster firewall has packages.aks.azure.com on its allowlist"
          break
        else
          sleep $wait_sleep
        fi
      fi
    done
}

update_base_url() {
  initial_url=$1
  
  # shellcheck disable=SC3010
  if [ "$PACKAGE_DOWNLOAD_BASE_URL" = "packages.aks.azure.com" ] && [[ "$initial_url" == *"acs-mirror.azureedge.net"* ]]; then
    initial_url="${initial_url//"acs-mirror.azureedge.net"/$PACKAGE_DOWNLOAD_BASE_URL}"
  elif [ "$PACKAGE_DOWNLOAD_BASE_URL" = "acs-mirror.azureedge.net" ] && [[ "$initial_url" == *"packages.aks.azure.com"* ]]; then
    initial_url="${initial_url//"packages.aks.azure.com"/$PACKAGE_DOWNLOAD_BASE_URL}"
  fi
  
  echo "$initial_url"
}

oras_login_with_kubelet_identity() {
    local acr_url=$1
    local client_id=$2
    local tenant_id=$3

    if [ -z "$client_id" ] || [ -z "$tenant_id" ]; then
        echo "client_id or tenant_id are not set. Oras login is not possible, proceeding with anonymous pull"
        return 
    fi

    retrycmd_can_oras_ls_acr 10 5 $acr_url
    ret_code=$? 
    if [ "$ret_code" -eq 0 ]; then
        echo "anonymous pull is allowed for acr '$acr_url', proceeding with anonymous pull"
        return
    elif [ "$ret_code" -ne 1 ]; then
        echo "failed with an error other than unauthorized, exiting.."
        return $ret_code
    fi

    set +x 
    access_url="http://169.254.169.254/metadata/identity/oauth2/token?api-version=2018-02-01&resource=https://management.azure.com/&client_id=$client_id"
    raw_access_token=$(retrycmd_get_access_token_for_oras 5 15 $access_url)
    ret_code=$? 
    if [ "$ret_code" -ne 0 ]; then
        echo $raw_access_token
        return $ret_code
    fi
    ACCESS_TOKEN=$(echo "$raw_access_token" | jq -r .access_token)
    if [ -z "$ACCESS_TOKEN" ] || [ "$ACCESS_TOKEN" = "null" ]; then
        echo "failed to parse access token"
        return $ERR_ORAS_PULL_UNAUTHORIZED
    fi

    raw_refresh_token=$(retrycmd_get_refresh_token_for_oras 10 5 $acr_url $tenant_id $ACCESS_TOKEN)
    ret_code=$? 
    if [ "$ret_code" -ne 0 ]; then
        echo "failed to retrieve refresh token: $ret_code"
        return $ret_code
    fi
    # shellcheck disable=SC3010
    if [[ "$raw_refresh_token" == *"error"* ]]; then
        echo "failed to retrieve refresh token"
        return $ERR_ORAS_PULL_UNAUTHORIZED
    fi
    REFRESH_TOKEN=$(echo "$raw_refresh_token" | jq -r .refresh_token)
    if [ -z "$REFRESH_TOKEN" ] || [ "$REFRESH_TOKEN" = "null" ]; then
        echo "failed to parse refresh token"
        return $ERR_ORAS_PULL_UNAUTHORIZED
    fi

    retrycmd_oras_login 3 5 $acr_url "$REFRESH_TOKEN"
    if [ "$?" -ne 0 ]; then
        echo "failed to login to acr '$acr_url' with identity token"
        return $ERR_ORAS_PULL_UNAUTHORIZED
    fi
    unset ACCESS_TOKEN REFRESH_TOKEN  # Clears sensitive data from memory
    set -x

    retrycmd_can_oras_ls_acr 10 5 $acr_url$test_image
    if [ "$?" -ne 0 ]; then
        echo "failed to login to acr '$acr_url', pull is still unauthorized"
        return $ERR_ORAS_PULL_UNAUTHORIZED
    fi

    echo "successfully logged in to acr '$acr_url' with identity token"
}

#HELPERSEOF
