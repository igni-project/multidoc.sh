#!/bin/sh

DOC_INDENT_CHAR='    '
DOC_INDENT=${DOC_INDENT_CHAR}

. multidoc/utils/indent.sh

cat examples/assets/foo | doc_indent_txt "${DOC_INDENT_CHAR}"
