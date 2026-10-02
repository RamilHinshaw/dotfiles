return {
    {'github/copilot.vim'},
    {
        "CopilotC-Nvim/CopilotChat.nvim",
        dependencies = {
          { "nvim-lua/plenary.nvim", branch = "master" }, -- for curl, log and async functions
        },
        build = "make tiktoken",
        opts = {
            window = {
                layout = 'float', -- This sets the chat window to be a floating window
            },
        },
    },
}
