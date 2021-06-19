" -----------------------------------------------------------------------------
" This config is targeted for Vim 8.0+
" -----------------------------------------------------------------------------
set viminfo=
" -----------------------------------------------------------------------------
" Plugins - use the builtin plugin manager
" -----------------------------------------------------------------------------
" To install vim-plug, execute:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"    https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

call plug#begin('~/.vim/plugged')

Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vim-scripts/AutoComplPop'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-surround'
Plug 'lilydjwg/colorizer'
Plug 'mattn/emmet-vim'
Plug 'morhetz/gruvbox'
Plug 'joshdick/onedark.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'tomasr/molokai'
Plug 'NLKNguyen/papercolor-theme'
Plug 'itchyny/lightline.vim'
Plug 'mengelbrecht/lightline-bufferline'
Plug 'tpope/vim-fugitive'
Plug 'ryanoasis/vim-devicons'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#util#install()}}
Plug 'vimwiki/vimwiki'
Plug 'vim-scripts/YankRing.vim'
Plug 'cakebaker/scss-syntax.vim'
Plug 'chr4/nginx.vim'
Plug 'chrisbra/csv.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'elixir-editors/vim-elixir'
Plug 'Glench/Vim-Jinja2-Syntax'
Plug 'jvirtanen/vim-hcl'
Plug 'lifepillar/pgsql.vim'
Plug 'othree/html5.vim'
Plug 'pangloss/vim-javascript'
Plug 'PotatoesMaster/i3-vim-syntax'
Plug 'stephpy/vim-yaml'
Plug 'tmux-plugins/vim-tmux'
Plug 'tpope/vim-git'
Plug 'tpope/vim-liquid'
Plug 'tpope/vim-rails'
Plug 'vim-python/python-syntax'
Plug 'vim-ruby/vim-ruby'
Plug 'wgwoods/vim-systemd-syntax'

call plug#end()
" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------

" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
else
  set t_Co=256
endif
set termguicolors
" Enable syntax highlighting.

" Set the color scheme.
colorscheme jellybeans
set background=dark
syntax on
filetype on
hi clear LineNr
hi clear SignColumn

" ----------------------------------------------------------------------------
" Basic Settings
"   Research any of these by running :help <setting>
" -----------------------------------------------------------------------------
let fancy_symbols_enabled=0
let mapleader="\<Space>"
let maplocalleader="\<Space>"
set autoindent
set autoread
set backspace=indent,eol,start
set clipboard+=unnamedplus
set colorcolumn=80
set complete+=kspell
set completeopt=menuone,longest
set cryptmethod=blowfish2
set cursorline
set directory=/tmp//,.
set encoding=utf-8
set expandtab smarttab
set formatoptions=tcqrn1
set hidden
set history=500
set hlsearch
set ignorecase
set incsearch
set laststatus=2
set matchpairs+=<:> " Use % to jump between pairs
set mmp=5000
set modelines=2
set mouse=a
set nobackup
set nocompatible
set noerrorbells visualbell t_vb=
set noshiftround
set nospell
set nostartofline
set number
set pastetoggle=<f2>
set path+=.,**
set regexpengine=1
set ruler
set scrolloff=3
set shell=/bin/bash
set shiftwidth=2
set showcmd
set showmatch
set shortmess+=c
set showmode
set smartcase
set softtabstop=4
set spelllang=en_us
set splitbelow
set splitright
set tabstop=4
set textwidth=0
set title
set ttimeout
set ttyfast
set ttymouse=sgr
set undodir=/tmp
set undofile
set virtualedit=block
set whichwrap=b,s,<,>
set wildmenu
set wildmode=full
set wrap

runtime! macros/matchit.vim

hi SpellBad cterm=underline ctermfg=9
hi SpellLocal cterm=underline ctermfg=9
hi SpellRare cterm=underline ctermfg=9
hi SpellCap cterm=underline

" -----------------------------------------------------------------------------
" Cursor
" -----------------------------------------------------------------------------
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
let &t_EI = "\<Esc>[2 q"
" -----------------------------------------------------------------------------
" Basic mappings
" -----------------------------------------------------------------------------

" Seamlessly treat visual lines as actual lines when moving around.
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Navigate around splits with a single key combo.
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

" Cycle through splits.
nnoremap <S-Tab> <C-w>

" Cycle through buffers.
nnoremap <Tab> :bnext<cr>
nnoremap <S-Tab> :bprevious<cr>

