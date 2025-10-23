-- Custom checkboxes already implemented in render_markdown.lua settings

function file_exists(filename)
    local file = io.open(filename, "r")
    if file then
        file:close()
        return true
    else
        return false
    end
end

function create_daily_log()
    local daily_log = {
        "# Log",
        "",
        "> [!story] Story of the day",
        "",
        "- [ ] Task",
        "- [x] Task completed",
        "- [s] Task irrelevant",
        "- [/] Task delegated",
        "- [>] Task migrated",
        "- [<] Task migrated to another system",
        "- [o] Event",
        "- [-] Note",
        "- [=] Emotions",
        "- [\"] Quote",
        "- [!] Insight"
    }

    local datetime = os.date("%Y-%m-%d, %A")
    local file_name = string.format("%s.md", datetime)
    local file_name_with_path = vim.fn.getcwd() .. "/" .. file_name

    if not file_exists(file_name) then
        -- Open a new buffer with the new file name
        vim.cmd.edit(file_name_with_path)

        vim.api.nvim_buf_set_lines(
            0,
            0,
            -1,
            false,
            daily_log
        )

        -- Save the file to disk
        vim.cmd("write")

        -- Move cursor to the last line and end of that line
        vim.api.nvim_win_set_cursor(0, { vim.fn.line("$"), 0 })
    else
        vim.api.nvim_command("edit " .. file_name)
        print("Daily log already exists")
    end
end

function create_monthly_log()
    local month_name = os.date("%B")

    local monthly_log = {
        "# " .. month_name,
        "",
        "> [!intentions] Intentions",
        "",
        "",
        "",
        "| Day | Story of the Day | Ex.    | Less       | Phil.          |",
        "| :-: | :--------------: | :----: | :--------: | :------------: |",
        "| 01  |                  | []     | []         | []             |",
        "| 02  |                  | []     | []         | []             |",
        "| 03  |                  | []     | []         | []             |",
        "| 04  |                  | []     | []         | []             |",
        "| 05  |                  | []     | []         | []             |",
        "| 06  |                  | []     | []         | []             |",
        "| 07  |                  | []     | []         | []             |",
        "| 08  |                  | []     | []         | []             |",
        "| 09  |                  | []     | []         | []             |",
        "| 10  |                  | []     | []         | []             |",
        "| 11  |                  | []     | []         | []             |",
        "| 12  |                  | []     | []         | []             |",
        "| 13  |                  | []     | []         | []             |",
        "| 14  |                  | []     | []         | []             |",
        "| 15  |                  | []     | []         | []             |",
        "| 16  |                  | []     | []         | []             |",
        "| 17  |                  | []     | []         | []             |",
        "| 18  |                  | []     | []         | []             |",
        "| 19  |                  | []     | []         | []             |",
        "| 20  |                  | []     | []         | []             |",
        "| 21  |                  | []     | []         | []             |",
        "| 22  |                  | []     | []         | []             |",
        "| 23  |                  | []     | []         | []             |",
        "| 24  |                  | []     | []         | []             |",
        "| 25  |                  | []     | []         | []             |",
        "| 26  |                  | []     | []         | []             |",
        "| 27  |                  | []     | []         | []             |",
        "| 28  |                  | []     | []         | []             |",
        "| 29  |                  | []     | []         | []             |",
        "| 30  |                  | []     | []         | []             |",
        "| 31  |                  | []     | []         | []             |",
        "",
        "",
        "## Log",
        "",
        ""
    }

    local month_number = os.date("%m")
    local file_name = string.format("%s-%s.md", month_number, month_name)
    local file_name_with_path = vim.fn.getcwd() .. "/" .. file_name

    if not file_exists(file_name) then
        -- Open a new buffer with the new file name
        vim.cmd.edit(file_name_with_path)

        vim.api.nvim_buf_set_lines(
            0,
            0,
            -1,
            false,
            monthly_log
        )

        -- Save the file to disk
        vim.cmd("write")

        -- Move cursor to the last line and end of that line
        vim.api.nvim_win_set_cursor(0, { vim.fn.line("$"), 0 })
    else
        vim.api.nvim_command("edit " .. file_name)
        print("Monthly log already exists")
    end
end

