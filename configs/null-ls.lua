local present, null_ls = pcall(require, "null-ls")

if not present then
  return
end

local b = null_ls.builtins

local sources = {

  -- webdev stuff
  b.formatting.prettier.with {
    extra_args = { "--print-with", "79" },
    filetypes = {
      "html",
      "markdown",
      "css",
      "typescript",
      "typescriptreact",
      "javascript",
      "javascriptreact",
      "typescript",
      "typescriptreact",
      "htmldjango",
      "json",
    },
  },
  b.formatting.isort.with { filetypes = { "python" } },
  b.formatting.black.with {
    extra_args = { "--line-length", "79" },
    filetypes = { "python" },
  },
  b.formatting.deno_fmt,                                                    -- choosed deno for ts/js files cuz its very fast!
  -- b.formatting.prettier.with { filetypes = { "html", "markdown", "css" } }, -- so prettier works only on these filetypes
  b.formatting.stylua,
  -- b.formatting.clang_format,

  -- linters
  -- b.diagnostics.eslint_d.with {
  --   diagnostics_format = "#{m} eslint_d:[#{c}]",
  --   filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
  -- },
  b.diagnostics.flake8.with {
    extra_args = { "--max-line-length=79", "--ignore=E4,E51,W234,BLK100,W292,W503,I001" },
    filetypes = { "python" },
    diagnostics_format = "#{m} flake8:[#{c}]",
  },
  b.diagnostics.codespell.with {
    diagnostics_format = "#{m} codespell:[#{c}]",
    filetypes = { "python", "javascript", "javascriptreact", "typescript", "typescriptreact" },
  },
  b.diagnostics.jsonlint.with {
    diagnostics_format = "#{m} jsonlint:[#{c}]",
    filetypes = { "json" },
  },
}

null_ls.setup {
  debug = true,
  sources = sources,
}