" Press * to search for the term under the cursor or a visual selection and
" then press a key below to replace all instances of it in the current file.
nnoremap <Leader>r :%s///g<Left><Left>
nnoremap <Leader>rc :%s///gc<Left><Left><Left>

" The same as above but instead of acting on the whole file it will be
" restricted to the previously visually selected range. You can do that by
" pressing *, visually selecting the range you want it to apply to and then
" press a key below to replace all instances of it in the current selection.
xnoremap <Leader>r :s///g<Left><Left>
xnoremap <Leader>rc :s///gc<Left><Left><Left>

" Type a replacement term and press . to repeat the replacement again. Useful
" for replacing a few instances of the term (comparable to multiple cursors).
nnoremap <silent> s* :let @/='\<'.expand('<cword>').'\>'<CR>cgn
xnoremap <silent> s* "sy:let @/=@s<CR>cgn

" Clear search highlights.
map <Leader><Space> :let @/=''<CR>
nnoremap <silent> // :noh<CR>

" Format paragraph (selected or not) to 80 character lines.
nnoremap <Leader>g gqap
xnoremap <Leader>g gqa

" Better indentation.
vnoremap < <gv  " better indentation
vnoremap > >gv  " better indentation

" Prevent x from overriding what's in the clipboard.
noremap x "_x
noremap X "_x

" Prevent selecting and pasting from overwriting what you originally copied.
xnoremap p pgvy

" Keep cursor at the bottom of the visual selection after you yank it.
vmap y ygv<Esc>

" Edit Vim config file in a new tab.
map <Leader>ev :tabnew $MYVIMRC<CR>

" Source Vim config file.
map <Leader>sv :source $MYVIMRC<CR>

" Toggle spell check.
map <F5> :setlocal spell!<CR>

" Toggle relative line numbers and regular line numbers.
nmap <F6> :set invrelativenumber<CR>

