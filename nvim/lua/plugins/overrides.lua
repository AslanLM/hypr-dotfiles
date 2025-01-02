return {
    -- Change configuration for trouble.nvim
    {
        -- Plugin: trouble.nvim
        -- URL: https://github.com/folke/trouble.nvim
        -- Description: A pretty list for showing diagnostics, references, telescope results, quickfix and location lists.
        "folke/trouble.nvim",
        -- Options to be merged with the parent specification
        opts = { use_diagnostic_signs = true }, -- Use diagnostic signs for trouble.nvim
    },

    -- Add symbols-outline.nvim plugin
    {
        -- Plugin: symbols-outline.nvim
        -- URL: https://github.com/simrat39/symbols-outline.nvim
        -- Description: A tree like view for symbols in Neovim using the Language Server Protocol.
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",                                                           -- Command to open the symbols outline
        keys = { { "<leader>cs", "<cmd>SymbolsOutline<CR>", desc = "Symbols Outline" } }, -- Keybinding to open the symbols outline
        config = true,                                                                    -- Use default configuration
    },
}
