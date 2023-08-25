local telescope = require("telescope")
local lga_actions = require("telescope-live-grep-args.actions")

telescope.setup {
	extensions = {
		live_grep_args = {
			auto_quoting = true, -- enable/disable auto-quoting
			-- define mappings, e.g.
			mappings = { -- extend mappings
			i = {
				["<C-k>"] = lga_actions.quote_prompt(),
				["<C-i>"] = lga_actions.quote_prompt({ postfix = " --iglob " }),
			},
		},
		-- ... also accepts theme settings, for example:
		-- theme = "dropdown", -- use dropdown theme
		-- theme = { }, -- use own theme spec
		-- layout_config = { mirror=true }, -- mirror preview pane
	}

	}
}



local builtin = require('telescope.builtin')
vim.keymap.set('n', '<leader>pf', builtin.find_files, {})
vim.keymap.set('n', '<C-p>', builtin.git_files, {}) 
vim.keymap.set('n', '<leader>ps',  
	require("telescope").extensions.live_grep_args.live_grep_args, { noremap = true }
)

