" ETNA header vim plugin
" thanks to Francisco Piedrafita for original code
" check the repo https://github.com/vim-scripts/header.vim
" modified for ETNA by TurukTheCook, check repo:
" https://github.com/TurukTheCook/etna-header

function s:filetype ()

  let s:file = expand("<afile>:t")
  let l:ft = &ft

  if l:ft ==# 'sh'
      let s:comment = "##"
      let s:comment_start = "#!/usr/bin/env bash"
      let s:comment_end = "##"
  elseif l:ft ==# 'python'
      let s:comment = "##"
      let s:comment_start = "#-*- coding:utf-8 -*-"
      let s:comment_end = "##"
  elseif l:ft ==# 'perl'
      let s:comment = "##"
      let s:comment_start = "#!/usr/local/bin/perl -w"
      let s:comment_end = "##"
  elseif l:ft ==# 'vim'
      let s:comment = "\""
      let s:comment_start = s:comment
      let s:comment_end = s:comment
  elseif l:ft ==# 'c' || l:ft ==# 'cpp'
      let s:comment = "**"
      let s:comment_start = "/*"
      let s:comment_end = "*/"
  elseif l:ft==# 'rst'
      let s:comment = ".."
      let s:comment_start = s:comment . " reStructuredText "
      let s:comment_end = s:comment
  elseif l:ft==# 'php'
      let s:comment = "\/\/"
      let s:comment_start = "#!/usr/local/bin/php<?php"
      let s:comment_end = s:comment
  elseif l:ft==# 'html'
      let s:comment = " --"
      let s:comment_start = "<!--"
      let s:comment_end = "-->"
  elseif l:ft ==# 'javascript'
      let s:comment = "\/\/"
      let s:comment_start = s:comment
      let s:comment_end = s:comment
  else
    let s:comment = "##"
    let s:comment_start = s:comment
    let s:comment_end = s:comment
  endif
  unlet s:file

endfunction


" FUNCTION:
" Insert the header when we create a new file.
" VARIABLES:
" header_etna = ETNA header + date + your login
" project_name = replace with project name after creating the header
" project_description = replace with project desc after creating the header

function s:add_header ()

  call s:filetype ()

  let s:header_etna = s:comment .         " ETNA PROJECT, " . strftime ("%d/%m/%Y") . " by LOGIN"
  let s:project_name = s:comment .        " project_name"
  let s:header_description = s:comment .  " File description:"
  let s:project_description = s:comment . "      project_description"

  call append (0, s:comment_start)
  call append (1, s:header_etna)
  call append (2, s:project_name)
  call append (3, s:header_description)
  call append (4, s:project_description)
  call append (5, s:comment_end)

  unlet s:comment
  unlet s:comment_start
  unlet s:comment_end
  unlet s:header_etna
  unlet s:project_name
  unlet s:header_description
  unlet s:project_description

endfunction


" FUNCTION:
" Update the date of last modification.
" Check the line number 6 looking for the pattern.
"
"function s:update_header ()
"
"  call s:filetype ()
"
"  let s:pattern = s:comment . " MODIFIED: [0-9]"
"  let s:line = getline (6)
"
"  if match (s:line, s:pattern) != -1
"    let s:modified = s:comment . " MODIFIED: " . strftime ("%Y-%m-%d %H:%M:%S")
"    call setline (6, s:modified)
"    unlet s:modified
"  endif
"
"  unlet s:comment
"  unlet s:pattern
"  unlet s:line
"
"endfunction

command! AddHeader call s:add_header ()
" autocmd BufNewFile * call s:add_header ()
" autocmd BufWritePre * call s:update_header ()
