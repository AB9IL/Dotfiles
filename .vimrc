" -----------------------------------------------------------------------------
" This config is targeted for Vim 8.0+ and NO PLUGINS
" -----------------------------------------------------------------------------
set viminfo=
" -----------------------------------------------------------------------------
" Color settings
" -----------------------------------------------------------------------------

" Enable 24-bit true colors if your terminal supports it.
if (has("termguicolors"))
  " https://github.com/vim/vim/issues/993#issuecomment-255651605
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
else
  set t_Co=256
endif

" -----------------------------------------------------------------------------
" Basic Settings
" Research any of these by running :help <setting>
" -----------------------------------------------------------------------------
let fancy_symbols_enabled=0
let mapleader="\<Space>"
let maplocalleader="\<Space>"
let g:netrw_banner=0
let g:netrw_winsize=25
set autoindent
set autoread
set backspace=indent,eol,start
set clipboard+=unnamedplus
set colorcolumn=80
set complete+=kspell
set completeopt=menuone,longest
set cryptmethod=blowfish2
set cursorcolumn
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
"set showmode
set noshowmode
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

" Set up the colors.
set background=dark
colorscheme torte
syntax on
filetype on
hi clear LineNr
hi clear SignColumn
hi! EndOfBuffer guibg=NONE ctermbg=NONE
hi! Search ctermbg=DarkGrey ctermfg=Black cterm=bold guifg=#CCCCDD guibg=#5775E4
hi! CurSearch ctermbg=DarkGrey ctermfg=Black cterm=bold guifg=#CCCCDD guibg=#00AAAA
hi! Visual ctermbg=DarkGrey ctermfg=Black cterm=bold guifg=#CCCCDD guibg=#5775E4
hi! ColorColumn cterm=bold ctermbg=Yellow guibg=#303030
hi! CursorLine cterm=bold ctermbg=Yellow guibg=#303030
hi! CursorColumn cterm=bold ctermbg=Yellow guibg=#303030
hi HighlightedyankRegion ctermfg=Black ctermbg=Yellow cterm=bold guifg=#000000 guibg=#9CE342
hi SpellBad cterm=underline ctermfg=9 gui=underline guifg=#CC3030
hi SpellLocal cterm=underline ctermfg=9 gui=underline guifg=#CC3030
hi SpellRare cterm=underline ctermfg=9 gui=underline guifg=#CC3030
hi SpellCap cterm=underline ctermfg=9 gui=underline guifg=#CC3030

" -----------------------------------------------------------------------------
" Cursor
" -----------------------------------------------------------------------------
let &t_EI = "\<Esc>[2 q"
let &t_SI = "\<Esc>[6 q"
let &t_SR = "\<Esc>[4 q"
" reset the cursor on start (for older versions of vim, usually not required)
augroup myCmds
au!
autocmd VimEnter * silent !echo -ne "\e[2 q"
augroup END
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

" Reselect visual selection after indenting.
vnoremap < <gv
vnoremap > >gv

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

" Allow gf to ceate and open files
map gf :edit <cfile><CR>

" Open the current file in the default program
nmap <Leader>x :!xdg-open %<CR><CR>

" Toggle spell check.
map <F5> :setlocal spell!<CR>

" Toggle relative line numbers and regular line numbers.
nmap <F6> :set invrelativenumber<CR>

" Automatically fix the last misspelled word and jump back to where you were.
" Taken from this talk: https://www.youtube.com/watch?v=lwD8G1P52Sk
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
au VimResized * wincmd =

" Update a buffer's contents on focus if it changed outside of Vim.
au FocusGained,BufEnter * :checktime

" Unset paste on InsertLeave.
au InsertLeave * silent! set nopaste

" Make sure all types of requirements.txt files get syntax highlighting.
au BufNewFile,BufRead requirements*.txt set syntax=python

" Ensure tabs don't get converted to spaces in Makefiles.
au FileType make setlocal noexpandtab

" Only show the cursor line in the active buffer.
augroup CursorLine
    au!
    au VimEnter,WinEnter,BufWinEnter * setlocal cursorline
    au WinLeave * setlocal nocursorline
augroup END

" Set filetype syntax and behavior
au BufNewFile,BufRead *.markdown,*.mdown,*.mkd,*.mdwn,*md set ft=markdown
au BufNewFile,BufRead conf,config,*.conf,*.strm,*.xspf, *.log set ft=config
au BufNewFile,BufRead *.wiki set ft=vimwiki

" Prevent rezize glitch on open
au VimEnter * :silent exec "!kill -s SIGWINCH $PPID"

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
    noau qall
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

" Remove trailing whitespaces
au BufWritePre * %s/\s\+$//e
" Remove trailing newline
au BufWritePre * %s/\n\+\%$//e

" Highlight yanked text
augroup highlightYankedText
    autocmd!
    au TextYankPost * call FlashYankedText()
augroup END
function! FlashYankedText()
    if (!exists('g:yankedTextMatches'))
        let g:yankedTextMatches = []
    endif

    let matchId = matchadd('IncSearch', ".\\%>'\\[\\_.*\\%<']..")
    let windowId = winnr()

    call add(g:yankedTextMatches, [windowId, matchId])
    call timer_start(500, 'DeleteTemporaryMatch')
endfunction
function! DeleteTemporaryMatch(timerId)
    while !empty(g:yankedTextMatches)
        let match = remove(g:yankedTextMatches, 0)
        let windowID = match[0]
        let matchID = match[1]

        try
            call matchdelete(matchID, windowID)
        endtry
    endwhile
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Status Line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=   " clear the statusline for when vimrc is reloaded

" status bar colors
hi NormalColor guifg=#50DD6A guibg=#262626 ctermfg=Grey ctermbg=Black
hi InsertColor guifg=#5080DD guibg=#262626 ctermfg=Blue ctermbg=Black
hi ReplaceColor guifg=#DD4040 guibg=#262626 ctermfg=Red ctermbg=Black
hi VisualColor guifg=#DD40DD guibg=#262626 ctermfg=Magenta ctermbg=Black
hi CommandColor guifg=#CCCCDD guibg=#262626 ctermfg=Grey ctermbg=Black

set statusline+=%#NormalColor#%{(mode()=='n')?'\ \ NORMAL\ ':''}
set statusline+=%#InsertColor#%{(mode()=='i')?'\ \ INSERT\ ':''}
set statusline+=%#ReplaceColor#%{(mode()=='R')?'\ \ REPLACE\ ':''}
set statusline+=%#VisualColor#%{(mode()=='v')?'\ \ VISUAL\ ':''}
set statusline+=%#VisualColor#%{(mode()=='')?'\ \ VISUAL\ ':''}
set statusline+=%#CommandColor#%{(mode()=='c')?'\ \ COMMAND\ ':''}
set statusline+=%3n\                                " buffer number
set statusline+=%f\                                 " file name
set statusline+=%h%m%r%w\                           " flags
set statusline+=%=                                  " right align
set statusline+=%{&fileformat}\ \|                  " file format
set statusline+=\ %{strlen(&fenc)?&fenc:&enc}\ \|   " encoding
set statusline+=\ %{strlen(&ft)?&ft:'none'}\        " filetype
set statusline+=\ %<%p%%\                           " position
set statusline+=\ %-4.(%l:%c%)\                     " offset

" .............................................................................
" Fast editing and reloading of vimrc configs
" .............................................................................
autocmd! bufwritepost $MYVIMRC source $MYVIMRC
