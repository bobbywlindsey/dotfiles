function ColorMyPencils()
    vim.api.nvim_create_autocmd({ "BufReadPost", "BufNewFile" }, {
        callback = function()
            local file_name = vim.api.nvim_buf_get_name(0)
            -- Get extension including dot
            local ext = file_name:match("^.+(%..+)$")

            if not string.find(file_name, "Bullet Journal")
                and ext == ".md"
                then
                    --vim.cmd.colorscheme("rose-pine-dawn")
                    --vim.cmd.colorscheme("catppuccin-latte")
                    --vim.cmd.colorscheme("rose-pine-moon")
                    vim.cmd.colorscheme("catppuccin-mocha")
                    --vim.api.nvim_set_hl(0, "LineNr", { fg = "#9AA9B8" })
                    --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            else
                --vim.cmd.colorscheme("rose-pine-moon")
                vim.cmd.colorscheme("catppuccin-mocha")
            end
        end
    })

end

-- Set default theme for netrw
vim.cmd("colorscheme catppuccin-mocha")
ColorMyPencils()
