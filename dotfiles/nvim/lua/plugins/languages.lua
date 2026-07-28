return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      servers = {
        -- These servers are installed by Home Manager, so Mason should not
        -- install a second, non-declarative copy of them.
        nil_ls = { mason = false },
        pyright = { mason = false },
        ruff = { mason = false },
      },
    },
  },
}
