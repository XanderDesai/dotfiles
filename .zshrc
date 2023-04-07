# Path to your oh-my-zsh installation.
export ZSH=/Users/xdesai/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
#ZSH_THEME="robbyrussell" #my normal one
ZSH_THEME="powerlevel9k/powerlevel9k"
#POWERLEVEL9K_MODE='nerdfont-complete'
POWERLEVEL9K_DISABLE_RPROMPT=true
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(time user dir vcs virtualenv)


# auto suggestion stuff
ZSH_AUTOSUGGEST_STRATEGY=(history)
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=23'
#ctrl-enter is mapped to this sequence in iterm
bindkey '^[[[CE' autosuggest-execute

# Edit command line with vim. ctrl-x followed by ctrl-e
autoload -U edit-command-line
zle -N edit-command-line
bindkey -M vicmd v edit-command-line

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
#plugins=(git osx svn-fast-info) # Edit 9/20/19
plugins=(git osx zsh-autosuggestions z)

# User configuration

export PATH="/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
# export MANPATH="/usr/local/man:$MANPATH"

source $ZSH/oh-my-zsh.sh

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias gs="git status"
alias gd="git diff"
alias gl="git log"
alias gpr="git pull origin master --rebase"
alias recentbranches="git branch --sort=-committerdate | more"
alias rmaperturecontainers="docker rm $(docker ps -a | grep aperture | tr -s ' ' | cut -d ' ' -f1)"
alias arc='duoconnect -arc -relay phab.duosec.org arc'
alias addgpr="echo 'Remember to push and yubikey' && duo-ssh-add && git pull origin master --rebase"
alias ag="ag --hidden"
alias vpnfix="ip route add 10.50.0.0/24 dev vboxnet0"
#alias lintchanges="git diff HeAD~ --name-only | grep '.*py' | tr '\n' ' ' | awk '{$1=$1};1' | xargs autopep8 -i"
alias syncwin='rsync -rtv /Users/xdesai/src/authproxy py3windows:authproxy_rsync --exclude .git --exclude tags --exclude .mypy_cache'
alias rmoldimages='docker rmi -f $(docker images -qa -f "dangling=true")'
alias alert_finished='say task done'

export SSH_AUTH_SOCK=~/.ssh/ykpiv-sock

#Improving speed inside git repo
#function git_prompt_info() {
  #ref=$(git symbolic-ref HEAD 2> /dev/null) || return
    #echo "$ZSH_THEME_GIT_PROMPT_PREFIX${ref#refs/heads/}${ZSH_THEME_GIT_PROMPT_CLEAN}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
#}
export PATH=/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin:~/bin/

function svndiff () {
  svn diff ${1+"$@"} | colordiff
}

function lintchanges () {
  git diff origin/master --name-only | grep '.*py' | tr '\n' ' ' | awk '{$1=$1};1' | xargs autopep8 -i
}

function jmp () {
    cd "$(z|grep -o "/.*"|fzf || pwd)"
}

# prompt_svn() {
  #local rev branch
  #if in_svn; then
    #rev=$(svn_get_rev_nr)
    #branch=$(svn_get_branch_name)
    #if [ `svn_dirty_choose_pwd 1 0` -eq 1 ]; then
      #prompt_segment yellow black
      #echo -n "$rev@$branch"
      #echo -n "±"
    #else
      #prompt_segment green black
      #echo -n "$rev@$branch"
    #fi
  #fi
#}

# build_prompt() {
  #RETVAL=$?
  #prompt_status
  #prompt_context
  #prompt_dir
  #prompt_git
  #prompt_svn
  #prompt_end
#}

# added by travis gem
[ -f /Users/xdesai/.travis/travis.sh ] && source /Users/xdesai/.travis/travis.sh

#GO
export GOPATH=~/go
export PATH=$PATH:$GOPATH/bin

# DDI
export PATH=$PATH:~/src/trustedpath/ddi

# PHP
export PATH=/usr/local/opt/php@7.3/bin:$PATH

# For frontend testing
export LDFLAGS="-L$(brew --prefix openssl@1.1)/lib"
export CFLAGS="-I$(brew --prefix openssl@1.1)/include"
#if command -v pyenv 1>/dev/null 2>&1; then
  #eval "$(pyenv init -)"
#fi

# fzf shortcuts and keybindings
source /usr/local/opt/fzf/shell/key-bindings.zsh

# Have fzf follow the gitignore rules
export FZF_DEFAULT_COMMAND="rg --files"

# tabtab source for electron-forge package
# uninstall by removing these lines or running `tabtab uninstall electron-forge`
[[ -f /Users/xdesai/.npm/_npx/32315/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh ]] && . /Users/xdesai/.npm/_npx/32315/lib/node_modules/electron-forge/node_modules/tabtab/.completions/electron-forge.zsh

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
