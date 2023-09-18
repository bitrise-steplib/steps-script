# Script

[![Step changelog](https://shields.io/github/v/release/bitrise-io/steps-script?include_prereleases&label=changelog&color=blueviolet)](https://github.com/bitrise-io/steps-script/releases)

Run any custom script you want. The power is in your hands. Use it wisely!

<details>
<summary>Description</summary>


Run any custom script you want as part of your Bitrise build. All you need to do is specifying the script runner  
(the default is bash), add the script, and run a build. 

You can also read the script from a file.

### Configuring the Step

1. Set the **Execute with/runner binary** input.

   Either define the path of the executor, or simply just add its name if you know it is available in the PATH, such as `ruby` or `python`. It can even be a command, such as `go run`.  

1. Write your script in the **Script content** input or specify a script file.

   If you have a script in your repository, you can simply run it from the file, either by calling it in the **Script content** input  
   or, optionally, by specifying the path to it in the **Script file path** input. 
   
   Be aware that relative paths are relative to the value set in the **Working directory** input - by default, it is your app's source directory.

### Troubleshooting

If the script fails, check the executor first - obviously, a Python script will not work with a bash runner.

Note that in certain cases, the filename or the filepath actually matters. For example, the `go run` command only accepts `.go` files.

### Useful links

* [System reports to check out the pre-installed executors](https://stacks.bitrise.io)
* [Exporting to Test Reports from custom Script Steps](https://devcenter.bitrise.io/testing/exporting-to-test-reports-from-custom-script-steps/)

### Related Steps

* [Script Runner](https://www.bitrise.io/integrations/steps/script-runner)
* [Remote Bash Script Runner](https://www.bitrise.io/integrations/steps/remote-script-runner)
</details>

## 🧩 Get started

Add this step directly to your workflow in the [Bitrise Workflow Editor](https://devcenter.bitrise.io/steps-and-workflows/steps-and-workflows-index/).

You can also run this step directly with [Bitrise CLI](https://github.com/bitrise-io/bitrise).

## ⚙️ Configuration

<details>
<summary>Inputs</summary>

| Key | Description | Flags | Default |
| --- | --- | --- | --- |
| `content` | Type your script here.  **Make sure that it returns a non zero exit code in case of an error!** The step will only fail if your script returns with a non zero exit code!  | required | `#!/usr/bin/env bash # fail if any commands fails set -e # make pipelines' return status equal the last command to exit with a non-zero status, or zero if all commands exit successfully set -o pipefail # debug log set -x  # write your script here echo "Hello World!"  # or run a script from your repository, like: # bash ./path/to/script.sh # not just bash, e.g.: # ruby ./path/to/script.rb` |
| `runner_bin` | The executor to be used for running the script. If it's available in the PATH you can just specify `ruby` or `python`, generally if you know the path of the executor you should define that, like `/bin/bash`.  You can even specify an execution command like `go run` instead of just a binary.  | required | `/bin/bash` |
| `working_dir` | This directory will be set as the current working directory for the script.  Any relative path in the Script (content) will be relative to this directory.  |  | `$BITRISE_SOURCE_DIR` |
| `script_file_path` | Save the specified script content to this path before execution. The file will be removed after the script finishes.  Generally you don't have to define this but there might be cases where the file's name or path actually matters. For example `go run` only accepts `.go` files.  If you specify a relative path then it will be relative to the *working directory* (which you can optionally specify as well).  |  |  |
| `is_debug` | If debug=yes the step will print debug infos about the working dir, tmp file path, exit code, etc.  |  | `no` |
</details>

<details>
<summary>Outputs</summary>
There are no outputs defined in this step
</details>

## 🙋 Contributing

We welcome [pull requests](https://github.com/bitrise-io/steps-script/pulls) and [issues](https://github.com/bitrise-io/steps-script/issues) against this repository.

For pull requests, work on your changes in a forked repository and use the Bitrise CLI to [run step tests locally](https://devcenter.bitrise.io/bitrise-cli/run-your-first-build/).

Learn more about developing steps:

- [Create your own step](https://devcenter.bitrise.io/contributors/create-your-own-step/)
- [Testing your Step](https://devcenter.bitrise.io/contributors/testing-and-versioning-your-steps/)
