require('nvim-treesitter.configs').setup {
  ensure_installed = {
    "bash",
    "c",
    "clojure",
    "commonlisp",
    "cpp",
    "css",
    "dockerfile",
    "eex",
    "elixir",
    "fennel",
    "fish",
    "go",
    "graphql",
    "html",
    "http",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "json5",
    "kotlin",
    "lua",
    "make",
    -- "markdown", -- markdown is buggy as it hides ```
    "php",
    "python",
    "regex",
    "rst",
    "ruby",
    "rust",
    "scss",
    "svelte",
    "swift",
    "toml",
    "tsx",
    "typescript",
    "vim",
    "vue",
    "yaml"
  },
  sync_install = true,
  ignore_install = { "norg" },
  highlight = {
    enable = true
  },
  indent = {
    enable = false,
  },
  context_commentstring = {
    enable = true,
  },
  incremental_selection = {
    enable = true,
    keymaps = {
      init_selection = "<space>s",
      node_incremental = "<space>sj",
      scope_incremental = "<space>sl",
      node_decremental = "<space>sk",
    }
  },
}
