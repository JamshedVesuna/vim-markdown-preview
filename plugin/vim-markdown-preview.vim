"============================================================
"                    Vim Markdown Preview
"   git@github.com:JamshedVesuna/vim-markdown-preview.git
"============================================================

function! Vim_Markdown_Preview()

  let BROWSER = 'google-chrome'
  let OSNAME = 'Unidentified'
  let REMOVE_TEMP_FILE = 0  "To remove the temp file, set to 1

  if has('win32')
    " Not yet used
    let OSNAME = 'win32'
  endif
  if has('unix')
    let OSNAME = 'unix'
  endif
  if has('mac')
    let OSNAME = 'mac'
    let BROWSER = 'safari'
  endif

  let curr_file = expand('%:p')
  call system('markdown ' . curr_file . ' > /tmp/vim-markdown-preview.html')

  if OSNAME == 'unix' && BROWSER == 'google-chrome'
    let chrome_wid = system("xdotool search --name 'vim-markdown-preview.html - Google Chrome'")
    if !chrome_wid
      "sleep 300m
      call system('see /tmp/vim-markdown-preview.html & > /dev/null &')
    else
      let curr_wid = system('xdotool getwindowfocus')
      call system('xdotool windowmap ' . chrome_wid)
      call system('xdotool windowactivate ' . chrome_wid)
      call system("xdotool key 'ctrl+r'")
      call system('xdotool windowactivate ' . curr_wid)
    endif
    "sleep 700m
  endif

  if OSNAME == 'mac' && BROWSER == 'safari'
    call system('open -g /tmp/vim-markdown-preview.html')
  endif

  if REMOVE_TEMP_FILE
    call system('rm /tmp/vim-markdown-preview.html')
  endif
endfunction

autocmd Filetype markdown,md map <buffer> <C-p> :call Vim_Markdown_Preview()<CR>
"autocmd BufWritePost *.markdown,*.md :call Vim_Markdown_Preview()
