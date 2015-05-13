Vim Markdown Preview
====================

A Vim plugin for previewing markdown files in a browser. This plugin was designed to maintain focus on Vim but use Google Chrome or Safari to preview rendered markdown. Thus, everything is done in the background so you never have to leave Vim.

The aim of this plugin is to be light weight with minimal dependencies. Thus, there is no polling engine or webserver involved.

![Screenshot](images/screenshot.gif?raw=true "Screenshot")

Installation<a name='installation'></a>
============

1. With Pathogen: Place `vim-markdown-preview/` in `.vim/bundle/`.
2. Default browsers:
    * OS X: Safari
    * Unix: Google Chrome
    * To change browsers, place the following in your `.vimrc` and replace `'Google Chrome'`:
        * `let vim_markdown_preview_browser='Google Chrome'`
3. Defaults to keeping rendered `.html` file.
    * To remove the rendered preview, after loading it in a browser, add the following to your `.vimrc`:
        * `let vim_markdown_preview_temp_file=1`
4. In combination with the above, defaults to mapping `Ctrl-p` to preview without displaying images.
    * To display images with the `Ctrl-p` mapping, add:
        * `let vim_markdown_preview_toggle=1`
    * To display images automatically on buffer write, add:
        * `let vim_markdown_preview_toggle=2`
    * To disregard images and still automatically preview on buffer write, add:
        * `let vim_markdown_preview_toggle=3`

The following example is using the write buffer option on OS X, with displaying images in the markdown preview, adding the following to `.vimrc`:

```vim
let vim_markdown_preview_temp_file=1
let vim_markdown_preview_toggle=2
```

![Screenshot](images/screenshot-with-images.gif?raw=true "Screenshot With Images")

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
When in a *.markdown or *.md file, vim-markdown-preview does the following when you type `Ctrl-p` (can be remapped, see [Installation](#installation)):

* If you are not previewing the current file:
    * Open an html rendered version of your file in Google Chrome or Safari in the background.
* Otherwise:
    * Refresh your preview of the current markdown file in Google Chrome or Safari.


Behind The Scenes
=================
* Regular mapping:
    1. First, vim-markdown-preview renders your markdown as html and creates a temporary file `vim-markdown-preview.html` in `/tmp/`.
    2. Next, vim-markdown-preview either opens the html file or refreshes the Google Chrome or Safari tab.
    3. If you would like vim-markdown-preview to remove the temporary file so nothing left behind, set `REMOVE_TEMP_FILE` to 1.
* Image viewing:
    1. First, vim-markdown-preview renders your markdown as html with the filename `<your-file>.md.html` in the same directory.
    2. Next, vim-markdown-preview either opens the html file or refreshes the Google Chrome or Safari tab.
    3. There is currently no option to remove this file after previewing.
