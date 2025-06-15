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

# Enable truecolor support in your terminal
export TERM="xterm-256color"
export COLORTERM=truecolor

# Use 24-bit RGB colors for highlighting
typeset -A ZSH_HIGHLIGHT_STYLES

# Match Catppuccin Mocha palette
ZSH_HIGHLIGHT_STYLES[suffix-alias]='fg=rgb:180/190/254,underline'   # Lavender
ZSH_HIGHLIGHT_STYLES[precommand]='fg=rgb:250/179/135,underline'     # Peach
ZSH_HIGHLIGHT_STYLES[arg0]='fg=rgb:rgb:116/199/236'                      # Green

# Prompt
setopt prompt_subst

# Define RGB escape helper
function rgb_fg() {
  printf '\e[38;2;%d;%d;%dm' $1 $2 $3
}
function reset_color() {
  printf '\e[0m'
}

NEWLINE=$'\n'

# Prompt using Catppuccin Mocha colors
PROMPT='%{$(rgb_fg 137 180 250)%}%~ '
PROMPT+='%{$(rgb_fg 245 224 220)%}${vcs_info_msg_0_}${NEWLINE}'
PROMPT+='%{$(rgb_fg 235 160 172)%} '
PROMPT+='%{$(reset_color)%}'

autoload -Uz vcs_info
precmd() { vcs_info }
zstyle ':vcs_info:git:*' formats 'on %b'

# Alias
alias ls="ls --color=auto"
alias youtube-dl-mp3="yt-dlp --extract-audio --audio-format mp3"

source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source ~/.zsh/zsh-history-substring-search/zsh-history-substring-search.zsh
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# Keybindings
bindkey "^[[1;5C" forward-word
bindkey "^[[1;5D" backward-word
# History substring keybindings 
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

export PATH=$PATH:/home/miha/.spicetify

export FLYCTL_INSTALL="/home/miha/.fly"
export PATH="$FLYCTL_INSTALL/bin:$PATH"

# fnm
FNM_PATH="/home/miha/.local/share/fnm"
if [ -d "$FNM_PATH" ]; then
  export PATH="/home/miha/.local/share/fnm:$PATH"
  eval "`fnm env`"
fi
