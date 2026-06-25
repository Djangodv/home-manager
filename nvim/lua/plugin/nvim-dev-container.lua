-- Desc:

vim.pack.add({
	"https://github.com/esensar/nvim-dev-container"
	-- { src = "https://github.com/nvim-treesitter/nvim-treesitter", version = 'v0.9.3' }
	-- "https://github.com/nvim-treesitter/nvim-treesitter" -- Dependency for nvim-dev-container
})

-- require("nvim-treesitter").setup({
-- 	-- Directory to install parsers and queries to (prepended to `runtimepath` to have priority)
-- 	install_dir = vim.fn.stdpath('data') .. '/site'
-- })

-- require("nvim-treesitter").install({ 'json' })

require("devcontainer").setup({})
