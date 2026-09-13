local prettier_markers = {
  ".prettierrc",
  ".prettierrc.json",
  ".prettierrc.js",
  ".prettierrc.cjs",
  ".prettierrc.mjs",
  ".prettierrc.yaml",
  ".prettierrc.yml",
  ".prettierrc.toml",
  "prettier.config.js",
  "prettier.config.cjs",
  "prettier.config.mjs",
}

local function formatter_for(bufnr)
  return vim.fs.root(bufnr, prettier_markers) and { "prettier" } or { "biome" }
end

local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = formatter_for,
    html = formatter_for,
    javascript = formatter_for,
    javascriptreact = formatter_for,
    typescript = formatter_for,
    typescriptreact = formatter_for,
    json = formatter_for,
  },

  -- format_on_save = {
  --   -- These options will be passed to conform.format()
  --   timeout_ms = 500,
  --   lsp_fallback = true,
  -- },
}

return options
