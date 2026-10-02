return {
    {'tpope/vim-fugitive'},
    {
        'lewis6991/gitsigns.nvim',
        opts = {
            current_line_blame = true,
            current_line_blame_opts = {
                virt_text = true,
                virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
                delay = 300,
                ignore_whitespace = true,
                virt_text_priority = 100,
                use_focus = true,
            }
        },
    },
}
