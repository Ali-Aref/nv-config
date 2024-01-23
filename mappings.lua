---@type MappingsTable
local M = {}

M.general = {
  i = {
    ["jj"] = { "<ESC>", "Exit Insert Mode" },
    ["jk"] = { "<ESC>", "Exit Insert Mode" },
  },
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- switch between windows
    ["<A-h>"] = { "<C-w>h", "window left" },
    ["<A-l>"] = { "<C-w>l", "window right" },
    ["<A-j>"] = { "<C-w>j", "window down" },
    ["<A-k>"] = { "<C-w>k", "window up" },
    -- toggle sidebar
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>" },
  },
}

-- more keybinds!
M.whichkey = {
  n = {
    -- rest client
    ["<leader>rr"] = { "<Plug>RestNvim", "run restapi request" },
    ["<leader>rl"] = { "<Plug>RestNvimLast", "rerun last api request"  },
    ["<leader>rv"] = { "<Plug>RestNvimPreview", "perview restapi curl" },
  },
}

return M
