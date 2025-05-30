local builtin = require("telescope.builtin")
vim.keymap.set("n", "<leader>pf", builtin.find_files, { desc = "Telescope find files" }) -- project files
vim.keymap.set("n", "<C-p>", builtin.git_files, { desc = "Telescope find files in Git" })
vim.keymap.set("n", "<leader>ps", function() -- project search
	builtin.grep_string({ search = vim.fn.input("Grep > ") });
end)

