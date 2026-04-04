_zsh_flex_history_line_init() {
  local cmd
  local zsh_flex_history_bin="${ZSH_FLEX_HISTORY_BIN:-${commands[zsh-flex-history]:-$(brew --prefix 2>/dev/null)/bin/zsh-flex-history}}"
  cmd="$("$zsh_flex_history_bin" --use-custom-history --print-only 2>/dev/null)" || return
  [[ -z "$cmd" ]] && return

  BUFFER="$cmd"
  CURSOR=${#BUFFER}
  zle redisplay
  zle -U $'\n'
}

autoload -Uz add-zle-hook-widget
add-zle-hook-widget line-init _zsh_flex_history_line_init
