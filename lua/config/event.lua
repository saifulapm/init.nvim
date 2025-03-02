local augroup = require("sugar.augroup")

augroup("TrimAndMakeDir", function(autocmd)
  autocmd("BufWritePre", "*", {
    function()
      local cursor = vim.api.nvim_win_get_cursor(0)
      vim.cmd([[:%s/\s\+$//e]])
      vim.api.nvim_win_set_cursor(0, cursor)
    end,
    function()
      require("helper.dir").mk()
    end,
  })
end)

augroup("HighlightOnYank", function(autocmd)
  autocmd("TextYankPost", "*", function()
    vim.highlight.on_yank()
  end)
end)

augroup("CursorlineOnCurrentWindow", function(autocmd)
  autocmd({ "BufEnter", "WinEnter" }, "*", function()
    vim.api.nvim_win_set_option(0, "cursorline", not vim.w.nocursorline)
  end)
  autocmd({ "BufLeave", "WinLeave" }, "*", function()
    vim.api.nvim_win_set_option(0, "cursorline", false)
  end)
end)

augroup("RelativeNumberOnCurrentWindow", function(autocmd)
  autocmd({ "BufEnter", "WinEnter" }, "*", function()
    if vim.api.nvim_win_get_option(0, "number") then
      vim.api.nvim_win_set_option(0, "relativenumber", true)
    end
  end)
  autocmd({ "BufLeave", "WinLeave" }, "*", function()
    vim.api.nvim_win_set_option(0, "relativenumber", false)
  end)
end)

augroup("OnTerminalBuffer", function(autocmd)
  autocmd("TermOpen", "*", {
    function()
      if vim.api.nvim_buf_get_option(0, "filetype") == "" then
        vim.api.nvim_buf_set_option(0, "filetype", "terminal")
      end
    end,
    "startinsert",
  })
end)

augroup("SetTabLine", function(autocmd)
  autocmd("TabNew", "*", function()
    local value = [[%{%v:lua.require("config.option.tabline").draw()%}]]
    vim.api.nvim_set_option("tabline", value)
  end)
end)

augroup("SetSynMaxCol", function(autocmd)
  autocmd("OptionSet", "textwidth", function()
    vim.api.nvim_buf_set_option(0, "synmaxcol", tonumber(vim.v.option_new))
  end)
  autocmd("BufEnter", "*", function()
    local textwidth = vim.api.nvim_buf_get_option(0, "textwidth")
    vim.api.nvim_buf_set_option(0, "synmaxcol", tonumber(textwidth))
  end)
end)

augroup("MacroRecording", function(autocmd)
  local opts = { title = "Macro", icon = "", timeout = 250 }
  autocmd("RecordingEnter", "*", function()
    local msg = (" 壘Recording @%s"):format(vim.fn.reg_recording())
    vim.notify(msg, vim.log.levels.INFO, opts)
  end)
  autocmd("RecordingLeave", "*", function()
    local msg = ("  Recorded @%s"):format(vim.v.event.regname)
    vim.notify(msg, vim.log.levels.INFO, opts)
  end)
end)
