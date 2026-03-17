setlocal efm=%f:%l:%c:\ %m
setlocal efm+=%-G%.%#       " discard all unmatched

nnoremap <buffer> <leader>L :call Format()<CR>
nnoremap <buffer> <leader>l :call Lint()<CR>
nnoremap <buffer> <leader>b :exe "!go run %"<CR>

function! Format()
    call system("go fmt ".expand('%'))
    echo "done"
endfunction

function! Lint()
    cgetexpr system("go build -o /dev/null ".expand('%'))
    echo "done"
    cwindow
endfunction
