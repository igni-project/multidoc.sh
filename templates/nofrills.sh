# Multidoc.sh Template: "No Frills"
# Igni Project 2026
#
# Valid DOC_FORMAT values
# md	Markdown
# html	Hypertext Markup Language (HTML)


# -- VARIABLES --

DOC_HEADER_CODE=""
DOC_SUBHEADER_CODE=""
DOC_CONTENTS=""
DOC_BODY_CODE=""
DOC_FOOTER_CODE=""
DOC_NLIST_COUNTER=0
DOC_LINK_TEXT=""
DOC_HEADER_LEVEL=0
DOC_COUNTER=0
DOC_INDENT_CHAR='    '
DOC_INDENT_CONTENTS=''
DOC_INDENT=''
DOC_TABLE_ROW_COUNTER=0
DOC_TABLE_ROW_LEN=0

if [ "${DOC_FORMAT}" = "html" ]
then
	DOC_INDENT=$DOC_INDENT_CHAR
	DOC_INDENT_CONTENTS=$DOC_INDENT_CHAR
fi

# -- FUNCTIONS PT.1: Abstraction Layer --

doc_header()          { doc_header_$DOC_FORMAT $@          ; }
doc_subheader()       { doc_subheader_$DOC_FORMAT $@       ; }
doc_h1()              { doc_h1_$DOC_FORMAT $@              ; }
doc_h2()              { doc_h2_$DOC_FORMAT $@              ; }
doc_h3()              { doc_h3_$DOC_FORMAT $@              ; }
doc_h4()              { doc_h4_$DOC_FORMAT $@              ; }
doc_h5()              { doc_h5_$DOC_FORMAT $@              ; }
doc_h6()              { doc_h6_$DOC_FORMAT $@              ; }
doc_p()               { doc_p_$DOC_FORMAT $@               ; }
doc_quote()           { doc_quote_$DOC_FORMAT $@           ; }
doc_nlist_start()     { doc_nlist_start_$DOC_FORMAT $@     ; }
doc_nlist_entry()     { doc_nlist_entry_$DOC_FORMAT $@     ; }
doc_nlist_end()       { doc_nlist_end_$DOC_FORMAT $@       ; }
doc_list_start()      { doc_list_start_$DOC_FORMAT $@      ; }
doc_list_entry()      { doc_list_entry_$DOC_FORMAT $@      ; }
doc_list_end()        { doc_list_end_$DOC_FORMAT $@        ; }
doc_code()            { doc_code_$DOC_FORMAT $@            ; }
doc_splitter()        { doc_splitter_$DOC_FORMAT $@        ; }
doc_link()            { doc_link_$DOC_FORMAT $@            ; }
doc_image()           { doc_image_$DOC_FORMAT $@           ; }
doc_table_start()     { doc_table_start_$DOC_FORMAT $@     ; }
doc_table_new_row()   { doc_table_new_row_$DOC_FORMAT $@   ; }
doc_table_cell()      { doc_table_cell_$DOC_FORMAT $@      ; }
doc_table_end()       { doc_table_end_$DOC_FORMAT $@       ; }
doc_b()               { doc_inl_b_$DOC_FORMAT $@           ; }
doc_i()               { doc_inl_i_$DOC_FORMAT $@           ; }
doc_inl_b()           { doc_inl_b_$DOC_FORMAT $@           ; }
doc_inl_i()           { doc_inl_i_$DOC_FORMAT $@           ; }
doc_gen()             { doc_gen_$DOC_FORMAT $@             ; }

doc_indent_in() { DOC_INDENT="${DOC_INDENT_CHAR}${DOC_INDENT}" ; }
doc_indent_out() { DOC_INDENT=$(printf "${DOC_INDENT}" | cut -c 5-) ; }

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
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}# ${*}\n\n"
	DOC_CONTENTS="${DOC_CONTENTS}\055 ${*}\n"
}

doc_h2_md()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}## ${*}\n\n"
	DOC_CONTENTS="${DOC_CONTENTS}    \055 ${*}\n"
}

