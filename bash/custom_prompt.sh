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

PROMPT_COMMAND=dyn_prompt
function dyn_prompt
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


if [[ $VIRTUAL_ENV != "" ]]; then
    venv="${BRED}(${VIRTUAL_ENV##*/}) "
elif [[ $IN_NIX_SHELL != "" ]]; then
    venv="${BRED}(λ) "
else
    venv=''
fi


ICON="φ"

# Configure the final Prompt
PS1="${venv}${LB} ${UC}${ICON} ${DC}\w ${RB}${DF} "
}
