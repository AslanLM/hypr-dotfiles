return {
    {
        'tpope/vim-surround',
        event = "VeryLazy",
    },
    {
        'numToStr/Comment.nvim',
        keys = { "gc", "gb" },
        config = function()
            require('Comment').setup()
        end,
    },
}
