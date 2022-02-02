export HISTFILE=~/.bash_history
set -o history
export PS1="\[\033[38;5;11m\]\u\[$(tput sgr0)\]@\[$(tput sgr0)\]\[\033[38;5;6m\][\w]\[$(tput sgr0)\]\$(git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'): \[$(tput sgr0)\]"

alias ls='ls --color=auto'
alias grep='grep --color=auto'

alias sti='shopify theme init'
alias stp='shopify theme pull'
alias stps='shopify theme push'
alias sts='shopify theme serve'
alias stc='shopify theme check'
