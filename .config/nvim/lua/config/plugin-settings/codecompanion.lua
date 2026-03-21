require("codecompanion").setup({
  interactions = {
    chat = {
      adapter = "ollama",
      model = "qwen3:32b"
    },
    inline = {
      adapter = "ollama",
      model = "qwen3:32b"
    },
    cli = {
      agent = "claude_code",
      agents = {
        claude_code = {
          cmd = "claude",
          args = {},
          description = "Claude Code CLI",
          provider = "terminal",
        },
      },
    },
  },
  -- opts = {
  --   log_level = "DEBUG",
  -- },
})
