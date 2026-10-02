return {
    {
      "neovim/nvim-lspconfig",
      dependencies = {
        "mason-org/mason.nvim",
        "mason-org/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
      },
      config = function()
        require("mason").setup()
        local capabilities = require("cmp_nvim_lsp").default_capabilities()

        local servers = {
          "lua_ls",
          "clangd",
          "pyright",
          "ts_ls",
          -- Add your installed servers here
        }

        require("mason-lspconfig").setup({
          ensure_installed = servers,
        })

        for _, server in ipairs(servers) do
          vim.lsp.config(server, {
            capabilities = capabilities,
          })

          vim.lsp.enable(server)
        end
      end,
    },
    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "VeryLazy", -- Or `LspAttach`
        priority = 1000, -- needs to be loaded in first
        config = function()
            require("tiny-inline-diagnostic").setup({
                -- ...
                signs = {
                    left = "",
                    right = "",
                    diag = "●",
                    arrow = "    ",
                    up_arrow = "    ",
                    vertical = " │",
                    vertical_end = " └",
                },
                blend = {
                    factor = 0.22,
                },
                -- ...
            })
            vim.diagnostic.config({ virtual_text = false })
        end
    },
}
