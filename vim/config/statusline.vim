set noshowmode

let g:lightline = {
  \ 'colorscheme': 'jellybeans',
  \ 'component_function': {
  \   'filename': 'LightLineFilename'
  \ }
\ }

function! LightLineFilename()
  return expand('%')
endfunction
