---
date: "2019-11-26"
title: "(n)vi(m): look and feel plugins"
description: "vi/vim/nvim is my de-facto tool for software development, here are my favorite look and feel plugins."
url: /2019/11/26/nvim-look-and-feel-plugins.html
---

[Last time]({{< relref "2019-11-13-golang-vim.markdown" >}}) I blogged about my basic nvim settings, this time I would like to share all the plugins I use as a heads-up-display when editing text.

### 1) vim-airline/vim-airline

[`vim-airline`](https://github.com/vim-airline/vim-airline) will draw a statusline at the bottom of each window indicating information relevant to file itself, like detected type, encoding, path and _vim stuff_ like modes, pressed keys or columns number.

`vim-airline` is the foundation for literally all the plugins I currently use that are going to be listed below.

### 2) ryanoasis/vim-devicons

[`vim-devicons`](https://github.com/ryanoasis/vim-devicons) adds file type icons to vim, usually displayed on the statusline and in combination with other plugins like `controlp`. A really important thing about this plugin is the that you must use a patched nerd font compatible one. My current favorite is [**Fura Code**](https://github.com/ryanoasis/nerd-fonts/blob/master/patched-fonts/FiraCode/Regular/complete/Fura%20Code%20Regular%20Nerd%20Font%20Complete.ttf), I also enable _ligatures_ on iterm2 when selecting this font.

### 3) airblade/vim-gitgutter

[`vim-gitgutter`](https://github.com/airblade/vim-gitgutter) shows a git diff in _the gutter_ to indicate added, changes and removed lines.

The configuration I use is:

```
set updatetime=500
```

### 4) mkitt/tabline.vim

[`tabline.vim`](https://github.com/mkitt/tabline.vim) allows displaying succint tabs and as expected it supports the usual [`g` commands](https://vim.fandom.com/wiki/Using_tab_pages) to navigate them.


### 5) NLKNguyen/papercolor-theme

[`papercolor-theme`](https://github.com/NLKNguyen/papercolor-theme) defines color schemes. The configuration I use is:

```
set termguicolors
set background=dark
colorscheme PaperColor
```

In practice all of this combined looks like this! 

<a data-flickr-embed="true" href="https://www.flickr.com/photos/mariocarrion/49130851277/in/dateposted-public/" title="nvim look and feel plugins"><img src="https://live.staticflickr.com/65535/49130851277_cc350b5409.jpg" width="500" height="336" alt="nvim look and feel plugins"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

---

_Productivity_ plugins are next!

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
