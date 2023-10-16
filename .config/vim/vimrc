"Get out of VI's compatible mode
set nocompatible

"Encoding
set encoding=utf-8

"Update time
set updatetime=300

"I like using light background terminal
set background=light

"Sets how many lines of history VIM has to remember
set history=1000

"Set to auto read when a file is changed from the outside
set autoread

"Keep buffer during switch files
set hidden

"No fold
set nofoldenable

"Always show current position
set ruler

"Show line number and wrap line
set number
set wrap

"Backspace and cursor keys wrap to
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

"show matching bracets
set showmatch

"Text options
set expandtab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set smarttab
set linebreak

"Auto-complete filename command mode
set wildmode=list:longest,full

"Highlight search things
set hlsearch
set incsearch

"viminfo file
set viminfo+=n~/.vim/.viminfo

"swapfile dir
set directory=/tmp//

"noswapfile
"setlocal noswapfile

"Enable filetype
filetype plugin indent on

"Enable syntax hl
syntax enable

"Highlight trailing spaces/tabs
match ErrorMsg '\s\+$'

"Highlight settings in Visual select and Diff mode
highlight Search ctermfg=DarkBlue
highlight Visual ctermfg=White ctermbg=LightBlue
highlight CocListLine ctermbg=Gray
highlight DiffAdd    cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffDelete cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffChange cterm=bold ctermfg=10 ctermbg=17 gui=none guifg=bg guibg=Red
highlight DiffText   cterm=bold ctermfg=10 ctermbg=88 gui=none guifg=bg guibg=Red
"highlight Comment ctermfg=Blue

"Don't like q:
map q <Nop>

"When highlight words, don't jump to next
nnoremap * :let @/='\<<C-R>=expand("<cword>")<CR>\>'<CR>:set hls<CR>
nnoremap <silent> <C-l> :nohls<CR><C-l>

"Map :Q to :q, :W to :w
cnoreabbrev Q <C-r>=(getcmdtype()==':'? 'q!' : 'Q')<CR>
cnoreabbrev W <C-r>=(getcmdtype()==':'? 'w' : 'W')<CR>
cnoreabbrev Wq <C-r>=(getcmdtype()==':'? 'wq' : 'Wq')<CR>
cnoreabbrev WQ <C-r>=(getcmdtype()==':'? 'wq' : 'WQ')<CR>

"Map VIM command/insert mode shortcut to bash shortcut
cnoremap <C-a> <Home>
cnoremap <C-e> <End>
cnoremap <C-b> <Left>
cnoremap <C-f> <Right>
cnoremap <C-d> <Del>
cnoremap <C-k> <Nop>
inoremap <C-a> <Home>
inoremap <C-e> <End>
inoremap <C-k> <Up>
inoremap <C-j> <Down>
inoremap <C-b> <Left>
inoremap <C-f> <Right>
inoremap <C-d> <Del>
inoremap <C-c> <ESC>
inoremap <C-z> <ESC><C-z>

noremap <Leader>W :w !sudo tee % > /dev/null

"autocmd settings
if !exists("autocommands_loaded")
    let autocommands_loaded = 1

    "Strip trailing withspace
    fun! StripTrailingWhitespace()
        let l = line(".")
        let c = col(".")
        " if &ft =~ 'mkd'
        "     return
        " endif
        %s/\s\+$//e
        call cursor(l, c)
    endfun
    autocmd BufWritePre * call StripTrailingWhitespace()
endif

"FileType
autocmd FileType go setlocal noexpandtab
autocmd FileType html,javascript,css,json,jsonc,lua,yaml setlocal shiftwidth=2 tabstop=2 softtabstop=2

"vim-plug setting
fun! VimPlug()
    call plug#begin('~/.vim/bundle')
        Plug 'neoclide/coc.nvim', {'branch': 'release'}
        Plug 'preservim/nerdtree', {'on': 'NERDTreeToggle'}
        Plug 'preservim/vim-markdown'
        Plug 'vim-airline/vim-airline'
    call plug#end()
endfun
silent! call VimPlug()

"nerdtree plugin
nmap <F8> :NERDTreeToggle<CR>

"coc.nvim plugin
highlight CocFloating ctermbg=235 guibg=#13354A
highlight CocMenuSel ctermbg=237 guibg=#13354A
autocmd BufWritePre *.go :call CocAction('organizeImport')
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
set tagfunc=CocTagFunc
let g:coc_data_home = '~/.vim/coc-data'
let g:coc_global_extensions = [
    \'coc-json',
    \'coc-yaml',
    \'coc-pyright',
    \'coc-snippets',
    \'coc-tabnine'
    \]
