let test#python#pytest#options = '-svx'

set efm=%f:%l:%c:\ %m  " ruff concise
set efm+=%f:%l:\ %m    " mypy
set efm+=%-G%.%#       " discard all unmatched

function! Lint()
    cgetexpr system("mypy --install-types --non-interactive . && ruff check --output-format=concise")
    echo "done"
    cwindow
endfunction

function! LintFormatFix()
    call system("ruff format ".expand('%'))
    let stdout = system("ruff check --fix --output-format=concise ".expand('%'))
    if v:shell_error != 0
       echo stdout
       return
    endif
    echo "done"
endfunction

nnoremap <leader>L :call LintFormatFix()<CR>
nnoremap <leader>l :call Lint()<CR>
