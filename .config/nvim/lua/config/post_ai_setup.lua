--
--
-- How to use in AI chat window
-- #buffer  <-- add this to include current buffer, /file works as well
-- @agent   <-- add this to give agent edit control
--
-- (temp) Setup here cuz I couldn't get it to work in plugins :/
require("codecompanion").setup({
    context = {
    buffer = true,       -- always include current file
    diagnostics = true,  -- always include LSP diagnostics
    -- git_diff = true,
    -- terminal = true,
    -- viewport = true,
    -- buffers = true,
  },

  adapters = {
    http = {
      ["llama_cpp"] = function()
        return require("codecompanion.adapters").extend("openai_compatible", {
          env = {
            url = "http://localhost:8080",
            api_key = "not-needed",
            chat_url = "/v1/chat/completions",
          },
          schema = {
            model = {
              default = "qwen3.8-27b",
            },
          },
        })
      end,
    },
  },
  interactions = {
    chat = { adapter = "llama_cpp" },
    inline = { adapter = "llama_cpp" },
    cmd = { adapter = "llama_cpp" },
    background = { adapter = "llama_cpp" },
  },
  display = {
    chat = {
      window = {
        layout = "vertical",
        position = "right",
        width = 0.35,
      },
    },
    inline = {
      -- Forces the inline prompt input to pop up in a floating window
      layout = "float", },
  },
})