doc_h3_md()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}### ${*}\n\n"
	DOC_CONTENTS="${DOC_CONTENTS}        \055 ${*}\n"
}

doc_h4_md()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}#### ${*}\n\n"
	DOC_CONTENTS="${DOC_CONTENTS}            \055 ${*}\n"
}

doc_h5_md()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}##### ${*}\n\n"
	DOC_CONTENTS="${DOC_CONTENTS}                \055 ${*}\n"
}

doc_h6_md()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}###### ${*}\n\n"
	DOC_CONTENTS="${DOC_CONTENTS}                    \055 ${*}\n"
}

# Paragraph

doc_p_md()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${*}\n\n"
}

# Block Quote

doc_quote_md()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}> ${*}\n\n"
}

# Numbered List

doc_nlist_start_md()
{
	DOC_NLIST_COUNTER=0
}

doc_nlist_entry_md()
{
	DOC_NLIST_COUNTER=$(expr ${DOC_NLIST_COUNTER} + 1)
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}${DOC_NLIST_COUNTER}. ${*}\n"
}

doc_nlist_end_md() 
{
	DOC_BODY_CODE="${DOC_BODY_CODE}\n"
}

# Bullet List

doc_list_start_md()
{
	return
}

doc_list_entry_md()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}\055 ${*}\n"
}

doc_list_end_md()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}\n"
}

# Code Block

