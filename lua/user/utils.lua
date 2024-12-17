local M = {}

M.load_lua_files = function(subdir)
  -- subdir should be a relative path under your lua/ directory, e.g. "override/theo"
  local config_dir = vim.fn.stdpath('config') .. '/lua/' .. subdir .. '/'
  local files = vim.fn.glob(config_dir .. '*.lua', false, true)

  for _, file in ipairs(files) do
    -- Convert full path to a Lua module name
    local module_name = file:match('lua/(.*)%.lua$')
    if module_name then
      require(module_name)
    end
  end
end

return M
