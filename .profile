#Start tmux automaticaly
if command -v tmux &> /dev/null && [ -n "$PS1" ] && [[ ! "$TERM" =~ screen ]] && [[ ! "$TERM" =~ tmux ]] && [ -z "$TMUX" ]; then
  exec tmux
fi

#Set script folder
export PATH=$PATH:~/scripts

#Set default programs
export VISUAL=nvim
export EDITOR=nvim
export READER="zathura"


alias r='ranger'
alias pip='sudo pip'
