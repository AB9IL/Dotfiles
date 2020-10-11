" CONFIGURATION FOR NEOVIM ONLY
" NOT SUITABLE FOR LEGACY VIM
let using_neovim = has('nvim')
let using_vim = !using_neovim

" ============================================================================
" Plugins
" ============================================================================
let vim_plug_just_installed = 0
let vim_plug_path = expand('~/.config/nvim/autoload/plug.vim')
if !filereadable(vim_plug_path)
    echo "Installing Vim-plug..."
    echo ""
    silent !mkdir -p ~/.config/nvim/autoload
    silent !curl -fLo ~/.config/nvim/autoload/plug.vim \
	--create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
    let vim_plug_just_installed = 1
endif

" manually load vim-plug the first time
if vim_plug_just_installed
    :execute 'source '.fnameescape(vim_plug_path)
endif

call plug#begin("~/.config/nvim/plugged")
Plug 'arielrossanigo/dir-configs-override.vim'
Plug 'scrooloose/nerdcommenter'
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'vim-scripts/AutoComplPop'
Plug 'majutsushi/tagbar'
Plug 'vim-scripts/IndexedSearch'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf'
Plug 'junegunn/fzf.vim'
Plug 'fisadev/FixedTaskList.vim'
if using_neovim && vim_plug_just_installed
    Plug 'Shougo/deoplete.nvim', {'do': ':autocmd VimEnter * UpdateRemotePlugins'}
else
    Plug 'Shougo/deoplete.nvim'
