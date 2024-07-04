return {
	"numToStr/FTerm.nvim",
	config = function()
		local fterm = require("FTerm")
		fterm.setup({
			dimensions = {
				height = 0.6,
				width = 0.6,
				-- x = 0.5,
				-- y = 0.5,
			},
		})

		local runners = { lua = "lua", javascript = "node", python="python"}

		local lazygit = fterm:new({
			cmd = "lazygit",
			dimensions = { height = 0.9, width = 0.9 },
		})
		local leftTerm = fterm:new({
			dimensions = { height = 1, width = 0.5, x = 1, y = 1 },
		})
		local bottomTerm = fterm:new({
			dimensions = { height = 0.4, width = 1, x = 0, y = 1 },
		})

		-- floating 
		vim.keymap.set("n", "<leader>tt", '<CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle terminal" })
		vim.keymap.set("t", "<leader>tt", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>', { desc = "Toggle terminal" })
		-- lazygit
		vim.keymap.set("n", "<leader>tg", function() lazygit:toggle() end, { desc = "lazygit" })
		vim.keymap.set("t", "<leader>tg", function() lazygit:toggle() end, { desc = "Toggle lazygit" })
		-- bottom terminal
		vim.keymap.set("n", "<leader>tj", function() bottomTerm:toggle() end, { desc = "Toggle bottom terminal" })
		vim.keymap.set("t", "<leader>tj", function() bottomTerm:toggle() end, { desc = "Toggle bottom terminal" })
		-- run 
		vim.keymap.set("n", "<leader>tr", function()
			local buf = vim.api.nvim_buf_get_name(0)
			local ftype = vim.filetype.match({ filename = buf })
			local exec = runners[ftype]
			if exec ~= nil then
				require("FTerm").scratch({ 
					cmd = { exec, buf },
					dimensions = {  height = 0.3, width = 1, x = 0, y = 1  }
				})
			end
		end, { desc = "Run file" })
	end,
}
