"============================================================
"                    Vim Markdown Preview
"   git@github.com:JamshedVesuna/vim-markdown-preview.git
"============================================================

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

if g:vim_markdown_preview_toggle == 0
  "Maps vim_markdown_preview_hotkey to vim_markdown_preview#preview()
  :exec 'autocmd Filetype markdown,md map <buffer> ' . g:vim_markdown_preview_hotkey . ' :call vim_markdown_preview#preview()<CR>'
elseif g:vim_markdown_preview_toggle == 1
  "Display images - Maps vim_markdown_preview_hotkey to vim_markdown_preview#preview_local() - saves the html file locally
  "and displays images in path
  :exec 'autocmd Filetype markdown,md map <buffer> ' . g:vim_markdown_preview_hotkey . ' :call vim_markdown_preview#preview_local()<CR>'
elseif g:vim_markdown_preview_toggle == 2
  "Display images - Automatically call vim_markdown_preview#preview_local() on buffer write
  autocmd BufWritePost *.markdown,*.md :call vim_markdown_preview#preview_local()
elseif g:vim_markdown_preview_toggle == 3
  "Automatically call vim_markdown_preview#preview() on buffer write
  autocmd BufWritePost *.markdown,*.md :call vim_markdown_preview#preview()
endif
