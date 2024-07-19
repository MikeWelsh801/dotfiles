return {
  -- 'feline-nvim/feline.nvim',
  'tjdevries/express_line.nvim',
  config = function()
    -- statusbar
    -- local gruvbox = {
    --     fg = '#928374',
    --     bg = '#1F2223',
    --     black = '#1B1B1B',
    --     skyblue = '#458588',
    --     cyan = '#83a597',
    --     green = '#689d6a',
    --     oceanblue = '#2a3500',
    --     magenta = '#fb4934',
    --     orange = '#fabd2f',
    --     red = '#cc241d',
    --     violet = '#b16286',
    --     white = '#ebdbb2',
    --     yellow = '#d79921',
    -- }
    require('gitsigns').setup()

    local extensions = require('el.extensions')
    local subscribe = require('el.subscribe')
    local diagnostics = require('el.diagnostic')

    local generator = function()
      local el_segments = {}

      -- vim mode
      table.insert(el_segments, extensions.mode)
      -- line/col number
      table.insert(el_segments, " [%3l,%3c] ")

      -- formatting for diagnostics
      local formatter = function(_, _, counts)
        local diag = ""

        local errors = counts["errors"]
        if errors ~= 0 then
          diag = diag .. "  " .. errors
        end

        local warnings = counts["warnings"]
        if warnings ~= 0 then
          diag = diag .. '  ' .. warnings
        end

        local hints = counts["hints"]
        if hints ~= 0 then
          diag = diag .. '  ' .. hints
        end

        local infos = counts["infos"]
        if infos ~= 0 then
          diag = diag .. ' » ' .. infos
        end

        return diag
      end

      -- diagnostics
      table.insert(el_segments,
        subscribe.buf_autocmd(
          "el_diagnostic",
          "BufWritePost",
          diagnostics.make_buffer(formatter)))

      -- move to middle
      table.insert(el_segments, "%=")

      -- icon
      table.insert(el_segments,
        subscribe.buf_autocmd(
          "el_file_icon",
          "BufRead",
          function(_, buffer)
            return extensions.file_icon(_, buffer)
          end
        ))

      local builtin = require('el.builtin')
      -- file name and modified flag
      table.insert(el_segments, " %t %m ")
      -- move to end
      table.insert(el_segments, "%=")

      -- git branch
      table.insert(el_segments,
        subscribe.buf_autocmd(
          "el_git_branch",
          "BufEnter",
          function(window, buffer)
            local branch = extensions.git_branch(window, buffer)
            if branch then
              return " " .. branch
            end
          end
        ))

      -- git changes
      table.insert(el_segments, " ")
      table.insert(el_segments,
        subscribe.buf_autocmd(
          "el_git_status",
          "BufWritePost",
          function(window, buffer)
            local changes = extensions.git_changes(window, buffer)
            if changes then
              return changes
            end
          end
        ))

      -- readonly_flag and percentage_through_file
      table.insert(el_segments, builtin.readonly_flag)
      table.insert(el_segments, builtin.percentage_through_window .. " ")

      return el_segments
    end

    require('el').setup({ generator = generator })

    vim.keymap.set("n", "<C-s>", function()
      ToggleStatusbar()
    end)

    local status = 3

    function ToggleStatusbar()
      if status == 3 then
        status = 0
      else
        status = 3
      end
      vim.cmd("set laststatus=" .. status .. " ruler")
    end
  end
}
