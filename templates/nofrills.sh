# -- VARIABLES --

DOC_INDENT_CHAR='    '
DOC_INDENT=""

DOC_HEADER_CODE="# Multidoc.sh Document\n"
DOC_SUBHEADER_CODE="## You $(date +%Y)\n\n"
DOC_CONTENTS=""
DOC_BODY=""

# -- FUNCTIONS PT.1: Abstraction Layer --

doc_header()
{
	doc_header_$DOC_FORMAT $@
}

doc_subheader()
{
	doc_subheader_$DOC_FORMAT $@
}

doc_h1()
{
	doc_h1_$DOC_FORMAT $@
}

doc_h2()
{
	doc_h2_$DOC_FORMAT $@
}

doc_h3()
{
	doc_h3_$DOC_FORMAT $@
}

doc_h4()
{
	doc_h4_$DOC_FORMAT $@
}

doc_h5()
{
	doc_h5_$DOC_FORMAT $@
}

doc_h6()
{
	doc_h6_$DOC_FORMAT $@
}

doc_p()
{
	doc_p_$DOC_FORMAT $@
}

doc_inl_b()
{
	doc_inl_b_$DOC_FORMAT $@
}

doc_inl_i()
{
	doc_inl_i_$DOC_FORMAT $@
}

doc_indent_in()
{
	DOC_INDENT="${DOC_INDENT_CHAR}${DOC_INDENT}"
}

doc_indent_out()
{
	DOC_INDENT=$(printf "${DOC_INDENT}" | cut -c 5-)
}

doc_gen()
{
	doc_gen_$DOC_FORMAT $@
}

# -- FUNCTIONS PT.2: Lanuage Specific Functions --

# Markdown

doc_header_md()
{
	DOC_HEADER_CODE="# ${*}\n"
}

doc_subheader_md()
{
	DOC_SUBHEADER_CODE="## ${*}\n\n"
}

doc_h1_md()
{
	DOC_BODY="${DOC_BODY}${DOC_INDENT}# ${*}\n\n"
	DOC_CONTENTS="${DOC_CONTENTS}\055 ${*}\n"
}

doc_h2_md()
{
	DOC_BODY="${DOC_BODY}${DOC_INDENT}## ${*}\n\n"
	DOC_CONTENTS="${DOC_CONTENTS}    \055 ${*}\n"
}

doc_h3_md()
{
	DOC_BODY="${DOC_BODY}${DOC_INDENT}### ${*}\n\n"
	DOC_CONTENTS="${DOC_CONTENTS}        \055 ${*}\n"
}

doc_h4_md()
{
	DOC_BODY="${DOC_BODY}${DOC_INDENT}#### ${*}\n\n"
	DOC_CONTENTS="${DOC_CONTENTS}            \055 ${*}\n"
}

doc_h5_md()
{
	DOC_BODY="${DOC_BODY}${DOC_INDENT}##### ${*}\n\n"
	DOC_CONTENTS="${DOC_CONTENTS}                \055 ${*}\n"
}

doc_h6_md()
{
	DOC_BODY="${DOC_BODY}${DOC_INDENT}###### ${*}\n\n"
	DOC_CONTENTS="${DOC_CONTENTS}                    \055 ${*}\n"
}

doc_p_md()
{
	DOC_BODY="${DOC_BODY}${*}\n\n"
}

doc_inl_b_md()
{
	printf "**${*}**"
}

doc_inl_i_md()
{
	printf "*${*}*"
}

doc_gen_md()
{
	DOC_CONTENTS="## Table of Contents\n\n${DOC_CONTENTS}"

	printf "${DOC_HEADER_CODE}${DOC_SUBHEADER_CODE}\n\n\n\n"

	if [[ "${DOC_CONTENTS_ENABLE}" -ne "" ]]; then
		printf "${DOC_CONTENTS}\n"
	fi
	
	printf "${DOC_BODY}"
}

# -- CHECKS & PREPARATION --

if [[ "${DOC_FORMAT}" == "" ]]; then
	printf "ERROR: variable 'DOC_FORMAT' not set!\n\n"
	printf "Accepted values for DOC_FORMAT:\n"
	printf "\055 'md'"
	exit
fi
