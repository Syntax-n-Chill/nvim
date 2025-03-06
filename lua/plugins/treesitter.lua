return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  config = function()
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()

    -- Add Laravel Blade to parser config --
    parser_config.blade = {
      install_info = {
        url = 'https://github.com/EmranMR/tree-sitter-blade',
        files = { 'src/parser.c' },
        branch = 'main',
      },
      filetype = 'blade',
    }

    local config = require('nvim-treesitter.configs')
    config.setup({
      ensure_installed = {
        'json',
        'prisma',
        'lua',
        'javascript',
        'typescript',
        'html',
        'markdown',
        'markdown_inline',
        'python',
        'vim',
        'yaml',
        'css',
        'go',
        'php',
        'regex',
        'bash',
        'blade',
      },
      highlight = { enable = true },
      indent = { enable = true },
      fold = { enable = true },
    })

    -- Make Neovim recognize *.blade.php as blade filetype --
    vim.filetype.add({
      pattern = {
        ['.*%.blade%.php'] = 'blade',
      },
    })
  end,
}
