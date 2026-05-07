doc_indent_txt()
{
    printf "${1}"
    awk 1 ORS="\n${1}"
}
