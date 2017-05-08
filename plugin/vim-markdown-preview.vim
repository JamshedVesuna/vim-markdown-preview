"============================================================
"                    Vim Markdown Preview
"   git@github.com:JamshedVesuna/vim-markdown-preview.git
"============================================================

let g:vmp_script_path = resolve(expand('<sfile>:p:h'))

let g:vmp_osname = 'Unidentified'

if has('win32') || has('win64')
  " Not yet used
  let g:vmp_osname = 'win32'
elseif has('unix')
  let s:uname = system("uname")

  if has('mac') || has('macunix') || has("gui_macvim") || s:uname == "Darwin\n"
    let g:vmp_osname = 'mac'
    let g:vmp_search_script = g:vmp_script_path . '/applescript/search-for-vmp.scpt'
    let g:vmp_activate_script = g:vmp_script_path . '/applescript/activate-vmp.scpt'
  else
    let g:vmp_osname = 'unix'
  endif
endif

if !exists("g:vim_markdown_preview_browser")
  if g:vmp_osname == 'mac'
    let g:vim_markdown_preview_browser = 'Safari'
  else
    let g:vim_markdown_preview_browser = 'Google Chrome'
  endif
endif

if !exists("g:vim_markdown_preview_temp_file")
  let g:vim_markdown_preview_temp_file = 0
endif

if !exists("g:vim_markdown_preview_toggle")
  let g:vim_markdown_preview_toggle = 0
endif

if !exists("g:vim_markdown_preview_github")
  let g:vim_markdown_preview_github = 0
endif

if !exists("g:vim_markdown_preview_perl")
  let g:vim_markdown_preview_perl = 0
endif

if !exists("g:vim_markdown_preview_pandoc")
  let g:vim_markdown_preview_pandoc = 0
endif

if !exists("g:vim_markdown_preview_use_xdg_open")
    let g:vim_markdown_preview_use_xdg_open = 0
endif

if !exists("g:vim_markdown_preview_hotkey")
    let g:vim_markdown_preview_hotkey='<C-p>'
endif

function! Vim_Markdown_Preview()
  let b:curr_file = expand('%:p')

  if g:vim_markdown_preview_github == 1
    call system('grip "' . b:curr_file . '" --export /tmp/vim-markdown-preview.html --title vim-markdown-preview.html')
  elseif g:vim_markdown_preview_perl == 1
    call system('Markdown.pl "' . b:curr_file . '" > /tmp/vim-markdown-preview.html')
  elseif g:vim_markdown_preview_pandoc == 1
    call system('pandoc --smart --standalone "' . b:curr_file . '" > /tmp/vim-markdown-preview.html')
  else
    call system('markdown "' . b:curr_file . '" > /tmp/vim-markdown-preview.html')
  endif
  if v:shell_error
    echo 'Please install the necessary requirements: https://github.com/JamshedVesuna/vim-markdown-preview#requirements'
  endif

  if g:vmp_osname == 'unix'
    let chrome_wid = system("xdotool search --name 'vim-markdown-preview.html - " . g:vim_markdown_preview_browser . "'")
    if !chrome_wid
      if g:vim_markdown_preview_use_xdg_open == 1
        call system('xdg-open /tmp/vim-markdown-preview.html 1>/dev/null 2>/dev/null &')
      else
        call system('see /tmp/vim-markdown-preview.html 1>/dev/null 2>/dev/null &')
      endif
    else
      let curr_wid = system('xdotool getwindowfocus')
      call system('xdotool windowmap ' . chrome_wid)
      call system('xdotool windowactivate ' . chrome_wid)
      call system("xdotool key 'ctrl+r'")
      call system('xdotool windowactivate ' . curr_wid)
    endif
  endif

  if g:vmp_osname == 'mac'
    if g:vim_markdown_preview_browser == "Google Chrome"
      let b:vmp_preview_in_browser = system('osascript "' . g:vmp_search_script . '"')
      if b:vmp_preview_in_browser == 1
        call system('open -g /tmp/vim-markdown-preview.html')
      else
        call system('osascript "' . g:vmp_activate_script . '"')
      endif
    else
      call system('open -a "' . g:vim_markdown_preview_browser . '" -g /tmp/vim-markdown-preview.html')
    endif
  endif

  if g:vim_markdown_preview_temp_file == 1
    sleep 200m
    call system('rm /tmp/vim-markdown-preview.html')
  endif
