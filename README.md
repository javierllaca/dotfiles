# Dotfiles

My environment setup files

## Setup

Clone repository into your home directory:

    git clone https://github.com/javierllaca/dotfiles.git ~/.dotfiles

Run the configure script:

    cd ~/.dotfiles && scripts/configure

## Scripts

`scripts` contains some handy utility scripts. Feel free to add them to a
location pointed to by your `$PATH` variable.

## Notes

### Other packages

Setup for the following packages is not automated:

- java
- golang

### tmux over ssh

To enable copy/paste from a remote tmux session over ssh to your local
clipboard, refer to https://gist.github.com/burke/5960455
