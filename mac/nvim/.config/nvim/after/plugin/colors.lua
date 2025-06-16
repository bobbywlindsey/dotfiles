require("catppuccin").setup {
    color_overrides = {
        latte = {
            rosewater = "#3E4A59",
            flamingo = "#6C8B8E",
            pink = "#7F9FA3",
            mauve = "#708090",
            red = "#4A6C6F",
            maroon = "#5A7081",
            peach = "#A0A090",
            yellow = "#BDB76B",
            green = "#6B8E23",
            teal = "#4682B4",
            blue = "#4169E1",
            sky = "#87CEEB",
            sapphire = "#5F9EA0",
            lavender = "#8A8DBE",
            text = "#2E3440",
            subtext1 = "#4C566A",
            subtext0 = "#5E81AC",
            overlay2 = "#AAB2BF",
            overlay1 = "#D8DEE9",
            overlay0 = "#E5E9F0",
            surface2 = "#ECEFF4",
            surface1 = "#F5F7FA",
            surface0 = "#FAFBFD",
            base = "#FAFAFA",      -- main background
            mantle = "#F5F7FA",    -- slight contrast
            crust = "#F0F0F0",     -- border background
        }
    }
}

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
                    vim.cmd.colorscheme("catppuccin-latte")
                    --vim.api.nvim_set_hl(0, "LineNr", { fg = "#9AA9B8" })
                    --vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
                    --vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
            else
                vim.cmd.colorscheme("rose-pine-moon")
            end
        end
    })

end

ColorMyPencils()
