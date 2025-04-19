set -o vi

export FZF_DEFAULT_OPTS="--style full \
    --border --padding 1,2 \
    --border-label ' Demo ' --input-label ' Input ' --header-label ' File Type ' \
    --preview 'fzf-preview.sh {}' \
    --bind 'result:transform-list-label:
        if [[ -z $FZF_QUERY ]]; then
          echo \" $FZF_MATCH_COUNT items \"
        else
          echo \" $FZF_MATCH_COUNT matches for [$FZF_QUERY] \"
        fi
        ' \
    --bind 'focus:transform-preview-label:[[ -n {} ]] && printf \" Previewing [%s] \" {}' \
    --bind 'focus:+transform-header:file --brief {} || echo \"No file selected\"' \
    --bind 'ctrl-r:change-list-label( Reloading the list )+reload(sleep 2; git ls-files)' \
    --color 'border:#aaaaaa,label:#cccccc' \
    --color 'preview-border:#9999cc,preview-label:#ccccff' \
    --color 'list-border:#669966,list-label:#99cc99' \
    --color 'input-border:#996666,input-label:#ffcccc' \
    --color 'header-border:#6699cc,header-label:#99ccff'"

export FZF_CTRL_R_OPTS=" # add option to add command from history to pet via alt + s
  --reverse
  --cycle
  --info=right
  --color header:italic
  --header 'alt+s (pet new)'
  --preview 'echo {}' --preview-window down:3:hidden:wrap
  --bind '?:toggle-preview'
  --bind 'alt-s:execute(pet new --tag {2..})+abort'"

eval "$(zoxide init bash)"

alias l="ls -lrt"
alias gl="ls -lrt | grep"
alias t="tmux"
alias ta="tmux a"
alias tk="tmux kill-session"
alias cl="clear"
alias l="eza --color=always --long --git --no-filesize --icons=always --no-user"
alias gl="eza --color=always --long --git --no-filesize --icons=always --no-user | grep"

bind -x '"\C-@": pet-select' # add ctrl + spacebar to trigger pet
