-- vim.api.nvim_open_win;

ChangeTheme = function()
  local height = vim.api.nvim_win_get_height(0)
  local width = vim.api.nvim_win_get_width(0)
  local buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, Options)
  vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
  -- vim.api.nvim_set_option_value('readonly', true, { buf = buf })

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "win",
    row = math.floor(height / 3),
    col = math.floor(width / 3),
    width = math.floor(width / 3),
    height = math.floor(height / 3),
    border = "single",
    anchor = "NW",
    style = "minimal",
  })

  vim.keymap.set("n", "<CR>", function()
    -- 1. Get the line text under the cursor
    local choice = vim.api.nvim_get_current_line()

    -- 2. Close the window
    vim.api.nvim_win_close(win, true)

    -- 3. Do something with the choice
    print("You selected: " .. choice)
    LoadTheme(choice)
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
  local close_keys = { "q", "<Esc>" }
  for _, key in ipairs(close_keys) do
    vim.keymap.set("n", key, "<cmd>close<CR>", { buffer = buf, silent = true })
  end
  vim.api.nvim_set_option_value("cursorline", true, { win = win })

  -- vim.api.nvim_set_option_value('winhl', 'Normal:MyHighlight', { win = win })
  vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
      if win and vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_set_config(win, {
          relative = "editor",
          row = math.floor(vim.o.lines / 3),
          col = math.floor(vim.o.columns / 3),
          width = math.floor(vim.o.columns / 3),
          height = math.floor(vim.o.lines / 3),
        })
      end
    end,
  })
end

vim.keymap.set("n", "<leader>tt", ChangeTheme, { desc = "Change theme" })

---@class buffWin
---@field buf integer|nil
---@field win integer|nil

---@type buffWin
local run_term = {
  buf = nil,
  win = nil,
}

---@param buffWin buffWin
local deleteBufWin = function(buffWin)
  return function() --TODO: may be reuse the buffer instead??????
    vim.schedule(function()
      if buffWin.win and vim.api.nvim_win_is_valid(buffWin.win) then
        vim.api.nvim_win_close(buffWin.win, true)
      end
      if buffWin.buf and vim.api.nvim_buf_is_valid(buffWin.buf) then
        vim.api.nvim_buf_delete(buffWin.buf, { force = true })
      end
      buffWin.buf = nil
      buffWin.win = nil
      -- buffWin.job = nil
    end)
  end
end

Run = function()
  if run_term.buf ~= nil and vim.api.nvim_buf_is_loaded(run_term.buf) then
    local wins = vim.fn.win_findbuf(run_term.buf)
    if #wins == 0 then
      print("buffer was hidden")
      vim.cmd("vsplit")
      vim.api.nvim_set_current_buf(run_term.buf)
      run_term.buf = vim.api.nvim_get_current_buf()
      run_term.win = vim.api.nvim_get_current_win()
      return
    end
    vim.api.nvim_win_hide(run_term.win)
    -- vim.api.nvim_set_current_buf(run_term.buf)
    return
  end

  local filename = vim.api.nvim_buf_get_name(0)
  -- Create a vertical split
  local ft = vim.bo.filetype
  vim.cmd("vnew")
  run_term.buf = vim.api.nvim_get_current_buf()
  run_term.win = vim.api.nvim_get_current_win()

  -- Launch the terminal in the current (new) window
  if ft == "python" then
    print(string.format("python %s", filename))
    vim.fn.jobstart({ "python", filename }, {
      term = true,

      on_exit = function()
        deleteBufWin(run_term)
      end,
    })
  else
    vim.fn.jobstart("make", {
      term = true,
      on_exit = function()
        deleteBufWin(run_term)
      end,
    })
  end
  -- Optional: Auto-scroll to the bottom as it runs
  vim.cmd("startinsert")
  vim.cmd("stopinsert")
end
vim.keymap.set("n", "<leader>rr", Run, { desc = "Run" })

---@type buffWin
local run_custom_term = {
  buf = nil,
  win = nil,
}

