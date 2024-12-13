return {
  {
    "ThePrimeagen/harpoon",
    branch = "harpoon2",
    config = function()
      require("harpoon").setup()
    end,
    dependencies = { 'nvim-lua/plenary.nvim' }
  },
}
