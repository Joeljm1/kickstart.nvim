-- vim.api.nvim_open_win;

ChangeTheme = function()
  local options = { 'Minimal', 'Tokyo-night' }

  local height = vim.api.nvim_win_get_height(0)
  local width = vim.api.nvim_win_get_width(0)
  local buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, options)
  vim.api.nvim_set_option_value('modifiable', false, { buf = buf })
  -- vim.api.nvim_set_option_value('readonly', true, { buf = buf })

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'win',
    row = math.floor(height / 3),
    col = math.floor(width / 3),
    width = math.floor(width / 3),
    height = math.floor(height / 3),
    border = 'single',
    anchor = 'NW',
    style = 'minimal',
  })

  vim.keymap.set('n', '<CR>', function()
    -- 1. Get the line text under the cursor
    local choice = vim.api.nvim_get_current_line()

    -- 2. Close the window
    vim.api.nvim_win_close(win, true)

    -- 3. Do something with the choice
    print('You selected: ' .. choice)
    if choice == options[1] then
      LoadTheme(true)
    else
      LoadTheme(false)
    end

    if choice == 'Option A' then
      -- Trigger specific logic for A
    end
  end, { buffer = buf, noremap = true, silent = true })

  -- vim.keymap.set('n', 'w', function()
  --   -- 1. Get the line text under the cursor
  --   local choice = vim.api.nvim_get_current_line()
  --
  --   table.insert(options, 'Hello')
  --   vim.api.nvim_set_option_value('modifiable', true, { buf = buf })
  --   vim.api.nvim_buf_set_lines(buf, 0, -1, false, options)
  --   vim.api.nvim_set_option_value('modifiable', false, { buf = buf })
  -- end, { buffer = buf, noremap = true, silent = true })

  -- Extra: Map 'q' or 'Esc' to close the menu without choosing
  local close_keys = { 'q', '<Esc>' }
  for _, key in ipairs(close_keys) do
    vim.keymap.set('n', key, '<cmd>close<CR>', { buffer = buf, silent = true })
  end
  vim.api.nvim_set_option_value('cursorline', true, { win = win })

  -- vim.api.nvim_set_option_value('winhl', 'Normal:MyHighlight', { win = win })
  vim.api.nvim_create_autocmd('VimResized', {
    callback = function()
      if win and vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_set_config(win, {
          relative = 'editor',
          row = math.floor(vim.o.lines / 3),
          col = math.floor(vim.o.columns / 3),
          width = math.floor(vim.o.columns / 3),
          height = math.floor(vim.o.lines / 3),
        })
      end
    end,
  })
end

vim.keymap.set('n', '<leader>tt', ChangeTheme, { desc = 'Change theme' })

Run = function()
  -- Create a vertical split
  local ft = vim.bo.filetype
  local name = vim.api.nvim_buf_get_name(0)
  vim.cmd 'vnew'

  -- Launch the terminal in the current (new) window
  if ft == 'python' then
    vim.fn.jobstart(string.format('python %s', name), {
      term = true,
    })
  else
    vim.fn.jobstart('make', {
      term = true,
    })
  end
  -- Optional: Auto-scroll to the bottom as it runs
  vim.cmd 'startinsert'
end
vim.keymap.set('n', '<leader>rr', Run, { desc = 'Run' })

RunCustom = function()
  -- Create a vertical split
  vim.cmd 'vnew'

  local cmd = vim.fn.input 'Enter what to run: '

  -- Launch the terminal in the current (new) window
  vim.fn.jobstart(cmd, {
    term = true,
  })
  -- Optional: Auto-scroll to the bottom as it runs
  vim.cmd 'startinsert'
end

vim.keymap.set('n', '<leader>rc', RunCustom, { desc = 'Run Custom' })

function ReadDir()
  local uv = vim.uv or vim.loop
  uv.fs_opendir('/home/joeljm/mine', function(err, dir)
    if err then
      print 'error opening file '
      return
    end
    local readDirs
    ---@param tb uv.fs_readdir.entry[][]
    readDirs = function(tb)
      uv.fs_readdir(dir, function(err, entries)
        if err then
          print('error opening file :', err)
          uv.fs_closedir(dir)
          return
        elseif entries then
          tb[#tb + 1] = entries
          readDirs(tb)
        else
          vim.schedule(function()
            print(vim.inspect(tb))
          end)
          uv.fs_closedir(dir, function(close_err)
            if close_err then
              print('error opening file ', close_err)
              uv.fs_closedir(dir)
            end
          end)
        end
      end)
    end
    local tb = {}
    readDirs(tb)
  end)
end

SessManage = function()
  local options = { 'Minimal', 'Tokyo-night' }

  local height = vim.api.nvim_win_get_height(0)
  local width = vim.api.nvim_win_get_width(0)
  local buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, options)
  vim.api.nvim_set_option_value('modifiable', false, { buf = buf })
  -- vim.api.nvim_set_option_value('readonly', true, { buf = buf })

  local win = vim.api.nvim_open_win(buf, true, {
    relative = 'win',
    row = math.floor(height / 3),
    col = math.floor(width / 3),
    width = math.floor(width / 3),
    height = math.floor(height / 3),
    border = 'single',
    anchor = 'NW',
    style = 'minimal',
  })

  vim.keymap.set('n', '<CR>', function()
    local choice = vim.api.nvim_get_current_line()
    vim.api.nvim_win_close(win, true)
    vim.cmd(string.format('source %s', choice))

    if choice == 'Option A' then
      -- Trigger specific logic for A
    end
  end, { buffer = buf, noremap = true, silent = true })

  -- vim.keymap.set('n', 'w', function()
  --   -- 1. Get the line text under the cursor
  --   local choice = vim.api.nvim_get_current_line()
  --
  --   table.insert(options, 'Hello')
  --   vim.api.nvim_set_option_value('modifiable', true, { buf = buf })
  --   vim.api.nvim_buf_set_lines(buf, 0, -1, false, options)
  --   vim.api.nvim_set_option_value('modifiable', false, { buf = buf })
  -- end, { buffer = buf, noremap = true, silent = true })

  -- Extra: Map 'q' or 'Esc' to close the menu without choosing
  local close_keys = { 'q', '<Esc>' }
  for _, key in ipairs(close_keys) do
    vim.keymap.set('n', key, '<cmd>close<CR>', { buffer = buf, silent = true })
  end
  vim.api.nvim_set_option_value('cursorline', true, { win = win })

  -- vim.api.nvim_set_option_value('winhl', 'Normal:MyHighlight', { win = win })
  vim.api.nvim_create_autocmd('VimResized', {
    callback = function()
      if win and vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_set_config(win, {
          relative = 'editor',
          row = math.floor(vim.o.lines / 3),
          col = math.floor(vim.o.columns / 3),
          width = math.floor(vim.o.columns / 3),
          height = math.floor(vim.o.lines / 3),
        })
      end
    end,
  })
end

Test2 = function()
  vim.ui.input({ prompt = 'this is a test ' }, function(inp)
    print(inp)
  end)
end
