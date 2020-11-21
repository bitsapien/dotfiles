# Personal Zsh configuration file. It is strongly recommended to keep all
# shell customization and configuration (including exported environment
# variables such as PATH) in this file or in files source by it.
#
# Documentation: https://github.com/romkatv/zsh4humans/blob/v4/README.md.

# Periodic auto-update on Zsh startup: 'ask' or 'no'.
zstyle ':z4h:'                auto-update      'ask'
# Ask whether to auto-update this often; has no effect if auto-update is 'no'.
zstyle ':z4h:'                auto-update-days '28'

# Keyboard type: 'mac' or 'pc'.
zstyle ':z4h:bindkey'         keyboard         'mac'
# When fzf menu opens on TAB, another TAB moves the cursor down ('tab:down')
# or accepts the selection and triggers another TAB-completion ('tab:repeat')?
zstyle ':z4h:fzf-complete'    fzf-bindings     'tab:down'
# When fzf menu opens on Shift+Down, TAB moves the cursor down ('tab:down')
# or accepts the selection and triggers another Shift+Down ('tab:repeat')?
zstyle ':z4h:cd-down'         fzf-bindings     'tab:down'
# Right-arrow key accepts one character ('partial-accept') from
# command autosuggestions or the whole thing ('accept')?
zstyle ':z4h:autosuggestions' forward-char     'accept'

# Send these files over to the remote host when connecting over ssh.
# Multiple files can be listed here.
zstyle ':z4h:ssh:*'           send-extra-files '~/.iterm2_shell_integration.zsh'
# Disable automatic teleportation of z4h over ssh when connecting to some-host.
# This makes `ssh some-host` equivalent to `command ssh some-host`.
zstyle ':z4h:ssh:some-host'   passthrough      'yes'

# Move the cursor to the end when Up/Down fetches a command from history?
zstyle ':zle:up-line-or-beginning-search'   leave-cursor 'yes'
zstyle ':zle:down-line-or-beginning-search' leave-cursor 'yes'

# Clone additional Git repositories from GitHub.
#
# This doesn't do anything apart from cloning the repository and keeping it
# up-to-date. Cloned files can be used after `z4h init`. This is just an
# example. If you don't plan to use Oh My Zsh, delete this line.
z4h install ohmyzsh/ohmyzsh || return

# Install or update core components (fzf, zsh-autosuggestions, etc.) and
# initialize Zsh. After this point console I/O is unavailable until Zsh
# is fully initialized. Everything that requires user interaction or can
# perform network I/O must be done above. Everything else is best done below.
z4h init || return

# Export environment variables.
export GPG_TTY=$TTY

# Extend PATH.
path=(~/bin $path)

# Use additional Git repositories pulled in with `z4h install`.
#
# This is just an example that you should delete. It does nothing useful.
z4h source $Z4H/ohmyzsh/ohmyzsh/lib/diagnostics.zsh
z4h source $Z4H/ohmyzsh/ohmyzsh/plugins/emoji-clock/emoji-clock.plugin.zsh
fpath+=($Z4H/ohmyzsh/ohmyzsh/plugins/supervisor)

# Source additional local files if they exist.
z4h source ~/.iterm2_shell_integration.zsh

# Define key bindings.
z4h bindkey undo Ctrl+/  # undo the last command line change
z4h bindkey redo Alt+/   # redo the last undone command line change

z4h bindkey z4h-cd-back    Shift+Left   # cd into the previous directory
z4h bindkey z4h-cd-forward Shift+Right  # cd into the next directory
z4h bindkey z4h-cd-up      Shift+Up     # cd into the parent directory
z4h bindkey z4h-cd-down    Shift+Down   # cd into a child directory

# Autoload functions.
autoload -Uz zmv

# Define functions and completions.
function md() { [[ $# == 1 ]] && mkdir -p -- "$1" && cd -- "$1" }
compdef _directories md

# Replace `ssh` with `z4h ssh` to automatically teleport z4h to remote hosts.
function ssh() { z4h ssh "$@" }

# Define named directories: ~w <=> Windows home directory on WSL.
[[ -n $z4h_win_home ]] && hash -d w=$z4h_win_home

# Define aliases.
alias tree='tree -a -I .git'

# Add flags to existing aliases.
alias ls="${aliases[ls]:-ls} -A"

# Set shell options: http://zsh.sourceforge.net/Doc/Release/Options.html.
setopt glob_dots     # no special treatment for file names with a leading dot
setopt no_auto_menu  # require an extra TAB press to open the completion menu


#############################################################################
#############################################################################
# CUSTOM CONFIGURATION
#############################################################################
#############################################################################


#############################################################################
# Backup ENVs
#############################################################################
env > ~/.env_backup

#############################################################################
# bitsapien's envs
#############################################################################
export CONFIG_HOME=$HOME/dotfiles
source $CONFIG_HOME/env

#############################################################################
# Load `goto` bash completion, TODO: Move it to relevant folder later
#############################################################################
source $GOTO_DATA_PATH/completion.bash

#############################################################################
# bitsapien's commands loader
#############################################################################
for file in $CONFIG_HOME/zsh/.*commands; do source $file; done
export PATH="$PATH:$CONFIG_HOME/bin"

#############################################################################
# Fast access blogging and note taking
#############################################################################
source $PROJECT_HOME/bitsapien-blog/scripts.sh

#############################################################################
# Company/Project I'm currently working with
#############################################################################
[ -f "$HOME/.zshrc_client" ] && source "$HOME/.zshrc_client"

#############################################################################
# Auto Jump
#############################################################################
[ -f /usr/local/etc/profile.d/autojump.sh ] && . /usr/local/etc/profile.d/autojump.sh

#############################################################################
# Language specific
#############################################################################
# Rust !
export PATH="$HOME/.cargo/bin:$PATH"
# GO !
export PATH="$PATH:$HOME/go/bin"
# Python !
export PATH="$PATH:$HOME/Library/Python/2.7/bin"
# Java !
export JAVA_HOME=$(/usr/libexec/java_home)
# Node12
alias node12='export PATH="/usr/local/opt/node@12/bin:$PATH"'
export NODE_ENV=development
export NODE_TLS_REJECT_UNAUTHORIZED=0
# Rust
source $HOME/.cargo/env

#############################################################################
# Vim : Bram is an asshole ! vim -> nvim
#############################################################################
alias vi=nvim
alias vim=nvim
# vim iced
export PATH=$PATH:$HOME/.vim/plugged/vim-iced/bin

#############################################################################
# Emacs
#############################################################################
export PATH="/usr/local/Cellar/emacs-plus/26.3/Emacs.app/Contents/MacOS/bin:$PATH"
# Doom Emacs !
export PATH="$HOME/.emacs.d/bin/:$PATH"

#############################################################################
# Helm
#############################################################################
export PATH="/usr/local/opt/helm@2/bin:$PATH"

#############################################################################
# iTerm2 Shell Integration
# ------------------------
# iTerm2 may be integrated with the unix shell so that it can keep track of
# your command history, current working directory, host name, and more—even
# over ssh
#############################################################################
test -e /Users/rahulc/.iterm2_shell_integration.zsh && \
  source /Users/rahulc/.iterm2_shell_integration.zsh || true

#############################################################################
# Prettier cat 😻
#############################################################################
alias cat="bat -p"

#############################################################################
# oh-my-zsh aliasing
#############################################################################
z4h source $Z4H/ohmyzsh/ohmyzsh/plugins/git/git.plugin.zsh
z4h source $Z4H/ohmyzsh/ohmyzsh/plugins/common-aliases/common-aliases.plugin.zsh

