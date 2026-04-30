[[ $- != *i* ]] && return

parse_git_branch() {
	local branch=$(git branch --show-current 2> /dev/null)
	[[ ! -z $branch ]] && echo " $branch"
}

export PS1="\w\[\033[0;32m\]\$(parse_git_branch)\[\033[0m\]\$ "

# MODELS_TEXT_SMALL:    google/gemini-3.1-flash-lite-preview    openai/gpt-5.4-nano     qwen/qwen3-coder
# MODELS_TEXT_MEDIUM:   google/gemini-3-flash-preview           openai/gpt-5.4-mini anthropic/claude-sonnet-4.6
# MODELS_TEXT_LARGE:    google/gemini-3.1-pro-preview           openai/gpt-5.4-pro  anthropic/claude-opus-4.6
MODEL_TEXT_SMALL="google/gemini-3.1-flash-lite-preview"
MODEL_TEXT_MEDIUM="google/gemini-3-flash-preview"
MODEL_TEXT_LARGE="anthropic/claude-opus-4.7"

# INFO: alias
alias d="go build -C ~/wte/dev && ~/wte/dev/dev"
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
alias ls="ls -lah"
alias lg="lazygit"
alias n="cd ~/wte/notes && nvim ~/wte/notes/todo.md"
alias nn="~/notes/scripts/newnote.sh"
alias q="ai text -m ${MODEL_TEXT_MEDIUM}"
alias qq="ai text -m ${MODEL_TEXT_LARGE}"
alias rss="node ~/wte/rss/main.ts"
alias tdel="tracker delete"
alias tinfo="tracker info"
alias tls="tracker list"
alias tracker="node ~/wte/tracker/main.ts"
alias tset="tracker set"
alias v="nvim"
alias vb="nvim ~/.bashrc"
alias ytls='fd --full-path ~/wte/youtube -E "*.txt" | tail -n 30'
alias ytr="retry yt-dlp"
alias ytsync='cat ~/wte/youtube/channels.txt | xargs yt-dlp \
	--restrict-filenames \
	--no-overwrites \
	--limit-rate 5M \
	--sleep-interval 2 \
	--max-sleep-interval 5 \
	--retries 10 \
	--socket-timeout 30 \
	--match-filter "duration > 180" \
	--playlist-end 10 \
	-o "/home/jon/wte/youtube/%(upload_date>%Y-%m-%d)s [%(uploader)s] %(title)s.%(ext)s"'
alias ytwatch='ytls | mpv --playlist=-'

# INFO: functions
retry() {
    while ! $($@); do
        echo "Command $@ failed, retrying in 60 seconds..."
        sleep 60
    done
}

# INFO: path
[ -d "$HOME/.nvm" ] && export NVM_DIR=$HOME/.nvm
export BUN_INSTALL="$HOME/.bun"
export DOTNET_CLI_TELEMETRY_OPTOUT='true'
export CHROME_BIN='/usr/bin/chromium'
export EDITOR=nvim
export HUSKY=0
export MANPAGER='nvim +Man!'
export NODE_OPTIONS="--experimental-strip-types"
export OLLAMA_TELEMETRY_DISABLED=1
export PATH="$BUN_INSTALL/bin:$PATH"
export PATH=$PATH:$HOME/wte/dotfiles/scripts
export PATH=$PATH:$HOME/.local/bin:$HOME/go/bin
export RIPGREP_CONFIG_PATH=$HOME/.ripgreprc

# INFO: source
[ -s "$HOME/.secrets" ] && source $HOME/.secrets

