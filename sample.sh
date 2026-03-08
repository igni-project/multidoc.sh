#!/bin/sh

DOC_FORMAT='md'
DOC_CONTENTS_ENABLE=1
. templates/nofrills.sh

doc_header 'Multidoc.sh Example'
doc_subheader 'IGNI Project'

doc_h1 'This is a size 1 heading,'
doc_h2 'This is a size 2 heading,'
doc_h3 'This is a size 3 heading,'
doc_h4 'This is a size 4 heading,'
doc_h5 "$(doc_inl_i This) is a size 5 heading,"
doc_h6 "and $(doc_inl_b this) is a size 6 heading."

doc_p 'Right here is a paragraph.'

doc_nlist_start 
doc_nlist_entry "numbered list item 1"
doc_nlist_entry "numbered list item 2"
doc_nlist_entry "numbered list item 3"
doc_nlist_end

doc_list_start 
doc_list_entry "bullet list item 1"
doc_list_entry "bullet list item 2"
doc_list_entry "bullet list item 3"
doc_list_end

doc_splitter

DOC_LINK_TEXT="Example link"
doc_link "https://example.com/"

DOC_LINK_TEXT="Igni Logo"
doc_image "https://avatars.githubusercontent.com/u/181029195"

doc_gen
