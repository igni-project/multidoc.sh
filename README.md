# Multidoc.sh 

Multidoc.sh is a collection of shell scripts that ease conversion between markup formats.

### Prerequisites

You need a POSIX compliant shell to run these scripts.

### Using Mutlidoc.sh

Multidoc.sh documents are written in shell script. To include a Multidoc.sh template, include any file from the `templates/` subdirectory of this repository with a dot command (`.`). In `./sample.sh`, the line `. templates/nofrills.sh` includes the 'No Frills' template.

Scripts that use Multidoc.sh output generated markup code to stdout. This output can be redirected to a file. For example, running the command `./sample.sh > sample.md` creates a Markdown file from the code in `sample.sh`. 
