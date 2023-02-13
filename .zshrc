# Lines configured by zsh-newuser-install
HISTFILE=~/.histfile
HISTSIZE=1000
SAVEHIST=1000
bindkey -e
# End of lines configured by zsh-newuser-install
# The following lines were added by compinstall
zstyle :compinstall filename $HOME'/.zshrc'
zstyle ':completion:*' list-colors 'di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'  
#Auto/Tab complete
zstyle ':completion:*' menu select
#zmodload zsh/complist

autoload -Uz compinit
compinit

# Languages
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

# Path
export PATH="/home/$USER/.local/bin:$PATH"

# Keybindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# History substring keybindings 
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

# Zsh autocompletion
typeset -A ZSH_HIGHLIGHT_STYLES
ZSH_HIGHLIGHT_STYLES[suffix-alias]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[precommand]=fg=green,underline
ZSH_HIGHLIGHT_STYLES[arg0]=fg=green

# Prompt
# Load version control information
autoload -Uz vcs_info
precmd() { vcs_info }

# Format the vcs_info_msg_0_ variable
zstyle ':vcs_info:git:*' formats 'on %F{yellow}%b'

NEWLINE=$'\n'
setopt PROMPT_SUBST
export PROMPT='%F{blue}%~ %F{default}${vcs_info_msg_0_}${NEWLINE}%F{white}» '

# Alias
alias ls="ls --color=auto"
alias nano="nano -litzx"
alias youtube-dl-mp3="youtube-dl --extract-audio --audio-format mp3"

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
