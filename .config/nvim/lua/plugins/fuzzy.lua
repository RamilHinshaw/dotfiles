return {
    -- {
    --   "ctrlpvim/ctrlp.vim",
    --   init = function()
    --     -- Show CtrlP's match window at the top
    --     vim.g.ctrlp_match_window =
    --     "top,order:ttb,min:1,max:10,results:10"

    --     vim.g.ctrlp_map = "<C-p>"
    --     vim.g.ctrlp_cmd = "CtrlP"
    --   end,
    -- },
    -- Telescope (Fuzzy Finder)
    {
    "nvim-telescope/telescope.nvim",

    dependencies = {
      "nvim-lua/plenary.nvim",
      {
        "nvim-telescope/telescope-fzf-native.nvim",
        build = "make",
      },
    },

    opts = {
      defaults = {
        -- Floating picker
        layout_strategy = "horizontal",

        layout_config = {
          -- PERCENT Size
          -- width = 0.40,
          -- height = 0.35,

          -- FIXED Size
          width = 100,
          height = 25,

          anchor = "N", --NORTH
          -- row = 0.05, -- gap below top edge
          prompt_position = "top",
        },

      vim.api.nvim_set_hl(0, "TelescopeBorder", {
        fg = "#6b7280",
        bg = "NONE",
      }),

      vim.api.nvim_set_hl(0, "TelescopePromptBorder", {
        fg = "#6b7280",
        bg = "NONE",
      }),

      vim.api.nvim_set_hl(0, "TelescopeResultsBorder", {
        fg = "#6b7280",
        bg = "NONE",
      }),

      vim.api.nvim_set_hl(0, "TelescopePreviewBorder", {
        fg = "#6b7280",
        bg = "NONE",
      }),

        sorting_strategy = "ascending",

        -- Show filename before the path
        path_display = {
          "filename_first",
        },

        -- Rounded floating borders
        border = true,
        -- borderchars = {
        --   "╭",
        --   "─",
        --   "╮",
        --   "│",
        --   "╯",
        --   "─",
        --   "╰",
        --   "│",
        -- },
      },

      pickers = {
        find_files = {
          -- Hide the preview for a more VS Code-like picker
          previewer = false,
        },
      },
    },

    keys = {
      {
        "<C-p>",
        "<Cmd>Telescope find_files<CR>",
        desc = "Find files",
      },
    },
  },
}
