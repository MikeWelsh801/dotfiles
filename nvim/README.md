# My NeoVim Config
My config files for neovim. I started with the primeagen's config and slowly added
key-maps/plugins. They're pretty messy, and I still have some redundant files from 
when I switched to lazy.nvim from packer.

Feel free to clone or copy whatever you like.

![Alt text](/screenshots/main_view.png?raw=true "Main Editor View")

# Getting the config
You need [NeoVim](https://github.com/neovim/neovim) 0.9.1 or later installed for 
all of the plugins to work properly. I've run it on older versions than that, but
you might see a few errors especially with Treesitter.

Make sure you don't already have an nvim config folder. If you do, copy your existing one
somewhere else.

Also, this config has web dev icons, so you'll need a patched font for icons to 
display properly. You can use nerd fonts here: [Nerd Fonts](https://www.nerdfonts.com/)

# Download instructions

## Mac/Linux

    git clone https://github.com/MikeWelsh801/nvim.git ~/.config/nvim && nvim

## Windows

    git clone https://github.com/MikeWelsh801/nvim.git $env:USERPROFILE\AppData\Local\nvim;  nvim

## Windows (Msys2 or Git Bash)

    git clone https://github.com/MikeWelsh801/nvim.git ~/AppData/Local/nvim && nvim

The next time you open nvim, lazy should install all the plugins for you.

# Common Commands I Use

Below are some of the commands I use frequently. There are obviously also all of
the standard vim commands (e.g. yap), and also there are some plugin specific commands
that I haven't listed. You can read the docs for those in the plugin links below.

To search through commands with telescope type:
```
:Telescope commands
```
## Searching Files
| command | action |
|---------|--------|
| Space-pv | open netrw file explorer |
| Space-pf | search for file |
| C-p | search for git files |
| Space-fg | grep for word or phrase in project files |
| tt | open Neotree |

## Window Management
| command | action |
|---------|--------|
| Space-ws | open horizantal split |
| Space-wv | open vertical split |
| Space-wo | close all other windows |
| Space-wc | close all this windows |
| Space-ww | switch to next window |
| Space-wh/j/k/l | use space-w then h/j/k/l to move around windows |
| Space-wH/J/K/L | use space-w then H/J/K/L to change window positions |
| Space-Space-w | Toggle window mode (when in window mode the arrow keys will change the size of windows) |

## Editing Commands
| command | action |
|---------|--------|
| gd | Go to definition (while in normal mode) |
| Shift-k | pull up entry for function or object in floating window |
| C-h | (in insert mode) while typing in paramaters to a function, this will pull up the definition for the function with paramaters |
| Space-s | Edit every instance of current word in the document |
| Space-vrn | rename variable |
| Space-vca | list code actions |
| Space-vrr | list all variable references |
| Space-f | auto format buffer |
| Space-y/d/Y/d | yank or delete to clipboard (yanked items can be pasted with C-v even outside nvim) |
| gcc | comment out current line |
| gbc | insert block comment |
| gc | (in visual mode) comment out selected lines |
| gb | (in visual mode) place block comment around selected lines |

## Git
All of these commands are using fugitive to do something (i.e. I just remapped some
fugitive commands). There are a lot more fugitive commands for committing, staging,
pulling up diffs, staging/splitting hunks. You can look those up in the fugitive link
in the plugin section below. Or once you are in the git status split (Space-gs), you
can type 'g?' to see a help menu with a bunch of commands.

![Alt text](/screenshots/merging.png?raw=true "Main Editor View")

| command | action |
|---------|--------|
| Space-gs | open git status with fugitive |
| Space-gds | open diff split (useful when resolving a merge conflict) |
| Space-g | when a merge diff is open, pull the left side buffer into the merge conflict buffer (center buffer) |
| Space-h | when a merge diff is open, pull the right side buffer into the merge conflict buffer (center buffer) |
| [c | previous merge conflict |
| ]c | next merge conflict |

## Misc Commands
| command | action |
|---------|--------|
| jk | (in insert mode) return to normal mode |
| Space-w | quicker save (e.g. you can type Space-w-q-Enter to save and quit)
| Space-sp | turn on spell check |
| [d | previous diagnostic |
| ]d | next diagnostic |
| Space-u | open undotree |
| C-z | Open a terminal. I have this configured to open fish (you must have fish installed for this to work). If you want to change the terminal, you can update vim.opt.shell at the bottom of the set.lua file in this config. If you're already in the terminal, C-z closes it. |
| Space-md | Open a live markdown preview in your browser. I'm not sure if there is setup required to make this work for different OS's/browsers etc. |
| Space-lm | Switch to light mode. Currently an everforest theme, but you can change this.
| Space-dm | Switch to dark mode. Transparent kanagawa-dragon theme. |

# LSP Setup

I set this up so it doesn't suggest lsp's for new language buffers. I didn't want
it bugging me if I enter a file type I don't want to edit ever again. If you want
to install a new server type:
```
:LspInstall
```
It will pull up a list of lsp's available for that language, and you can type the number
for the one you want to install.

To check if an lsp is running in your current buffer type:
```
:LspInfo
```
Alternately you can type:
```
:Mason
```
This will pull up a pop up window that shows all available and installed lsp's,
as well as linters, formatters, and dap's.

If you're having problems with an lsp. You can run:
```
:LspLog
```
This will give you a list of lsp errors with date and time stamps. 

You can also run:
```
:checkhealth
```
This will show the health status of all installed plugins that have diagnostic
information.

# Main Plugins I Use

Here are the links to the main plugins for docs/usage. Some have dependencies,
so there are more than this, but this should get you started.

* Splash Screen - https://github.com/goolord/alpha-nvim
* Comments - https://github.com/numToStr/Comment.nvim
* Telescope - https://github.com/nvim-telescope/telescope.nvim
* Treesitter - https://github.com/nvim-treesitter/nvim-treesitter
* Treesitter Playground - https://github.com/nvim-treesitter/playground
* Harpoon - https://github.com/ThePrimeagen/harpoon
* Undotree - https://github.com/mbbill/undotree
* Fugative - https://github.com/tpope/vim-fugitive
* Lsp-Zero - https://github.com/VonHeikemen/lsp-zero.nvim
* Git Signs - https://github.com/lewis6991/gitsigns.nvim
* ~~Feline - https://github.com/Famiu/feline.nvim~~ Express Line - https://github.com/tjdevries/express_line.nvim
