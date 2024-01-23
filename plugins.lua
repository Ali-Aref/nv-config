local overrides = require "custom.configs.overrides"

---@type NvPluginSpec[]
local plugins = {

  -- Override plugin definition options

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- format & linting
      {
        "jose-elias-alvarez/null-ls.nvim",
        config = function()
          require "custom.configs.null-ls"
        end,
      },
    },
    config = function()
      require "plugins.configs.lspconfig"
      require "custom.configs.lspconfig"
    end, -- Override to setup mason-lspconfig
  },

  -- override plugin configs
  {
    "williamboman/mason.nvim",
    opts = overrides.mason,
  },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = overrides.treesitter,
  },

  {
    "nvim-tree/nvim-tree.lua",
    opts = overrides.nvimtree,
  },

  -- Install a plugin
  {
    "max397574/better-escape.nvim",
    event = "InsertEnter",
    config = function()
      require("better_escape").setup()
    end,
  },

  -- FIX: my commands
  -- ~ Ali
  {
    "folke/todo-comments.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    cmd = { "TodoQuickFix", "TodoLocList", "TodoTrouble", "TodoTelescope" },
    opts = {
      keywords = {
        FIX = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
        WARN = { icon = "", color = "warning", alt = { "WARNING", "XXX" } },
        HACK = { icon = "", color = "warning" },
        TEST = { icon = "󰙨", color = "test", alt = { "TESTING", "PASSED", "FAILED" } },
        PERF = { icon = "", color = "ref", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
        TODO = { icon = "", color = "info" },
        NOTE = { icon = "", color = "hint", alt = { "INFO", "START" } },
      },
      colors = {
        info = { "#25afff" },
        warning = { "#fc8f59" },
        error = { "#ff5050" },
        test = { "#D03259" },
        ref = { "#7084c6" },
        hint = { "#10B981" },
      },
    },
  },
  {
    "rest-nvim/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    ft = { "http" },
    config = function()
      require("rest-nvim").setup {
        -- Open request results in a horizontal split
        result_split_horizontal = false,
        -- Keep the http file buffer above|left when split horizontal|vertical
        result_split_in_place = false,
        -- stay in current windows (.http file) or change to results window (default)
        stay_in_current_window_after_split = true,
        -- Skip SSL verification, useful for unknown certificates
        skip_ssl_verification = false,
        -- Encode URL before making request
        encode_url = true,
        -- Highlight request on run
        highlight = {
          enabled = true,
          timeout = 250,
        },
        result = {
          -- toggle showing URL, HTTP info, headers at top the of result window
          show_url = true,
          -- show the generated curl command in case you want to launch
          -- the same request via the terminal (can be verbose)
          show_curl_command = false,
          show_http_info = true,
          show_headers = true,
          -- table of curl `--write-out` variables or false if disabled
          -- for more granular control see Statistics Spec
          show_statistics = {
            -- check the man curl (--write-out)
            "time_connect",
            "time_total",
          },
          -- executables or functions for formatting response body [optional]
          -- set them to false if you want to disable them
          formatters = {
            json = "jq",
            -- html = function(body)
            --   return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
            -- end,
          },
        },
        -- Jump to request line on run
        jump_to_request = false,
        env_file = ".env",
        custom_dynamic_variables = {},
        yank_dry_run = true,
        search_back = true,
      }
    end,
  },
  -- To make a plugin not be loaded
  -- {
  --   "NvChad/nvim-colorizer.lua",
  --   enabled = false
  -- },

  -- All NvChad plugins are lazy-loaded by default
  -- For a plugin to be loaded, you will need to set either `ft`, `cmd`, `keys`, `event`, or set `lazy = false`
  -- If you want a plugin to load on startup, add `lazy = false` to a plugin spec, for example
  -- {
  --   "mg979/vim-visual-multi",
  --   lazy = false,
  -- }
}

return plugins
