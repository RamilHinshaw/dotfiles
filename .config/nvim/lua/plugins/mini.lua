-- mini.nvim — we use `mini.animate` for smooth scrolling + transitions.
--
-- A single `mini.animate.setup()` handles everything with no extra mappings:
--   * scroll  : splits every vertical scroll into small subscrolls (smooth scrolling).
--               Your remapped <C-d>/<C-u>/<C-f>/<C-b> and J/K become smooth for free;
--               single-line scrolls stay instant so it never feels sluggish.
--   * cursor  : animates cursor movement (gg, G, n/N, word jumps, ...).
--   * resize  : smoothly animates window/split resizing.
--   * open/close : fade-in/out when windows (splits) are opened/closed.
--
-- Loaded eagerly (no lazy triggers) so animations are active from startup.
return {
    {
        'echasnovski/mini.nvim',
        version = '*',
        config = function()
            local animate = require('mini.animate')

            animate.setup({
                -- Smooth scrolling
                scroll = {
                    enable = true,
                    timing = animate.gen_timing.linear({ duration = 250, unit = 'total' }),
                    -- Raise max_output_steps (e.g. 120) for an even smoother glide.
                    subscroll = animate.gen_subscroll.equal({ max_output_steps = 60 }),
                },

                -- Animate cursor movement inside the buffer
                cursor = {
                    enable = true,
                    timing = animate.gen_timing.linear({ duration = 150, unit = 'total' }),
                    path = animate.gen_path.line(),
                },

                -- Smooth window resize transitions
                resize = {
                    enable = true,
                    timing = animate.gen_timing.linear({ duration = 200, unit = 'total' }),
                },

                -- Fade for opening/closing windows (splits)
                open = {
                    enable = true,
                    timing = animate.gen_timing.linear({ duration = 300, unit = 'total' }),
                },
                close = {
                    enable = true,
                    timing = animate.gen_timing.linear({ duration = 300, unit = 'total' }),
                },
            })
        end,
    },
}
