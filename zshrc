export ZSH=~/.oh-my-zsh

ZSH_THEME="gallois"
# other flags
#     CASE_SENSITIVE="true"
#     HYPHEN_INSENSITIVE="true"
#     DISABLE_AUTO_UPDATE="true"
#     export UPDATE_ZSH_DAYS=13
#     DISABLE_LS_COLORS="true"
#     DISABLE_AUTO_TITLE="true"
#     ENABLE_CORRECTION="true"
#     COMPLETION_WAITING_DOTS="true"
#     DISABLE_UNTRACKED_FILES_DIRTY="true"
#     HIST_STAMPS="mm/dd/yyyy"
#     ZSH_CUSTOM=/path/to/new-custom-folder

plugins=(git osx terminalapp)

source $ZSH/oh-my-zsh.sh

autoload -U compinit
compinit

export EDITOR=vi

# vim key bindings
bindkey -v

export PATH=/usr/bin:/bin:/usr/sbin:/sbin   # default configuration
export PATH=/usr/local/bin:$PATH            # higher precedence for brew-installed binaries

# java
export JAVA_HOME=$(/usr/libexec/java_home -v 1.8)
export PATH=$PATH:/usr/lib/jvm/java-8-oracle/bin
export PATH=$PATH:/usr/lib/jvm/java-8-oracle/db/bin
export PATH=$PATH:/usr/lib/jvm/java-8-oracle/jre/bin

# python
export PYTHONPATH=$HOME/code/pinboard

# golang
export GOROOT=/usr/local/go
export MAGNUS=$HOME/code/magnus
export GOPATH=$MAGNUS
export PATH=$GOROOT/bin:$PATH
export PATH=$MAGNUS/bin:$PATH
export PATH=$MAGNUS/scripts/bin:$PATH

# base aliases
alias l='ls -l'
alias ll='ls -alF'
alias rm='rm -i'
alias sz='source ~/.zshrc'

# grep aliases
alias rgrep='grep -RI'
alias gogrep='rgrep --include \*.go'
alias jgrep='rgrep --include \*.java'
alias sgrep='rgrep --include \*.scala'
alias pygrep='rgrep --include \*.py'

# override builtin command with r interpreter
disable r

# virtual environment aliases
alias mvenv='python3 -m venv ./.venv'
alias avenv='source ./.venv/bin/activate'

# other handy aliases
alias tag='ctags -R .'
alias c++='g++ -std=c++11 -stdlib=libc++'
alias valg='valgrind --leak-check=yes'
alias time='/usr/bin/time'
