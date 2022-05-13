local config_store = {}
local fn = vim.fn

local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
end

install = function(use, plugin)
  if type(plugin) == "table" then
    for idx, sub in pairs(plugin) do
      install(use, sub)
    end
  else
    use(plugin)
  end
end

local init_plugins = function(plugins)
  local packer = require "packer"
  plugins = plugins or {}

  packer.startup(function(use)
    install(use, plugins)
    if packer_bootstrap then
      require("packer").sync()
    end
  end)
end

local init_config = function(modules, opts)
  if not modules then
    error "No modules provided"
  end

  config_store.modules = modules
  -- print('Initializing configuration')
  for idx, mod in pairs(modules) do
    local ok, mod = pcall(require, mod)
    if not ok then
      error("Module " .. mod " hasn't been initialized")
    else
      mod.init(opts)
    end
  end
end

local reload_config = function()
  if not config_store.modules then
    error "Configuration hasn't been initialized yet"
    return
  end

  print "Reloading configuration"
  init_config(config_store.modules)
end

return {
  init = init_config,
  init_plugins = init_plugins,
  reload = reload_config,
}
