Vim Markdown Preview
====================

Vim plugin for previewing markdown files in a browser.

Installation
============

1. With Pathogen: Place `vim-markdown-preview/` in `.vim/bundle/`

Usage
=====

* When the current buffer is *.markdown or *.md, Vim Markdown Preview maps `Ctrl-p` to open the buffer in the default system browser as html.
* Vim Markdown Preview creates a temporary file vim-markdown-preview.html in /tmp/ and removes it after opening it in a browser so nothing is left behind.
* Further, Vim Markdown Preview opens the browser in the background, which allows you to maintain focus on vim.
