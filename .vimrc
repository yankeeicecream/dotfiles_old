set backup
set backupdir-=.
set backupdir-=~/
set backupdir-=~/tmp
set backupdir^=./.saves,~/tmp,/tmp
" Autosave
set updatetime=1000
autocmd BufLeave * update
autocmd CursorHold * update
autocmd InsertLeave * update
" people's choice