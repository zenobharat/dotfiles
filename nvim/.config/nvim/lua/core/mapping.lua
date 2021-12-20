local bind = require('keymap.bind')
local map_cr = bind.map_cr
local map_cu = bind.map_cu
local map_cmd = bind.map_cmd
local map_args = bind.map_args
local map_wait = bind.map_wait
local map_lua = bind.map_lua

vim.g["@z"] = "f cl<CR><ESC>l"

local def_map = {
  -- normal mode
  ["n|<Leader>d-"]           = map_cr("bd"):with_noremap():with_nowait(),
  ["n|<Leader>d_"]           = map_cr("bd!"):with_noremap():with_nowait(),
  ["n|<M-h>"]                = map_cr("b#"):with_noremap():with_nowait(),
  ["n|<M-l>"]                = map_cr("nohl"):with_noremap():with_silent():with_nowait(),
  ["n|<Leader>d#"]           = map_cmd(":let @/='\\<'.expand('<cword>').'\\>'<CR>cgN"):with_noremap():with_silent(),
  ["n|<Leader>d*"]           = map_cmd(":let @/='\\<'.expand('<cword>').'\\>'<CR>cgn"):with_noremap():with_silent(),
  ["n|<M-Space>"]            = map_args("ls<CR>:b"):with_noremap():with_nowait(),
  ["n|<Leader>dn"]           = map_lua("require('utils').toggleNumbers()"):with_noremap():with_nowait(),
  ["n|<M-+>"]                = map_cr(":vertical resize +5"):with_noremap():with_silent(),
  ["n|<M-=>"]                = map_cr(":vertical resize -5"):with_noremap():with_silent(),
  ["n|<M-->"]                = map_cr(":resize -5"):with_noremap():with_silent(),
  ["n|<M-_>"]                = map_cr(":resize +5"):with_noremap():with_silent(),
  ["n|!"]                    = map_cmd(vim.g["@z"]):with_noremap():with_nowait(),
  ["n|<M-y>"]                = map_cr("wincmd w"):with_noremap():with_nowait(),
  ["n|<M-b>"]                = map_cr("wincmd ="):with_noremap():with_nowait(),
  ["n|<Leader>gt"]           = map_lua("require('utils').openTerm('tig status')"):with_noremap():with_nowait(),
  ["n|<Leader>gf"]           = map_lua("require('utils').openTerm('tig ' .. vim.fn.expand('%'))"):with_noremap():with_nowait(),
  ["n|<Leader>gl"]           = map_lua("require('utils').openTerm('tig')"):with_noremap():with_nowait(),
  ["n|<Leader>ds"]           = map_args("SS"):with_noremap(),
  ["n|<Leader>dr"]           = map_wait("SR " .. require('utils').getSessionFilePath()):with_noremap(),
  ["n|<Leader>dd"]           = map_wait("SD " .. require('utils').getSessionFilePath()):with_noremap(),

  ["n|Y"]                    = map_cmd("y$"):with_noremap():with_nowait(),
  ["n|<C-k>"]                = map_cmd(":m .-2<CR>=="):with_noremap():with_nowait(),
  ["n|<C-j>"]                = map_cmd(":m .+1<CR>=="):with_noremap():with_nowait(),

  -- visual mode
  ["v|<C-j>"]                = map_cmd(":m '>+1<CR>gv=gv"):with_noremap():with_nowait(),
  ["v|<C-k>"]                = map_cmd(":m '<-2<CR>gv=gv"):with_noremap():with_nowait(),
  ["v|<Leader>d#"]           = map_cmd("\"sy:let @/=@s<CR>cgN"):with_noremap(),
  ["v|<Leader>d*"]           = map_cmd("\"sy:let @/=@s<CR>cgn"):with_noremap(),

  --- Copy/Paste
  -- paste from clipboard
  ["n|<Leader>ap"]           = map_cmd("\"+p"):with_noremap():with_nowait(),
  -- yank current file path to clipboard
  ["n|<Leader>af"]           = map_cr("let @+ = expand('%')"):with_noremap(),
  -- paste from m register
  ["n|<Leader>am"]           = map_cmd("\"mp"):with_noremap():with_nowait(),
  -- copy visual selection to clipboard
  ["v|<Leader>ay"]           = map_cmd("\"+y"):with_noremap():with_nowait(),
  -- paste over visual selection from clipboard
  ["v|<Leader>ap"]           = map_cmd("\"+p"):with_noremap():with_nowait(),
  -- copy visual selection to register m
  ["v|<Leader>ac"]           = map_cmd("\"my"):with_noremap():with_nowait(),
  -- paste over visual selection from register m
  ["v|<Leader>am"]           = map_cmd("\"mp"):with_noremap():with_nowait(),
}

bind.nvim_load_mapping(def_map)
