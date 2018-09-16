# vim-todo-highlight
a vim plugin to highlight todos and fixmes

## Installation
#### [vim-plug](https://github.com/junegunn/vim-plug)
Add the following configuration to your `.vimrc`.
```vim
Plug 'sakshamgupta05/vim-todo-highlight'
```
Install with `:PlugInstall`.

#### [Pathogen](https://github.com/tpope/vim-pathogen)
Install with the following command.
```sh
git clone https://github.com/sakshamgupta05/vim-todo-highlight ~/.vim/bundle/vim-todo-highlight
```

#### [Vundle](https://github.com/VundleVim/Vundle.vim)
Add the following configuration to your `.vimrc`.
```vim
Plugin 'sakshamgupta05/vim-todo-highlight'
```
Install with `:PluginInstall`.

#### [NeoBundle](https://github.com/Shougo/neobundle.vim)
Add the following configuration to your `.vimrc`.
```vim
NeoBundle 'sakshamgupta05/vim-todo-highlight'
```
Install with `:NeoBundleInstall`.

## Introduction
This plugin helps you to remember the `TODO:` and `FIXME:` you have written in your code by highlighting them inside vim.

### Usage
Just type `TODO:` or `FIXME:` inside a comment and this plugin will highlight it for you.

## Configuration
### Default configuration
`gui` &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: HEX colors for terminals that support *24bit true colour*  
`cterm` &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 256 colors for terminals that support only *256 colour palette*  
`fg_color` : text color  
`bg_color` : background color
```vim
{
  'TODO': {
    'gui_fg_color': '#ffffff',
    'gui_bg_color': '#ffbd2a',
    'cterm_fg_color': 'white',
    'cterm_bg_color': '214'
  },
  'FIXME': {
    'gui_fg_color': '#ffffff',
    'gui_bg_color': '#f06292',
    'cterm_fg_color': 'white',
    'cterm_bg_color': '204'
  }
}
```
### Disable default annotations
If you want to disable highlighting for the default annotations, configure as
```vim
let g:todo_highlight_disable_default = ['TODO', 'FIXME']
```

### Add custom annotations
To add your own custom annotations and/or customize colors for existing annotations, configure as (if you leave any attribute as blank, the default(`TODO`) configurations will be used)
```vim
let g:todo_highlight_config = {
        \ 'REVIEW': {},
        \ 'NOTE': {
          \ 'gui_fg_color': '#ffffff',
          \ 'gui_bg_color': '#ffbd2a',
          \ 'cterm_fg_color': 'white',
          \ 'cterm_bg_color': '214'
        \ }
      \ }
```
