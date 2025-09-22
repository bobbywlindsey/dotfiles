local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files,
    { desc = "Find project files" })
vim.keymap.set("n", "<C-p>", builtin.git_files,
    { desc = "Find project files in Git" })
vim.keymap.set("n", "<leader>ps", function()
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end, { desc = "Search files (grep)" })
