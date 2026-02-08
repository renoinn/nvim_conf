vim.lsp.config("lua_ls", {
  on_init = function(client)
    if client.workspace_folders then
      local path = client.workspace_folders[1].name
      if
        path ~= vim.fn.stdpath "config"
        and (vim.uv.fs_stat(path .. "/.luarc.json") or vim.uv.fs_stat(path .. "/.luarc.jsonc"))
      then
        return
      end
    end

    client.config.settings.Lua = vim.tbl_deep_extend("force", client.config.settings.Lua, {
      runtime = {
        version = "LuaJIT",
        path = {
          "lua/?.lua",
          "lua/?/init.lua",
          vim.fn.expand "~/.luarocks/share/lua/5.3/?.lua",
          vim.fn.expand "~/.luarocks/share/lua/5.3/?/init.lua",
          "/usr/share/5.3/?.lua",
          "/usr/share/lua/5.3/?/init.lua",
        },
      },
      workspace = {
        checkThirdParty = false,
        -- library = {
        --   vim.env.VIMRUNTIME,
        --   -- Depending on the usage, you might want to add additional paths
        --   -- here.
        --   "${3rd}/luv/library",
        --   "${3rd}/busted/library",
        --   "${3rd}/luassert/library",
        --   vim.fn.expand "~/.luarocks/share/lua/5.3",
        --   "/usr/share/lua/5.3",
        -- },
        -- See https://github.com/neovim/nvim-lspconfig/issues/3189
        library = vim.api.nvim_get_runtime_file("", true),
      },
    })
  end,
  settings = {
    Lua = {},
  },
})

return {}
