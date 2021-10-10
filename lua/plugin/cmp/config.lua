local cmp = require("cmp")

cmp.setup({
  completion = {
    completeopt = "menu,menuone,preview,noinsert",
  },
  snippet = {
    expand = function(args)
      require("luasnip").lsp_expand(args.body)
    end,
  },
  documentation = {
    border = require("helper.border").rounded,
    maxwidth = 80,
  },
  mapping = require("plugin.cmp.keymap").setup(cmp),
  formatting = {
    format = function(entry, vim_item)
      vim_item.kind = require("lsp.ui.completion").kind({
        text = true,
        icon = "default",
      })[vim_item.kind]

      vim_item.menu = ({
        nvim_lsp = "[LSP]",
        nvim_lua = "[Neovim Lua]",
        luasnip = "[LuaSnip]",
        buffer = "[Buffer]",
        path = "[Path]",
      })[entry.source.name]

      return vim_item
    end,
  },
  experimental = { ghost_text = true },
  sources = {
    { name = "nvim_lsp", max_item_count = 10 },
    { name = "nvim_lua", max_item_count = 5 },
    { name = "luasnip", max_item_count = 5 },
    { name = "buffer", max_item_count = 5 },
    { name = "path", max_item_count = 10 },
  },
})
