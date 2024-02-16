local read_only = require("custom.utils").read_only

local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- export default on_attach and capabilities config for use in .nvim.lua scripts.
LSP_DEFAULTS = {
  on_attach = on_attach,
  capabilities = read_only(capabilities),
}

local lspconfig = require "lspconfig"

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "tailwindcss", "tsserver", "clangd", "svelte", "rust_analyzer" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    capabilities = capabilities,
  }
end

lspconfig.emmet_ls.setup {
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {
    "astro",
    "css",
    "eruby",
    "html",
    "htmldjango",
    "javascriptreact",
    "less",
    "pug",
    "sass",
    "scss",
    "svelte",
    "typescriptreact",
    "vue",
  },
  init_options = {
    typescriptreact = {
      options = {
        ["output.selfClosingStyle"] = "xhtml",
      },
    },
    javascriptreact = {
      options = {
        ["output.selfClosingStyle"] = "xhtml",
      },
    },
    vue = {
      options = {
        ["output.selfClosingStyle"] = "xhtml",
      },
    },
    svelte = {
      options = {
        ["output.selfClosingStyle"] = "xhtml",
      },
    },
  },
}

--
-- lspconfig.pyright.setup { blabla}
