#!/bin/bash
ERR_SYSTEMCTL_START_FAIL=4 
ERR_CLOUD_INIT_TIMEOUT=5 
ERR_FILE_WATCH_TIMEOUT=6 
ERR_HOLD_WALINUXAGENT=7 
ERR_RELEASE_HOLD_WALINUXAGENT=8 
ERR_APT_INSTALL_TIMEOUT=9 
ERR_DOCKER_INSTALL_TIMEOUT=20 
ERR_DOCKER_DOWNLOAD_TIMEOUT=21 
ERR_DOCKER_KEY_DOWNLOAD_TIMEOUT=22 
ERR_DOCKER_APT_KEY_TIMEOUT=23 
ERR_DOCKER_START_FAIL=24 
ERR_MOBY_APT_LIST_TIMEOUT=25 
ERR_MS_GPG_KEY_DOWNLOAD_TIMEOUT=26 
ERR_MOBY_INSTALL_TIMEOUT=27 
ERR_CONTAINERD_INSTALL_TIMEOUT=28 
ERR_RUNC_INSTALL_TIMEOUT=29 
ERR_K8S_RUNNING_TIMEOUT=30 
ERR_K8S_DOWNLOAD_TIMEOUT=31 
ERR_KUBECTL_NOT_FOUND=32 
ERR_IMG_DOWNLOAD_TIMEOUT=33 
ERR_KUBELET_START_FAIL=34 
ERR_DOCKER_IMG_PULL_TIMEOUT=35 
ERR_CONTAINERD_CTR_IMG_PULL_TIMEOUT=36 
ERR_CONTAINERD_CRICTL_IMG_PULL_TIMEOUT=37 
ERR_CONTAINERD_INSTALL_FILE_NOT_FOUND=38 
ERR_CONTAINERD_VERSION_INVALID=39 
ERR_CNI_DOWNLOAD_TIMEOUT=41 
ERR_MS_PROD_DEB_DOWNLOAD_TIMEOUT=42 
ERR_MS_PROD_DEB_PKG_ADD_FAIL=43 
ERR_ORAS_DOWNLOAD_ERROR=45 
ERR_SYSTEMD_INSTALL_FAIL=48 
ERR_MODPROBE_FAIL=49 
ERR_OUTBOUND_CONN_FAIL=50 
ERR_K8S_API_SERVER_CONN_FAIL=51 
ERR_K8S_API_SERVER_DNS_LOOKUP_FAIL=52 
ERR_K8S_API_SERVER_AZURE_DNS_LOOKUP_FAIL=53 
ERR_KATA_KEY_DOWNLOAD_TIMEOUT=60 
ERR_KATA_APT_KEY_TIMEOUT=61 
ERR_KATA_INSTALL_TIMEOUT=62 
ERR_VHD_FILE_NOT_FOUND=65 
ERR_CONTAINERD_DOWNLOAD_TIMEOUT=70 
ERR_RUNC_DOWNLOAD_TIMEOUT=71 
ERR_CUSTOM_SEARCH_DOMAINS_FAIL=80 
ERR_GPU_DOWNLOAD_TIMEOUT=83 
ERR_GPU_DRIVERS_START_FAIL=84 
ERR_GPU_DRIVERS_INSTALL_TIMEOUT=85 
ERR_GPU_DEVICE_PLUGIN_START_FAIL=86 
ERR_GPU_INFO_ROM_CORRUPTED=87 
ERR_SGX_DRIVERS_INSTALL_TIMEOUT=90 
ERR_SGX_DRIVERS_START_FAIL=91 
ERR_APT_DAILY_TIMEOUT=98 
ERR_APT_UPDATE_TIMEOUT=99 
ERR_CSE_PROVISION_SCRIPT_NOT_READY_TIMEOUT=100 
ERR_APT_DIST_UPGRADE_TIMEOUT=101 
ERR_APT_PURGE_FAIL=102 
ERR_SYSCTL_RELOAD=103 
ERR_CIS_ASSIGN_ROOT_PW=111 
ERR_CIS_ASSIGN_FILE_PERMISSION=112 
ERR_PACKER_COPY_FILE=113 
ERR_CIS_APPLY_PASSWORD_CONFIG=115 
ERR_SYSTEMD_DOCKER_STOP_FAIL=116 
ERR_CRICTL_DOWNLOAD_TIMEOUT=117 
ERR_CRICTL_OPERATION_ERROR=118 
ERR_CTR_OPERATION_ERROR=119 

ERR_AZURE_STACK_GET_ARM_TOKEN=120 
ERR_AZURE_STACK_GET_NETWORK_CONFIGURATION=121 
ERR_AZURE_STACK_GET_SUBNET_PREFIX=122 

