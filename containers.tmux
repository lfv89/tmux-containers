#!/usr/bin/env bash

CURRENT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

default_containers_format="#($CURRENT_DIR/scripts/containers.sh)"
containers_format_option="@containers_format"

get_tmux_option() {
  local option="$1"
  local default_value="$2"
  local option_value="$(tmux show-option -gqv "$option")"
  if [ -z "$option_value" ]; then
    echo "$default_value"
  else
    echo "$option_value"
  fi
}

replace_containers_placeholder() {
  local status_line="$1"
  local containers_format="$(get_tmux_option "$containers_format_option" "$default_containers_format")"
  echo "${status_line//#\{containers\}/$containers_format}"
}

main() {
  # Get current status-right
  local status_right="$(tmux show-option -gqv "status-right")"
  
  # Replace placeholder if it exists
  if [[ "$status_right" == *"#{containers}"* ]]; then
    local new_status_right="$(replace_containers_placeholder "$status_right")"
    tmux set-option -gq status-right "$new_status_right"
  fi
}

main