function journal_snippet(snippet)
    local weekly_reflection = {
        "Reflection:",
        "",
        "1. Update headlines of past week in Monthly Log",
        "2. Skim through past week's entries",
        "3. Reflect using bulleted entries or complete sentences:",
        "    - What feelings, observations, patterns, or ideas stand out?",
        "    - Use the time to debrief on any event or thought",
        "4. Note the tone of the reflection - what does this reveal about how the week went?",
        "",
        "Migration (With the reflection as context, refine tasks and priorities for the upcoming week):",
        "",
        "1. List tasks that came up during reflection",
        "2. Move tasks outside this week into Future Log or relevant Custom Collection",
        "3. Move tasks from previous dailies or weeklies to this list if need to be completed this week",
        "4. Set an intention for the upcoming week and mark priorities accordingly",
        "",
        "### Reflection",
        "",
        "",
        "",
        "### Migration",
        "",
        ""
    }

    local monthly_reflection = {
        "Reflection:",
        "",
        "- Similar to weekly reflection",
        "- Some additional questions to consider:",
        "    - What are you seeing? ",
        "    - What were you feeling throughout the month? ",
        "    - What is giving you energy and what is taking it? ",
        "    - How did your actions support your intention? How did they not? ",
        "    - What are your excuses? ",
        "    - What are the stories that you've been telling yourself? ",
        "    - What actions do you need to take? ",
        "    - What support do you need?",
        "- As you reflect, you'll notice that we often don't complete our to do lists. Rather than judge ourselves, practice looking at this with curiosity:",
        "    - Why did this not get done?",
        "    - How does this make me feel?",
        "    - Why does it make me feel this way?",
        "    - Do I have the time to take?",
        "- Once you can identify the deeper cause, you might be able to strategize how to move forward (or let it go).",
        "",
        "Migration:",
        "",
        "1. List tasks that came up during reflection",
        "2. Run tasks from previous month through Migration Filter and add to new monthly list",
        "3. Migrate remaining tasks to other areas (apps, Future Log, calendar, Custom Collection)",
        "4. Refine Custom Collections",
        "5. Add new month spread to Index",
        "",
        "### Reflection",
        "",
        "",
        "",
        "### Migration",
        "",
        ""
    }

    local yearly_reflection = {
        "### Working",
        "",
        "",
        "",
        "### Not Working",
        "",
        "",
        "",
        "### More Of",
        "",
        "",
        "",
        "### Less Of",
        "",
        "",
        "",
        "### What I Learned",
        "",
        ""
    }

    -- Get current cursor row
    local row, _ = unpack(vim.api.nvim_win_get_cursor(0))
    row = row - 1

    if snippet == "daily_log" then
        create_daily_log()
        return
    elseif snippet == "weekly_reflection" then
        vim.api.nvim_buf_set_lines(0, row, row, false, weekly_reflection)
        return
    elseif snippet == "monthly_reflection" then
        vim.api.nvim_buf_set_lines(0, row, row, false, monthly_reflection)
        return
    elseif snippet == "monthly_log" then
        create_monthly_log()
        return
    elseif snippet == "yearly_reflection" then
        vim.api.nvim_buf_set_lines(0, row, row, false, yearly_reflection)
        return
    else
        vim.notify("Not a valid snippet", vim.log.levels.WARN)
        return
    end
end

vim.keymap.set("n", "<leader>bjdl", function()
    journal_snippet("daily_log")
end, { noremap = true, silent = true },
{ desc = "Bullet journal daily log" })

vim.keymap.set("n", "<leader>bjwr", function()
    journal_snippet("weekly_reflection")
end, { noremap = true, silent = true },
{ desc = "Bullet journal weekly reflection" })

vim.keymap.set("n", "<leader>bjmr", function()
    journal_snippet("monthly_reflection")
end, { noremap = true, silent = true },
{ desc = "Bullet journal monthly reflection" })

vim.keymap.set("n", "<leader>bjml", function()
    journal_snippet("monthly_log")
end, { noremap = true, silent = true },
{ desc = "Bullet journal monthly log" })

vim.keymap.set("n", "<leader>bjyr", function()
    journal_snippet("yearly_reflection")
end, { noremap = true, silent = true },
{ desc = "Bullet journal yearly reflection" })