ERR_VHD_BUILD_ERROR=125 

ERR_SWAP_CREATE_FAIL=130 
ERR_SWAP_CREATE_INSUFFICIENT_DISK_SPACE=131 

ERR_TELEPORTD_DOWNLOAD_ERR=150 
ERR_TELEPORTD_INSTALL_ERR=151 
ERR_ARTIFACT_STREAMING_DOWNLOAD=152 
ERR_ARTIFACT_STREAMING_INSTALL=153 

ERR_HTTP_PROXY_CA_CONVERT=160 
ERR_UPDATE_CA_CERTS=161 
ERR_DOWNLOAD_SECURE_TLS_BOOTSTRAP_KUBELET_EXEC_PLUGIN_TIMEOUT=169 

ERR_DISBALE_IPTABLES=170 

ERR_KRUSTLET_DOWNLOAD_TIMEOUT=171 
ERR_DISABLE_SSH=172 
ERR_PRIMARY_NIC_IP_NOT_FOUND=173 
ERR_INSERT_IMDS_RESTRICTION_RULE_INTO_MANGLE_TABLE=174 
ERR_INSERT_IMDS_RESTRICTION_RULE_INTO_FILTER_TABLE=175 
ERR_DELETE_IMDS_RESTRICTION_RULE_FROM_MANGLE_TABLE=176 
ERR_DELETE_IMDS_RESTRICTION_RULE_FROM_FILTER_TABLE=177 

ERR_VHD_REBOOT_REQUIRED=200 
ERR_NO_PACKAGES_FOUND=201 
ERR_SNAPSHOT_UPDATE_START_FAIL=202 

ERR_PRIVATE_K8S_PKG_ERR=203 
ERR_K8S_INSTALL_ERR=204 

ERR_SYSTEMCTL_MASK_FAIL=2 

ERR_CREDENTIAL_PROVIDER_DOWNLOAD_TIMEOUT=205 

ERR_CNI_VERSION_INVALID=206 

ERR_CURL_REMOVE_TIMEOUT=300 
ERR_CURL_DOWNLOAD_TIMEOUT=301 
ERR_CURL_EXTRACT_TIMEOUT=302 
ERR_CURL_DOWNGRADE_LIBSSL=303 
ERR_CURL_DOWNLOAD_DEV_TIMEOUT=304 
ERR_CURL_INSTALL_TIMEOUT=305 
ERR_CURL_VERSION_MISMATCH=306 

