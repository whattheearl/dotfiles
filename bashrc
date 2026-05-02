[[ $- != *i* ]] && return

# MODELS_TEXT_SMALL:    google/gemini-3.1-flash-lite-preview    openai/gpt-5.4-nano     qwen/qwen3-coder
# MODELS_TEXT_MEDIUM:   google/gemini-3-flash-preview           openai/gpt-5.4-mini anthropic/claude-sonnet-4.6
# MODELS_TEXT_LARGE:    google/gemini-3.1-pro-preview           openai/gpt-5.4-pro  anthropic/claude-opus-4.6
MODEL_TEXT_SMALL="google/gemini-3.1-flash-lite-preview"
MODEL_TEXT_MEDIUM="google/gemini-3-flash-preview"
MODEL_TEXT_LARGE="anthropic/claude-opus-4.7"

# INFO: alias
##--- quick list
alias r="docker build ~/wte/home -t mynginx:latest && docker run -p 8080:8080 --name mynginx mynginx:latest"
alias create='bun run ~/wte/dev/index.ts create'
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
alias lg="lazygit"
alias l="ls -F"
alias nn="~/notes/scripts/newnote.sh"
alias q="ai text -m ${MODEL_TEXT_MEDIUM}"
alias qq="ai text -m ${MODEL_TEXT_LARGE}"
alias rss="node ~/wte/rss/main.ts"
alias sb="source ~/.bashrc"
alias v="nvim"
alias vb="nvim +12 ~/.bashrc"
alias vt="nvim ~/wte/notes/todo.md"
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

parse_git_branch() {
    local branch=$(git branch --show-current 2> /dev/null)
    # some color escape issue when parsed by echo i think saw a solution with ysap but too lazy to check
    [[ ! -z $branch ]] && echo " $branch"
}

# INFO: envvars
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

