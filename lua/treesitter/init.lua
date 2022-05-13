local ts = require "nvim-treesitter.configs"

local init_self = function(opts)
  opts = opts or {}
  if not ts then
    error "treesitter is not installed yet."
    return
  end

  ts.setup {
    ensure_installed = "all",
    sync_install = false,
    indent = {
      enable = true,
    },
    highlight = {
      enable = true,
    },
    rainbow = {
      enable = true,
    },
    autotag = {
      enable = true,
    },
  }
end

return {
  init = init_self,
}
