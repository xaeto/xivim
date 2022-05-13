local servers = require("nvim-lsp-installer").get_installed_servers()
local avail_servers = require("nvim-lsp-installer").get_available_servers()

local autocmd = function()
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "*",
    callback = function()
      vim.schedule(check_lsp, -1)
    end,
  })
end

check_lsp = function()
  local buf = vim.api.nvim_get_current_buf()
  local ft = vim.api.nvim_buf_get_option(buf, "filetype")

  local lsp = require "nvim-lsp-installer"
  local exists = false

  for _, value in pairs(avail_servers) do
    if value == ft then
      exists = true
    end
  end

  if exists then
    local installed = false
    for _, value in pairs(servers) do
      local languages = value["languages"]
      for _, v in pairs(languages) do
        if v == ft then
          installed = true
          break
        end
      end
    end
    if installed == false then
      print "Server not installed."
      lsp.install_by_filetype(ft)
    else
      print "exists"
    end
  end
end

local init_self = function(opts)
  autocmd()

  local lsp_installer = require "nvim-lsp-installer"
  lsp_installer.settings {
    ui = {
      icons = {
        server_installed = "✓",
        server_pending = "➜",
        server_uninstalled = "✗",
      },
    },
  }

  opts = opts or {}
  lsp_installer.on_server_ready(function(server)
    server:setup(opts)
  end)

  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require("cmp_nvim_lsp").update_capabilities(capabilities)

  for _, value in pairs(servers) do
    if value.name then
      require("lspconfig")[value.name].setup {
        capabilities = capabilities,
        debounce_text_changes = 150,
      }
    end
  end
end

return {
  init = init_self,
}
