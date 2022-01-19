local M = {}

function M.setup(arg)
  local opts = arg or {}
  local foreground = opts.fg or "blue"
  local lsp = require("lsp-status")
  return {
    server = {
      function()
        local buf_ft = vim.api.nvim_buf_get_option(0, "filetype")
        local clients = vim.lsp.get_active_clients()
        if not next(clients) then
          return nil
        end
        -- FIXME: avoid loop for get the active client (?)
        for _, client in ipairs(clients) do
          local filetypes = client.config.filetypes
          if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
            return client.name
          end
        end
        return nil
      end,
      color = { fg = foreground, gui = "BOLD" },
    },
    status = {
      function()
        return lsp.status()
      end,
      cond = function()
        local width = vim.api.nvim_win_get_width(0) - #lsp.status()
        local client_attached = #vim.lsp.buf_get_clients() > 0
        local status_not_empty = lsp.status() ~= " "
        return width > 99 and client_attached and status_not_empty
      end,
      color = { fg = foreground, gui = "BOLD" },
      padding = 0,
    },
  }
end

return M
