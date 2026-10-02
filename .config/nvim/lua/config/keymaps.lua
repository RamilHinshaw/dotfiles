-- ################################################################################################################
--
-- Ramil Hinshaw's custom keymaps :)
--
-- ################################################################################################################

vim.g.mapleader = "\\"
vim.g.maplocalleader = "\\"

local function map(mode, lhs, rhs, opts)
 -- {Link: According to Stack Overflow https://stackoverflow.com/questions/77255648/best-method-to-convert-a-vim-expr-value-to-neovim-in-lua} and 
 -- {Link: Medium https://medium.com/unixification/must-have-neovim-keymaps-51c283394070}, 
 -- Neovim's vim.keymap.set function has "noremap = true" as its default behavior, but it's often included for clarity.
  local options = { noremap = true, silent = true }
  if opts then
    options = vim.tbl_extend("force", options, opts)
  end
  vim.keymap.set(mode, lhs, rhs, options)
end

-- ============================================================================
-- PLUGIN DETECTION
-- ============================================================================

local plugins = {}
local function has(name)
  if plugins[name] ~= nil then return plugins[name] end
  local ok = pcall(require, name)
  plugins[name] = ok
  return ok
end

-- ============================================================================
-- GENERAL (no plugin deps)
-- ============================================================================

-- NvimTree
map("n", "<C-n>", "<cmd>Neotree toggle<cr>", { desc = "Toggle NvimTree" })

-- Normal Mode Mappings (equivalent to "noremap" or "nnoremap")
local set = vim.keymap.set

set({ "n", "x", "o" }, "H", "0", {
  desc = "Go to beginning of line",
})

set({ "n", "x", "o" }, "L", "$", {
  desc = "Go to end of line",
})

map({"n", "v", "x", "o"}, "K", "<C-u>", { desc = "Scroll up half page" }) -- "nnoremap K <c-u>"
map({"n", "v", "x", "o"}, "J", "<C-d>", { desc = "Scroll down half page" }) -- "nnoremap J <c-d>"

map({"n", "v", "x", "o"}, "<C-u>", "<C-b>", { desc = "Scroll up a full page" }) -- "nnoremap <c-u> <c-b>"
map({"n", "v", "x", "o"}, "<C-d>", "<C-f>", { desc = "Scroll down a full page" }) -- "nnoremap <c-d> <c-f>"

map({"n", "v", "x", "o"}, "<C-j>", "J", { desc = "Join line below" }) -- "nnoremap <c-j> J"
map({"n", "v", "x", "o"}, "<C-s>", "s", { desc = "Substitute character" }) -- "nnoremap <c-s> s"

-- Switch Buffers
map ("n", "<S-Left>", ":bprev<CR>")
map ("n", "<S-Right>", ":bnext<CR>")
map ("n", "<C-h>", ":bprev<CR>")
map ("n", "<C-l>", ":bnext<CR>")
map("n", "<leader>bd", ":bw<CR>", { desc = "Close buffer" })


-- ============================================================================
-- TELESCOPE
-- ============================================================================
-- Grep
if has("telescope.builtin") then
  local builtin = require("telescope.builtin")

  map('n', '<leader>ff', builtin.find_files, { desc = 'Telescope find files' })
  map('n', '<leader>fg', builtin.live_grep, { desc = 'Telescope live grep' })
  map('n', '<leader>fb', builtin.buffers, { desc = 'Telescope buffers' })
  map('n', '<leader>fh', builtin.help_tags, { desc = 'Telescope help tags' })
  map('n', '<leader>fo', builtin.oldfiles)

  vim.keymap.set("n", "<leader>dd", function()
    require("telescope.builtin").diagnostics({ bufnr = 0 })
  end, { noremap = true, silent = true, desc = "Telescope: Buffer diagnostics" })

	-- Diagnostics
  map('n', '<leader>dt', builtin.lsp_type_definitions)
  map('n', '<leader>dr', builtin.lsp_references)
  map('n', '<leader>dl', builtin.lsp_definitions)
  map('n', '<leader>di', builtin.lsp_implementations)
  map('n', '<leader>ds', builtin.lsp_document_symbols)
end

map('n', '<C-d>', "<cmd>Trouble diagnostics toggle<cr>")
--Copilot
map("n", "<leader>cc", ":CopilotChatToggle<CR>", { noremap = true, silent = true, desc = "Toggle Copilot Chat" })
map("x", "<leader>cc", ":'<,'>CopilotChat<cr>", { desc = "copilot chat selection" })

--Toggle Term
map("n", "<leader>tt", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Terminal (small)" })
map("n", "<C-_>", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Terminal (small)" }) -- CTRL + / (forward slash)
map("n", "<leader>tv", "<cmd>ToggleTerm direction=vertical<cr>", { desc = "Toggle Vertical Terminal" })
map("n", "<leader>th", "<cmd>ToggleTerm direction=horizontal<cr>", { desc = "Toggle Horizontal Terminal" })
map("n", "<leader>tf", "<cmd>ToggleTerm direction=float<cr>", { desc = "Toggle Float Terminal" })
map('t', '<C-q>', '<C-\\><C-n>:bd!<CR>', { noremap = true, silent = true })

-- Persistent Terminal
-- local toggle = require("jamjar").make("main")
-- vim.keymap.set({ "n", "t" }, "<c-;>", toggle, { desc = "toggle scratch terminal" })

vim.keymap.set(
  { "n", "t" },
  "<C-\\>",
  "<cmd>ToggleTerm direction=float<CR>",
  {
    desc = "Toggle terminal",
    silent = true,
  }
)

--Commenting
map("n", "<C-k>", function() require("Comment.api").toggle.linewise.current() end, { noremap = true, silent = true })

--  Visual Mode Mappings
map("v", "<C-k>", function()
  local esc = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
  vim.api.nvim_feedkeys(esc, 'nx', false)
  require("Comment.api").toggle.linewise(vim.fn.visualmode())
end, { noremap = true, silent = true })

-- COPY AND PASTE | dependencies:  wayland depends on wl-clipboard
vim.opt.clipboard = "unnamedplus"
map("v", "<C-S-c>", '"+y')
map("n", "<C-S-v>", '"+p')
map("i", "<C-S-v>", "<C-r>+")

-- Delete Buffer without breaking layout (plugin)
map("n", "<C-c>", "<cmd>Bdelete<cr>")

-- ============================================================================
-- AI / CODECOMPANION
-- ============================================================================

-- Action palette
map({ "n", "x" }, "<leader>ap", "<cmd>CodeCompanionActions<cr>", {
  desc = "AI action palette",
})

-- Toggle chat
map({ "n", "x" }, "<leader>ac", "<cmd>CodeCompanionChat Toggle<cr>", {
  desc = "Toggle AI chat",
})

map({ "n", "x" }, "<leader>aa", "<cmd>CodeCompanionChat Toggle<cr>", {
  desc = "Toggle AI chat",
})

map({ "n", "x" }, "<C-;>", "<cmd>CodeCompanionChat Toggle<cr>", {
  desc = "Toggle AI chat",
})

-- Ask about the visually selected code
map("x", "<leader>ae", "<cmd>CodeCompanion /explain<cr>", {
  desc = "Explain selected code",
})

-- Inline assistant for the current line or selection
map({ "n", "x" }, "<leader>ai", "<cmd>CodeCompanion<cr>", {
  desc = "AI inline assistant",
})

-- Open chat with the selected code
map("x", "<leader>as", "<cmd>CodeCompanionChat<cr>", {
  desc = "Chat about selection",
})

-- ============================================================================
-- CONTEXT SHORTCUTS INSIDE CODECOMPANION CHAT
-- ============================================================================

vim.api.nvim_create_autocmd("FileType", {
  pattern = "codecompanion",
  callback = function(event)
    local opts = {
      buffer = event.buf,
      -- buffer = true,
      silent = true,
      noremap = true,
    }

    -- Insert context tags into the chat prompt
    map("i", "<C-f>", "#{buffer}@{agent} ", vim.tbl_extend("force", opts, {
      desc = "Add current file",
    }))

    map("n", "<C-f>", "i#{buffer}@{agent} ", vim.tbl_extend("force", opts, {
      desc = "Add current file",
    }))

    map("i", "<cr>", "<C-\\><C-n>|", vim.tbl_extend("force", opts, {
      desc = "Add current file",
    }))

    map("i", "<C-d>", "#{diff} ", vim.tbl_extend("force", opts, {
      desc = "Add Git diff",
    }))

    map("i", "<C-e>", "#{diagnostics} ", vim.tbl_extend("force", opts, {
      desc = "Add diagnostics",
    }))

    map("i", "<C-t>", "#{terminal} ", vim.tbl_extend("force", opts, {
      desc = "Add terminal output",
    }))

    -- Use <C-g>, not <C-v>, because <C-v> is Visual Block mode in Vim
    map("i", "<C-g>", "#{viewport} ", vim.tbl_extend("force", opts, {
      desc = "Add visible code",
    }))

    map("i", "<C-b>", "#{buffers}@{agent} ", vim.tbl_extend("force", opts, {
      desc = "Add open buffers",
    }))

    -- More reliable than Ctrl-Enter across terminals
    map({ "i", "n" }, "<leader>s", "<C-s>", vim.tbl_extend("force", opts, {
      desc = "Send AI message",
    }))
  end,
})


-- ============================================================================
-- QUIT ALL
-- ============================================================================

vim.keymap.set("c", "<CR>", function()
  local command = vim.fn.getcmdline()

  if command == "q" then
    vim.fn.setcmdline("qa")
  elseif command == "wq" then
    vim.fn.setcmdline("wqa")
  elseif command == "wq!" then
    vim.fn.setcmdline("wqa!")
  elseif command == "q!" then
    vim.fn.setcmdline("qa!")
  end

  return "<CR>"
end, { expr = true, desc = "Make :q quit Neovim" })


-- ============================================================================
-- CUSTOM COMMANDS
-- ============================================================================
vim.api.nvim_create_user_command("BufOnly", function()
  local current = vim.api.nvim_get_current_buf()

  for _, bufnr in ipairs(vim.api.nvim_list_bufs()) do
    if bufnr ~= current and vim.api.nvim_buf_is_loaded(bufnr) then
      vim.api.nvim_buf_delete(bufnr, { force = false })
    end
  end
end, {
  desc = "Close all buffers except the current one",
})


