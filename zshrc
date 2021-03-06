export ZSH=/Users/gary/.oh-my-zsh
ZSH_THEME="robbyrussell"
plugins=(git)

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="~/.rbenv/bin:$PATH"


source $ZSH/oh-my-zsh.sh

export PGPASSFILE='~/.pgpass'

alias g='hub'
alias git='hub'
alias ga='hub add'
alias gs='hub status && hub --no-pager diff --stat'
alias gp='hub push'
alias gc='hub commit -v'
alias gch='hub checkout'
alias gr='hub fetch && hub rebase -i origin/master'
alias gpr='hub pull-request'
alias sudo='sudo '
alias http='python -m SimpleHTTPServer 9000'
alias z='cd /Volumes/Z-Drive/'
alias wds='node_modules/webpack-dev-server/bin/webpack-dev-server.js'
alias vi='nvim'
alias vim='nvim'

export EDITOR='nvim'

shitpostgres() {
  launchctl unload ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
  rm /usr/local/var/postgres/postmaster.pid
  launchctl load -w ~/Library/LaunchAgents/homebrew.mxcl.postgresql.plist
}

update_all() {
  brew update && \
    brew upgrade && \
    brew reinstall --HEAD neovim && \
    upgrade_oh_my_zsh && \
    nvim +PlugUpdate +q +q
}
