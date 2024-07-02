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

		local runners = { lua = "lua", javascript = "node", python="python" }

		local lazygit = fterm:new({
			cmd = "lazygit",
			dimensions = { height = 0.7, width = 0.7 },
		})

		-- toggle
		vim.keymap.set("n", "<A-i>", '<CMD>lua require("FTerm").toggle()<CR>')
		vim.keymap.set("t", "<A-i>", '<C-\\><C-n><CMD>lua require("FTerm").toggle()<CR>')
		-- lazygit
		vim.keymap.set("n", "<A-g>", function() lazygit:toggle() end)
		vim.keymap.set("t", "<A-g>", function() lazygit:toggle() end)
		-- run 
		vim.keymap.set("n", "<leader>rf", function()
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
