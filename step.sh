#!/bin/bash

export PREVIOUS_EXIT_CODE=$?
THIS_SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

CONFIG_tmp_script_file_path="${THIS_SCRIPT_DIR}/._script_cont"

if [ -z "${content}" ] ; then
	echo " [!] => Failed: No script (content) defined for execution!"
	exit 1
fi

if [ -z "${runner_bin}" ] ; then
	echo " [!] => Failed: No script executor defined!"
	exit 1
fi

function debug_echo {
	local msg="$1"
	if [[ "${is_debug}" == "yes" ]] ; then
		echo "${msg}"
	fi
}


debug_echo
debug_echo "==> Start"

if [ ! -z "${working_dir}" ] ; then
	debug_echo "==> Switching to working directory: ${working_dir}"
	cd "${working_dir}"
	if [ $? -ne 0 ] ; then
		echo " [!] Failed to switch to working directory: ${working_dir}"
		exit 1
	fi
fi

if [ ! -z "${script_file_path}" ] ; then
	debug_echo "==> Script (tmp) save path specified: ${script_file_path}"
	CONFIG_tmp_script_file_path="${script_file_path}"
fi

echo -n "${content}" > "${CONFIG_tmp_script_file_path}"

debug_echo
${runner_bin} "${CONFIG_tmp_script_file_path}"
script_result=$?

debug_echo
debug_echo "==> Script finished with exit code: ${script_result}"

rm "${CONFIG_tmp_script_file_path}"
unset PREVIOUS_EXIT_CODE
exit ${script_result}
