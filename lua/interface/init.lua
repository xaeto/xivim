local ts = require "telescope"

telescope = function()
  ts.setup {
    extensions = {
      fzy_native = {
        override_generic_sorter = false,
        override_file_sorter = true,
      },
    },
  }

  ts.load_extension "ui-select"
  ts.load_extension "fzy_native"
  ts.load_extension "dap"
  ts.load_extension "workflow"
end

startup = function()
  require("startup").setup()
end

nvim_tree = function()
  require("nvim-tree").setup {}
end

status_bar = function()
  require("lualine").setup {
    options = {
      icons_enabled = true,
      theme = "tokyonight",
      component_separators = { left = "", right = "" },
      section_separators = { left = "", right = "" },
      disabled_filetypes = {},
      always_divide_middle = true,
    },
    sections = {
      lualine_a = { "mode" },
      lualine_b = { "branch", "diff", "diagnostics" },
      lualine_c = { "filename" },
      lualine_x = { "encoding", "fileformat", "filetype" },
      lualine_y = { "progress" },
      lualine_z = { "location" },
    },
    inactive_sections = {
      lualine_a = {},
      lualine_b = {},
      lualine_c = { "filename" },
      lualine_x = { "location" },
      lualine_y = {},
      lualine_z = {},
    },
    tabline = {},
    extensions = {},
  }
end

local init_self = function(opts)
  -- print('Initializing interface')
  nvim_tree()
  telescope()
  status_bar()
end

return {
  init = init_self,
}
