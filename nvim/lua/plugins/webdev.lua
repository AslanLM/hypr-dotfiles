return {
    {
        'mattn/emmet-vim',
        ft = { 'html', 'css', 'javascript', 'javascriptreact', 'typescriptreact' },
        config = function()
            vim.g.user_emmet_leader_key = '<C-E>'
        end,
    },
    {
        'windwp/nvim-ts-autotag',
        event = "InsertEnter",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        config = function()
            require('nvim-ts-autotag').setup()
        end,
    },
}
