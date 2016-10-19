---
author:
  display_name: Mario Carrion
  email: mario@carrion.ws
  login: mario
  url: http://blog.mariocarrion.com/
author_email: mario@carrion.ws
author_login: mario
author_url: http://blog.mariocarrion.com/
categories:
- english
comments:
- author: Crayola
  author_email: ariannaibarra@hotmail.com
  author_url: ""
  content: =S entendÃ­ poquito, casÃ­ nada... xDD
  date: 2009-07-14 10:53:04 -0400
  date_gmt: 2009-07-14 15:53:04 -0400
  id: 14962
- author: Mario Carrion
  author_email: mario@monouml.org
  author_url: http://blog.mariocarrion.com
  content: Luego te explico, tu confÃ­a.
  date: 2009-07-14 21:07:35 -0400
  date_gmt: 2009-07-15 02:07:35 -0400
  id: 14963
date: 2009-07-01T13:20:49Z
date_gmt: 2009-07-01 18:20:49 -0400
published: true
status: publish
tags:
- mono
- opensuse
- english
title: Multiple Parallel Mono Environments
url: /2009/07/01/multiple-parallel-mono-environments/
wordpress_id: 571
wordpress_url: http://blog.carrion.ws/?p=571
---

<p>If you are a <a href="http://www.mono-project.com/">Mono</a> developer, either you develop Mono or you use Mono for development, I'm sure you already have your <a title="Paralle Mono Environments" href="http://www.mono-project.com/Parallel_Mono_Environments">Parallel Mono Environment</a> set up and you are happy using it. Keeping a parallel environment is necessary because that way you don't break your default Mono installation or an specific mono application, so you can keep using the latest version of whatever you need, however sometimes you need more than one parallel environment, usually because you are working on different versions, for example <em>mono-2-6</em>, <em>mono-head</em> and <em>mono-package</em>; in the <a href="http://www.mono-project.com/Accessibility">Accessibility Team</a> we are always working on different Mono versions jumping from one version to another, so we need to keep multiple parallel environments, and we don't want to compile everything every time over and over. One way to accomplish multiple parallel environments is to keep <em>n</em> copies of <em>mono-dev-env</em> (something like <em>mono-dev-env-2-6</em> or <em>mono-dev-env-trunk</em>); but since I like to keep everything in one place and use the same procedure to set up my environments, I updated the default environment file to something like this (you can always get an updated version from: <a href="http://www.mariocarrion.com/files/mono-dev">here</a>):</p>
<pre class="brush:bash">#!/bin/bash
#
# Based on http://www.mono-project.com/Parallel_Mono_Environments , with the 
# following modifications:
#
# - Aliases for make:
#   - mk = make
#   - mki = make install
#   - mku = make uninstall
#   - mkuci = make uninstall, clean, autogen and install
#   - mkc = make clean
#   - mkdc = make dist-clean
#   - autogenmono = autogen.sh with prefix, you also add your arguments
#   - configuremono = configure with prefix, you also add your arguments
#   - bootstrapmono = bootstrap with prefix, you also add your arguments
# - Success/Failure messages raised depending on executed command.
# 
# You will need to add the following alias into your .bashrc:
#
# function exportmono {
#   source ~/path/to/mono-dev $1
# }
#
# so you can use:
# - "exportmono trunk"
# - "exportmono 2.4" 
# - "exportmono whatever" 
# to use multiple parallel environments, when no argument is used "trunk" 
# is set by default.
#
#
# You can also use "lcustom" to load custom scripts, for example
# if you need to define environment variables instead of adding those here
# you will write a custom-var.sh and will use:
#
# "lcustom ~/custom-var.sh"

# Use this variable to add local enviroment paths 
# (i.e. to include a custom executable script)
EXTRA_PATH=$HOME/Documents/Repository/uia2atk/tools

# Colors, based on http://wiki.archlinux.org/index.php/Color_Bash_Prompt
NO_COLOR='\e[0m'
# regular colors
BLACK='\e[0;30m'
RED='\e[0;31m'
GREEN='\e[0;32m'
YELLOW='\e[0;33m'
BLUE='\e[0;34m'
MAGENTA='\e[0;35m'
CYAN='\e[0;36m'
WHITE='\e[0;37m'
# emphasized (bolded) colors
EBLACK='\e[1;30m'
ERED='\e[1;31m'
EGREEN='\e[1;32m'
EYELLOW='\e[1;33m'
EBLUE='\e[1;34m'
EMAGENTA='\e[1;35m'
ECYAN='\e[1;36m'
EWHITE='\e[1;37m'
# underlined colors
UBLACK='\e[4;30m'
URED='\e[4;31m'
UGREEN='\e[4;32m'
UYELLOW='\e[4;33m'
UBLUE='\e[4;34m'
UMAGENTA='\e[4;35m'
UCYAN='\e[4;36m'
UWHITE='\e[4;37m'
# background colors
BBLACK='\e[40m'
BRED='\e[41m'
BGREEN='\e[42m'
BYELLOW='\e[43m'
BBLUE='\e[44m'
BMAGENTA='\e[45m'
BCYAN='\e[46m'
BWHITE='\e[47m'

# We are going to load CUSTOM FILES
# 
# Basically the idea is to split multiple development paths or variables
# into different files, that way we can keep this file as clean as possible.
# This magic function tries to load those files.

