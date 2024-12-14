return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    require("bufferline").setup({
      options = {
        close_command = require("bufdelete").bufdelete,
        offsets = {
          {
            filetype = "neo-tree",
            text = "File Explorer", -- Optional text to display
            text_align = "left",    -- Align the text (left, center, right)
            separator = true,       -- Add a separator between Neotree and bufferline
          },
        },
        -- Other bufferline options
        show_buffer_close_icons = true,
        show_close_icon = true,
        separator_style = "thin",
      },
    })

    local wk = require("which-key")
    wk.add(
      {
        {
          "<leader>bb",
          ":BufferLineCyclePrev<CR>",
          silent = true,
          desc = "Cycle to previous buffer",
        },
        {
          "<leader>bn",
          ":BufferLineCycleNext<CR>",
          silent = true,
          desc = "Cycle to next buffer",
        },
        {
          "<leader>bf",
          ":Telescope buffers previewer=true<CR>",
          silent = true,
          desc = "Find buffers with Telescope",
        },
        {
          "<leader>bj",
          ":BufferLinePick<CR>",
          silent = true,
          desc = "Pick a buffer to jump to",
        },
        {
          "<leader>bc",
          ":BufferLineCloseOthers<CR>",
          silent = true,
          desc = "Close all other buffers",
        },
        {
          "<leader>bh",
          ":BufferLineCloseLeft<CR>",
          silent = true,
          desc = "Close buffers to the left",
        },
        {
          "<leader>bl",
          ":BufferLineCloseRight<CR>",
          silent = true,
          desc = "Close buffers to the right",
        },
      }
    )
  end
}
