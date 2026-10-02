-- Central plugin loader
-- Each plugin spec lives in its own file under specs/
local specs = {}

local spec_files = {
    "ai", -- my selfhosted AI companion
    "themes", -- list of themes go here
    "snacks", -- utilities: fuzzy picker & statuscolumn
    "fuzzy",  --  Fuzzy Search
    "bufferline", -- buffers are 'tabs-like' at the top 
    "neo-tree", -- file explorer sidebar
    "session-manager", -- remembers last files editted when open nvim for project folder
    "mini", -- utilities: animate (smooth scrolling, cursor animation, pane animation)
    "devicons", -- Adds file-type icons to file explorers, bufferlines, fuzzy finders, completion menus, and statuslines
    "lsp", -- Enables IDE-like features
    "toggleterm", -- Toggle Terminal as panes or floating
    "trouble", -- Presents diagnostics, references, quickfix results, TODO items, and location lists in a navigable panel.
    "editing", -- 3 plugins: autopairs, indent-blankline (show blanks), rainbow-delimiters, & Comment toggle
    "neogit", -- Git interface modeled after Magit
    "lualine", -- Displays a customizable statuslin
    "treesitter", -- Parses code into a syntax tree for more accurate highlighting, indentation, folding, text objects, navigation, and structural selections.
    "which-key", -- Shows available keybindings after you press a leader key
    -- "copilot", -- Open copilots AI
    "todo-comments", -- Highlights TODO, FIXME, HACK, NOTE, and WARN, and allows to be searchable
    "none-ls", -- Use Neovim as a language server to inject LSP diagnostics, code actions, and more via Lua. Telescope and trouble uses this.
    "bufferlist", -- Show floating pane of buffers (tabs)
    "render-markdown", -- Can show markdown like render in neovim
    "completion", -- 5 plugins: Suggest LSP symbols, buffer words, file paths, snippets, commands, and function signature
    "git", -- 2 plugins: vim-fugitive (git functions), gitsigns (shows + or -)
    -- "edgy", -- smooth animation for neo-tree
    "bufdelete", --allows delete (closing current tab) without breaking the layout (neotree & trouble breaks this)
    "multicursor", -- allows multicursor editing
}

for _, file in ipairs(spec_files) do
    local spec = require("plugins." .. file)
    for _, s in ipairs(spec) do
        table.insert(specs, s)
    end
end

return specs
