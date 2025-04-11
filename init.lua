-- Ignore the user lua configuration
vim.opt.runtimepath:remove(vim.fn.stdpath("config")) -- ~/.config/nvim
vim.opt.runtimepath:remove(vim.fn.stdpath("config") .. "/after") -- ~/.config/nvim/after

-- Nixvim's internal module table
-- Can be used to share code throughout init.lua
local _M = {}

-- Set up options {{{
do
    local nixvim_options = {
        autoindent = true,
        clipboard = "unnamedplus",
        expandtab = true,
        list = true,
        listchars = "tab:» ,trail:·,multispace:·,lead: ,nbsp:⎕",
        number = true,
        relativenumber = true,
        shiftwidth = 2,
        softtabstop = 0,
        tabstop = 2,
        termguicolors = true,
    }

    for k, v in pairs(nixvim_options) do
        vim.opt[k] = v
    end
end
-- }}}

require("gruvbox").setup({})

vim.cmd([[let $BAT_THEME = 'gruvbox'

colorscheme gruvbox
]])
require("nvim-web-devicons").setup({})

require("mini.starter").setup({
    content_hooks = {
        require("mini.starter").gen_hook.adding_bullet(),
        require("mini.starter").gen_hook.indexing("all", { "Builtin actions" }),
        require("mini.starter").gen_hook.aligning("center", "center"),
    },
    header = "           _                    _\n  ___  ___| |__  _ __ ___    __| | _____   __\n / _ \\/ __| '_ \\| '_ ` _ \\  / _` |/ _ \\ \\ / /\n| (_) \\__ \\ |_) | | | | | || (_| |  __/\\ V /\n \\___/|___/_.__/|_| |_| |_(_)__,_|\\___| \\_/\n",
    items = {
        require("mini.starter").sections.builtin_actions(),
        require("mini.starter").sections.recent_files(10, true),
        require("mini.starter").sections.recent_files(10, false),
    },
})

-- LSP {{{
do
    local __lspServers = {
        { extraOptions = { init_options = { diagnosticSeverity = "Hint" } }, name = "typos_lsp" },
        { name = "pyright" },
        {
            extraOptions = {
                settings = {
                    nixd = {
                        formatting = {
                            command = {
                                "/nix/store/8dy4rqc44frv0wi4k6akn0a2znmj7bym-nixfmt-unstable-2025-04-04/bin/nixfmt",
                            },
                        },
                        nixpkgs = {
                            expr = 'import (builtins.getFlake "/nix/store/gv8kpbbakfkw91b3xkr0xgkhwzmnqq6r-source").inputs.nixpkgs { }',
                        },
                    },
                },
            },
            name = "nixd",
        },
        { name = "dockerls" },
        { name = "astro" },
    }
    -- Adding lspOnAttach function to nixvim module lua table so other plugins can hook into it.
    _M.lspOnAttach = function(client, bufnr) end
    local __lspCapabilities = function()
        capabilities = vim.lsp.protocol.make_client_capabilities()

        capabilities = vim.tbl_deep_extend("force", capabilities, require("cmp_nvim_lsp").default_capabilities())

        return capabilities
    end

    local __setup = {
        on_attach = _M.lspOnAttach,
        capabilities = __lspCapabilities(),
    }

    for i, server in ipairs(__lspServers) do
        if type(server) == "string" then
            require("lspconfig")[server].setup(__setup)
        else
            local options = server.extraOptions

            if options == nil then
                options = __setup
            else
                options = vim.tbl_extend("keep", options, __setup)
            end

            require("lspconfig")[server.name].setup(options)
        end
    end
end
-- }}}

local cmp = require("cmp")
cmp.setup({
    mapping = {
        ["<C-e>"] = cmp.mapping.close(),
        ["<C-n>"] = cmp.mapping.select_next_item(),
        ["<C-p>"] = cmp.mapping.select_prev_item(),
        ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },
    sources = {
        { name = "nvim_lsp" },
        { name = "path" },
        { keyword_length = 5, name = "buffer" },
        { name = "cmdline" },
    },
})

vim.opt.runtimepath:prepend(vim.fs.joinpath(vim.fn.stdpath("data"), "site"))
require("nvim-treesitter.configs").setup({
    ensure_installed = { "python", "astro", "just", "dockerfile", "json", "yaml", "lua", "nix", "c", "markdown" },
    highlight = { enable = true },
    parser_install_dir = vim.fs.joinpath(vim.fn.stdpath("data"), "site"),
})

require("todo-comments").setup({})

require("telescope").setup({})

local __telescopeExtensions = {}
for i, extension in ipairs(__telescopeExtensions) do
    require("telescope").load_extension(extension)
end

require("smear_cursor").setup({})

require("oil").setup({ view_options = { show_hidden = true } })

require("noice").setup({})

require("nvim-navic").setup({})

require("lualine").setup({})

require("gitsigns").setup({ current_line_blame = true })

require("fidget").setup({})

require("Comment").setup({ opleader = { line = "<C-_>" }, toggler = { line = "<C-_>" } })

require("bufferline").setup({})

-- Set up keybinds {{{
do
    local __nixvim_binds = { { action = "<cmd>Oil<CR>", key = "-", mode = "", options = { silent = true } } }
    for i, map in ipairs(__nixvim_binds) do
        vim.keymap.set(map.mode, map.key, map.action, map.options)
    end
end
-- }}}

-- Set up autogroups {{
do
    local __nixvim_autogroups = { nixvim_binds_LspAttach = { clear = true } }

    for group_name, options in pairs(__nixvim_autogroups) do
        vim.api.nvim_create_augroup(group_name, options)
    end
end
-- }}
-- Set up autocommands {{
do
    local __nixvim_autocommands = {
        {
            callback = function(args)
                do
                    local __nixvim_binds = {}

                    for i, map in ipairs(__nixvim_binds) do
                        local options = vim.tbl_extend("keep", map.options or {}, { buffer = args.buf })
                        vim.keymap.set(map.mode, map.key, map.action, options)
                    end
                end
            end,
            desc = "Load keymaps for LspAttach",
            event = "LspAttach",
            group = "nixvim_binds_LspAttach",
        },
    }

    for _, autocmd in ipairs(__nixvim_autocommands) do
        vim.api.nvim_create_autocmd(autocmd.event, {
            group = autocmd.group,
            pattern = autocmd.pattern,
            buffer = autocmd.buffer,
            desc = autocmd.desc,
            callback = autocmd.callback,
            command = autocmd.command,
            once = autocmd.once,
            nested = autocmd.nested,
        })
    end
end
-- }}
