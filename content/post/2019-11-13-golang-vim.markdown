---
date: "2019-11-13"
title: "(n)vi(m): basic settings"
description: "vi/vim/nvim is my de-facto tool for software development, here are my favorite settings."
url: /2019/11/13/nvim-daily-workflow-plugins.html
---

Over the years I've been _collecting vi-like plugins_, as well as learning a few obscure built-in commands for helping me improve my typing speed, this includes those specific to programming languages as well as some of those related to the core of _writing text_.

This is the first of a series of posts covering the settings and plugins I use for my daily workflow. I will cover two **must-have** _built-in settings_ and then in future posts I will be writing about concrete plugins.

For reference you can take a look at [my configuration file](https://github.com/MarioCarrion/dotfiles/blob/master/nvim/init.vim).

### 1) number relativenumber

This setting is amazing, it allows you display a number on the _gutter_ that is relative to the actual line you're on, best explained with a screenshot (you may need to click the image below to see it properly):

<a data-flickr-embed="true" href="https://www.flickr.com/photos/mariocarrion/49062940172/in/dateposted-public/" title="vim: relativenumber"><img src="https://live.staticflickr.com/65535/49062940172_599cc60545_o.png" alt="vim: relativenumber"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

The details on the left gutter are:

* `18` is the current line number,
* `numbers above 18` indicate the relative number above this line, and
* `numbers below 18` indicate the relative number below this line.

With that in mind we can jump down or up easily using `k` or `j`, for example:

* 3 lines down `3j` or,
* 10 lines up `10k`.

I really like this one!

### 2) autochdir

There are few cases where I prefer using the built-in version of something I'm trying to do instead of any of the popular plugins (in this particular case I prefer using `netrw` instead of like `nerdtree`).

Here is where this setting comes in, it changes your `netrw` directory relative to the location of the current file. This action is, most of the times, what we are trying to do when opening the directory browser. In cases where you don't want that you can actually search for an specific file using _ctlp_ (which I will be discussing in a future post).

Besides setting this configuration I also use:

```
nnoremap - :Explore<CR>
let g:netrw_banner = 0
let g:netrw_liststyle = 3
let g:netrw_bufsettings = 'noma nomod nu nobl nowrap ro'
autocmd FileType netrw setl bufhidden=delete
```

Which indicates:

* Pressing `-` in normal mode will open `netrw`,
* The banner details will be gone,
* The list style will be set to 3, and
* It will close all opened buffers related to netrw after quitting.

In practical terms this is how it looks like:

<a data-flickr-embed="true" href="https://www.flickr.com/photos/mariocarrion/49062261958/in/dateposted-public/" title="nvim: netrw"><img src="https://live.staticflickr.com/65535/49062261958_a900f5b063_o.png" alt="nvim: netrw"></a><script async src="//embedr.flickr.com/assets/client-code.js" charset="utf-8"></script>

---

Yeah I know, _two settings only_ but really those improved my typing life tenfold!

![The more you know](https://media.giphy.com/media/83QtfwKWdmSEo/giphy.gif "The more you know")
