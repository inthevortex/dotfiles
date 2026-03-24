# =============================================================================
# Environment Variables & Paths
# =============================================================================

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export LANGUAGE=en_US:en

# Default Editors
export EDITOR="nvim"
export VISUAL="nvim"

# Paths
export ANDROID_HOME=/home/inthevortex/Android/Sdk/
export PATH="$PATH:$ANDROID_HOME/platform-tools:$ANDROID_HOME/tools"
export PATH="$PATH:/home/inthevortex/.dotnet/tools"
export PATH="/home/inthevortex/.bun/bin:$PATH"
export PATH="$HOME/.local/bin:$HOME/go/bin:/usr/local/bin:$PATH"

# =============================================================================
# FZF Configuration
# =============================================================================

export FZF_DEFAULT_OPTS=" \
--color=bg+:#363a4f,bg:#24273a,spinner:#f4dbd6,hl:#ed8796 \
--color=fg:#cad3f5,header:#ed8796,info:#c6a0f6,pointer:#f4dbd6 \
--color=marker:#f4dbd6,fg+:#cad3f5,prompt:#c6a0f6,hl+:#ed8796 \
--prompt='⚡ ' --pointer='▶' --marker='✓ '"

if command -v fd &> /dev/null; then
    export FZF_DEFAULT_COMMAND='fd --type f --hidden --exclude .git'
    export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
    export FZF_ALT_C_COMMAND='fd --type d --hidden --exclude .git'
fi
