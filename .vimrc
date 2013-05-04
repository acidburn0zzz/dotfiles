" http://dougireton.com/blog/2013/02/23/layout-your-vimrc-like-a-boss/

"-------- plugins {{{
"------------------------------------------------------
" pathogen
" https://github.com/tpope/vim-pathogen
call pathogen#infect()			" include all plugins in bundle folder
call pathogen#helptags()		" include helppage for vim plugins in bundle folder
" call pathogen#runtime_append_all_bundles()
filetype plugin indent on		" enable detection, plugin, indenting

"vim powerline
"set nocompatible   " Disable vi-compatibility
"set laststatus=2   " Always show the statusline
"set encoding=utf-8 " Necessary to show unicode glyphs
"set t_Co=256 " Explicitly tell vim that the terminal supports 256 colors

" vimwiki
" http://www.vim.org/scripts/script.php?script_id=2226
" requirements for it to work
set nocompatible 
"filetype plugin on 
syntax on

"}}}
"-------- important {{{
"------------------------------------------------------
"}}}
"-------- moving around, searching and patterns {{{
"------------------------------------------------------
"}}}
"-------- tags {{{
"------------------------------------------------------
"}}}
"-------- displaying text {{{
"------------------------------------------------------
"}}}
"-------- syntax, highlighting and spelling {{{
"------------------------------------------------------
"}}}
"-------- multiple windows {{{
"------------------------------------------------------
"}}}
"-------- multiple tab pages {{{
"------------------------------------------------------
"}}}
"-------- terminal {{{
"------------------------------------------------------
"}}}
"-------- using the mouse {{{
"------------------------------------------------------
"}}}
"-------- printing {{{
"------------------------------------------------------
"}}}
"-------- messages and info {{{
"------------------------------------------------------
"}}}
"-------- selecting text {{{
"------------------------------------------------------
"}}}
"-------- editing text {{{
"------------------------------------------------------
"}}}
"-------- tabs and indenting {{{
"------------------------------------------------------
"}}}
"-------- folding {{{
"------------------------------------------------------
"}}}
"-------- diff mode {{{
"------------------------------------------------------
"}}}
"-------- mapping {{{
"------------------------------------------------------
"}}}
"-------- reading and writing files {{{
"------------------------------------------------------
"}}}
"-------- the swap file {{{
"------------------------------------------------------
"}}}
"-------- command line editing {{{
"------------------------------------------------------
"}}}
"-------- executing external commands {{{
"------------------------------------------------------
" copy or paste from X11 clipboard
" http://vim.wikia.com/wiki/GNU/Linux_clipboard_copy/paste_with_xclip
" requires: xclip
" usage: visual mode select then hit F6 to copy
" 	hit F7 to paste from GUI to vim without formating issues
vmap <F6> :!xclip -f -sel clip<CR>
map <F7> mz:-1r !xclip -o -sel clip<CR>`z

"}}}
"-------- running make and jumping to errors {{{
"------------------------------------------------------
"}}}
"-------- language specific {{{
"------------------------------------------------------
"}}}
"-------- multi-byte characters {{{
"------------------------------------------------------
"}}}
"-------- various {{{
"------------------------------------------------------
"}}}



"------------------------------------------////
"	    VIM CONFIGURATION
"------------------------------------------////
" located on ~/.vimrc
"set t_Co=256

scriptencoding utf-8
set encoding=utf-8
"set listchars=trail:·,precedes:«,extends:»,eol:↲,tab:▸\

"-------- Visual {{{
"------------------------------------------------------
syntax on 			" enable color syntax
set number 			" show line numbers on left side
"set modeline
set ls=2			" display jilename statusbar
set ignorecase 			" ignore case when searching
set hlsearch 			" highlight searches
set incsearch			" increamental search, find as you type word
set title			" show title in console title bar
"set cursorcolumn		" show column highlight
"set cursorline			" show line highlight
"set mouse-=a			" disable mouse automatically entering visual mode
"set mouse=a			" enable mouse support and activate visual mode with dragging


" toggle absolute and relative numbers
" http://www.reddit.com/r/vim/comments/vowr6/numbersvim_better_line_numbers_for_vim/
" auto change numbers on mode switch
silent! autocmd InsertEnter * :set number
silent! autocmd InsertLeave * :set relativenumber
nnoremap <F2> :se <c-r>=&rnu?"":"r"<CR>nu<CR>
" toggle absolute,relative, and no numbers
" map <Leader>nn :set <c-r>={'00':'','01':'r','10':'nor'}[&rnu.&nu]<CR>nu<CR>

"}}}
"-------- Hotkey {{{
"------------------------------------------------------
" change leader key: default is \ hotkey
" http://stackoverflow.com/questions/1764263/what-is-the-leader-in-a-vimrc-file
":let mapleader = ","

" toggle line numbers
nmap <C-N><C-N> :set invnumber<CR>

" toggle paste mode
" http://simon.xn--schnbeck-p4a.dk/vim-paste-indent-problems/
set pastetoggle=<F10> " in insert mode, enable pasting




" clear matching after search
noremap <silent> <leader><space> :noh<cr>:call clearmatches()<cr>

" move between matching opening and ending code; example { code }
map <tab> %

" Go to beginning or end of line
noremap H ^
noremap L $
"}}}
"-------- Themes {{{
"------------------------------------------------------
syntax enable
"set background=dark	" set background dark color
set background=light	" set background light color
"}}}
"-------- New Shit {{{
"------------------------------------------------------
" http://blog.bodhizazen.net/linux/command-line-spell-checking/
" Show matching [] and {}
"	set showmatch
"
"	" Spell check on
"	set spell spelllang=en_us
"	setlocal spell spelllang=en_us
"
"	" Toggle spelling with the F7 key
"	nn <F7> :setlocal spell! spelllang=en_us<CR>
"	imap <F7> <C-o>:setlocal spell! spelllang=en_us<CR>
"
"	" Spelling
"	highlight clear SpellBad
"	highlight SpellBad term=standout ctermfg=1 term=underline cterm=underline
"	highlight clear SpellCap
"	highlight SpellCap term=underline cterm=underline
"	highlight clear SpellRare
"	highlight SpellRare term=underline cterm=underline
"	highlight clear SpellLocal
"	highlight SpellLocal term=underline cterm=underline
"
"	" where it should get the dictionary files
"	let g:spellfile_URL = 'http://ftp.vim.org/vim/runtime/spell'

"}}}
" Indent Guides {{{

let g:indentguides_state = 0
function! IndentGuides() " {{{
    if g:indentguides_state
        let g:indentguides_state = 0
        2match None
    else
        let g:indentguides_state = 1
        execute '2match IndentGuides /\%(\_^\s*\)\@<=\%(\%'.(0*&sw+1).'v\|\%'.(1*&sw+1).'v\|\%'.(2*&sw+1).'v\|\%'.(3*&sw+1).'v\|\%'.(4*&sw+1).'v\|\%'.(5*&sw+1).'v\|\%'.(6*&sw+1).'v\|\%'.(7*&sw+1).'v\)\s/'
    endif
endfunction " }}}
hi def IndentGuides guibg=#303030
nnoremap <leader>I :call IndentGuides()<cr>

" }}}
" Block Colors {{{

let g:blockcolor_state = 0
function! BlockColor() " {{{
    if g:blockcolor_state
        let g:blockcolor_state = 0
        call matchdelete(77881)
        call matchdelete(77882)
        call matchdelete(77883)
        call matchdelete(77884)
        call matchdelete(77885)
    else
        let g:blockcolor_state = 1
        call matchadd("BlockColor1", '^ \{4}.*', 1, 77881)
        call matchadd("BlockColor2", '^ \{8}.*', 2, 77882)
        call matchadd("BlockColor3", '^ \{12}.*', 3, 77883)
        call matchadd("BlockColor4", '^ \{16}.*', 4, 77884)
        call matchadd("BlockColor5", '^ \{20}.*', 5, 77885)
    endif
endfunction " }}}

" Send visual selection to gist.github.com as a private, filetyped Gist
" Requires the gist command line too (brew install gist)
" vnoremap <leader>G :w !gist -p -t %:e \| pbcopy<cr>
" vnoremap <leader>UG :w !gist -p \| pbcopy<cr>

" Visual Mode */# from Scrooloose {{{

function! s:VSetSearch()
  let temp = @@
  norm! gvy
  let @/ = '\V' . substitute(escape(@@, '\'), '\n', '\\n', 'g')
  let @@ = temp
endfunction

vnoremap * :<C-u>call <SID>VSetSearch()<CR>//<CR><c-o>
vnoremap # :<C-u>call <SID>VSetSearch()<CR>??<CR><c-o>

" }}}

"}}}
"{{{ Word Wrapping
" better word wrapping: breaks at spaces or hyphens
set formatoptions=l
set lbr

" move thru word wrapped line
nnoremap k gk
nnoremap j gj
"}}}
"{{{ Folding
" http://vim.wikia.com/wiki/Folding

" code folding; using 3 open/closing braces
set foldmethod=marker
"set foldmethod=indent

"Refocus folds; close any other fold except the one that you are on
nnoremap ,z zMzvzz

" fold color
hi Folded cterm=bold ctermfg=DarkBlue ctermbg=none
hi FoldColumn cterm=bold ctermfg=DarkBlue ctermbg=none
"}}}


" Keep search matches in the middle of the window.
nnoremap n nzzzv
nnoremap N Nzzzv

" Don't move on *
nnoremap * *<c-o>

" Heresy
inoremap <c-a> <esc>I
inoremap <c-e> <esc>A

" highlight current word; good to see different code
nnoremap <silent> <leader>h1 :execute 'match InterestingWord1 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h2 :execute '2match InterestingWord2 /\<<c-r><c-w>\>/'<cr>
nnoremap <silent> <leader>h3 :execute '3match InterestingWord3 /\<<c-r><c-w>\>/'<cr>

" Clean trailing whitespace
nnoremap <leader>w mz:%s/\s\+$//<cr>:let @/=''<cr>`z

