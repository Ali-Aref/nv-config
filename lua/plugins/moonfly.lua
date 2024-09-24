return {
	"bluz71/vim-moonfly-colors", 
	name = "moonfly", 
	lazy = false,
	priority = 1000,
	config = function()
		-- transparent
		vim.g.moonflyTransparent = false
		-- win separator
		-- 0 will display no window separators
		-- 1 will display block separators; this is the default
		-- 2 will diplay line separators
		vim.g.moonflyWinSeparator = 0
		vim.opt.fillchars = { horiz = '━', horizup = '┻', horizdown = '┳', vert = '┃', vertleft = '┫', vertright = '┣', verthoriz = '╋', }
	end,
}
