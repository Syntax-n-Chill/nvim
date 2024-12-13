local env = os.getenv("USER")

-- Load different code based on the environment variable's value
if env == "maskkiller" then
  require("override.maskkiller.theme")
elseif env == "lbattaglioli" then
  -- Load or execute production-specific code here
end
