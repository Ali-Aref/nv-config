return {
	"Exafunction/codeium.vim",
	event = "BufEnter",
	config = function()
		-- disable custom keybindings
		vim.g.codeium_disable_bindings = 1

		vim.keymap.set("i", "<A-i>", function()
			return vim.fn["codeium#Accept"]()
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<A-o>", function()
			return vim.fn["codeium#CycleCompletions"](1)
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<A-u>", function()
			return vim.fn["codeium#CycleCompletions"](-1)
		end, { expr = true, silent = true })
		vim.keymap.set("i", "<A-I>", function()
			return vim.fn["codeium#Clear"]()
		end, { expr = true, silent = true })
	end,
}
