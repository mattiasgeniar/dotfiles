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

# Comment this out to disable weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
COMPLETION_WAITING_DOTS="true"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git macports osx vagrant phing git-flow rvm zsh-syntax-highlighting)

source $ZSH/oh-my-zsh.sh
source $HOME/.zsh_aliases

# Customize to your needs...
export PATH=/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:/usr/local/git/bin:/opt/local/bin:/opt/local/sbin
unsetopt correct_all

ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern cursor)
export RUBYLIB=$RUBYLIB:/Library/Ruby/Gems/1.8/gems/veewee-0.2.3/lib/:/Library/Ruby/Gems/1.8/gems/virtualbox-0.9.2/lib/

function mtr {
  host=`ruby -ruri -e "puts (URI.parse('$1').host or '$1')"`
  echo host: $host
  /usr/local/Cellar/mtr/0.85/sbin/mtr -t $host
}

function ping_url {
  host=`ruby -ruri -e "puts (URI.parse('$1').host or '$1')"`
  echo host: $host
  /sbin/ping $host
}

# An SSH function for Nucleus "sshn": default Agent Fowarding & use custom port
function sshn {
  # First, test on port 9999 (our default SSH)
  nc -z $1 9999 > /dev/null 2> /dev/null

  if [ $? -eq 0 ]
  then
    ssh -p 9999 nucmattias@"$1"
  fi

  # Second, test on port 22
  nc -z $1 22 > /dev/null 2> /dev/null

  if [ $? -eq 0 ]
  then
    ssh -p 22 nucmattias@"$1"
  fi
}

push() {
  git pull && git commit . -m "$1" && git push && stash pull-request master -r master_repo -T "$1" > /dev/null 2>&1;
  echo "Pulled, commited, pushed and PR created. Yay!";
}

export GREP_COLOR='1;37'

PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting

# Add the Java 1.8 binary
PATH=$PATH:/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin/
JAVA_HOME="/Library/Internet\ Plug-Ins/JavaAppletPlugin.plugin/Contents/Home/bin"

bindkey -s "^[OM" "^M"