endfunction


"Renders html locally and displays images
function! Vim_Markdown_Preview_Local()
  let b:curr_file = expand('%:p')

  if g:vim_markdown_preview_github == 1
    call system('grip "' . b:curr_file . '" --export vim-markdown-preview.html --title vim-markdown-preview.html')
  elseif g:vim_markdown_preview_perl == 1
    call system('Markdown.pl "' . b:curr_file . '" > /tmp/vim-markdown-preview.html')
  elseif g:vim_markdown_preview_pandoc == 1
    call system('pandoc --smart --standalone "' . b:curr_file . '" > /tmp/vim-markdown-preview.html')
  else
    call system('markdown "' . b:curr_file . '" > vim-markdown-preview.html')
  endif
  if v:shell_error
    echo 'Please install the necessary requirements: https://github.com/JamshedVesuna/vim-markdown-preview#requirements'
  endif

  if g:vmp_osname == 'unix'
    let chrome_wid = system("xdotool search --name vim-markdown-preview.html - " . g:vim_markdown_preview_browser . "'")
    if !chrome_wid
      if g:vim_markdown_preview_use_xdg_open == 1
        call system('xdg-open vim-markdown-preview.html 1>/dev/null 2>/dev/null &')
      else
        call system('see vim-markdown-preview.html 1>/dev/null 2>/dev/null &')
      endif
    else
      let curr_wid = system('xdotool getwindowfocus')
      call system('xdotool windowmap ' . chrome_wid)
      call system('xdotool windowactivate ' . chrome_wid)
      call system("xdotool key 'ctrl+r'")
      call system('xdotool windowactivate ' . curr_wid)
    endif
  endif

  if g:vmp_osname == 'mac'
    if g:vim_markdown_preview_browser == "Google Chrome"
      let b:vmp_preview_in_browser = system('osascript "' . g:vmp_search_script . '"')
      if b:vmp_preview_in_browser == 1
        call system('open -g vim-markdown-preview.html')
      else
        call system('osascript "' . g:vmp_activate_script . '"')
      endif
    else
      call system('open -a "' . g:vim_markdown_preview_browser . '" -g vim-markdown-preview.html')
    endif
  endif

  if g:vim_markdown_preview_temp_file == 1
    sleep 200m
    call system('rm vim-markdown-preview.html')
  endif
endfunction

if g:vim_markdown_preview_toggle == 0
  "Maps vim_markdown_preview_hotkey to Vim_Markdown_Preview()
  :exec 'autocmd Filetype markdown,md map <buffer> ' . g:vim_markdown_preview_hotkey . ' :call Vim_Markdown_Preview()<CR>'
elseif g:vim_markdown_preview_toggle == 1
  "Display images - Maps vim_markdown_preview_hotkey to Vim_Markdown_Preview_Local() - saves the html file locally
  "and displays images in path
  :exec 'autocmd Filetype markdown,md map <buffer> ' . g:vim_markdown_preview_hotkey . ' :call Vim_Markdown_Preview_Local()<CR>'
elseif g:vim_markdown_preview_toggle == 2
  "Display images - Automatically call Vim_Markdown_Preview_Local() on buffer write
  autocmd BufWritePost *.markdown,*.md :call Vim_Markdown_Preview_Local()
elseif g:vim_markdown_preview_toggle == 3
  "Automatically call Vim_Markdown_Preview() on buffer write
  autocmd BufWritePost *.markdown,*.md :call Vim_Markdown_Preview()
endif
