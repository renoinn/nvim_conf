return {
  {
    "NMAC427/guess-indent.nvim",
    cmd = "GuessIndent",
    event = {
      "BufReadPost",
      "BufNewFile",
      "BufWritePost",
    },
    opts = function(_, opts) opts.auto_cmd = true end,
  },
}
