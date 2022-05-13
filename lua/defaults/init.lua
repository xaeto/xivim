local ft_defaults = {
  textwidth = 120,
  shiftwidth = 2,
}

local load_colorscheme = function()
  vim.g.tokyonight_style = "night"
  vim.cmd [[
  colorscheme tokyonight
  ]]
  vim.cmd "set updatetime=50"
end

local setup_filetypes = function()
  local ft = require "filetype"
  ft.setup {
    enable = true,
    config = {
      lua = ft_defaults,
      c = {
        shiftwidth = 2,
        textwidth = 80,
      },
      json = {
        shiftwidth = 4,
        textwidth = 120,
      },
      go = {
        shiftwidth = 2,
        textwidth = 120,
      },
    },
  }
end

local set_defaults = function()
  vim.opt.relativenumber = true

  vim.opt.number = true
  vim.opt.cmdheight = 2
  vim.g.dashboard_default_executive = "telescope"

  require("Comment").setup()
  require("nvim-autopairs").setup {}
end

local indent_line = function()
  vim.opt.list = true
  vim.opt.listchars:append "space:⋅"
  vim.opt.listchars:append "eol:↴"
  vim.g.indentLine_fileTypeExclude = { "dashboard", "startup" }

  require("indent_blankline").setup {
    show_current_context = true,
    show_current_context_start = true,
    show_end_of_line = true,
  }
  require("project-workflow").setup()
end

local spell_sitter = function()
  require("spellsitter").setup {
    enable = true,
  }
end

local init_self = function(opts)
  -- print('Initializing default')
  set_defaults()
  setup_filetypes()
  indent_line()
  load_colorscheme()
  spell_sitter()
  vim.diagnostic.config {
    virtual_text = false,
    virtual_lines = {
      prefix = "::",
    },
  }
  require "tidy"
  require("lsp_lines").register_lsp_virtual_lines()
  require("go").setup {
    -- notify: use nvim-notify
    notify = false,
    -- auto commands
    auto_format = true,
    auto_lint = true,
    -- linters: revive, errcheck, staticcheck, golangci-lint
    linter = "revive",
    -- linter_flags: e.g., {revive = {'-config', '/path/to/config.yml'}}
    linter_flags = {},
    -- lint_prompt_style: qf (quickfix), vt (virtual text)
    lint_prompt_style = "qf",
    -- formatter: goimports, gofmt, gofumpt
    formatter = "goimports",
    -- test flags: -count=1 will disable cache
    test_flags = { "-v" },
    test_timeout = "30s",
    test_env = {},
    -- show test result with popup window
    test_popup = true,
    test_popup_auto_leave = false,
    test_popup_width = 80,
    test_popup_height = 10,
    -- test open
    test_open_cmd = "edit",
    -- struct tags
    tags_name = "json",
    tags_options = { "json=omitempty" },
    tags_transform = "snakecase",
    tags_flags = { "-skip-unexported" },
    -- quick type
    quick_type_flags = { "--just-types" },
  }
end

return {
  init = init_self,
}
