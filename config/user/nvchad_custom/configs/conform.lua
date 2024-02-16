local options = {
  lsp_fallback = true,

  formatters_by_ft = {
    -- default
    lua = { "stylua" },

    -- web dev
    typescript = { "prettier" },
    typescriptreact = { "prettier" },
    javascript = { "prettier" },
    css = { "prettier" },
    html = { "prettier" },
    vue = { "prettier" },

    -- scripting
    sh = { "shfmt" },

    -- game dev
    glsl = { "clang_format" },
  },

  format_on_save = {
    timeout_ms = 500,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
