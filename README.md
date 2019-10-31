# Brew bundle

Install the bundle:

```
$ brew bundle install
```

Update the `Brewfile`:

```
$ brew bundle dump --force
```

# Zsh symlinks

```
$ mv ~/.zshrc ~/.zshrc.bak
$ ln -s ~/Projects/Repos/dotfiles/zsh/zshrc ~/.zshrc

$ mv ~/.zsh_aliases ~/.zsh_aliases.bak
$ ln -s ~/Projects/Repos/dotfiles/zsh/zsh_aliases ~/.zsh_aliases
```
