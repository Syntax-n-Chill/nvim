# Neovim Config

This is a breakdown of the Neovim configuration, including all plugins,
their features, and any associated keybindings. The setup uses
Lazy.nvim for plugin management.

# Plugins

## Theme

Plugin: [catppuccin/nvim](https://github.com/catppuccin/nvim)

Description: Provides a beautiful and customizable Neovim theme.

## Code Comments

### Comment.nvim

Plugin: [numToStr/Comment.nvim](https://github.com/numToStr/Comment.nvim)

Purpose: Easily comment and uncomment lines or blocks of code.

Keybindings: None explicitly configured.

### Comment-Box

Plugin: [LudoPinelli/comment-box.nvim](https://github.com/LudoPinelli/comment-box.nvim)

Purpose: Create stylish comment boxes and lines.

Keybindings:

- <leader>cb: Create a left-aligned box.
- <leader>cc: Create a centered box.
- <leader>ct: Create a left-aligned titled line.
- <leader>cl: Create a centered line.
- <leader>cd: Remove a box or line.

# TODO

- [x] Ability to manage split panes, sizes, widths, direction, layout
- [x] Add [`helpview.nvim`](https://github.com/OXY2DEV/helpview.nvim) for viewing :h [name] files
- [x] Add [`bufferline.nvim`](https://github.com/akinsho/bufferline.nvim) to show file names and ability to use mouse
- [x] Setup linting/prettier file in lua
- [x] Fix error with removing focus from Lazy window when installing
- [x] Harpoon has an error when opening menu in Neotree
- [x] Use Vim motions with NeoTree (open/collapse directories/files)
- [x] Avante
- [x] Git blame off by default, add a toggle
- [x] After push/commit, clear NeoTree Git status indicators
- [x] Show hidden files
- [x] Setup [`conform.nvim`](https://github.com/stevearc/conform.nvim) to auto format on save
- [x] Clean which-keys (create a directory with files for specific key bindings)
- [x] Setup an "Extras" directory, where we can put things like Avante (for if we open source this)
- [x] File tabs and keymap to quickly jump back and forth between buffers
- [x] Auto restoring nvim sessions
- [x] Setup flash.nvim for quickly navigating code

- [] nvim-surround
- [ ] Structure and setup default vim-options
- [ ] Function lsp signatures
- [ ] Multi-cursor support (vim-visual-multi)
- [ ] Setup leap.nvim for quickly navigating code
- [ ] Need to setup individual lsp config files
  - [ ] typescript-tools (styled-components)
  - [ ] css
  - [ ] html
  - [ ] golang
  - [ ] json
  - [ ] yaml
  - [ ] vue
  - [x] lua
- [ ] Linters and formatters

  - [ ] eslint
  - [ ] prettier
  - [x] stylua

- [ ] Look through Christian's Lunar Vim setup for ideas
- [ ] Configure `noice`
- [ ] Auto reload config when saving

`:checkhealth which-key`
