return {
      -- You can also add new plugins here as well:
      -- Add plugins, the lazy syntax
      -- "andweeb/presence.nvim",
      -- {
      --   "ray-x/lsp_signature.nvim",
      --   event = "BufRead",
      --   config = function()
      --     require("lsp_signature").setup()
      --   end,
      -- },
      {
            "olivercederborg/poimandres.nvim",
            name = "poimandres",
            config = function()
                  require("poimandres").setup()
            end,
      },
      {
            "nvim-lualine/lualine.nvim",
            name = "lualine",
            lazy = false,
            dependencies = {"nvim-tree/nvim-web-devicons"},
            config = function()
                  require("lualine").setup({})
            end,
      },
      -- {
      --       'akinsho/git-conflict.nvim',
      --       name = "git-conflict-resolver",
      --       lazy = false,
      --       config = function ()
      --             require("git-conflict").setup({})
      --       end
      -- },{
      "jay-babu/mason-null-ls.nvim",
      opts = {
            handlers = {
                  -- for prettierd
                  prettierd = function()
                        require("null-ls").register(require("null-ls").builtins.formatting.prettierd.with {
                              condition = function(utils)
                                    return utils.root_has_file "package.json"
                                          or utils.root_has_file ".prettierrc"
                                          or utils.root_has_file ".prettierrc.json"
                                          or utils.root_has_file ".prettierrc.js"
                              end,
                        })
                  end,
                  -- For eslint_d:
                  eslint_d = function()
                        require("null-ls").register(require("null-ls").builtins.diagnostics.eslint_d.with {
                              condition = function(utils)
                                    return utils.root_has_file "package.json"
                                          or utils.root_has_file ".eslintrc.json"
                                          or utils.root_has_file ".eslintrc.js"
                              end,
                        })
                  end,
            },
      },
      {
            "tpope/vim-surround",
            name = "vim-surround",
            lazy = false,
      }
}