function lcustom {
  if test x"$1" = x; then 
  	echo -e "${RED}>>${NO_COLOR} Nothing to do, no arguments provided."
  else
  	source $1 && echo -e "${RED}>>${NO_COLOR} Loaded: '$1'" || echo -e "${RED}>>${NO_COLOR} Not loaded"
  fi
}

MONO_REV=$1
if test x"$MONO_REV" = x; then
	MONO_REV="trunk"
fi

HOME_ROOT=$HOME/.root-dev/$MONO_REV
MONO_PREFIX=$HOME_ROOT
GNOME_PREFIX=$HOME_ROOT

if [ -d $HOME_ROOT ]; then
  echo -e "${RED}>>${NO_COLOR} Using environment: ${RED}$MONO_REV"
else
  mkdir -p $HOME_ROOT && echo -e "${RED}>>${NO_COLOR} Using environment (for the first time): ${RED}$MONO_REV" || echo -e "${RED}>>${NO_COLOR} Unable to create local path."
fi

# configure-related functions
function autogenmono {
  ./autogen.sh --prefix=$MONO_PREFIX $* && mynotify "autogenmono" || mynotify 1 "autogenmono"
}
function configuremono {
  ./configure --prefix=$MONO_PREFIX $* && mynotify "configuremono" || mynotify 1 "configuremono"
}
function bootstrapmono {
  if test x"$1" = x; then
    echo -e "${RED}>>${NO_COLOR} Use bootstrapmono bootstrap-file"
    echo -e "${RED}>>${NO_COLOR} For example: bootstrapmono bootstrap-2.12"
  else
    ./$1 --prefix=$MONO_PREFIX $2 && mynotify "bootstrapmono" || mynotify 1 "bootstrapmono"
  fi
}

# make-related functions
function mkuci {
  make uninstall && make clean && autogenmono $* && make install && mynotify "mkuci" || mynotify 1 "mkuci" 
}
function mk { 
  make $* && mynotify "mk" || mynotify 1 "mk"
}
function mki { 
  make install $* && mynotify "mki" || mynotify 1 "mki" 
}
function mku { 
  make uninstall && mynotify "mku" || mynotify 1 "mku" 
}
function mkc { 
  make clean && mynotify "mkc" || mynotify 1 "mkc" 
}
function mkdc { 
  make dist-clean && mynotify "mkdc" || mynotify 1 "mkdc"
}

function mynotify {
  MSG_CONTENT=$1
  MSG_URGENCY="normal"
  MSG_RESULT="done"

  echo $1 | grep "[^0-9]" > /dev/null 2>&1
  # Is first argument a numeric value?
  if [ "$?" -ne "0" ]; then 
    if [ "$1" -eq "1" ]; then 
      MSG_CONTENT=$2
      MSG_URGENCY="critical"
      MSG_RESULT="failed"
    fi
  fi
 
  notify-send -t 2500 -u $MSG_URGENCY "$MSG_CONTENT $MSG_RESULT: '`basename $PWD`'"
}

export DYLD_LIBRARY_PATH=$MONO_PREFIX/lib:$DYLD_LIBRARY_PATH
export LD_LIBRARY_PATH=$MONO_PREFIX/lib:$LD_LIBRARY_PATH
export C_INCLUDE_PATH=$MONO_PREFIX/include:$GNOME_PREFIX/include
export ACLOCAL_PATH=$MONO_PREFIX/share/aclocal
export PKG_CONFIG_PATH=$MONO_PREFIX/lib/pkgconfig:$GNOME_PREFIX/lib/pkgconfig
export MANPATH=$MONO_PREFIX/share/man:$MANPATH
# a11y support
export GTK_MODULES=gail:atk-bridge

PATH=$EXTRA_PATH:$PATH
PATH=$MONO_PREFIX/bin:$PATH
PS1="$WHITE@mono-dev$NO_COLOR:$RED$MONO_REV$NO_COLOR:\w-> "

</pre>
<p>To use this script you will need to define an alias in your <em>.bashrc</em>:</p>
<p><code lang="bash"><br />
function exportmono {<br />
   source ~/path/to/mono-dev $1<br />
}<br />
</code></p>
<p>You can use this alias: <em>exportmono 2.4</em> if you are planning to define a 2.4 environment, or <em>exportmono trunk</em>, or whatever; there are more aliases that I like to use, for example, <em>autogenmono</em>, <em>mk</em> or <em>mki</em>, the nice about these aliases is that they also use <em>notify-send</em> to send a message when the command is completed, so you can work on something else while compiling, installing, cleaning or configuring. Also the bash prompt is using colors to identify what is the current parallel environment, in this case I'm using mono-2-4 and the environment name is <em>2.4</em>.</p>
<p><a href="http://www.flickr.com/photos/mariocarrion/3679259436/" title="Mono  by Mario Carrion, on Flickr"><img src="http://farm4.static.flickr.com/3641/3679259436_e8d2f03123.jpg" width="500" height="193" alt="Mono " /></a>&nbsp;&nbsp;&nbsp;<a href="http://www.flickr.com/photos/mariocarrion/3679267312/" title="Screenshot by Mario Carrion, on Flickr"><img src="http://farm4.static.flickr.com/3016/3679267312_324898f2e1.jpg" width="500" height="193" alt="Screenshot" /></a></p>
<p>This environment should work on any recent bash version, if not let me know.</p>
