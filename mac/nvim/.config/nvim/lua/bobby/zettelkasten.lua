local telescope = require("telescope.builtin")

function FollowLink()
    -- Get the word under the cursor
    local prefix = vim.fn.expand("<cword>")

    if prefix == nil or prefix == "" then
        vim.notify("No reference under cursor", vim.log.levels.WARN)
        return
    end

    -- Search for matching files
    local glob_pattern = string.format("%s*.md", prefix)
    local matches = vim.fn.glob(glob_pattern, false, true)

    if #matches == 0 then
        vim.notify("No matching zettels found", vim.log.levels.INFO)
        return
    elseif #matches == 1 then
        -- Open the file
        vim.cmd.edit(matches[1])
        return
    else
        telescope.find_files({
            prompt_title = "Matching Zettels: " .. prefix,
            find_command = { "rg", "--files", "-g", glob_pattern },
            cwd = vim.loop.cwd(),
        })
    end
end

function CreateZettel()
    local file_name_input = vim.fn.input("New zettel: ")

    if file_name_input == nil or file_name_input == "" then
        vim.notify("No zettel name provided", vim.log.levels.WARN)
        return
    end

    local datetime = os.date("%Y%m%d%H%M")

    -- Sanitize input
    file_name_input = file_name_input:gsub("/", "-")

    local file_name = string.format("%s - %s.md", datetime, file_name_input)

    local file_name_with_path = vim.fn.getcwd() .. "/" .. file_name

    -- Open a new buffer with the new file name
    vim.cmd.edit(file_name_with_path)

    -- Write an initial markdown header
    vim.api.nvim_buf_set_lines(
        0,
        0,
        -1,
        false,
        { "# " .. file_name_input, "", "" }
    )

    -- Save the file to disk
    vim.cmd("write")

    -- Move cursor to the last line and end of that line
    vim.api.nvim_win_set_cursor(0, { vim.fn.line("$"), 0 })

    -- Copy prefix
    vim.fn.setreg('"', datetime)
end

function ListStructureZettels()
    telescope.grep_string({
        prompt_title = "Structure Zettels",
        search = "#structure"
    });
end

function ListZettelReferences()
    -- Get current file name
    local file_name = vim.fn.expand("%:t")
    
    -- Split on '-' and trim whitespace
    local prefix = file_name:match("^(.-)%s*%-%s*")
    local prefix_cleaned = vim.trim(prefix)

    telescope.grep_string({
        prompt_title = "Connected Zettels",
        search = "[[" .. prefix_cleaned .. "]]"
    });
end

vim.keymap.set(
    "n",
    "gd", -- "follow link"
    FollowLink,
    {
        noremap = true,
        silent = true
    },
    { desc = "Follow zettel link"}
)

vim.keymap.set(
    "n",
    "zn",
    CreateZettel,
    {
        noremap = true,
        silent = true
    },
    { desc = "New zettel" }
)

vim.keymap.set(
    "n",
    "zs",
    ListStructureZettels,
    {
        noremap = true,
        silent = true
    },
    { desc = "Zettel structure" }
)

vim.keymap.set(
    "n",
    "zc",
    ListZettelReferences,
    {
        noremap = true,
        silent = true
    },
    { desc = "Zettel connections" }
)
