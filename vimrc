syntax on
set hlsearch
set ts=4
set tags=~/.tags
set shiftwidth=4
set expandtab
set tabstop=4
set cinkeys-=0# "do not jump to first column with #
set formatoptions-=c "disable automatic comment continuation

"set cindent
"set smartindent depreciated, use cindent
"set diffopt+=iwhite
"see smartindent and autoindent at http://vim.wikia.com/wiki/Indenting_source_code
set smartindent
set autoindent
filetype indent on
filetype plugin on
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4
autocmd Filetype html setlocal expandtab tabstop=4 shiftwidth=4

"set scrollbind to scroll to split windows together
"set scrollbind

" jk to exit to normal mode, in addition to esc.
:imap jk <Esc>

"map ':' to ';'
nnoremap ; :

let mapleader = ","

"Open command-line window using conque
map <Leader>c :ConqueTerm bash <Return>

map <Leader>a :bprev<Return>
map <Leader>s :bnext<Return>
map <Leader>d :bp<bar>sp<bar>bn<bar>bd<CR>
map <Leader>b :buffers<Return>
map <Leader>ls :buffers<Return>

"map ctrl-movement keys to window switching
map <Leader>k <C-w><Up>
map <Leader>j <C-w><Down>
map <Leader>l <C-w><Right>
map <Leader>h <C-w><Left>

"open new window in split
map <Leader>n :vsplit<Return>
map <Leader>N :split <Return>

"line numbers
set nu
map <Leader>nu :set invnumber<Return>

"map buffer switching keys
map <Leader>1 :b1<Return>
map <Leader>2 :b2<Return>
map <Leader>3 :b3<Return>
map <Leader>4 :b4<Return>
map <Leader>5 :b5<Return>
map <Leader>6 :b6<Return>
map <Leader>7 :b7<Return>
map <Leader>8 :b8<Return>
map <Leader>9 :b9<Return>

"save and quit
map <Leader>q :qa<Return>
map <Leader>w :wqa!<Return>

"enable/disable auto indentation
map <Leader>ei :set smartindent autoindent<Return>
map <Leader>di :set smartindent! autoindent!<Return>

"open yanked filepath
map <Leader>o :vi <C-r>0<Return>

"Remove trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

"In text files, unlimit the width of text
autocmd BufRead *.txt set tw=0

"to enable incremental search:
set incsearch

"to change search color
hi Search cterm=NONE ctermfg=grey ctermbg=blue

colorscheme default

"" start pathogen plugin management
execute pathogen#infect()

" add full (%F) or relative (%f) file path to your existing statusline
set laststatus=2
set statusline+=%c\ %f

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" hit ctrl-l to get rid of search highlight
" http://stackoverflow.com/questions/1352242/how-to-get-rid-of-search-highlight-in-vim
map <silent> <C-L> :let @/=""<CR>

" highlight variable under cursor
" http://stackoverflow.com/questions/1551231/highlight-variable-under-cursor-in-vim-like-in-netbeans
" autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

" When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" http://superuser.com/questions/401926/how-to-get-shiftarrows-and-ctrlarrows-working-in-vim-in-tmux
" tmux will send xterm-style keys when its xterm-keys option is on
if &term =~ '^screen'
   execute "set <xUp>=\e[1;*A"
   execute "set <xDown>=\e[1;*B"
   execute "set <xRight>=\e[1;*C"
   execute "set <xLeft>=\e[1;*D"
endif

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" use ctrl+D to delete without yanking
" map <silent> <C-D> : "_d

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search for selected text, forwards or backwards.
" http://vim.wikia.com/wiki/Search_for_visually_selected_text
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gV:call setreg('"', old_reg, old_regtype)<CR>
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

augroup filetypedetect
  au BufNewFile,BufRead *.pig set filetype=pig syntax=pig
augroup END

" for .q .ql .hql files
augroup filetypedetect
  au BufNewFile,BufRead *.q set filetype=hive expandtab
  au BufNewFile,BufRead *.ql set filetype=hive expandtab
  au BufNewFile,BufRead *.hql set filetype=hive expandtab
augroup END

" for .scala files
augroup filetypedetect
  au BufNewFile,BufRead *.scala set filetype=scala expandtab
augroup END

" for .thrift files
augroup filetypedetect
  au BufNewFile,BufRead *.thrift set filetype=thrift expandtab
augroup END

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" to convert a line of text to Title Case
" http://kmandla.wordpress.com/2011/03/07/note-to-self-title-case-in-vim
":s/\<\(\w\)\(\w*\)\>/\u\1\L\2/g

" START syntastic settings

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
    \'mode': 'active',
    \'active_filetypes': ['python'],
    \'passive_filetypes': ['java', 'cc', 'cpp', 'go']}

" END syntastic settings

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
set backspace=2

set rtp+=$GOROOT/misc/vim
filetype plugin indent on
syntax on

let g:godef_split=0

" vim-markdown
let g:vim_markdown_folding_disabled = 1 " disable folding

set wildmode=longest,list,full
set wildmenu

set makeprg=python\ %
set autowrite

set tags=./tags,tags;$HOME

" for .ql files
au BufNewFile,BufRead *.ql set filetype=hive expandtab

" Convenient way to visualize JSON objects
com! FormatJSON %!python -m json.tool

" SQLFmt
map <Leader>sf :SQLFmt <Return>

if &diff
    colorscheme evening
endif

let g:autotagTagsFile="tags"
