return {
    {
        'ggandor/leap.nvim',
        keys = { "b", "B" },
        config = function()
            require('leap').add_default_mappings()
        end,
    },
    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" }, -- Dependencia obligatoria
        config = function()
            require("harpoon").setup()
            vim.keymap.set("n", "<leader>ha", require("harpoon.mark").add_file, { desc = "Harpoon add file" })
            vim.keymap.set("n", "<leader>hh", require("harpoon.ui").toggle_quick_menu, { desc = "Harpoon menu" })
        end,
    }
}
