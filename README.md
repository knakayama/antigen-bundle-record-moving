antigen bundle record moving
============================

moving antigen bundle record(s)

# Description

Sometimes I want to tweak [antigen](https://github.com/zsh-users/antigen) bundles with [peco](https://github.com/peco/peco) style moving.

# Requirements

* [antigen](https://github.com/zsh-users/antigen)
* [peco](https://github.com/peco/peco)

# Install

Add the following line to your `~/.zshrc`:

```zsh
antigen bundle knakayama/antigen-bundle-record-moving
antigen apply

bindkey '^x^a' -antigen-bundle-record-moving # or your favorite key
```

# License

[MIT](https://github.com/knakayama/antigen-bundle-record-moving/blob/master/LICENSE)

# Author

[knakayama](https://github.com/knakayama)
