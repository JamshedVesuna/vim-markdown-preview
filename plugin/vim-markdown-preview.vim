"============================================================
"                    Vim Markdown Preview
"   git@github.com:JamshedVesuna/vim-markdown-preview.git
"============================================================

function! Vim_Markdown_Preview()
  let curr_file = expand('%:t')
  call system('markdown ' . curr_file . ' > /tmp/vim-markdown-preview.html')
  let chrome_wid = system("xdotool search --name 'vim-markdown-preview.html - Google Chrome'")
  sleep 300m
  if !chrome_wid
    call system('see -g /tmp/vim-markdown-preview.html')
  else
    let curr_wid = system('xdotool getwindowfocus')
    call system('xdotool windowmap ' . chrome_wid)
    call system('xdotool windowactivate ' . chrome_wid)
    call system("xdotool key 'ctrl+r'")
    call system('xdotool windowactivate ' . curr_wid)
  endif
  sleep 31m
  call system('rm /tmp/vim-markdown-preview.html')
endfunction

autocmd BufWritePost *.markdown,*.md :call Vim_Markdown_Preview()
"autocmd Filetype markdown,md map <buffer> <C-p> :call Vim_Markdown_Preview()<CR>
