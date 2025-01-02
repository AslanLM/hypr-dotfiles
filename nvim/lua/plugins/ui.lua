return {
  {
    "folke/noice.nvim",
    config = function()
      require("noice").setup({
        cmdline = {
          view = "cmdline", -- Use the cmdline view for the command-line
        },
        presets = {
          bottom_search = true,   -- Enable bottom search view
          command_palette = true, -- Enable command palette view
          lsp_doc_border = true,  -- Enable LSP documentation border
        },
      })
    end,
  },
  {
    "rcarriga/nvim-notify",
    opts = {
      render = "compact",
      background_colour = "#1E1E2E",
      timeout = 5000,
    },
  },
  {
    "b0o/incline.nvim",
    event = "BufReadPre",     -- Load this plugin before reading a buffer
    priority = 1200,          -- Set the priority for loading this plugin
    config = function()
      require("incline").setup({
        window = { margin = { vertical = 0, horizontal = 1 } },         -- Set the window margin
        hide = {
          cursorline = true,                                            -- Hide the incline window when the cursorline is active
        },
        render = function(props)
          local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")           -- Get the filename
          if vim.bo[props.buf].modified then
            filename = "[+] " .. filename                                                           -- Indicate if the file is modified
          end

          local icon, color = require("nvim-web-devicons").get_icon_color(filename)           -- Get the icon and color for the file
          return { { icon, guifg = color }, { " " }, { filename } }                           -- Return the rendered content
        end,
      })
    end,
  },
  {
    --Lualine
    'nvim-lualine/lualine.nvim',
    config = function()
      require('lualine').setup({
        options = {
          theme = 'palenight'
        }
      })
    end
  },
  {
    "HiPhish/rainbow-delimiters.nvim",
    config = function()
      local rainbow_delimiters = require("rainbow-delimiters")
      vim.g.rainbow_delimiters = {
        strategy = {
          [""] = rainbow_delimiters.strategy["global"],
          vim = rainbow_delimiters.strategy["local"],
        },
        query = {
          [""] = "rainbow-delimiters",
          latex = "rainbow-blocks",
        },
        highlight = {
          "RainbowDelimiterRed",
          "RainbowDelimiterYellow",
          "RainbowDelimiterBlue",
          "RainbowDelimiterOrange",
          "RainbowDelimiterGreen",
          "RainbowDelimiterViolet",
          "RainbowDelimiterCyan",
        },
      }
    end,
  },
  {
    --Themes: catppuccin
    "catppuccin/nvim",
    lazy = false,
    name = "catppuccin",
    priority = 1000,
    config = function()
      require("catppuccin").setup({
        flavour = 'mocha',
        transparent_background = true,
      })
      vim.cmd.colorscheme "catppuccin"
    end
  },
}
