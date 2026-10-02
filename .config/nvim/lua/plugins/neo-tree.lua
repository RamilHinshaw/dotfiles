return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
      "nvim-tree/nvim-web-devicons", -- pretty :)
    },
    opts = {
      close_if_last_window = false,

      filesystem = {
        -- Set Window to the left
        window = {
          position = "left",
          width = 30,
        },
        -- Automatically expand the path to the current file.
        follow_current_file = {
          enabled = true,
          leave_dirs_open = true,
        },

        -- Optional: make it feel more like VS Code.
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
        },
      },

      event_handlers = {
        {
          event = "neo_tree_buffer_enter",
          handler = function()
            vim.opt_local.number = true
            vim.opt_local.relativenumber = true
          end,
        },
      },

    open_files_do_not_replace_types = {
      "terminal",
      "trouble",
      "qf",
    },

    },

    -- AUTOSTART Code
    config = function(_, opts)
      require("neo-tree").setup(opts)

      vim.api.nvim_create_autocmd("VimEnter", {
        group = vim.api.nvim_create_augroup("open-neo-tree-on-startup", {
          clear = true,
        }),
        callback = function()
          vim.schedule(function()
            local min_width = 140
            local min_height = 45

            if vim.o.columns >= min_width and vim.o.lines >= min_height then
              vim.cmd("Neotree filesystem reveal left")
              vim.cmd("wincmd l") -- Put cursor back in main
              vim.cmd("Trouble diagnostics open focus=false")
            end
          end)
        end,
      })
    end,
  },
}
