return {
    {
      "folke/trouble.nvim",
      opts = {
        focus = false,
        auto_close = false,
        auto_preview = false,
        open_no_results = true,

        win = {
          position = "bottom",
          size = 10,
        },
      }, -- for default options, refer to the configuration section for custom setup.

    -- AUTOSTART Code
    config = function(_, opts)
      require("trouble").setup(opts)

      vim.api.nvim_create_autocmd("VimEnter", {
        group = vim.api.nvim_create_augroup("open-trouble-on-startup", {
          clear = true,
        }),
        callback = function()
          vim.schedule(function()
            -- Keep Trouble open even when there are no diagnostics.
            vim.cmd("Trouble diagnostics open focus=false")

            -- Move focus from Neo-tree to the main file window.
            vim.cmd("wincmd l")
          end)
        end,
      })
    end,

      cmd = "Trouble",
      keys = {
        {
          "<leader>xx",
          "<cmd>Trouble diagnostics toggle<cr>",
          desc = "Diagnostics (Trouble)",
        },
        {
          "<leader>xX",
          "<cmd>Trouble diagnostics toggle filter.buf=0<cr>",
          desc = "Buffer Diagnostics (Trouble)",
        },
        {
          "<leader>cs",
          "<cmd>Trouble symbols toggle focus=false<cr>",
          desc = "Symbols (Trouble)",
        },
        {
          "<leader>cl",
          "<cmd>Trouble lsp toggle focus=false win.position=right<cr>",
          desc = "LSP Definitions / references / ... (Trouble)",
        },
        {
          "<leader>xL",
          "<cmd>Trouble loclist toggle<cr>",
          desc = "Location List (Trouble)",
        },
        {
          "<leader>xQ",
          "<cmd>Trouble qflist toggle<cr>",
          desc = "Quickfix List (Trouble)",
        },
      },
    },
}