" Automatically fix the last misspelled word and jump back to where you were.
"   Taken from this talk: https://www.youtube.com/watch?v=lwD8G1P52Sk
nnoremap <leader>sp :normal! mz[s1z=`z<CR>

" Toggle visually showing all whitespace characters.
noremap <F7> :set list!<CR>
inoremap <F7> <C-o>:set list!<CR>
cnoremap <F7> <C-c>:set list!<CR>

" Open a terminal
nnoremap <C-w>t :terminal<CR>

" -----------------------------------------------------------------------------
" Basic autocommands
" -----------------------------------------------------------------------------

" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

" Unset paste on InsertLeave.
autocmd InsertLeave * silent! set nopaste

" Make sure all types of requirements.txt files get syntax highlighting.
autocmd BufNewFile,BufRead requirements*.txt set syntax=python

" Ensure tabs don't get converted to spaces in Makefiles.
autocmd FileType make setlocal noexpandtab

" Only show the cursor line in the active buffer.
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Set filetype syntax and behavior 
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mdwn,*md set ft=markdown
au BufNewFile,BufRead conf,config,*.conf,*.strm,*.xspf set ft=config

" Prevent rezize glitch on open
autocmd VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

" ----------------------------------------------------------------------------
" Basic commands
" ----------------------------------------------------------------------------

" Add all TODO items to the quickfix list relative to where you opened Vim.
function! s:todo() abort
  let entries = []
  for cmd in ['git grep -niIw -e TODO -e FIXME 2> /dev/null',
            \ 'grep -rniIw -e TODO -e FIXME . 2> /dev/null']
    let lines = split(system(cmd), '\n')
    if v:shell_error != 0 | continue | endif
    for line in lines
      let [fname, lno, text] = matchlist(line, '^\([^:]*\):\([^:]*\):\(.*\)')[1:3]
      call add(entries, { 'filename': fname, 'lnum': lno, 'text': text })
    endfor
    break
  endfor

  if !empty(entries)
    call setqflist(entries)
    copen
  endif
endfunction

command! Todo call s:todo()

" Profile Vim by running this command once to start it and again to stop it.
function! s:profile(bang)
  if a:bang
    profile pause
    noautocmd qall
  else
    profile start /tmp/profile.log
    profile func *
    profile file *
  endif
endfunction

command! -bang Profile call s:profile(<bang>0)

" Save buffer as sudo
ca w!! w !sudo tee "%"

" Save with Ctrl-s
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

" Open a terminal
nnoremap <C-w>t :terminal<CR>

" Start Markdown Preview
map <Leader>mp :MarkdownPreview<CR>

" Stop Markdown Preview
map <Leader>ms :MarkdownPreviewStop<CR>

" Remove excess whitespace on save
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" -----------------------------------------------------------------------------
" Plugin settings, mappings and autocommands
" -----------------------------------------------------------------------------
" Netrw
  let g:netrw_banner = 0
  let g:netrw_liststyle = 3
  let g:netrw_browse_split = 4
  let g:netrw_altv = 1
  let g:netrw_winsize = 20
  let g:NetrwIsOpen=0

  function! OpenToRight()
    :normal v
    let g:path=expand('%:p')
    execute 'q!'
    execute 'belowright vnew' g:path
    :normal <C-w>l
  endfunction

  function! OpenBelow()
    :normal v
    let g:path=expand('%:p')
    execute 'q!'
    execute 'belowright new' g:path
    :normal <C-w>l
  endfunction

  function! OpenTab()
    :normal v
    let g:path=expand('%:p')
    execute 'q!'
    execute 'tabedit' g:path
    :normal <C-w>l
  endfunction

  function! NetrwMappings()
      " Hack fix to make ctrl-l work properly
      noremap <buffer> <A-l> <C-w>l
      noremap <buffer> <C-l> <C-w>l
      noremap <silent> <A-f> :call ToggleNetrw()<CR>
      noremap <buffer> V :call OpenToRight()<cr>
      noremap <buffer> H :call OpenBelow()<cr>
      noremap <buffer> T :call OpenTab()<cr>
  endfunction

  augroup netrw_mappings
      autocmd!
      autocmd filetype netrw call NetrwMappings()
  augroup END

  " Allow for netrw to be toggled
  function! ToggleNetrw()
      if g:NetrwIsOpen
          let i = bufnr("$")
          while (i >= 1)
              if (getbufvar(i, "&filetype") == "netrw")
                  silent exe "bwipeout " . i
              endif
              let i-=1
          endwhile
          let g:NetrwIsOpen=0
      else
          let g:NetrwIsOpen=1
          silent Lexplore
      endif
  endfunction

" Manually toggle Netrw
nmap <leader>n :Lexplore<CR>

" .............................................................................
" junegunn/fzf.vim
" .............................................................................

let $FZF_DEFAULT_OPTS = '--bind ctrl-a:select-all'

" Customize fzf colors to match your color scheme.
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit',
  \ 'ctrl-y': {lines -> setreg('*', join(lines, "\n"))}}

" Launch fzf with CTRL+P.
nnoremap <silent> <C-p> :FZF -m<CR>

" Map a few common things to do with FZF.
nnoremap <silent> <Leader><Enter> :Buffers<CR>
nnoremap <silent> <Leader>l :Lines<CR>

" Allow passing optional flags into the Rg command.
"   Example: :Rg myterm -g '*.md'
command! -bang -nargs=* Rg
  \ call fzf#vim#grep(
  \ "rg --column --line-number --no-heading --color=always --smart-case " .
  \ <q-args>, 1, fzf#vim#with_preview(), <bang>0)

" .............................................................................
" SirVer/ultisnips
" .............................................................................

let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" .............................................................................
" Autoclose
" .............................................................................

" Fix to let ESC work as espected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

" .............................................................................
" Yankring
" .............................................................................

let g:yankring_history_dir = '~/.vim/'
" Fix for yankring and neovim problem when system has non-text things
" copied in clipboard
let g:yankring_clipboard_monitor = 0

" .............................................................................
" plasticboy/vim-markdown
" .............................................................................
autocmd FileType markdown let b:sleuth_automatic=0
autocmd Filetype markdown let conceallevel=0
autocmd FileType markdown normal zR
let g:vim_markdown_frontmatter=1

" .............................................................................
" iamcco/markdown-preview.nvim
" .............................................................................
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='~/.css/github-markdown.css'
let g:mkdp_browser='firefox'
let g:mkdp_auto_close=0

" .............................................................................
" VimWiki
" .............................................................................
let g:vimwiki_list = [{'path': '~/Vimwiki/','syntax': 'markdown', 'ext': '.md'}]
au BufRead,BufNewFile *.wiki set filetype=vimwiki

" .............................................................................
" Airline
" .............................................................................
let g:airline_powerline_fonts = 0
let g:airline_theme = 'jellybeans'
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:webdevicons_enable = 0

" .............................................................................
" Fast editing and reloading of vimrc configs
" .............................................................................
autocmd! bufwritepost $MYVIMRC source $MYVIMRC