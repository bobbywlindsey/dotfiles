return {
    "mbbill/undotree",
    config = function ()
        vim.keymap.set("n", "<leader>u", vim.cmd.UndotreeToggle, { desc = "Undo tree" })
    end
}