if find /etc -type f -name "*-release" -print -quit 2>/dev/null | grep -q '.'; then
    OS=$(sort -r /etc/*-release | gawk 'match($0, /^(ID_LIKE=(coreos)|ID=(.*))$/, a) { print toupper(a[2] a[3]); exit }')
    OS_VERSION=$(sort -r /etc/*-release | gawk 'match($0, /^(VERSION_ID=(.*))$/, a) { print toupper(a[2] a[3]); exit }' | tr -d '"')
else
    echo "/etc/*-release not found"
fi

UBUNTU_OS_NAME="UBUNTU"
MARINER_OS_NAME="MARINER"
MARINER_KATA_OS_NAME="MARINERKATA"
KUBECTL=/usr/local/bin/kubectl
DOCKER=/usr/bin/docker
export GPU_DV="${GPU_DRIVER_VERSION:=}"
export GPU_DEST=/usr/local/nvidia
NVIDIA_DOCKER_VERSION=2.8.0-1
DOCKER_VERSION=1.13.1-1
NVIDIA_CONTAINER_RUNTIME_VERSION="3.6.0"
export NVIDIA_DRIVER_IMAGE_SHA="${GPU_IMAGE_SHA:=}"
export NVIDIA_DRIVER_IMAGE_TAG="${GPU_DV}-${NVIDIA_DRIVER_IMAGE_SHA}"
export NVIDIA_DRIVER_IMAGE="mcr.microsoft.com/aks/aks-gpu"
export CTR_GPU_INSTALL_CMD="ctr run --privileged --rm --net-host --with-ns pid:/proc/1/ns/pid --mount type=bind,src=/opt/gpu,dst=/mnt/gpu,options=rbind --mount type=bind,src=/opt/actions,dst=/mnt/actions,options=rbind"
export DOCKER_GPU_INSTALL_CMD="docker run --privileged --net=host --pid=host -v /opt/gpu:/mnt/gpu -v /opt/actions:/mnt/actions --rm"
APT_CACHE_DIR=/var/cache/apt/archives/
PERMANENT_CACHE_DIR=/root/aptcache/
EVENTS_LOGGING_DIR=/var/log/azure/Microsoft.Azure.Extensions.CustomScript/events/
CURL_OUTPUT=/tmp/curl_verbose.out

retrycmd_if_failure() {
    retries=$1; wait_sleep=$2; timeout=$3; shift && shift && shift
    for i in $(seq 1 $retries); do
        timeout $timeout "${@}" && break || \
        if [ $i -eq $retries ]; then
            echo Executed \"$@\" $i times;
            return 1
        else
            sleep $wait_sleep
        fi
    done
    echo Executed \"$@\" $i times;
}
retrycmd_nslookup() {
    wait_sleep=$1; timeout=$2; total_timeout=$3; record=$4
    start_time=$(date +%s)
    while true; do
        nslookup -timeout=$timeout -retry=0 $record && break || \
        current_time=$(date +%s)
        if [ $((current_time - start_time)) -ge $total_timeout ]; then
            echo "Total timeout $total_timeout reached, nslookup -timeout=$timeout -retry=0 $record failed"
            return 1
        fi
        sleep $wait_sleep
    done
    current_time=$(date +%s)
    echo "Executed nslookup -timeout=$timeout -retry=0 $record for $((current_time - start_time)) seconds";
}
retrycmd_if_failure_no_stats() {
    retries=$1; wait_sleep=$2; timeout=$3; shift && shift && shift
    for i in $(seq 1 $retries); do
        timeout $timeout ${@} && break || \
        if [ $i -eq $retries ]; then
            return 1
        else
            sleep $wait_sleep
        fi
    done
}
retrycmd_get_tarball() {
    tar_retries=$1; wait_sleep=$2; tarball=$3; url=$4
    echo "${tar_retries} retries"
    for i in $(seq 1 $tar_retries); do
        tar -tzf $tarball && break || \
        if [ $i -eq $tar_retries ]; then
            return 1
        else
            timeout 60 curl -fsSLv $url -o $tarball > $CURL_OUTPUT 2>&1
            if [[ $? != 0 ]]; then
                cat $CURL_OUTPUT
            fi
            sleep $wait_sleep
        fi
    done
}
retrycmd_curl_file() {
    curl_retries=$1; wait_sleep=$2; timeout=$3; filepath=$4; url=$5
    echo "${curl_retries} retries"
    for i in $(seq 1 $curl_retries); do
        [[ -f $filepath ]] && break
        if [ $i -eq $curl_retries ]; then
            return 1
        else
            timeout $timeout curl -fsSLv $url -o $filepath 2>&1 | tee $CURL_OUTPUT >/dev/null
            if [[ $? != 0 ]]; then
                cat $CURL_OUTPUT
            fi
            sleep $wait_sleep
        fi
    done
}
wait_for_file() {
    retries=$1; wait_sleep=$2; filepath=$3
    paved=/opt/azure/cloud-init-files.paved
    grep -Fq "${filepath}" $paved && return 0
    for i in $(seq 1 $retries); do
        grep -Fq '#EOF' $filepath && break
        if [ $i -eq $retries ]; then
            return 1
        else
            sleep $wait_sleep
        fi
    done
    sed -i "/#EOF/d" $filepath
    echo $filepath >> $paved
}
systemctl_restart() {
    retries=$1; wait_sleep=$2; timeout=$3 svcname=$4
    for i in $(seq 1 $retries); do
        timeout $timeout systemctl daemon-reload
        timeout $timeout systemctl restart $svcname && break || \
        if [ $i -eq $retries ]; then
            return 1
        else
            systemctl status $svcname --no-pager -l
            journalctl -u $svcname
            sleep $wait_sleep
        fi
    done
}
systemctl_stop() {
    retries=$1; wait_sleep=$2; timeout=$3 svcname=$4
    for i in $(seq 1 $retries); do
        timeout $timeout systemctl daemon-reload
        timeout $timeout systemctl stop $svcname && break || \
        if [ $i -eq $retries ]; then
            return 1
        else
            sleep $wait_sleep
        fi
    done
}
systemctl_disable() {
    retries=$1; wait_sleep=$2; timeout=$3 svcname=$4
    for i in $(seq 1 $retries); do
        timeout $timeout systemctl daemon-reload
        timeout $timeout systemctl disable $svcname && break || \
        if [ $i -eq $retries ]; then
            return 1
        else
            sleep $wait_sleep
        fi
    done
}
sysctl_reload() {
    retries=$1; wait_sleep=$2; timeout=$3
    for i in $(seq 1 $retries); do
        timeout $timeout sysctl --system && break || \
        if [ $i -eq $retries ]; then
            return 1
        else
            sleep $wait_sleep
        fi
    done
}
version_gte() {
  test "$(printf '%s\n' "$@" | sort -rV | head -n 1)" == "$1"
}

systemctlEnableAndStart() {
    systemctl_restart 100 5 30 $1
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

semverCompare() {
    VERSION_A=$(echo $1 | cut -d "+" -f 1)
    VERSION_B=$(echo $2 | cut -d "+" -f 1)
    [[ "${VERSION_A}" == "${VERSION_B}" ]] && return 0
    sorted=$(echo ${VERSION_A} ${VERSION_B} | tr ' ' '\n' | sort -V )
    highestVersion=$(IFS= echo "${sorted}" | cut -d$'\n' -f2)
    [[ "${VERSION_A}" == ${highestVersion} ]] && return 0
    return 1
}
downloadDebPkgToFile() {
    PKG_NAME=$1
    PKG_VERSION=$2
    PKG_DIRECTORY=$3
    mkdir -p $PKG_DIRECTORY
    pushd ${PKG_DIRECTORY}
    retrycmd_if_failure 10 5 600 apt-get download ${PKG_NAME}=${PKG_VERSION}*
    popd
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
    if [[ ${arch,,} == "aarch64" || ${arch,,} == "arm64"  ]]; then
        echo "arm64"
    else
        echo "amd64"
    fi
}
isARM64() {
    if [[ $(getCPUArch) == "arm64" ]]; then
        echo 1
    else
        echo 0
    fi
}

logs_to_events() {
    local task=$1; shift
    local eventsFileName=$(date +%s%3N)

    local startTime=$(date +"%F %T.%3N")
    ${@}
    ret=$?
    local endTime=$(date +"%F %T.%3N")

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
    echo ${json_string} > ${EVENTS_LOGGING_DIR}${eventsFileName}.json

    if [ "$ret" != "0" ]; then
      return $ret
    fi
}

should_skip_nvidia_drivers() {
    set -x
    body=$(curl -fsSL -H "Metadata: true" --noproxy "*" "http://169.254.169.254/metadata/instance?api-version=2021-02-01")
    ret=$?
    if [ "$ret" != "0" ]; then
      return $ret
    fi
    should_skip=$(echo "$body" | jq -e '.compute.tagsList | map(select(.name | test("SkipGpuDriverInstall"; "i")))[0].value // "false" | test("true"; "i")')
    echo "$should_skip"
}

installJq() {
  output=$(jq --version)
  if [ -n "$output" ]; then
    echo "$output"
  else
    if [[ $OS == $MARINER_OS_NAME ]]; then
      sudo tdnf install -y jq && echo "jq was installed: $(jq --version)"
    else
      apt_get_install 5 1 60 jq && echo "jq was installed: $(jq --version)"
    fi
  fi
}


check_array_size() {
  declare -n array_name=$1
  local array_size=${#array_name[@]}
  if [[ ${array_size} -gt 0 ]]; then
    last_index=$(( ${#array_name[@]} - 1 ))
  else
    return 1
  fi
}

capture_benchmark() {
  set +x
  local title="$1"
  title="${title//[[:space:]]/_}"
  title="${title//-/_}"
  benchmarks+=($title)
  check_array_size benchmarks || { echo "Benchmarks array is empty"; return; }
  declare -n current_section="${benchmarks[last_index]}"
  local is_final_section=${2:-false}

  local current_time=$(date +%s)
  local end_timestamp=$(date +%H:%M:%S)
  if [[ "$is_final_section" == true ]]; then
    local start_timestamp=$script_start_timestamp
    local start_time=$script_start_stopwatch
  else
    local start_timestamp=$section_start_timestamp
    local start_time=$section_start_stopwatch
  fi

  local difference_in_seconds=$((current_time - start_time))
  local elapsed_hours=$(($difference_in_seconds/3600))
  local elapsed_minutes=$((($difference_in_seconds%3600)/60))
  local elapsed_seconds=$(($difference_in_seconds%60))
  printf -v total_time_elapsed "%02d:%02d:%02d" $elapsed_hours $elapsed_minutes $elapsed_seconds

  current_section+=($start_timestamp)
  current_section+=($end_timestamp)
  current_section+=($total_time_elapsed)

  unset -n current_section

  section_start_stopwatch=$(date +%s)
  section_start_timestamp=$(date +%H:%M:%S)

  set -x
}

process_benchmarks() {
  set +x
  check_array_size benchmarks || { echo "Benchmarks array is empty"; return; }
  declare -n script_stats="${benchmarks[last_index]}"
  
  script_object=$(jq -n --arg script_name "$(basename $0)" --arg script_start_timestamp "${script_stats[0]}" --arg end_timestamp "${script_stats[1]}" --arg total_time_elapsed "${script_stats[2]}" '{($script_name): {"overall": {"start_time": $script_start_timestamp, "end_time": $end_timestamp, "total_time_elapsed": $total_time_elapsed}}}')

  unset script_stats[@]
  unset -n script_stats

  for ((i=0; i<${#benchmarks[@]} - 1; i+=1)); do
      
    declare -n section_name="${benchmarks[i]}"
     
    section_object=$(jq -n --arg section_name "${benchmarks[i]}" --arg section_start_timestamp "${section_name[0]}" --arg end_timestamp "${section_name[1]}" --arg total_time_elapsed "${section_name[2]}" '{($section_name): {"start_time": $section_start_timestamp, "end_time": $end_timestamp, "total_time_elapsed": $total_time_elapsed}}')
      
    script_object=$(jq -n --argjson script_object "$script_object" --argjson section_object "$section_object" --arg script_name "$(basename $0)" '$script_object | .[$script_name] += $section_object')
    
    unset section_name[@]
    unset -n section_name

  done

  echo "Benchmarks:"
  echo "$script_object" | jq -C .
 
  jq ". += [$script_object]" ${VHD_BUILD_PERF_DATA} > tmp.json && mv tmp.json ${VHD_BUILD_PERF_DATA}
  chmod 755 ${VHD_BUILD_PERF_DATA}
  set -x
}

#return proper release metadata for the package based on the os and osVersion
#e.g., For os UBUNTU 18.04, if there is a release "r1804" defined in components.json, then set RELEASE to "r1804"
#Otherwise set RELEASE to "current"
updateRelease() {
    local package="$1"
    local os="$2"
    local osVersion="$3"
    RELEASE="current"
    local osVersionWithoutDot=$(echo "${osVersion}" | sed 's/\.//g')
    #For UBUNTU, if $osVersion is 18.04 and "r1804" is also defined in components.json, then $release is set to "r1804"
    #Similarly for 20.04 and 22.04. Otherwise $release is set to .current.
    #For MARINER, the release is always set to "current" now.
    if [[ "${os}" == "${MARINER_KATA_OS_NAME}" || "${os}" == "${MARINER_OS_NAME}" ]]; then
        return 0
    fi
    if [[ $(echo "${package}" | jq ".downloadURIs.ubuntu.\"r${osVersionWithoutDot}\"") != "null" ]]; then
        RELEASE="\"r${osVersionWithoutDot}\""
    fi
}

updatePackageVersions() {
    local package="$1"
    local os="$2"
    local osVersion="$3"
    RELEASE="current"
    updateRelease "${package}" "${os}" "${osVersion}"
    local osLowerCase=$(echo "${os}" | tr '[:upper:]' '[:lower:]')
    PACKAGE_VERSIONS=()

    #if .downloadURIs.${osLowerCase} exist, then get the versions from there.
    #otherwise get the versions from .downloadURIs.default 
    if [[ $(echo "${package}" | jq ".downloadURIs.${osLowerCase}") != "null" ]]; then
        if jq -e ".downloadURIs.${osLowerCase}.${RELEASE}.versions | length == 0" <<< "${package}" > /dev/null; then
            return
        fi
        versions=$(echo "${package}" | jq ".downloadURIs.${osLowerCase}.${RELEASE}.versions[]" -r)
        for version in ${versions[@]}; do
            PACKAGE_VERSIONS+=("${version}")
        done
        return
    fi
    versions=$(echo "${package}" | jq ".downloadURIs.default.${RELEASE}.versions[]" -r)
    for version in ${versions[@]}; do
        PACKAGE_VERSIONS+=("${version}")
    done
    return 0
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
    if [[ $(echo "${package}" | jq ".downloadURIs.${osLowerCase}") != "null" ]]; then
        downloadURL=$(echo "${package}" | jq ".downloadURIs.${osLowerCase}.${RELEASE}.downloadURL" -r)
        [ "${downloadURL}" = "null" ] && PACKAGE_DOWNLOAD_URL="" || PACKAGE_DOWNLOAD_URL="${downloadURL}"
        return
    fi
    downloadURL=$(echo "${package}" | jq ".downloadURIs.default.${RELEASE}.downloadURL" -r)
    [ "${downloadURL}" = "null" ] && PACKAGE_DOWNLOAD_URL="" || PACKAGE_DOWNLOAD_URL="${downloadURL}"
    return    
}

#HELPERSEOF