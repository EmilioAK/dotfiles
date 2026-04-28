local function terminal_shell()
  if (vim.uv or vim.loop).os_uname().sysname == "Darwin" then
    return { "/opt/homebrew/bin/fish", "--login" }
  end

  return { "zsh", "--login" }
end

return {
  {
    "folke/snacks.nvim",
    opts = {
      terminal = {
        shell = terminal_shell(),
      },
    },
  },
}
