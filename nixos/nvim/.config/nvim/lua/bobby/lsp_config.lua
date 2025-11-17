local capabilities = require("blink.cmp").get_lsp_capabilities()

local on_attach = function(_,_)
    -- :h lsp    (for default keybindings and APIs)
    vim.keymap.set("n", "gi", vim.lsp.buf.implementation,
        { desc = "Get implementation" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition,
        { desc = "Get definition" })
    vim.keymap.set("n", "gca", vim.lsp.buf.code_action,
        { desc = "Get code action" })
    vim.keymap.set("n", "gr", require("telescope.builtin").lsp_references,
        { desc = "Get references" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover,
        { desc = "Get documentation" })
end

-- Lua LSP
vim.lsp.config("lua_ls", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        Lua = {
            diagnostics = {
                globals = { "vim" },
            },
        },
    },
})

-- Python LSP
--vim.lsp.config("pylsp", {})
vim.lsp.config("pyright", {
    capabilities = capabilities,
    on_attach = on_attach
})

-- JSON LSP
vim.lsp.config("jsonls", {
    capabilities = lsp_capabilities,
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
            schemaDownload = { enable = false },
        },
    },
})

-- YAML LSP (with CloudFormation support)
vim.lsp.config("yamlls", {
    capabilities = capabilities,
    on_attach = on_attach,
    settings = {
        yaml = {
            schemaStore = {
                enable = false, -- Disable the default schema store
                url = "",
            },
            schemas = require("schemastore").yaml.schemas({
                extra = {
                    {
                        name = "CloudFormation",
                        description = "CloudFormation Template",
                        fileMatch = { "*.template.y*ml", "*-template.y*ml" },
                        url = "https://raw.githubusercontent.com/awslabs/goformation/master/schema/cloudformation.schema.json",
                    },
                },
            }),
            customTags = {
                -- CloudFormation tags
                "!And scalar",
                "!If scalar",
                "!Not",
                "!Equals scalar",
                "!Or scalar",
                "!FindInMap scalar",
                "!Base64",
                "!Cidr",
                "!Ref",
                "!Sub",
                "!GetAtt sequence",
                "!GetAZs",
                "!ImportValue sequence",
                "!Select sequence",
                "!Split sequence",
                "!Join sequence",
                "!GetAtt",
            },
        },
    },
})
