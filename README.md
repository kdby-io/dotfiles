# Dotfiles

Configuration files for my personal development environment setup

## Applications

- [Fish shell](https://https://fishshell.com/)
- [Tmux](https://tmux.github.io/)
- [Tmuxp](https://github.com/tony/tmuxp)
- vim

## Installation

**Warning:** If you already have your own configuration files for above applications, this shell script will overwrite them.

```sh
git clone https://github.com/pueue/dotfiles
cd dotfiles
chmod +x ./setup.sh
./setup.sh
```

## Symbolic link

Running `setup.sh` spreads dotfiles to your local machine using symbolic link. It makes keep tracking changes of these dotfiles by git. It also provides dependency for your development environment. If you remove this repository folder from your local machine after installation, you might see 'No file or directory' Error. This makes you assure keeping tracking dotfile changes.
