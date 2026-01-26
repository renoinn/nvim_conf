-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  build = ':TSUpdate',
  opts = function(_, opts)
    opts.ensure_installed = {
      "lua",
      "vim",
      "go",
      "javascript",
      "typescript",
      -- add more arguments for adding more treesitter parsers
    }
    opts.auto_install = true
    return opts
  end,
}
