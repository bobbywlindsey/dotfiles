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
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, { desc = "Project view" })
--vim.keymap.set("n", "<leader>pv", ":NERDTreeToggle<CR>",
    --{ desc = "Project view"})

vim.keymap.set("n", "<leader>w", vim.cmd.write, { desc = "Write file" })
vim.keymap.set("n", "<leader>q", vim.cmd.quit, { desc = "Quit" })

vim.keymap.set("i", "jk", "<Esc>", { desc = "Command mode" })
vim.keymap.set("i", "kj", "<Esc>", { desc = "Command mode" })

-- Move highlighted lines w/ auto identation
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move highlighted up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv",
    { desc = "Move highlighted down" })

-- Yank to clipboard
vim.keymap.set("n", "<leader>y", "\"+y", { desc = "Copy to clipboad" })
vim.keymap.set("v", "<leader>y", "\"+y", { desc = "Copy to clipboard" })
vim.keymap.set("n", "<leader>Y", "\"+Y",
    { desc = "Copy current line to clipboard" })

-- Navigate buffers
vim.keymap.set("n", "<Tab>", ":bnext<CR>", { desc = "Next buffer" })
vim.keymap.set("n", "<S-Tab>", ":bprevious<CR>", { desc = "Previous buffer" })

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

-- Reload all configs
vim.keymap.set(
  "n",
  "<leader>so",
  reload_config,
  { desc = "Reload Neovim config" }
)
