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
export PATH=$PATH:$HOME/bin
export PATH=$PATH:$HOME/code/arcanist/bin

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

export S3_TEST="s3://pinterest-test/test/jojinaga"

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
alias ctag='ctags .'
alias c++='g++ -std=c++11 -stdlib=libc++'
alias valg='valgrind --leak-check=yes'
alias time='/usr/bin/time'

alias devads-tunnel='ssh -L 53901:localhost:53901 -L 53903:localhost:53903 -L 53909:localhost:53909 -L 53911:localhost:53911 devads'

alias hg='hologram use engineer'

alias optimus_commons='mvn install -pl commons -am -DskipTests'
alias optimus_checkstyle='mvn checkstyle:checkstyle -pl'

alias gironde-login='gironde login jojinaga'
alias gironde-eng='gironde sign -ca engineering --user jojinaga'
alias gironde-m10n='gironde sign -ca m10n --user jojinaga'
alias gironde-all='gironde-login && gironde-eng && gironde-m10n'

# s3
export AAEF='s3://pinterest-berlin/m10n_data/ad_all_event_flat/'
