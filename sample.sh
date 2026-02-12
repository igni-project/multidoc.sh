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

doc_gen