endif
Plug 'roxma/nvim-yarp'
Plug 'roxma/vim-hug-neovim-rpc'
Plug 'deoplete-plugins/deoplete-jedi'
Plug 'deoplete-plugins/deoplete-go', {'do': 'make'}
Plug 'nsf/gocode', {'rtp': 'nvim', 'do': '~/.config/nvim/plugged/gocode/nvim/symlink.sh'}
Plug 'Shougo/context_filetype.vim'
Plug 'davidhalter/jedi-vim'
Plug 'Townk/vim-autoclose'
Plug 'tpope/vim-surround'
Plug 'michaeljsmith/vim-indent-object'
Plug 'jeetsukumaran/vim-indentwise'
Plug 'sheerun/vim-polyglot'
Plug 'mileszs/ack.vim'
Plug 'rrethy/vim-hexokinase', { 'do': 'make hexokinase' }
Plug 't9md/vim-choosewin'
Plug 'fisadev/vim-isort'
Plug 'valloric/MatchTagAlways'
Plug 'mattn/emmet-vim'
Plug 'tpope/vim-fugitive'
Plug 'mhinz/vim-signify'
Plug 'vim-scripts/YankRing.vim'
Plug 'neomake/neomake'
Plug 'ryanoasis/vim-devicons'
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'godlygeek/tabular'
Plug 'plasticboy/vim-markdown'
Plug 'iamcco/markdown-preview.nvim', {'do': { -> mkdp#util#install()}}
Plug 'vimwiki/vimwiki'
call plug#end()

" Install plugins the first time vim runs
if vim_plug_just_installed
    echo "Installing Bundles, please ignore key map error messages"
    :PlugInstall
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic settings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let fancy_symbols_enabled = 0
let mapleader="\<Space>"
set clipboard+=unnamedplus
set colorcolumn=80
set complete+=kspell
set completeopt=menuone,longest
set cursorline
set encoding=utf-8
set hidden
set history=500
set nowrap
set nobackup
set mouse=a
set pastetoggle=<f2>
set path+=**
set ruler
set shell=/bin/bash
set tabstop=4
set textwidth=120
set softtabstop=4
set title
set shiftwidth=4
set nu
set fillchars+=vert:\
set completeopt+=noinsert
set completeopt-=preview
set scrolloff=3
set shortmess+=c
set splitbelow
set splitright
set wildmode=list:longest

" Set colors and transparency
set background = "dark"
if has('gui_running') || using_neovim || (&term =~? 'mlterm\|xterm\|xterm-256\|screen-256')
    if !has('gui_running')
        let &t_Co = 256
    endif
    colorscheme jellybeans
else
    colorscheme plastic
endif
set termguicolors
hi Normal guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE

" Clean up trailing whitespace on save
autocmd BufWritePre *.py :%s/\s\+$//e
au FileType python map <silent> <leader>b Oimport ipdb; ipdb.set_trace()<esc>
fun! CleanExtraSpaces()
    let save_cursor = getpos(".")
    let old_query = getreg('/')
    silent! %s/\s\+$//e
    call setpos('.', save_cursor)
    call setreg('/', old_query)
endfun

" Open certain files as Markdown
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mdwn,*md set ft=markdown

" Writer mode
fun! Writer()
	setlocal spell spelllang=en_us
	setlocal formatoptions=t1
	setlocal textwidth=80
	setlocal noautoindent
	setlocal shiftwidth=5
	setlocal tabstop=5
	setlocal expandtab
endfun
com! WR call Writer()

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Basic mappings
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Seamlessly treat visual lines as actual lines when moving around.
noremap j gj
noremap k gk
noremap <Down> gj
noremap <Up> gk
inoremap <Down> <C-o>gj
inoremap <Up> <C-o>gk

" Navigate tabs
map tt :tabnew
map <M-Right> :tabn<CR>
imap <M-Right> <ESC>:tabn<CR>
map <M-Left> :tabp<CR>
imap <M-Left> <ESC>:tabp<CR>

" Navigate around splits with a single key combo.
nnoremap <C-l> <C-w><C-l>
nnoremap <C-h> <C-w><C-h>
nnoremap <C-k> <C-w><C-k>
nnoremap <C-j> <C-w><C-j>

" Cycle through splits.
nnoremap <S-Tab> <C-w>w

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

" Save with Ctrl-s
nnoremap <C-s> :w<CR>
inoremap <C-s> <ESC>:w<CR>

" Save as sudo
ca w!! w !sudo tee "%"

" Open a terminal
nnoremap <C-w>t :terminal<CR>

" Start Markdown Preview
map <Leader>mp :MarkdownPreview<CR>

" Stop Markdown Preview
map <Leader>ms :MarkdownPreviewStop<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" PLUGIN SETTINGS
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Netrw
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tagbar
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" toggle tagbar display
map <F4> :TagbarToggle<CR>
" autofocus on tagbar open
let g:tagbar_autofocus = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Hexokinase
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:Hexokinase_highlighters = ['backgroundfull']

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Neomake
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Run linter on write
autocmd! BufWritePost * Neomake

" Check code as python3 by default
let g:neomake_python_python_maker = neomake#makers#ft#python#python()
let g:neomake_python_flake8_maker = neomake#makers#ft#python#flake8()
let g:neomake_python_python_maker.exe = 'python3.8 -m py_compile'
let g:neomake_python_flake8_maker.exe = 'python3.8 -m flake8'

" Disable error messages inside the buffer, next to the problematic line
let g:neomake_virtualtext_current_error = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" This is the default extra key bindings
let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-x': 'split',
  \ 'ctrl-v': 'vsplit' }

" Default fzf layout
" - down / up / left / right
let g:fzf_layout = { 'down': '~40%' }

" Previews (ccat replaces cat or bat)
command! -bang -nargs=? -complete=dir Files
    \ call fzf#vim#files(<q-args>, 
    \ {'options': ['--layout=reverse',
    \ '--info=inline',
    \ '--preview',
    \ 'ccat {} | head -200']},
    \ <bang>0)

" size and position of preview
let g:fzf_preview_window = 'right:60%'

" In Neovim, you can set up fzf window using a Vim command
let g:fzf_layout = { 'window': 'enew' }
let g:fzf_layout = { 'window': '-tabnew' }
let g:fzf_layout = { 'window': '10split enew' }

" Customize fzf colors to match your color scheme
let g:fzf_colors =
\ { 'fg':      ['fg', 'Normal'],
  \ 'bg':      ['bg', 'Normal'],
  \ 'hl':      ['fg', 'Comment'],
  \ 'fg+':     ['fg', 'CursorLine', 'CursorColumn', 'Normal'],
  \ 'bg+':     ['bg', 'CursorLine', 'CursorColumn'],
  \ 'hl+':     ['fg', 'Statement'],
  \ 'info':    ['fg', 'PreProc'],
  \ 'border':  ['fg', 'Ignore'],
  \ 'prompt':  ['fg', 'Conditional'],
  \ 'pointer': ['fg', 'Exception'],
  \ 'marker':  ['fg', 'Keyword'],
  \ 'spinner': ['fg', 'Label'],
  \ 'header':  ['fg', 'Comment'] }

