return {
    "folke/snacks.nvim",
    priority = 1000,
    lazy = false,
    ---@type snacks.Config
    opts = {
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
        bigfile = { enabled = true },
        explorer = { enabled = true },
        -- input = { enabled = true },
        image = { enabled = true },
        picker = { enabled = true },
        quickfile = { enabled = true },
        -- scroll = { enabled = true },
    },
    keys = {
        { "<leader>pf", function() Snacks.picker.files() end,                                   desc = "Smart Find Files" },
        { "<leader>ff", function() Snacks.picker.smart() end,                                   desc = "Smart Find Files" },
        { "<leader>fg", function() Snacks.picker.grep() end,                                    desc = "Grep" },
        { "<leader>fc", function() Snacks.picker.files({ cwd = vim.fn.stdpath("config") }) end, desc = "Find Config File" },
        { "<leader>td", function() Snacks.picker.todo_comments() end,                           desc = "Todo" },
        { "<leader>km", function() Snacks.picker.keymaps() end,                                 desc = "Keymaps" },
        { "<C-p>",      function() Snacks.picker.git_files() end,                               desc = "Find Git Files" },
        { "<leader>fr", function() Snacks.picker.recent() end,                                  desc = "Recent" },
        { "<leader>tt", function() Snacks.picker.explorer() end,                                  desc = "Explorer" },
    },
}
