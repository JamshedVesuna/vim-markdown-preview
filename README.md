Vim Markdown Preview
====================

A Vim plugin for previewing markdown files in a browser. This plugin was designed to maintain focus on vim but use Google Chrome to preview rendered markdown. Thus, everything is done in the background so you never have to leave Vim.

![Screenshot](images/screenshot.gif?raw=true "Screenshot")

Installation
============

1. With Pathogen: Place `vim-markdown-preview/` in `.vim/bundle/`.

Requirements
============
* [Markdown](http://daringfireball.net/projects/markdown/)
* [xdotool](https://github.com/jordansissel/xdotool)
* [Google Chrome](https://www.google.com/chrome/browser/)

Usage
=====
When in a *.markdown or *.md file, vim-markdown-preview does the following on a write to the buffer:

* If you are not previewing the current file:
    * Open an html rendered version of your file in Google Chrome in the background.
* Otherwise:
    * Refresh your preview of the current markdown file in Google Chrome.

Uncomment the last line in `plugin/vim-markdown-preview.vim` to map `Ctrl-p` to the above instead of on write.

Behind The Scenes
=================
1. First, vim-markdown-preview renders your markdown as html and creates a temporary file `vim-markdown-preview.html` in `/tmp/`.
2. Next, vim-markdown-preview then either opens the html file or refreshes the Google Chrome tab.
3. Lastly, vim-markdown-preview removes the temporary file so nothing left behind.
