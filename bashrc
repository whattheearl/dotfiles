[[ $- != *i* ]] && return

# MODELS_TEXT_SMALL:    google/gemini-3.1-flash-lite-preview    openai/gpt-5.4-nano     qwen/qwen3-coder
# MODELS_TEXT_MEDIUM:   google/gemini-3-flash-preview           openai/gpt-5.4-mini anthropic/claude-sonnet-4.6
# MODELS_TEXT_LARGE:    google/gemini-3.1-pro-preview           openai/gpt-5.4-pro  anthropic/claude-opus-4.6
MODEL_TEXT_LARGE="anthropic/claude-opus-4.7"
MODEL_TEXT_MEDIUM="google/gemini-3-flash-preview"
MODEL_TEXT_SMALL="google/gemini-3.1-flash-lite-preview"

# prompt
HISTCONTROL=ignoredups
HISTFILESIZE=20000
HISTSIZE=10000
PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
shopt -s histappend

# alias
#--- quick list
alias r="cd ~/wte/dev && go run ."
alias create='bun run ~/wte/dev/index.ts create'
alias fd="fd --color=never"
alias vd='cd ~/wte/dev && nvim +22 ~/wte/dev/cmd/create.ts'
alias vw='cd ~/wte/web-template && nvim .'
#----
alias commit="ai commit -m ${MODEL_TEXT_MEDIUM}"
alias ga="git add"
alias gb="git branch"
alias gba="git branch -a"
alias gc="git commit"
alias gca!="git add -A && git commit -m $(date -Iseconds) && git push"
alias gca="git commit --amend --verbose"
alias gco="git checkout"
alias gcom="git checkout master"
alias gl="git pull"
alias glo="git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%ar) %C(bold blue)<%an>%Creset' --abbrev-commit --date=relative"
alias gp="git push"
alias gr="git reset"
alias gs="git status"
alias gsw="git switch"
alias gswd="git switch dev"
alias gswm="git switch master"
alias gwip="git commit -am 'WIP'; git push;"
alias l="ls -F"
alias lg="lazygit"
alias nn="~/notes/scripts/newnote.sh"
alias q="ai text -m ${MODEL_TEXT_MEDIUM} --status"
alias qq="ai text -m ${MODEL_TEXT_LARGE}"
alias rss="node ~/wte/rss/main.ts"
alias sb="source ~/.bashrc"
alias skb="setxkbmap -option caps:escape && setxkbmap -option altwin:swap_alt_win"
alias v="nvim"
alias vb="nvim +19 ~/.bashrc"
alias vn="nvim ~/.config/nvim/init.lua"
alias vt="nvim ~/wte/notes/todo.md"
alias vv="nvim -c \"normal '0'\""

# functions
parse_git_branch() {
    local branch=$(git branch --show-current 2> /dev/null)
    # some color escape issue when parsed by echo i think saw a solution with ysap but too lazy to check
    [[ ! -z $branch ]] && echo " $branch"
}

# envvars
export BUN_INSTALL="$HOME/.bun"
export CHROME_BIN='/usr/bin/chromium'
export EDITOR=nvim
export HUSKY=0
export MANPAGER='nvim +Man!';
export OLLAMA_TELEMETRY_DISABLED=1
export PATH="$PATH:$BUN_INSTALL/bin:$HOME/wte/dotfiles/scripts:$HOME/.local/bin:$HOME/go/bin"
export PROMPT_COMMAND="history -a; history -c; history -r; $PROMPT_COMMAND"
export PS1="\w\[\033[0;32m\]\$(parse_git_branch)\[\033[0m\]\$ "
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc
[ -s "$HOME/.secrets" ] && source $HOME/.secrets

