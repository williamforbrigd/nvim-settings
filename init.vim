"Source files"

source $HOME/.config/nvim/plug-config/coc.vim

"---------------------------------------Plugins----------------------------------"
call plug#begin('~/.vim/plugged')
	"Tools"
	Plug 'vifm/vifm.vim'

	"Autocomplete"
	Plug 'neoclide/coc.nvim', {'branch': 'release'}

	"Color Schemes"
    Plug 'morhetz/gruvbox' 
    Plug 'calincru/peaksea.vim' "My favourite theme"

    "File system explorer"
    Plug 'preservim/nerdtree'

    "Get error messages to the left"
    Plug 'dense-analysis/ale'

    "Surrond words with ex brackets"
    Plug 'tpope/vim-surround'

    "Autocomplete code"
    Plug 'zxqfl/tabnine-vim'

    "Syntax checking"
    Plug 'vim-syntastic/syntastic'

    "Statusbar plugin"
    Plug 'itchyny/lightline.vim'

    "Intellisense"
    Plug 'neoclide/coc.nvim', {'branch': 'release'}

    " Debugger Plugins
    Plug 'puremourning/vimspector'
    Plug 'szw/vim-maximizer'



    " telescope requirements...
    Plug 'nvim-lua/popup.nvim'
    Plug 'nvim-lua/plenary.nvim'
    Plug 'nvim-telescope/telescope.nvim'

call plug#end()

" Automatically install missing plugins on startup
autocmd VimEnter *
  \  if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \|   PlugInstall --sync | q
  \| endif


"---------------------------------------General Settings-------------------------"
set encoding=UTF-8
set spelllang=en_us
set spell

set number

"Tab settings"
set tabstop=2 "The width of a tab is set to x"
set shiftwidth=2 "Indents will have a width of x"
set softtabstop=2 "Sets the number of columns for a tab"
set expandtab "Expand tab to spaces."

"Status-line"
set statusline=
set statusline+=%#PmenuSel#
set statusline+=\ %M
set statusline+=\ %y "file type"
set statusline+=\ %r "read only"
set statusline+=\ %F "full path"
set statusline+=%= "Right side settings"
set statusline+=\ %c:%l:%L "column:current line: total number of lines"
set statusline+=\ %p%% "percent of the file we are at"
set statusline+=\ [%n] "buffer number"


"---------------------------------------Color Settings-------------------------"
"
colorscheme gruvbox 
set background=dark
hi Normal guibg=NONE ctermbg=NONE "To set the background transparent"

"---------------------------------------Key Remapping-------------------------"
map <Space> :EditVifm .<CR> "Open file manager in current directory"

map <C-o> :NERDTreeToggle<CR>
map <C-n> :tabn<CR>
map <C-t> :tabnew<CR>

"Auto close brackets"
inoremap {<CR> {<CR>}<C-o>O

"Nerd Tree open files in new tab"
let NERDTreeMapOpenInTab='<ENTER>'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" => lightline
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ ['mode', 'paste'],
      \             ['fugitive', 'readonly', 'filename', 'modified'] ],
      \   'right': [ [ 'lineinfo' ], ['percent'] ]
      \ },
      \ 'component': {
      \   'readonly': '%{&filetype=="help"?"":&readonly?"??":""}',
      \   'modified': '%{&filetype=="help"?"":&modified?"+":&modifiable?"":"-"}',
      \   'fugitive': '%{exists("*FugitiveHead")?FugitiveHead():""}'
      \ },
      \ 'component_visible_condition': {
      \   'readonly': '(&filetype!="help"&& &readonly)',
      \   'modified': '(&filetype!="help"&&(&modified||!&modifiable))',
      \   'fugitive': '(exists("*FugitiveHead") && ""!=FugitiveHead())'
      \ },
      \ 'separator': { 'left': ' ', 'right': ' ' },
      \ 'subseparator': { 'left': ' ', 'right': ' ' }
      \ }

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