" Enable per-command history.
" CTRL-N and CTRL-P will be automatically bound to next-history and
" previous-history instead of down and up. If you don't like the change,
" explicitly bind the keys to down and up in your $FZF_DEFAULT_OPTS.

" find buffers
nmap <leader>b :Buffers<CR>
" file files
nmap <leader>f :Files<CR>
" find lines
nmap <leader>l :Lines<CR>
" find tags
nmap <leader>t :Tags<CR>
" find history
nmap <leader>h :History<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Deoplete
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use deoplete.
let g:python3_host_prog = '/usr/bin/python3.8'
call deoplete#custom#option('enable_at_startup', 1)
call deoplete#custom#option('ignore_case', 1)
call deoplete#custom#option('smart_case', 1)
let g:deoplete#sources#go#gocode_binary = $GOPATH.'bin/gocode'
let g:deoplete#csources#go#sort_class = ['package', 'func', 'type', 'var', 'const']
" complete with words from any opened file
let g:context_filetype#same_filetypes = {}
let g:context_filetype#same_filetypes._ = '_'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Jedi-vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Disable autocompletion (using deoplete instead)
let g:jedi#completions_enabled = 0

" All these mappings work only for python code:
" Go to definition
let g:jedi#goto_command = ',d'
" Find ocurrences
let g:jedi#usages_command = ',o'
" Find assignments
let g:jedi#goto_assignments_command = ',a'
" Go to definition in new tab
nmap ,D :tab split<CR>:call jedi#goto()<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Ack.vim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mappings
nmap ,r :Ack
nmap ,wr :execute ":Ack " . expand('<cword>')<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Window Chooser
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mapping
nmap  -  <Plug>(choosewin)
" show big letters
let g:choosewin_overlay_enable = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Signify
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" this first setting decides in which order try to guess your current vcs
" UPDATE it to reflect your preferences, it will speed up opening files
let g:signify_vcs_list = ['git', 'hg']
" mappings to jump to changed blocks
nmap <leader>sn <plug>(signify-next-hunk)
nmap <leader>sp <plug>(signify-prev-hunk)
" nicer colors
highlight DiffAdd           cterm=bold ctermbg=none ctermfg=119
highlight DiffDelete        cterm=bold ctermbg=none ctermfg=167
highlight DiffChange        cterm=bold ctermbg=none ctermfg=227
highlight SignifySignAdd    cterm=bold ctermbg=237  ctermfg=119
highlight SignifySignDelete cterm=bold ctermbg=237  ctermfg=167
highlight SignifySignChange cterm=bold ctermbg=237  ctermfg=227

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Autoclose 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fix to let ESC work as expected with Autoclose plugin
" (without this, when showing an autocompletion window, ESC won't leave insert
"  mode)
let g:AutoClosePumvisible = {"ENTER": "\<C-Y>", "ESC": "\<ESC>"}

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Yankring
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:yankring_history_dir = '~/.config/nvim/'
" Fix for yankring and neovim problem when system has non-text things
" copied in clipboard
let g:yankring_clipboard_monitor = 0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_powerline_fonts = 1
let g:airline_theme = 'jellybeans'
let g:airline#extensions#whitespace#enabled = 1
let g:airline#extensions#tabline#enabled = 1

" Fancy Symbols!!
if fancy_symbols_enabled
    let g:webdevicons_enable = 1

    " custom airline symbols
    if !exists('g:airline_symbols')
       let g:airline_symbols = {}
    endif
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = '⭠'
    let g:airline_symbols.readonly = '⭤'
    let g:airline_symbols.linenr = '⭡'
else
    let g:webdevicons_enable = 0
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" plasticboy/vim-markdown
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd FileType markdown let b:sleuth_automatic=0
autocmd Filetype markdown let conceallevel=0
autocmd FileType markdown normal zR
let g:vim_markdown_frontmatter=1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" iamcco/markdown-preview.nvim
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:mkdp_refresh_slow=1
let g:mkdp_markdown_css='/usr/local/share/md/github-markdown.css'
let g:mkdp_browser='firefox'
let g:mkdp_auto_close=0

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" VimWiki
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:vimwiki_list = [{'path': '~/Documents/Vimwiki/','syntax': 'markdown', 'ext': '.md'}]
au BufRead,BufNewFile *.wiki set filetype=vimwiki

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fast editing and reloading of vimrc configs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
