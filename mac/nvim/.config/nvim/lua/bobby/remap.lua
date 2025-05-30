-- Helper functions
local function reload_config()
  -- Unload all bobby modules
  for name,_ in pairs(package.loaded) do
    if name:match("^bobby") then
      package.loaded[name] = nil
    end
  end

  -- Unload after/plugin modules if needed
  for name,_ in pairs(package.loaded) do
    if name:match("^after%.plugin") then
      package.loaded[name] = nil
    end
  end

  -- Reload main config
  dofile(vim.fn.stdpath("config") .. "/init.lua")
  print("Config reloaded!")
end

-- Mappings
--vim.keymap.set("n", "<leader>pv", vim.cmd.Ex) -- Project view
vim.keymap.set("n", "<leader>pv", ":NERDTreeToggle<CR>") -- Project view

vim.keymap.set("n", "<leader>w", vim.cmd.write)
vim.keymap.set("n", "<leader>q", vim.cmd.quit)

vim.keymap.set("i", "jk", "<Esc>")
vim.keymap.set("i", "kj", "<Esc>")

-- Move highlighted lines w/ auto identation
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

-- Yank to clipboard
vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")

-- Navigate buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>")
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>")

-- Reload all configs
vim.keymap.set(
  "n",
  "<leader>so",
  reload_config,
  { desc = "Reload Neovim config" }
)
