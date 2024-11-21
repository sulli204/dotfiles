filetype off                  " required
set number
set numberwidth=3

set expandtab
set tabstop=2
set softtabstop=2
set guifont=Monospace:h20

:set autochdir

autocmd BufWritePre * :%s/\s\+$//e

nnoremap <C-j> :tabprevious<CR>
nnoremap <C-k> :tabnext<CR>

syntax enable
set background=dark
colorscheme solarized

set laststatus=2
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'itchyny/lightline.vim'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-rails'
Plugin 'tpope/vim-haml'
Plugin 'preservim/nerdtree'
Bundle 'vim-ruby/vim-ruby'

call vundle#end()           " required
filetype plugin indent on   "required
"
" Brief help :PluginList       - lists configured plugins :PluginInstall    -
" installs plugins; append `!` to update or just :PluginUpdate :PluginSearch
" foo - searches for foo; append `!` to refresh local cache :PluginClean
" - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ Put your non-Plugin stuff
" after this line
"
set ruler

function! LightlineFilename()
  let root = fnamemodify(get(b:, 'git_dir'), ':h')
  let path = expand('%:p')
  if path[:len(root)-1] ==# root
    return path[len(root)+1:]
  endif
  return expand('%')
endfunction

let g:lightline = {
      \ 'colorscheme': 'solarized',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'absolutepath', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead',
      \   'filename': 'LightlineFilename',
      \ },
      \ }

if $TERM_PROGRAM =~ "iTerm"
    let &t_SI = "\<Esc>]50;CursorShape=1\x7" " Vertical bar in insert mode
    let &t_EI = "\<Esc>]50;CursorShape=0\x7" " Block in normal mode
endif
