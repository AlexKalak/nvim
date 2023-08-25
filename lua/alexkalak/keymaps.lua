--Adding on ctrl + / new line 
function newLineFromNormalMode()
	local keys = vim.api.nvim_replace_termcodes('<ESC>', true, false, true)
	vim.api.nvim_feedkeys('O', 'n', true)
	vim.api.nvim_feedkeys(keys, 'm', false)
end

vim.keymap.set("n", "<C-m>", function() newLineFromNormalMode() end)



local map = vim.api.nvim_set_keymap
local opts = {noremap = true, silent = false}

--Moving lines
map("n", "<A-j>", ":m .+1<CR>==", opts) -- move line up(n)
map("n", "<A-k>", ":m .-2<CR>==", opts) -- move line down(n)
map("v", "<A-j>", ":m '>+1<CR>gv=gv", opts) -- move line up(v)
map("v", "<A-k>", ":m '<-2<CR>gv=gv", opts) -- move line down(v)
