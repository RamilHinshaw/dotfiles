return {
  "famiu/bufdelete.nvim",

  keys = {
    {
      "<C-w>",
      "<cmd>Bdelete<CR>",
      mode = "n",
      desc = "Close current buffer",
    },

    {
      "<leader>bo",
      "<cmd>Bdelete other<CR>",
      mode = "n",
      desc = "Close other buffers",
    },
  },
}