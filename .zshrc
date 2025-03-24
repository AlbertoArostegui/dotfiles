# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:$HOME/.local/bin:/usr/local/bin:$PATH

# Path to your Oh My Zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time Oh My Zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
ZSH_THEME="gozilla"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment one of the following lines to change the auto-update behavior
# zstyle ':omz:update' mode disabled  # disable automatic updates
# zstyle ':omz:update' mode auto      # update automatically without asking
# zstyle ':omz:update' mode reminder  # just remind me to update when it's time

# Uncomment the following line to change how often to auto-update (in days).
# zstyle ':omz:update' frequency 13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# You can also set it to another string to have that shown instead of the default red dots.
# e.g. COMPLETION_WAITING_DOTS="%F{yellow}waiting...%f"
# Caution: this setting can cause issues with multiline prompts in zsh < 5.7.1 (see #5765)
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git)

source $ZSH/oh-my-zsh.sh
alias vim=nvim
alias ll='lsd -l'
alias la='lsd -la'

export SVUT=$HOME/.svut
export PATH=$SVUT:$PATH
export PATH=$PATH:/Applications/CPLEX_Studio2211/opl/bin/arm64_osx/

alias get_idf='. $HOME/esp/esp-idf/export.sh'

#bison
export CFLAGS="-I/opt/bison/bison-3.7.91/share/include ${CFLAGS}"
export CXXFLAGS="-I/opt/bison/bison-3.7.91/share/include ${CXXFLAGS}"
export LDFLAGS="-L/opt/bison/bison-3.7.91/lib ${LDFLAGS}"
export PATH="/opt/bison/bison-3.7.91/bin:${PATH}"

#flex
export CFLAGS="-I/opt/flex/flex-2.6.4/include ${CFLAGS}"
export CXXFLAGS="-I/opt/flex/flex-2.6.4/include ${CXXFLAGS}"
export LDFLAGS="-L/opt/flex/flex-2.6.4/lib ${LDFLAGS}"
export PATH="/opt/flex/flex-2.6.4/bin:${PATH}"

#SystemC
export SYSTEMC_HOME="/Users/alberto/systemc"

#Verilator
export VERILATOR_ROOT="/Users/alberto/verilator"

export PATH="$VERILATOR_ROOT/bin:$PATH"
export VERILATOR_INC_DIR="$VERILATOR_ROOT/include"

#Other
export PATH="$PATH:/Users/alberto/executables"

#Neovim binds
cat neovim_binds.txt
