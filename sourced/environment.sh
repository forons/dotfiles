#	                                           ██
#	                 ██████                   ░██
#	  █████  ██   ██░██░░░██  ██████  ██████ ██████  ██████
#	 ██░░░██░░██ ██ ░██  ░██ ██░░░░██░░██░░█░░░██░  ██░░░░
#	░███████ ░░███  ░██████ ░██   ░██ ░██ ░   ░██  ░░█████
#	░██░░░░   ██░██ ░██░░░  ░██   ░██ ░██     ░██   ░░░░░██
#	░░██████ ██ ░░██░██     ░░██████ ░███     ░░██  ██████
#	 ░░░░░░ ░░   ░░ ░░       ░░░░░░  ░░░       ░░  ░░░░░░
#

setopt extended_glob

#########################################
# Homebrew                              #
#########################################
export HOMEBREW_CASK_OPTS="--appdir=/Applications"
export HOMEBREW_NO_ANALYTICS=1
export HOMEBREW_MAKE_JOBS=4

#########################################
# Language                              #
#########################################
export LC_COLLATE=en_US.UTF-8
export LC_CTYPE=en_US.UTF-8
export LC_MESSAGES=en_US.UTF-8
export LC_MONETARY=en_US.UTF-8
export LC_NUMERIC=en_US.UTF-8
export LC_TIME=en_US.UTF-8
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US.UTF-8
export LESSCHARSET=utf-8

#########################################
# Config set                            #
#########################################
export EDITOR=vim
export VISUAL=vim

export MANPAGER="less -X";

export GREP_OPTIONS="--color=auto";
export LSCOLORS=gxfxbEaEBxxEhEhBaDaCaD

export GOPATH="$HOME/go"
export MANPATH="$(brew --prefix)/opt/coreutils/libexec/gnuman:$MANPATH"


#########################################
# HISTORY set                           #
#########################################
export HISTSIZE=32768; # Larger bash history (allow 32³ entries; default is 500)
export SAVEHIST=32768;
export HISTFILESIZE=$HISTSIZE;
export HISTCONTROL=ignorespace:ignoredups;
export HISTIGNORE="ls:cd:cd -:pwd:exit:date:* --help:history"; # Make some commands not show up in history
export HISTFILE=~/.zsh_history;
HIST_STAMPS='%Y-%m-%d %T '
export HISTTIMEFORMAT="%Y-%m-%d %T ";

# Use one command per line
shopt -s cmdhist

# Treat the '!' character specially during expansion.
setopt BANG_HIST

# Write the history file in the ":start:elapsed;command" format.
setopt EXTENDED_HISTORY

# Write to the history file immediately, not when the shell exits.
setopt INC_APPEND_HISTORY

# append instead of rewrite (should be cool with multiple instances"
shopt -s histappend
setopt APPEND_HISTORY

# Share history between all sessions.
setopt SHARE_HISTORY

# Don't record an entry that was just recorded again.
setopt HIST_IGNORE_DUPS

# Do not display a line previously found.
setopt HIST_FIND_NO_DUPS

# Don't record an entry starting with a space.
setopt HIST_IGNORE_SPACE

# Don't write duplicate entries in the history file.
setopt HIST_SAVE_NO_DUPS

# Remove superfluous blanks before recording entry.
setopt HIST_REDUCE_BLANKS

# Don't execute immediately upon history expansion.
setopt HIST_VERIFY

# Beep when accessing nonexistent history.
setopt HIST_BEEP

#########################################
# PATH set                              #
#########################################
PATH="$(brew --prefix)/opt/coreutils/libexec/gnubin:$PATH"
PATH=${PATH}:/usr/local/bin
PATH=${PATH}:/usr/local/sbin
PATH=${PATH}:/usr/bin
PATH=${PATH}:/bin
PATH=${PATH}:/usr/sbin
PATH=${PATH}:/sbin
PATH=${PATH}:/usr/local/git/bin
PATH=${PATH}:"$HOME"/dotfiles/misc
PATH=${PATH}:"$HOME"/dotfiles/bin
PATH=${PATH}:"$HOME"/go/bin

export PATH=${PATH}

