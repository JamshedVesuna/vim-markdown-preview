Vim Markdown Preview
====================

A Vim plugin for previewing markdown files in a browser. This plugin was designed to maintain focus on vim but use Google Chrome or Safari to preview rendered markdown. Thus, everything is done in the background so you never have to leave Vim.

![Screenshot](images/screenshot.gif?raw=true "Screenshot")

Installation
============

1. With Pathogen: Place `vim-markdown-preview/` in `.vim/bundle/`.
2. Default browsers:
    * OS X: Safari
    * Unix: Google Chrome

Support and Requirements
========================

## OS X:

* [Markdown](http://daringfireball.net/projects/markdown/)
* [Safari](https://www.apple.com/safari/)

## Unix:

* [Markdown](http://daringfireball.net/projects/markdown/)
* [xdotool](https://github.com/jordansissel/xdotool)
* [Google Chrome](https://www.google.com/chrome/browser/)

Usage
=====
When in a *.markdown or *.md file, vim-markdown-preview does the following when you type `Ctrl-p` (can be remapped):

* If you are not previewing the current file:
    * Open an html rendered version of your file in Google Chrome or Safari in the background.
* Otherwise:
    * Refresh your preview of the current markdown file in Google Chrome or Safari.

Uncomment the last line in `plugin/vim-markdown-preview.vim` to map a buffer write to the above instead of `Ctrl-p`.

Behind The Scenes
=================
1. First, vim-markdown-preview renders your markdown as html and creates a temporary file `vim-markdown-preview.html` in `/tmp/`.
2. Next, vim-markdown-preview then either opens the html file or refreshes the Google Chrome or Safari tab.
3. If you would like vim-markdown-preview to remove the temporary file so nothing left behind, set `REMOVE_TEMP_FILE` to 1.
