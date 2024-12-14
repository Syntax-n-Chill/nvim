local M = {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { 'nvim-lua/plenary.nvim' }
}

M.config = function ()
  local harpoon = require('harpoon')
  harpoon:setup({})

  -- basic telescope configuration
  local conf = require("telescope.config").values
  local function toggle_telescope(harpoon_files)
    local file_paths = {}
    for _, item in ipairs(harpoon_files.items) do
      table.insert(file_paths, item.value)
    end

    require("telescope.pickers").new({}, {
      prompt_title = "Harpoon",
      finder = require("telescope.finders").new_table({
        results = file_paths,
      }),
      previewer = conf.file_previewer({}),
      sorter = conf.generic_sorter({}),
    }):find()
  end

  vim.keymap.set("n", "<C-e>", function() toggle_telescope(harpoon:list()) end,
    { desc = "Open harpoon window" })

  local wk = require("which-key")
  wk.add({
    {
      "<leader>y",
      function()
        local file_name = vim.fn.expand('%:t')
        vim.notify("Added " .. file_name, "info", { timeout = 1500, title = "Harpoon'd yo ass" })
        harpoon:list():add()
      end,
      silent = true,
      desc = "Add Harpoon mark",
    },
    {
      "<C-e>",
      function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end,
      silent = true,
      desc = "Toggle Harpoon menu",
    },
    {
      "<leader>n",
      function()
        harpoon:list():clear()
      end,
      silent = true,
      desc = "Clear Harpoon list",
    },
    {
      "<leader>j",
      function()
        harpoon:list():next()
      end,
      silent = true,
      desc = "Cycle to next Harpoon",
    },
    {
      "<leader>k",
      function()
        harpoon:list():prev()
      end,
      silent = true,
      desc = "Cycle to prev Harpoon",
    },
  })
end

return M
