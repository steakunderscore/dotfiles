" turn on spell check in Git commits.
autocmd FileType gitcommit set spell

autocmd BufRead,BufNewFile *.md set filetype=markdown

" Spell-check Markdown files
autocmd FileType markdown setlocal spell

" Wrap Markdown files
autocmd FileType markdown set wrap

" save on FocusLost
autocmd FocusLost * nested :silent! wall

" return to normal mode on FocustLost
autocmd FocusLost * call feedkeys("\<C-\>\<C-n>")

" treat dasherised words as whole words in stylesheets
autocmd Filetype css,scss,sass setlocal iskeyword+=-

function! WhatTheSize()
  execute ":!identify % | cut -d' ' -f 3"
endfunction
autocmd BufEnter *.jpg,*.png call WhatTheSize()

" :help last-position-jump
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Set colorcolumn to the current textwidth or fallback to the specified column.
function! ColorColumnAtTextWidth(column)
  if &textwidth > 0
    execute ':set cc=' . &textwidth
  else
    execute ':set cc=' . a:column
  endif
endfunction

" Set colorcolumn to the current textwidth or fallback to 80
autocmd BufWinEnter * call ColorColumnAtTextWidth(80)
