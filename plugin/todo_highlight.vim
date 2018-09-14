" vim-todo-highlight - a Vim/Neovim plugin to highlight todos and fixmes
" Maintainer:   Saksham Gupta <https://github.com/sakshamgupta05/vim-todo-highlight>
" Version:      1.0

" highlight todo and fixme in comments
hi myTodo ctermfg=white ctermbg=214 guifg=white guibg=#ffbd2a
hi myFixme ctermfg=white ctermbg=204 guifg=white guibg=#f06292

" create group for todo
augroup myTodo
  autocmd!
  autocmd Syntax * syntax match myTodo /\v\_.<TODO:/hs=s+1 containedin=.*Comment
augroup END

" create group for fixme
augroup myFixme
  autocmd!
  autocmd Syntax * syntax match myFixme /\v\_.<FIXME:/hs=s+1 containedin=.*Comment
augroup END
