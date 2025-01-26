export PATH=$PATH:$HOME/.config/homebrew/bin
export PATH=$PATH:/opt/homebrew/bin
export BUN_INSTALL=$HOME/.bun
export PATH=$BUN_INSTALL/bin:$PATH
export PATH=$HOME/tyl/dev-cli/bin:$PATH
export PATH=$PATH:/opt/nvim-linux64/bin
export PATH=$PATH:$HOME/.cargo/env
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$HOME/go/bin
export PATH=$PATH:$HOME/.deno/bin
export PATH=$PATH:$HOME/.dotnet/tools/kiota
export PATH=$PATH:/opt/nvim-linux64/bin
export PATH=$PATH:$HOME/wte/dotfiles/scripts
export EDITOR=nvim

export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh" # This loads nvm

# export NVM_DIR="$HOME/.nvm"
#   [ -s "/opt/homebrew/opt/nvm/nvm.sh" ] && \. "/opt/homebrew/opt/nvm/nvm.sh"  # This loads nvm
#   [ -s "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm" ] && \. "/opt/homebrew/opt/nvm/etc/bash_completion.d/nvm"  # This loads nvm bash_completion
