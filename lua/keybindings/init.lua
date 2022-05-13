local init_self = function(opts)
  opts = opts or {}
  vim.cmd [[
  let mapleader = " "

  nnoremap Y yg$
  nnoremap n nzzzv
  nnoremap N Nzzzv
  nnoremap J mzJ`z

  xnoremap <leader>p "_dP

  nnoremap <leader>y "+y
  vnoremap <leader>y "+y
  nmap <leader>Y "+Y

  nnoremap <leader>d "_d
  vnoremap <leader>d "_d
  ]]
  local jmaps = require "jmaps"
  jmaps.setup "/home/jannik/.config/nvim/lua/keybindings/mappings.json"
end

return {
  init = init_self,
}
