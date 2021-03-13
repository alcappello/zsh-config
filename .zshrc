# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Ansible managed
# zsh version: 5.8
# antigen version: 

export TERM="xterm-256color"
export EDITOR="vim"
export PATH="$PATH:$HOME/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin:/usr/games:/usr/local/games"


HIST_STAMPS="yyyy-mm-dd"
UPDATE_ZSH_DAYS="30"
COMPLETION_WAITING_DOTS="true"

# ADOTDIR="$HOME/.antigen"

ANTIGEN_BUNDLES="$HOME/.antigen/bundles"
ANTIGEN_PLUGIN_UPDATE_DAYS="30"
ANTIGEN_SYSTEM_UPDATE_DAYS="30"

source "/usr/local/share/antigen/antigen.zsh"

antigen use oh-my-zsh


antigen bundle brew
antigen bundle docker
antigen bundle docker-compose
antigen bundle fancy-ctrl-z
antigen bundle git-extras
antigen bundle gnu-utils
antigen bundle httpie
antigen bundle pip
antigen bundle rake
antigen bundle python
antigen bundle zsh_reload
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zsh-users/zsh-docker
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle unixorn/autoupdate-antigen.zshplugin

POWERLEVEL9K_INSTALLATION_PATH=$ANTIGEN_BUNDLES/bhilburn/powerlevel9k/powerlevel9k.zsh-theme

antigen theme romkatv/powerlevel10k

antigen apply

###

unsetopt share_history

autoload -Uz copy-earlier-word
zle -N copy-earlier-word

# hotkeys
bindkey '\e[1~' beginning-of-line
bindkey '\e[4~' end-of-line
bindkey '^U' autosuggest-accept

# aliases
alias 'ubuntu-release'="lsb_release -a"
alias 'ds'='docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.RunningFor}}"'
alias 'ls'='exa'
alias 'cat'='bat'
alias 't'='todo.sh'
alias 'dc'="docker-compose"
alias suser='su -'
alias 'gco'="git checkout"
alias 'gcom'="git checkout master"
alias 'commit'="git add . && git commit"


# zsh-autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=15
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=240" # gray highlight
ZSH_AUTOSUGGEST_STRATEGY=(history completion)

source /etc/profile
# user configs
[[ -r /etc/zsh/zshrc.local ]] && source /etc/zsh/zshrc.local
[[ -r "$HOME/.zshrc.local" ]] && source "$HOME/.zshrc.local"

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

zstyle ':completion:*:*:docker:*' option-stacking yes
zstyle ':completion:*:*:docker-*:*' option-stacking yes

autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /usr/local/bin/terraform terraform