" Change case
inoremap <C-u> <esc>mzgUiw`za

" Emacs bindings in command line mode
" cnoremap <c-a> <home>
" cnoremap <c-e> <end>

" Select (charwise) the contents of the current line, excluding indentation.
" Great for pasting Python lines into REPLs.
nnoremap vv ^vg_

map <F3> :%s!<!\&lt;!g\|:%s!>!\&gt;!g<CR>

" color highlight line
"set cul                                           " highlight current line
"hi CursorLine term=none cterm=none ctermbg=3      " adjust color


" reopen file where you left off at
" http://stackoverflow.com/questions/774560/in-vim-how-do-i-get-a-file-to-open-at-the-same-line-number-i-closed-it-at-last
" make sure to have permissions to ~/.viminfo if it doesnt work
" sudo chown user:group ~/.viminfo
" where user is your username and group is often the same as your username
augroup line_return
    au!
    au BufReadPost *
        \ if line("'\"") > 0 && line("'\"") <= line("$") |
        \     execute 'normal! g`"zvzz' |
        \ endif
augroup END




" watch for changes then auto reload vimrc
" http://superuser.com/a/417997
augroup myvimrc
    au!
    au BufWritePost .vimrc,_vimrc,vimrc,.gvimrc,_gvimrc,gvimrc so $MYVIMRC | if has('gui_running') | so $MYGVIMRC | endif
augroup END


