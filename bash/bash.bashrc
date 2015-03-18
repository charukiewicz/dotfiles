# Symlink: sudo ln -s /path/to/dotfiles/bash/bash.bashrc /etc/bash.bashrc
# Remove (or backup) /etc/bash.bashrc, ~/.bashrc, and /root/.bashrc for this to function properly

if [ -f /etc/bash_completion ]; then
	    . /etc/bash_completion
fi

xhost +local:root > /dev/null 2>&1

complete -cf sudo

shopt -s cdspell
shopt -s checkwinsize
shopt -s cmdhist
shopt -s dotglob
shopt -s expand_aliases
shopt -s extglob
shopt -s histappend
shopt -s hostcomplete
shopt -s nocaseglob

export HISTSIZE=10000
export HISTFILESIZE=${HISTSIZE}
export HISTCONTROL=ignoreboth

alias ls='ls --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias ll='ls -l --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias la='ls -la --group-directories-first --time-style=+"%d.%m.%Y %H:%M" --color=auto -F'
alias grep='grep --color=tty -d skip'
alias cp="cp -i"                          # confirm before overwriting something
alias df='df -h'                          # human-readable sizes
alias free='free -m'                      # show sizes in MB
alias np='nano PKGBUILD'

# ex - archive extractor
# usage: ex <file>
ex ()
{
  if [ -f $1 ] ; then
    case $1 in
      *.tar.bz2)   tar xjf $1   ;;
      *.tar.gz)    tar xzf $1   ;;
      *.bz2)       bunzip2 $1   ;;
      *.rar)       unrar x $1     ;;
      *.gz)        gunzip $1    ;;
      *.tar)       tar xf $1    ;;
      *.tbz2)      tar xjf $1   ;;
      *.tgz)       tar xzf $1   ;;
      *.zip)       unzip $1     ;;
      *.Z)         uncompress $1;;
      *.7z)        7z x $1      ;;
      *)           echo "'$1' cannot be extracted via ex()" ;;
    esac
  else
    echo "'$1' is not a valid file"
  fi
}

# prompt
BROWSER=/usr/bin/xdg-open

PATH=$PATH:/home/christian/.gem/ruby/2.1.0/bin
export PATH

#if [ "`id -u`" -eq 0 ]; then
#    PS1="[ \[\e[1;31m\]λ\[\e[1;32m\]\[\e[49m\] \W \[\e[0m\]] "
#else
#    PS1="[ \[\e[1;32m\]λ \W \[\e[0m\]] "
#fi

###### PROMPT CONFIG ######

## Colors?  Used for the prompt.
#Regular text color
BLACK='\[\e[0;30m\]'
#Bold text color
BBLACK='\[\e[1;30m\]'
#background color
BGBLACK='\[\e[40m\]'
RED='\[\e[0;31m\]'
BRED='\[\e[1;31m\]'
BGRED='\[\e[41m\]'
GREEN='\[\e[0;32m\]'
BGREEN='\[\e[1;32m\]'
BGGREEN='\[\e[1;32m\]'
YELLOW='\[\e[0;33m\]'
BYELLOW='\[\e[1;33m\]'
BGYELLOW='\[\e[1;33m\]'
BLUE='\[\e[0;34m\]'
BBLUE='\[\e[1;34m\]'
BGBLUE='\[\e[1;34m\]'
MAGENTA='\[\e[0;35m\]'
BMAGENTA='\[\e[1;35m\]'
BGMAGENTA='\[\e[1;35m\]'
CYAN='\[\e[0;36m\]'
BCYAN='\[\e[1;36m\]'
BGCYAN='\[\e[1;36m\]'
WHITE='\[\e[0;37m\]'
BWHITE='\[\e[1;37m\]'
BGWHITE='\[\e[1;37m\]'

#default color
DF='\[\e[0m\]'
BGDF='\[\e[49m]'

PROMPT_COMMAND=smile_prompt
function smile_prompt
{
if [ "$?" -eq "0" ] # success
then
  LB="${DF}["
  RB="${DF}]"
else # fail
  LB="${BRED}[${DF}"
  RB="${BRED}]${DF}"
fi
if [ $UID -eq 0 ] #root user color
then
  UC="${BRED}"
else #normal user color
  UC="${BGREEN}"
fi

#directory color
DC="${BGREEN}"


# Get Virtual Env
if [[ $VIRTUAL_ENV != "" ]]
    then
      # Strip out the path and just leave the env name
      venv="${BRED}(${VIRTUAL_ENV##*/}) "
else
      # In case you don't have one activated
      venv=''
fi
# End Virtual Env Setting

if [ `hostname` = "solidus" ]
	then ICON="Ξ"
elif [ `hostname` = "cypher" ] 
	then ICON="λ"
else
	ICON="?"
fi

# Configure the final Prompt
PS1="${venv}${LB} ${UC}${ICON} ${DC}\W ${RB}${DF} "
}

###### END PROMPT CONFIG ######

alias devmode="sh ~/scripts/devmode.sh"
