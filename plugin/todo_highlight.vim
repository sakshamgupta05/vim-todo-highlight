" File: todo_highlight.vim
" Author: Saksham Gupta <https://github.com/sakshamgupta05>
" Description: a Vim/Neovim plugin to highlight todos and fixmes

" make sure file is loaded only once
if exists("g:loaded_todo_highlight")
  finish
endif
let g:loaded_todo_highlight = 1

" default highlight config
let s:todo_highlight_config_default = {
      \   'TODO': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#ffbd2a',
      \     'cterm_fg_color': 'white',
      \     'cterm_bg_color': '214'
      \   },
      \     'FIXME': {
      \     'gui_fg_color': '#ffffff',
      \     'gui_bg_color': '#f06292',
      \     'cterm_fg_color': 'white',
      \     'cterm_bg_color': '204'
      \   }
      \ }

" creates annotation group and highlight it according to the config
function! s:CreateAnnotationGroup(annotation, config)
  " set group name -> my_annotation
  let l:group_name = 'my_' . tolower(a:annotation)

  " make group for annotation where its pattern matches and is inside comment
  execute 'augroup ' . l:group_name
    autocmd!
    execute 'autocmd Syntax * syntax match ' . l:group_name .
          \ ' /\v\_.<' . a:annotation . ':/hs=s+1 containedin=.*Comment.*'
  augroup END

  " highlight the group according to the config
  if has('termguicolors')
    execute 'hi ' l:group_name .
          \ ' guifg = ' . get(a:config, 'gui_fg_color', s:todo_highlight_config_default['TODO']['gui_fg_color']) .
          \ ' guibg = ' . get(a:config, 'gui_bg_color', s:todo_highlight_config_default['TODO']['gui_bg_color'])
  else
    execute 'hi ' l:group_name .
          \ ' ctermfg = ' . get(a:config, 'cterm_fg_color', s:todo_highlight_config_default['TODO']['cterm_fg_color']) .
          \ ' ctermbg = ' . get(a:config, 'cterm_bg_color', s:todo_highlight_config_default['TODO']['cterm_bg_color'])
  endif
endfunction

" highlights the default annotation groups (`TODO`, `FIXME`)
for [annotation, config] in items(s:todo_highlight_config_default)
  " check if user has disabled the default annotation
  if !exists("g:todo_highlight_disable_default") || index(g:todo_highlight_disable_default, annotation) == -1
    call s:CreateAnnotationGroup(annotation, config)
  endif
endfor

" highlights the user specified custom annotation groups
if exists("g:todo_highlight_config")
  for [annotation, config] in items(g:todo_highlight_config)
    call s:CreateAnnotationGroup(annotation, config)
  endfor
endif
