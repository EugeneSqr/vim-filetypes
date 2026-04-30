" wrapping for smaller screens and vertical splits
setlocal wrap
setlocal linebreak
setlocal breakat-=\.
setlocal breakindent
setlocal showbreak=>>

let test#python#pytest#options = '-svx'

setlocal efm=%f:%l:%c:\ %m  " ruff concise
setlocal efm+=%f:%l:\ %m    " mypy
setlocal efm+=%-G%.%#       " discard all unmatched

function! Lint()
    cgetexpr system("mypy . && ruff check --output-format=concise")
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

nnoremap <buffer> <leader>L :call LintFormatFix()<CR>
nnoremap <buffer> <leader>l :call Lint()<CR>
