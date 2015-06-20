-antigen-bundle-record-moving() {
  if [[ -z "$_ANTIGEN_BUNDLE_RECORD" && -z "$ADOTDIR" ]]; then
    cat <<'EOT' 1>&2
$_ANTIGEN_BUNDLE_RECORD is not set, perhaps antigen is not applied.
EOT
  return 1
  fi

  if ! type peco &>/dev/null; then
    cat <<'EOT' 1>&2
peco does not found in your $PATH.
EOT
  return 1
  fi

  local line
  cd $(echo $_ANTIGEN_BUNDLE_RECORD \
    | sed -n '1!p' \
    | while read line; do
        if [[ "$line" =~ 'true$' ]]; then
          echo "$line" \
          | sed \
          -e 's@/@-SLASH-@g' \
          -e 's@:@-COLON-@g' \
          -e 's@|@-PIPE-@g'  \
          | xargs -I% echo "${ADOTDIR}/repos/%"
        else
          echo "$line"
        fi
      done \
    | awk '{print $1}' \
    | peco
  )
  zle accept-line
  zle -R -c
}

autoload -Uz -- -antigen-bundle-record-moving
zle -N -- -antigen-bundle-record-moving

# Local Variables:
# mode: Shell-Script
# sh-indentation: 2
# indent-tabs-mode: nil
# sh-basic-offset: 2
# End:
# vim: ft=zsh sw=2 ts=2 et
