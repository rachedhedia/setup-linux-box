-- Ensure lazy.nvim is installed and loaded
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable",
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
  { "bluz71/vim-moonfly-colors", name = "moonfly", lazy = false, priority = 1000}
})

-- Set the color scheme
vim.cmd.colorscheme "moonfly"

