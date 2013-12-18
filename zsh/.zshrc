# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set to this to use case-sensitive completion
CASE_SENSITIVE="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git vagrant phing git-flow rvm zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_aliases

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/opt/local/bin:/opt/local/sbin
unsetopt correct_all

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)

function mtr {
  host=`ruby -ruri -e "puts (URI.parse('$1').host or '$1')"`
  echo host: $host
  /opt/local/sbin/mtr -t $host
}

function ping_url {
  host=`ruby -ruri -e "puts (URI.parse('$1').host or '$1')"`
  echo host: $host
  /sbin/ping $host
}

export GREP_COLOR='1;37'
