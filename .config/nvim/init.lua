--
-- ################################################################################################################
--
-- 8888888b.                         d8b 888      888    888 d8b                   888                             
-- 888   Y88b                        Y8P 888      888    888 Y8P                   888                             
-- 888    888                            888      888    888                       888                             
-- 888   d88P  8888b.  88888b.d88b.  888 888      8888888888 888 88888b.  .d8888b  88888b.   8888b.  888  888  888 
-- 8888888P"      "88b 888 "888 "88b 888 888      888    888 888 888 "88b 88K      888 "88b     "88b 888  888  888 
-- 888 T88b   .d888888 888  888  888 888 888      888    888 888 888  888 "Y8888b. 888  888 .d888888 888  888  888 
-- 888  T88b  888  888 888  888  888 888 888      888    888 888 888  888      X88 888  888 888  888 Y88b 888 d88P 
-- 888   T88b "Y888888 888  888  888 888 888      888    888 888 888  888  88888P' 888  888 "Y888888  "Y8888888P"  
-- 
-- ================================================================================================================
--
--  Ramil Hinshaw's nvim Config 2026 | rev 1.0
--
--	Website:  www.RamilHinshaw.com
--  GitHub:   https://github.com/RamilHinshaw
--  Twitter:  https://twitter.com/RamilHinshaw
--
-- ################################################################################################################

-- Load custom options
require("config.options")

-- Bootstrap lazy.nvim (loads all plugins from lua/plugins)
require("config.lazy")

-- Load custom Keymaps
require("config.keymaps")

-- # SET COLORSCHEME HERE # --
vim.cmd.colorscheme("ember")

require("config.post_ai_setup")
-- require("config.post_autostart")