local custom_percentage = 0.4 --40%

---@param cmd string|nil
RunCustom = function(cmd)
  -- check if already window exists
  if run_custom_term.buf ~= nil and vim.api.nvim_buf_is_loaded(run_custom_term.buf) then
    local wins = vim.fn.win_findbuf(run_custom_term.buf)

    -- buffer is hidden
    if #wins == 0 then
      vim.cmd("vsplit")
      vim.cmd("vertical resize " .. math.floor(vim.o.columns * custom_percentage))
      vim.api.nvim_set_current_buf(run_custom_term.buf)
      -- run_custom_term.buf = vim.api.nvim_get_current_buf()
      run_custom_term.win = vim.api.nvim_get_current_win()
      vim.cmd("startinsert")
      return
    end

    -- hide buffer
    vim.api.nvim_win_hide(run_custom_term.win)
    return
  end

  if cmd == nil then
    cmd = vim.fn.input("Enter what to run: ")
  end

  -- Create a vertical split
  vim.cmd("vnew")
  vim.cmd("vertical resize " .. math.floor(vim.o.columns * custom_percentage))
  run_custom_term.buf = vim.api.nvim_get_current_buf()
  run_custom_term.win = vim.api.nvim_get_current_win()

  -- Launch the terminal in the current (new) window
  vim.fn.jobstart(cmd, {
    term = true,
    on_exit = function()
      deleteBufWin(run_custom_term)
    end,
  })
  -- Optional: Auto-scroll to the bottom as it runs
  vim.cmd("startinsert")
end

function RunShell()
  RunCustom("fish")
end
vim.keymap.set({ "n", "i", "t" }, "<C-\\>", RunShell, { desc = "Run shell (fish)" })
vim.keymap.set("n", "<leader>rc", RunCustom, { desc = "Run Custom" })

function ReadDir()
  local uv = vim.uv or vim.loop
  uv.fs_opendir("/home/joeljm/mine", function(err, dir)
    if err then
      print("error opening file ")
      return
    end
    local readDirs
    ---@param tb uv.fs_readdir.entry[][]
    readDirs = function(tb)
      uv.fs_readdir(dir, function(err, entries)
        if err then
          print("error opening file :", err)
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
              print("error opening file ", close_err)
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
  local options = { "Minimal", "Tokyo-night" }

  local height = vim.api.nvim_win_get_height(0)
  local width = vim.api.nvim_win_get_width(0)
  local buf = vim.api.nvim_create_buf(false, true)

  vim.api.nvim_buf_set_lines(buf, 0, -1, false, options)
  vim.api.nvim_set_option_value("modifiable", false, { buf = buf })
  -- vim.api.nvim_set_option_value('readonly', true, { buf = buf })

  local win = vim.api.nvim_open_win(buf, true, {
    relative = "win",
    row = math.floor(height / 3),
    col = math.floor(width / 3),
    width = math.floor(width / 3),
    height = math.floor(height / 3),
    border = "single",
    anchor = "NW",
    style = "minimal",
  })

  vim.keymap.set("n", "<CR>", function()
    local choice = vim.api.nvim_get_current_line()
    vim.api.nvim_win_close(win, true)
    vim.cmd(string.format("source %s", choice))

    if choice == "Option A" then
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
  local close_keys = { "q", "<Esc>" }
  for _, key in ipairs(close_keys) do
    vim.keymap.set("n", key, "<cmd>close<CR>", { buffer = buf, silent = true })
  end
  vim.api.nvim_set_option_value("cursorline", true, { win = win })

  -- vim.api.nvim_set_option_value('winhl', 'Normal:MyHighlight', { win = win })
  vim.api.nvim_create_autocmd("VimResized", {
    callback = function()
      if win and vim.api.nvim_win_is_valid(win) then
        vim.api.nvim_win_set_config(win, {
          relative = "editor",
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
  vim.ui.input({ prompt = "this is a test " }, function(inp)
    print(inp)
  end)
end
