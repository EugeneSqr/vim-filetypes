nnoremap <buffer> <leader>L :call Format()<CR>
nnoremap <buffer> <leader>l :call Lint()<CR>
nnoremap <buffer> <leader>b :exe "!cargo run"<CR>

function! Format()
    call system("cargo fmt")
    echo "done"
endfunction

function! Lint()
    cgetexpr system("cargo check")
    echo "done"
    cwindow
endfunction
