local M = {}

M.treesitter = {
  highlight = {
    enable = true
  },
  ensure_installed = {
    -- defaults
    "vim",
    "lua",

    -- web dev
    "html",
    "css",
    "javascript",
    "typescript",
    "tsx",
    "vue",
    "svelte",
    "json",

    -- low level
    "rust",
    "c",

    -- game dev
    "glsl",

    -- documentation
    "markdown",
    "markdown_inline",
  },
  indent = {
    enable = true,
    -- disable = {
    --   "python"
    -- },
  },
}

M.mason = {
  ensure_installed = {
    -- lua stuff
    "lua-language-server",
    "stylua",

    -- web dev stuff
    "css-lsp",
    "html-lsp",
    "typescript-language-server",
    "deno",
    "prettier",

    -- c/cpp stuff
    "clangd",
    "clang-format",
  },
}

-- git support in nvimtree
M.nvimtree = {
  git = {
    enable = true,
  },

  renderer = {
    highlight_git = true,
    icons = {
      show = {
        git = true,
      },
    },
  },
}

M.cmp = function()
  local opts = require "plugins.configs.cmp"

  local cmp_ui = require("core.utils").load_config().ui.cmp
  local cmp_style = cmp_ui.style

  local field_arrangement = {
    atom = { "kind", "abbr", "menu" },
    atom_colored = { "kind", "abbr", "menu" },
  }

  opts.formatting.fields = field_arrangement[cmp_style] or { "menu", "abbr", "kind" }

  opts.formatting.format = function(entry, item)
    local icons = require "nvchad.icons.lspkind"
    local icon = (cmp_ui.icons and icons[item.kind]) or ""

    if cmp_style == "atom" or cmp_style == "atom_colored" then
      icon = " " .. icon .. " "
      item.menu = cmp_ui.lspkind_text and "   (" .. item.kind .. ")" or ""
      item.kind = icon
    else
      if item.kind == "Color" and type(entry.completion_item.documentation) == "string" then
        local _, _, r, g, b = string.find(entry.completion_item.documentation, "^rgb%((%d+), (%d+), (%d+)")
        if r then
          local color = string.format("%02x%02x%02x", r, g, b)
          local group = "Tw_" .. color
          if vim.fn.hlID(group) < 1 then
            vim.api.nvim_set_hl(0, group, { fg = "#" .. color })
          end
          item.menu = "■"
          item.menu_hl_group = group
        end
      end
      icon = cmp_ui.lspkind_text and (" " .. icon .. " ") or icon
      item.kind = string.format("%s %s", icon, cmp_ui.lspkind_text and item.kind or "")
    end

    return item
  end

  return opts
end
return M
