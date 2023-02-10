#1 If you come from bash you might have to change your $PATH.
# 
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="Eastwood"

plugins=(
	git
	artisan
	laravel5
	zsh-autosuggestions
	zsh-vim-mode
	z
)

source $ZSH/oh-my-zsh.sh

# Helper functions
# make and change to dir
mkcd() {
  mkdir "$1" && cd "$1"
}

# Link a composer package for local development
composer-link() {
    composer config repositories.local '{"type": "path", "url": "'$1'"}' --file composer.json
}

# extract any type of compressed file
function extract {
    echo Extracting $1 ...
    if [ -f $1 ] ; then
        case $1 in
            *.tar.bz2)   tar xjf $1  ;;
            *.tar.gz)    tar xzf $1  ;;
            *.bz2)       bunzip2 $1  ;;
            *.rar)       rar x $1    ;;
            *.gz)        gunzip $1   ;;
            *.tar)       tar xf $1   ;;
            *.tbz2)      tar xjf $1  ;;
            *.tgz)       tar xzf $1  ;;
            *.zip)       unzip $1   ;;
            *.Z)         uncompress $1  ;;
            *.7z)        7z x $1  ;;
            *)        echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}

# Readable output of man files, can be piped like mandump grep | subl
function mandump {
	man $1 | col -bx 
}

# Path modiifications
export PATH="$PATH:$HOME/.composer/vendor/bin"
export PATH="/usr/local/sbin:$PATH"
export NODE_PATH='/usr/local/lib/node_modules'
export SSH_AUTH_SOCK=~/Library/Group\ Containers/2BUA8C4S2C.com.1password/t/agent.sock

# Fix issue vi plugin overriding arrow up history
# start typing + [Up-Arrow] - fuzzy find history forward
if [[ "${terminfo[kcuu1]}" != "" ]]; then
  autoload -U up-line-or-beginning-search
  zle -N up-line-or-beginning-search
  bindkey "${terminfo[kcuu1]}" up-line-or-beginning-search
fi
# start typing + [Down-Arrow] - fuzzy find history backward
if [[ "${terminfo[kcud1]}" != "" ]]; then
  autoload -U down-line-or-beginning-search
  zle -N down-line-or-beginning-search
  bindkey "${terminfo[kcud1]}" down-line-or-beginning-search
fi

# Aliass
alias pa="php artisan"
alias c="clear"
alias gpsu="git push --set-upstream"
alias gaac="git add --all && git commit -m"
alias gcp="git cherry-pick"
alias gnah="git reset --hard; git clean -df;"
alias phpunit="php vendor/bin/phpunit"
alias pest="./vendor/bin/pest"
alias pu="phpunit"
alias nr="npm run"
alias puf="phpunit --filter"
alias pufs="phpunit --stop-on-failure --filter"
alias pus="phpunit --stop-on-failure"
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias gclean="git checkout . && git clean -df"
alias subl="/Applications/Sublime\ Text.app/Contents/SharedSupport/bin/subl"
alias storm="phpstorm"
alias finder="open"
alias composer="php /usr/local/bin/composer"
alias gffs="git flow feature start"
alias jsc="/System/Library/Frameworks/JavaScriptCore.framework/Versions/Current/Helpers/jsc"
alias a=artisan
alias vim=nvim

export NVM_DIR=~/.nvm
source $(brew --prefix nvm)/nvm.sh

source /Users/simonvomeyser/.docker/init-zsh.sh || true # Added by Docker Desktop
