# Multidoc.sh 

Multidoc.sh is a collection of shell scripts that ease conversion between markup formats.

### Prerequisites

You need a POSIX compliant shell to run these scripts. On Windows, Git Bash will suffice.

### Usage

#### Importing Mutlidoc.sh
Most Multidoc.sh documents are written in shell script. To include a Multidoc.sh in your project, copy the `mutlidoc` directory in this repository's root directory into your project.

You may integrate Multidoc.sh in your shell scripts with a dot command (.). For example, in `./sample.sh`, the line `. multidoc/templates/nofrills.sh` includes the 'No Frills' template.

#### Script Execution
Scripts that use Multidoc.sh output generated markup code to stdout. This output can be redirected to a file. For example, running the command `./examples/nofrills-sample.sh > sample.md` creates a Markdown file from the code in `./examples/nofrills-sample.sh`. 
