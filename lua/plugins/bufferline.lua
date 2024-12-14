return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = function ()
    require("bufferline").setup({
      options = {
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
  end
}
