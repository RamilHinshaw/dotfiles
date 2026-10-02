return {
        {"akinsho/toggleterm.nvim",
        version = "*",
        opts = {

          -- 40% of the current Neovim window width
          size = function(term)
            if term.direction == "vertical" then
              return math.floor(vim.o.columns * 0.20)
            elseif term.direction == "horizontal" then
              return math.floor(vim.o.lines * 0.25)
            end
          end,

          -- Floating terminal size
          float_opts = {
            border = "rounded",

            -- 70% of the current width
            width = function()
              return math.floor(vim.o.columns * 0.60)
            end,

            -- 60% of the current height
            height = function()
              return math.floor(vim.o.lines * 0.40)
            end,
          },

          -- Make floating terminals start centered
          -- open_mapping = [[<leader>tt]],
          shade_terminals = true,
          shading_factor = 2,
       },
     },
     -- { "https://codeberg.org/comfysage/jamjar.nvim" },
}
