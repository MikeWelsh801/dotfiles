return {
    'nvim-telescope/telescope.nvim',
    event = "CursorMoved",
    tag = '0.1.4',
    -- or                            , branch = '0.1.x',
    dependencies = { { 'nvim-lua/plenary.nvim' } },
    config = function()
        -- telescope
        local builtin = require('telescope.builtin')
        vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
        vim.keymap.set('n', '<C-p>', builtin.git_files, {})
        vim.keymap.set('n', '<leader>fg', builtin.live_grep, {})
        vim.keymap.set('n', '<leader>ps', function()
            builtin.grep_string({ search = vim.fn.input("Grep > ") });
        end)
        vim.keymap.set('n', '<leader>td', ':TodoTelescope<cr>', { silent = true })

        require('telescope').setup {
            defaults = {
                mappings = {
                    i = {
                        -- change split vertical mapping, so it doesn't conflict
                        -- with pasting (Ctrl-v)
                        ["<C-s>"] = "select_vertical"
                    }
                }
            },
        }
    end
}
