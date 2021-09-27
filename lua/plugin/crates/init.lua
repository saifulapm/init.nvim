return {
  "Saecki/crates.nvim",
  after = "rust-tools.nvim",
  config = function()
    require("plugin.crates.config")
  end,
  cond = function()
    return vim.fn.expand("%:t") == "Cargo.toml"
  end,
}
