return {
        require("papis").setup({
                -- Enable the default keymaps (defaults to `false`)
          enable_keymaps = true,
          -- You might want to change the filetypes activating papis.nvim
          init_filetypes = { "markdown", "norg", "yaml", "typst" },
          -- If you don't have an appropriate font (like Nerd Font), you
          -- may want to disable icons. This may require a `:Papis reload data`.
          -- to take effect.
          enable_icons = true,
  }),
}
