"============================================================
"                    Vim Markdown Preview
"   git@github.com:JamshedVesuna/vim-markdown-preview.git
"============================================================

function! Vim_Markdown_Preview()
  :let curr_file = expand('%:t')
  :call system('markdown ' . curr_file . ' > /tmp/vim-markdown-preview.html' . ' && open -g /tmp/vim-markdown-preview.html')
  :sleep 314m
  :call system('rm /tmp/vim-markdown-preview.html')
endfunction

autocmd Filetype markdown,md map <buffer> <C-p> :call Vim_Markdown_Preview()<CR>
