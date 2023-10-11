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
            "nvim-telescope/telescope.nvim",
            dependencies = {
                  "nvim-lua/popup.nvim",
                  "nvim-lua/plenary.nvim",
                  "nvim-telescope/telescope-live-grep-args.nvim",
                  "nvim-telescope/telescope-media-files.nvim"
            },
            -- the first parameter is the plugin specification
            -- the second is the table of options as set up in Lazy with the `opts` key
            config = function(plugin, opts)
                  -- run the core AstroNvim configuration function with the options table
                  require("plugins.configs.telescope")(plugin, opts)

                  -- require telescope and load extensions as necessary
                  local telescope = require "telescope"
                  local lga_actions = require "telescope-live-grep-args.actions"
                  telescope.setup {
                        extensions = {
                              live_grep_args = {
                                    mappings = {
                                          i = {
                                                ["<C-k>"] = lga_actions.quote_prompt(),
                                                ["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
                                          }
                                    }
                              },
                              media_files = {
                                    find_cmd = "rg"
                              }
                        }
                  }
                  telescope.load_extension "media_files"
                  telescope.extensions.live_grep_args.live_grep_args()
            end,
      },
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
      -- },
      {
            "jay-babu/mason-null-ls.nvim",
            opts = {
                  handlers = {
                        -- for prettierd
                        prettierd = function()
                              require("null-ls").register(require("null-ls").builtins.formatting.prettierd)
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
      },
      {
            "folke/trouble.nvim",
            dependencies = { "nvim-tree/nvim-web-devicons" },
      },
      {
            "sindrets/diffview.nvim"
      }
}
