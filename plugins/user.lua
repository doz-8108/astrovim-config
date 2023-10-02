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
            dependencies = {"nvim-tree/nvim-web-devicons"},
            config = function()
                  require("lualine").setup({})
            end,
      }
}
