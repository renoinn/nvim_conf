-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  -- init = function()
  --   vim.api.nvim_create_autocmd("FileType", {
  --     pattern = { "<filetype>" },
  --     callback = function() vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()" end,
  --   })
  -- end,
  opts = function(_, opts)
    opts.ensure_installed = {
      "lua",
      "vim",
      "go",
      "javascript",
      "typescript",
      -- add more arguments for adding more treesitter parsers
    }
  end,
}
