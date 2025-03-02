-- This file simply bootstraps the installation of Lazy.nvim and then calls other files for execution
-- This file doesn't necessarily need to be touched, BE CAUTIOUS editing this file and proceed at your own risk.
local lazypath = vim.env.LAZY or vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not (vim.env.LAZY or (vim.uv or vim.loop).fs_stat(lazypath)) then
  -- stylua: ignore
  vim.fn.system({ "git", "clone", "--filter=blob:none", "https://github.com/folke/lazy.nvim.git", "--branch=stable", lazypath })
end
vim.opt.rtp:prepend(lazypath)

-- validate that lazy is available
if not pcall(require, "lazy") then
  -- stylua: ignore
  vim.api.nvim_echo({ { ("Unable to load lazy from: %s\n"):format(lazypath), "ErrorMsg" }, { "Press any key to exit...", "MoreMsg" } }, true, {})
  vim.fn.getchar()
  vim.cmd.quit()
end

require "lazy_setup"
require "polish"

vim.keymap.set({ "n", "o", "v" }, "m", "$", { noremap = true, silent = true })
vim.keymap.set({ "n", "o", "v" }, "q", "_", { noremap = true, silent = true })
vim.keymap.set("n", "<C-j>", "<C-d>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<C-k>", "<C-u>zz", { noremap = true, silent = true })
vim.keymap.set("n", "<tab>", "<C-^>", { noremap = true, silent = true })
vim.keymap.set("n", "<C-a>", "ggVG", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "*", ":term python3 %<CR>", { noremap = true, silent = true })
vim.api.nvim_set_keymap("n", "-", ":bd <CR>", { noremap = true, silent = true })

vim.keymap.set("i", "<C-l>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})

vim.g.copilot_no_tab_map = true
vim.opt.scrolloff = 10
