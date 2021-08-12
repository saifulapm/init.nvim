local M = {}

local augroup = require("util.event.augroup")

function M.attach(client)
  augroup.setup({
    ["HighlightOnCursor"] = {
      expect = client.resolved_capabilities.document_highlight,
      filter = "<buffer>",
      {
        events = "CursorHold",
        cmd = "lua vim.lsp.buf.document_highlight()"
      },
      {
        events = "CursorHoldI",
        cmd = "lua vim.lsp.buf.document_highlight()"
      },
      {
        events = "CursorMoved",
        cmd = "lua vim.lsp.buf.clear_references()"
      },
    },
    ["CodelensOnInsert"] = {
      expect = client.resolved_capabilities.code_lens,
      events = "BufEnter,CursorHold,InsertEnter,InsertLeave",
      filter = "<buffer>",
      { cmd = "lua vim.lsp.codelens.refresh()" }
    },
  })
end

return M
