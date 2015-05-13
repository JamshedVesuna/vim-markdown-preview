"============================================================
"                    Vim Markdown Preview
"   git@github.com:JamshedVesuna/vim-markdown-preview.git
"============================================================

let b:REMOVE_TEMP_FILE = 0  "To remove the temp file, set to 1
let b:vim_markdown_preview_browser = 'Google Chrome'

function! Vim_Markdown_Preview()

  let OSNAME = 'Unidentified'

  if has('win32')
    " Not yet used
    let OSNAME = 'win32'
  endif
  if has('unix')
    let OSNAME = 'unix'
  endif
  if has('mac')
    let OSNAME = 'mac'
  endif

  let curr_file = expand('%:p')
  call system('markdown ' . curr_file . ' > /tmp/vim-markdown-preview.html')

  if OSNAME == 'unix'
    let chrome_wid = system("xdotool search --name 'vim-markdown-preview.html - " . b:vim_markdown_preview_browser . "'")
    if !chrome_wid
      call system('see /tmp/vim-markdown-preview.html &> /dev/null &')
    else
      let curr_wid = system('xdotool getwindowfocus')
      call system('xdotool windowmap ' . chrome_wid)
      call system('xdotool windowactivate ' . chrome_wid)
      call system("xdotool key 'ctrl+r'")
      call system('xdotool windowactivate ' . curr_wid)
    endif
  endif

  if OSNAME == 'mac'
    call system('open -g /tmp/vim-markdown-preview.html')
  endif

  if b:REMOVE_TEMP_FILE == 1
    sleep 200m
    call system('rm /tmp/vim-markdown-preview.html')
  endif
endfunction


"Renders html locally and displays images
function! Vim_Markdown_Preview_Local()

  let OSNAME = 'Unidentified'

  if has('win32')
    " Not yet used
    let OSNAME = 'win32'
  endif
  if has('unix')
    let OSNAME = 'unix'
  endif
  if has('mac')
    let OSNAME = 'mac'
  endif

  let curr_file = expand('%:p')
  call system('markdown ' . curr_file . ' > ' . curr_file . '.html')

  if OSNAME == 'unix'
    let chrome_wid = system("xdotool search --name '". curr_file . ".html - " . b:vim_markdown_preview_browser . "'")
    if !chrome_wid
      call system('see ' . curr_file . '.html &> /dev/null &')
    else
      let curr_wid = system('xdotool getwindowfocus')
      call system('xdotool windowmap ' . chrome_wid)
      call system('xdotool windowactivate ' . chrome_wid)
      call system("xdotool key 'ctrl+r'")
      call system('xdotool windowactivate ' . curr_wid)
    endif
  endif

  if OSNAME == 'mac'
    call system('open -g ' . curr_file . '.html')
  endif

  if b:REMOVE_TEMP_FILE == 1
    sleep 200m
    call system('rm ' . curr_file . '.html')
  endif
endfunction


"Maps Ctrl-p to Vim_Markdown_Preview()
autocmd Filetype markdown,md map <buffer> <C-p> :call Vim_Markdown_Preview()<CR>

"Display images - Maps Ctrl-p to Vim_Markdown_Preview_Local() - saves the html file locally
"and displays images in path
"autocmd Filetype markdown,md map <buffer> <C-p> :call Vim_Markdown_Preview_Local()<CR>

"Display images - Automatically call Vim_Markdown_Preview_Local() on buffer write
"autocmd BufWritePost *.markdown,*.md :call Vim_Markdown_Preview_Local()

"Automatically call Vim_Markdown_Preview() on buffer write
"autocmd BufWritePost *.markdown,*.md :call Vim_Markdown_Preview()
