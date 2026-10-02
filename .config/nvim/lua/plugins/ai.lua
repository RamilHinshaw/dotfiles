return {
  "olimorris/codecompanion.nvim",
  -- version = "^19.0.0",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
  },
  -- config = function()
  --   require("codecompanion").setup({
  --     interactions = {
  --       chat = {
  --         -- You can specify an adapter by name and model (both ACP and HTTP)
  --         adapter = {
  --           name = "copilot",
  --           model = "gpt-4.1",
  --         },
  --       },
  --       -- Or, just specify the adapter by name
  --       inline = {
  --         adapter = "anthropic",
  --       },
  --       cmd = {
  --         adapter = "openai",
  --       },
  --       background = {
  --         adapter = {
  --           name = "ollama",
  --           model = "qwen-7b-instruct",
  --         },
  --       },
  --     },
  --   })
  -- end,
}
