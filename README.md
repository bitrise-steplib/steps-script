# Generic Script Runner Step

Specify the script content and (optionally) the script runner
binary and this step will execute it.

The *runner* can even be a command, if it's available in the PATH
and can execute the script it will work.

For example to run a [Go](https://golang.org/) Hello World "script"
you can define the content:

```
package main
import "fmt"
func main() {
    fmt.Println("hello world")
}
```

Set the *Execute with* parameter to `go run` and specify
a *script file path* because `go run` can only accept (at the moment)
files with a `.go` extension (just specify `main.go` or `step.go` as the script path).

If the `go` binary can be found in the `$PATH` your Hello World
script will run without any problem.
