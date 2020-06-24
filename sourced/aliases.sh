#             ██ ██
#            ░██░░
#   ██████   ░██ ██  ██████    ██████  █████   ██████
#  ░░░░░░██  ░██░██ ░░░░░░██  ██░░░░  ██░░░██ ██░░░░
#   ███████  ░██░██  ███████ ░░█████ ░███████░░█████
#  ██░░░░██  ░██░██ ██░░░░██  ░░░░░██░██░░░░  ░░░░░██
# ░░████████ ███░██░░████████ ██████ ░░██████ ██████
#  ░░░░░░░░ ░░░ ░░  ░░░░░░░░ ░░░░░░   ░░░░░░ ░░░░░░
#

#########################################
# Quick config                          #
#########################################
alias hosts="sudo $EDITOR /etc/hosts"
alias python="/usr/local/bin/python3"
alias pip='/usr/local/bin/pip3'


#########################################
# Shorten common commands               #
#########################################
alias ls="ls -hFG"
alias ll="ls -lahFG"
alias "cd.."="cd ../"
alias rmrf="rm -rf"
alias mkdir="mkdir -p"
alias cp="cp -r"
alias scp="scp -r"
alias v="vim"
alias vi="vim"
alias tree='tree -CAFa -I "CVS|*.*.package|.svn|.git|.hg|node_modules|bower_components" --dirsfirst'
alias top="sudo htop"
alias htop="sudo htop"
alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"
alias preview="fzf --preview 'bat --color \"always\" {}'"
alias man='tldr'

alias du="ncdu --color dark -rr -x --exclude .git --exclude node_modules"

# use 'bat' instead of 'cat'
# https://remysharp.com/2018/08/23/cli-improved
if command -v bat &>/dev/null; then
  alias cat='bat'
fi

#########################################
# File cleanup                          #
#########################################
alias cleanup="find . -type f -name '*.DS_Store' -ls -delete"
alias lscleanup="/System/Library/Frameworks/CoreServices.framework/Frameworks/LaunchServices.framework/Support/lsregister -kill -r -domain local -domain system -domain user && killall Finder"

#########################################
# IP / Speedtest                        #
#########################################
alias ip="curl ipinfo.io/ip"
alias ips="ifconfig -a | perl -nle'/(\d+\.\d+\.\d+\.\d+)/ && print $1'"
alias stest="wget -O /dev/null http://speedtest.wdc01.softlayer.com/downloads/test10.zip"
alias ping='prettyping --nolegend'

#########################################
# Git                                   #
#########################################
alias gist="gist -ec $1"