doc_code_md()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}\`${*}\`\n\n"
}

# Horizontal Splitter

doc_splitter_md()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}--------\n\n"
}

# Link

doc_link_md()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}\[${DOC_LINK_TEXT}\]\(${*}\)\n\n"
}

# Image

doc_image_md()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}!\[${DOC_LINK_TEXT}\]\(${*}\)\n\n"
}

# Table

doc_table_start_md()
{
		DOC_BODY_CODE="${DOC_BODY_CODE}| "
}

doc_table_new_row_md()
{
	if [ -z ${DOC_TABLE_ROW_COUNTER} ]
	then
		DOC_BODY_CODE="${DOC_BODY_CODE}\n| "
	else
		DOC_BODY_CODE="${DOC_BODY_CODE}\n--------\n| "
	fi

	DOC_TABLE_ROW_COUNTER=$(expr ${DOC_TABLE_ROW_COUNTER} + 1)
}

doc_table_cell_md()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${*} | "
}

doc_table_end_md()
{
	return
}

# Inline Formatting

doc_inl_b_md()
{
	printf "**${*}**"
}

doc_inl_i_md()
{
	printf "*${*}*"
}

# Generate Document

doc_gen_md()
{
	DOC_CONTENTS="## Table of Contents\n\n${DOC_CONTENTS}"

	printf "${DOC_HEADER_CODE}${DOC_SUBHEADER_CODE}\n\n\n\n"

	if [ -n "${DOC_CONTENTS_ENABLE}" ]
	then
		printf "${DOC_CONTENTS}\n"
	fi
	
	printf "${DOC_BODY_CODE}"
}

# HTML

doc_header_html()
{
	DOC_HEADER_CODE="${DOC_INDENT}<h1>${*}</h1>\n"
}

doc_subheader_html()
{
	DOC_SUBHEADER_CODE="${DOC_INDENT}<h2>${*}</h2>\n"
}

doc_h1_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<h1>${*}</h1>\n"
	
	DOC_COUNTER=$DOC_HEADER_LEVEL
	while [ $DOC_COUNTER -lt 1 ];
	do
		DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}<ul>\n"
		DOC_COUNTER=$(expr $DOC_COUNTER + 1)
		DOC_INDENT_CONTENTS="${DOC_INDENT_CONTENTS}${DOC_INDENT_CHAR}"
	done
	
	while [ $DOC_COUNTER -gt 1 ];
	do
		DOC_COUNTER=$(expr $DOC_COUNTER - 1)
		DOC_INDENT_CONTENTS=$(printf "${DOC_INDENT_CONTENTS}" | cut -c 5-)
		DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}</ul>\n"
	done
	
	DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}<li>${*}</li>\n"
	DOC_HEADER_LEVEL=1
}

doc_h2_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<h2>${*}</h2>\n"
	
	DOC_COUNTER=$DOC_HEADER_LEVEL
	while [ $DOC_COUNTER -lt 2 ];
	do
		DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}<ul>\n"
		DOC_COUNTER=$(expr $DOC_COUNTER + 1)
		DOC_INDENT_CONTENTS="${DOC_INDENT_CONTENTS}${DOC_INDENT_CHAR}"
	done
	
	while [ $DOC_COUNTER -gt 2 ];
	do
		DOC_COUNTER=$(expr $DOC_COUNTER - 1)
		DOC_INDENT_CONTENTS=$(printf "${DOC_INDENT_CONTENTS}" | cut -c 5-)
		DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}</ul>\n"
	done
	
	DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}<li>${*}</li>\n"
	DOC_HEADER_LEVEL=2
}

doc_h3_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<h3>${*}</h3>\n"
	
	DOC_COUNTER=$DOC_HEADER_LEVEL
	while [ $DOC_COUNTER -lt 3 ];
	do
		DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}<ul>\n"
		DOC_COUNTER=$(expr $DOC_COUNTER + 1)
		DOC_INDENT_CONTENTS="${DOC_INDENT_CONTENTS}${DOC_INDENT_CHAR}"
	done
	
	while [ $DOC_COUNTER -gt 3 ];
	do
		DOC_COUNTER=$(expr $DOC_COUNTER - 1)
		DOC_INDENT_CONTENTS=$(printf "${DOC_INDENT_CONTENTS}" | cut -c 5-)
		DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}</ul>\n"
	done
	
	DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}<li>${*}</li>\n"

	DOC_HEADER_LEVEL=3
}

doc_h4_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<h4>${*}</h4>\n"
	
	DOC_COUNTER=$DOC_HEADER_LEVEL
	while [ $DOC_COUNTER -lt 4 ];
	do
		DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}<ul>\n"
		DOC_COUNTER=$(expr $DOC_COUNTER + 1)
		DOC_INDENT_CONTENTS="${DOC_INDENT_CONTENTS}${DOC_INDENT_CHAR}"
	done
	
	while [ $DOC_COUNTER -gt 4 ];
	do
		DOC_COUNTER=$(expr $DOC_COUNTER - 1)
		DOC_INDENT_CONTENTS=$(printf "${DOC_INDENT_CONTENTS}" | cut -c 5-)
		DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}</ul>\n"
	done
	
	DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}<li>${*}</li>\n"

	DOC_HEADER_LEVEL=4
}

doc_h5_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<h5>${*}</h5>\n"

	DOC_COUNTER=$DOC_HEADER_LEVEL
	while [ $DOC_COUNTER -lt 5 ];
	do
		DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}<ul>\n"
		DOC_COUNTER=$(expr $DOC_COUNTER + 1)
		DOC_INDENT_CONTENTS="${DOC_INDENT_CONTENTS}${DOC_INDENT_CHAR}"
	done
	
	while [ $DOC_COUNTER -gt 5 ];
	do
		DOC_COUNTER=$(expr $DOC_COUNTER - 1)
		DOC_INDENT_CONTENTS=$(printf "${DOC_INDENT_CONTENTS}" | cut -c 5-)
		DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}</ul>\n"
	done
	
	DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}<li>${*}</li>\n"

	DOC_HEADER_LEVEL=5
}

doc_h6_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<h6>${*}</h6>\n"

	DOC_COUNTER=$DOC_HEADER_LEVEL
	while [ $DOC_COUNTER -lt 6 ];
	do
		DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}<ul>\n"
		DOC_COUNTER=$(expr $DOC_COUNTER + 1)
		DOC_INDENT_CONTENTS="${DOC_INDENT_CONTENTS}${DOC_INDENT_CHAR}"
	done
	
	while [ $DOC_COUNTER -gt 6 ];
	do
		DOC_COUNTER=$(expr $DOC_COUNTER - 1)
		DOC_INDENT_CONTENTS=$(printf "${DOC_INDENT_CONTENTS}" | cut -c 5-)
		DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}</ul>\n"
	done
	
	DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}<li>${*}</li>\n"

	DOC_HEADER_LEVEL=6
}

# Paragraph

doc_p_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<p>${*}</p>\n"
}

# Block Quote

doc_quote_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<blockquote>${*}</blockquote>\n"
}

# Numbered List

doc_nlist_start_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<ol>\n"
	doc_indent_in
}

doc_nlist_entry_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<li>${*}</li>\n"
}

doc_nlist_end_html()
{
	doc_indent_out
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}</ol>\n"
}

# Bullet List

doc_list_start_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<ul>\n"
	doc_indent_in
}

doc_list_entry_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<li>${*}</li>\n"
}

doc_list_end_html()
{
	doc_indent_out
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}</ul>\n"
}

# Code Block

doc_code_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<code>${*}</code>\n"
}

# Horizontal Splitter

doc_splitter_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<hr>\n"
}

# Link

doc_link_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<a href=\"${*}\">${DOC_LINK_TEXT}</a>\n"
}

# Image

doc_image_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<img src=\"${*}\" alt=\"${DOC_LINK_TEXT}\">\n"
}

# Table

doc_table_start_html()
{
	DOC_TABLE_ROW_COUNTER=0
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}<table>\n${DOC_INDENT}${DOC_INDENT_CHAR}<tr>\n"
	doc_indent_in
}

doc_table_new_row_html()
{
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}</tr>\n${DOC_INDENT}<tr>\n"
	DOC_TABLE_ROW_COUNTER=$(expr ${DOC_TABLE_ROW_COUNTER} + 1)
}

doc_table_cell_html()
{
	if [ ${DOC_TABLE_ROW_COUNTER} = '0' ]
	then
		DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}${DOC_INDENT_CHAR}<th>${*}</th>\n"
	else
		DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}${DOC_INDENT_CHAR}<td>${*}</td>\n"
	fi
}

doc_table_end_html()
{
	doc_indent_out
	DOC_BODY_CODE="${DOC_BODY_CODE}${DOC_INDENT}${DOC_INDENT_CHAR}</tr>\n${DOC_INDENT}</table>\n"
}

# Inline Formatting

doc_inl_b_html()
{
	printf "<b>${*}</b>"
}

doc_inl_i_html()
{
	printf "<i>${*}</i>"
}

# Generate Document

doc_gen_html()
{
	DOC_CONTENTS="${DOC_INDENT_CHAR}<h2>Table of Contents</h2>\n${DOC_CONTENTS}"
	
	printf "<!DOCTYPE html>\n<html lang=\"en\" class=\"no-js\">\n"

	printf "${DOC_HEADER_CODE}${DOC_SUBHEADER_CODE}\n"
	
	if [ -n "${DOC_CONTENTS_ENABLE}" ];
	then
	
		DOC_COUNTER=$DOC_HEADER_LEVEL
		while [ $DOC_COUNTER -gt 0 ];
		do
			DOC_INDENT_CONTENTS=$(printf "${DOC_INDENT_CONTENTS}" | cut -c 5-)
			DOC_COUNTER=$(expr $DOC_COUNTER - 1)
			DOC_CONTENTS="${DOC_CONTENTS}${DOC_INDENT_CONTENTS}</ul>\n"
		done
	
		printf "${DOC_CONTENTS}\n"
	fi
	
	printf "${DOC_BODY_CODE}"
	
	printf "</html>\n"
}

# -- CHECKS & PREPARATION --

if [ "${DOC_FORMAT}" = "" ]
then
	printf "ERROR: variable 'DOC_FORMAT' not set!\n\nAccepted values for DOC_FORMAT:\n\055 'md'\n\055 'html'"
	exit
fi
