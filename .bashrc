#start with some suphys stuff
# exec default bashrc
if [ -f /etc/bashrc ]; then
        . /etc/bashrc   
fi

# add custom physics path
export PATH=~/bin:/usr/physics/bin:/usr/local/bin:$PATH
export MANPATH=/usr/physics/man:$MANPATH

# no coredumps in home
ulimit -S -c 0

# default umask
umask 022

# disable autologout
unset autologout 

# set TEX default path
set TEXINPUTS=".:/usr/physics/tex//:"

# set ICT proxy 
HTTP_PROXY=http://www-cache.usyd.edu.au:8080

# no duplicate lines in the history
HISTCONTROL=ignoredups:ignorespace

# append to the history file, no overwrite
shopt -s histappend

# history length 
HISTSIZE=100000000
HISTFILESIZE=200000000


# set default printer
if [ -f ~/.default_printer ]; then
        export PRINTER=`more < ~/.default_printer`
        export LWPRINTER=$PRINTER
        export LPDEST=$PRINTER
fi

# Change default printer in current shell and new shells
alias chooser='cd ; /usr/bin/perl /usr/physics/bin/chooser.pl ; PRINTER=`more < ~/.default_printer` ; LWPRINTER=`more < ~/.default_printer` ; LPDEST=`more < ~/.default_printer` ; export PRINTER ; export LWPRINTER ; export LPDEST'

# NOTE: echo-ing anything breaks scp

# USER CUSTOM SETTINGS BELOW #

# If not running interactively, don't do anything
[ -z "$PS1" ] && return
#make mono find dlls properly
export LD_LIBRARY_PATH=~/lib
export PKG_CONFIG_PATH=~/lib/pkgconfig/

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set a color prompt
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

#not sure what any of the escape codes do - important bit is the __git_ps1 to show branch 
export PS1='\[\033[01;32m\]\h\[\033[01;34m\] \w\[\033[31m\]$(__git_ps1 " %s") \[\033[01;34m\]$\[\033[00m\] '
# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi
#spelling aliases
alias got='git'
alias ci='vim' 
alias ks='ls'
alias ake='make'
alias nake='make'
alias naje='make'
# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'
#My aliases
#git
alias gdh='git diff HEAD'
alias gcm='git commit -m'
alias gs='git status'
alias ga='git add .'
#others
alias top='htop'
#suphys has broken matlab for some reason - also quota
alias matlab='/usr/physics/matlab2010/bin/matlab'
alias quota='echo "" ; df -h ~ | sed /"export"/d ; echo ""'
#calculates most used commands
alias used='cat ~/.bash_history | sort | uniq -c | sort -n | tail'
alias revcount='git log --oneline --all | wc -l'
alias vi='vim' #helpful - on suphys invoking as vi reads different startup files
alias gvim='xmodmap -e "clear Lock" -e "keycode 0x42 = Escape" && gvim'
#calculates most used commands but ignores arguments
function useds(){
cat ~/.bash_history | awk {'print $1'} | sort | uniq -c | sort -n | tail
}
alias open='gnome-open'
function gopen(){
for x in $@ ; do gvim $x; done
}
function latwarn {
pdflatex $1 | grep -i warn
}
#because latex is fun we use this function to compile
function latmake {
pdflatex $1 && bibtex $1 && pdflatex $1 && pdflatex $1
}
#evince doesn't go into the background automatically, but doing this fixes that problem - essentially aliases evince to evince &
#cannot be done with an alias because an alias can't fiddle with arguments
function evince {
exec evince "$1" &
}
#create a skeleton latex document
function latheader {
echo "\documentclass{article} 
\usepackage{amsmath} 
\begin{document} 
\author{John Palmer, SID : 308219805} 
\title{TITLE HERE !!!} 
\maketitle 

\end{document}" > $1
}
function mkgitig {
echo "*.aux
*.log
*.swp
*.mdb
*.pdf
*.dll
*.exe
*.gz
*.dvi
*sigfile" > .gitignore
}
#fsharp aliases - could porbably do better with some sor to of copy script
alias fsc='mono ~/FSharp-2.0.0.0/bin/fsc.exe'
alias fsi='mono ~/FSharp-2.0.0.0/bin/fsi.exe --readline+ --gui-' 
# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if [ -f ~/etc/bash_completion ] && ! shopt -oq posix; then
    . ~/etc/bash_completion
fi

