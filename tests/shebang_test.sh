#!/usr/bin/env bash

TEST_DIR="$(cd "$(dirname "$BASH_SOURCE[0]")"; pwd)"
main() {
	local expected=$(uuidgen)
	read -rd '' script <<- EOF
	#!/usr/bin/env ruby
	puts "$expected"
EOF

	local result=$(content="$script" runner_bin=bash sh "${TEST_DIR}/../step.sh")
	if [[ $result != $expected ]]; then
		echo "Shebang test failed ($result != $expected)"
		exit 1
	fi
	echo "Shebang test passed"
}

main "$@"
