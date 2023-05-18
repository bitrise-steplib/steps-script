#!/usr/bin/env bash

TEST_DIR="$(cd "$(dirname "$BASH_SOURCE[0]")"; pwd)"
main() {
	local expected=$(uuidgen)
	local script="echo \"$expected\""

	local result=$(content="$script" runner_bin=bash sh "${TEST_DIR}/../step.sh")
	if [[ $result != $expected ]]; then
		echo "Bash test failed ($result != $expected)"
		exit 1
	fi
	echo "Bash test passed"
}

main "$@"
