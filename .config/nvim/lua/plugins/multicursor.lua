return {
  "jake-stewart/multicursor.nvim",
  branch = "1.0",
  config = function()
    local mc = require("multicursor-nvim")
    mc.setup()

    local set = vim.keymap.set

    -- Add cursors above/below
    set({ "n", "x" }, "<up>", function()
      mc.lineAddCursor(-1)
    end)

    set({ "n", "x" }, "<down>", function()
      mc.lineAddCursor(1)
    end)

    -- Add cursors for matching words
    set({ "n", "x" }, "<leader>n", function()
      mc.matchAddCursor(1)
    end)

    set({ "n", "x" }, "<leader>N", function()
      mc.matchAddCursor(-1)
    end)

    -- Skip matching words
    set({ "n", "x" }, "<leader>s", function()
      mc.matchSkipCursor(1)
    end)

    set({ "n", "x" }, "<leader>S", function()
      mc.matchSkipCursor(-1)
    end)

    -- Enable/disable cursors
    set({ "n", "x" }, "<C-q>", mc.toggleCursor)

    -- Keymaps active only while multiple cursors exist
    mc.addKeymapLayer(function(layerSet)
      set({ "n", "x" }, "<Left>", mc.prevCursor)
      set({ "n", "x" }, "<Right>", mc.nextCursor)

      layerSet({ "n", "x" }, "<leader>x", mc.deleteCursor)

      layerSet("n", "<Esc>", function()
        if not mc.cursorsEnabled() then
          mc.enableCursors()
        else
          mc.clearCursors()
        end
      end)
    end)
  end,
}

