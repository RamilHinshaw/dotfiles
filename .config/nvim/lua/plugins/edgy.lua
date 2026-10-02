-- Used to animate neotree and other panes


return {
  {
    "folke/edgy.nvim",
    event = "VeryLazy",
    dependencies = {
      "nvim-neo-tree/neo-tree.nvim",
    },

    init = function()
      vim.opt.laststatus = 3
      vim.opt.splitkeep = "screen"
    end,

    opts = {
      animate = {
        enabled = true,
        fps = 144,
        cps = 180,
      },

      left = {
        {
          title = "Neo-Tree",
          ft = "neo-tree",
          filter = function(buf)
            return vim.b[buf].neo_tree_source == "filesystem"
          end,
          size = {
            width = 20,
          },
        },

        -- Catch other Neo-tree windows/sources
        {
          ft = "neo-tree",
        },
      },
    },
  },
}
