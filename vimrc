set tabstop=8
set expandtab
set shiftwidth=4
set softtabstop=4
set nocompatible
"   set ignorecase

set backupdir=~/tmp/vi/
set directory=~/tmp/vi/
set undodir=~/tmp/vi/

set t_Co=0

au BufNewFile,BufRead *.go setlocal noet ts=8 sw=8 sts=8
au BufNewFile,BufRead *.c setlocal noet ts=8 sw=8 sts=8
au BufNewFile,BufRead *.h setlocal noet ts=8 sw=8 sts=8

set tags=./tags,tags,./gotags.vi,./rusty-tags.vi;
autocmd BufRead *.rs :setlocal tags+=./rusty-tags.vi;/
autocmd BufRead *.go :setlocal tags+=./gotags.vi;/
