-- Get the current user's username from the environment variables.
-- On Unix-like systems, this will usually be your login name.
local env = os.getenv('USER')

local utils = require('user.utils')

-- We want to load a set of Lua files based on the current user.
-- The files for each user are expected to be inside a directory named after the user.
-- For example, if the user is "theo", we expect files in `lua/override/theo/`.
local base_override_path = 'override/' .. env

-- `vim.fn.stdpath('config')` gives us the path to the user's Neovim configuration directory.
-- Typically, this is `~/.config/nvim` on Linux and macOS.
-- We then add `/lua/` and the `base_override_path` to point to our target directory.
local config_dir = vim.fn.stdpath('config') .. '/lua/' .. base_override_path

-- `vim.fn.isdirectory()` checks if a given path points to a directory.
if vim.fn.isdirectory(config_dir) == 1 then
  utils.load_lua_files(base_override_path)
else
  -- If the directory doesn't exist, you can decide what to do here.
  -- For example, you could load a default set of files:
  -- utils.load_lua_files('override/default')
  --
  -- Or you could simply not load anything if the directory doesn't exist.
end
