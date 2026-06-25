-- Desc:
--vim.keymap.set('n', '', '')

vim.keymap.set({ 't', 'n' }, '<c-j>', '<cmd>:Term<cr>')  -- Toggle terminal

vim.keymap.set('v', '<c-c>', '"+y')                      -- Copy to clipboard
vim.keymap.set({ 'n', 'i' }, '<c-v>', '<esc>"+p')        -- Paste from clipboard

vim.keymap.set({ 'n', 'v' }, '<space>', ':')             -- Open commandline

vim.keymap.set({ 'n', 't' }, '<c-s-p>', '<cmd>:Run<cr>') -- Run file

vim.keymap.set({ 'n' }, '<c-/>', 'gcc', { remap = true })
vim.keymap.set({ 'v' }, '<c-/>', 'gc', { remap = true })

-- vim.keymap.set({ 'n' }, '<>', '')

-- local last_buf = nil
-- local timer = vim.uv.new_timer()
-- timer:start(1000, 0, vim.schedule_wrap(function()
--   vim.api.nvim_command('echomsg "test"')
-- end))
--
-- -- vim.keymap.set('n', '<c-tab>', '<c-^>')
-- vim.api.nvim_create_user_command('Ctab', function()
-- 	if last_buf == nil then
-- 		last_buf = vim.api.nvim_get_current_buf()
-- 	elseif last_buf == vim.api.nvim_get_current_buf() then
-- 		last_buf =
-- 	end
-- 	local last_buf = vim.api.nvim_get_current_buf()
-- 	vim.cmd('b#')
-- 	if last_buf ~= vim.api.nvim_get_current_buf() then
-- 		vim.cmd('b#')
-- 	else
-- 		vim.cmd('b#')
-- 	end
-- 	local timer = vim.uv.new_timer()
-- 	timer:start(2000, 0, vim.schedule_wrap(function()
-- 		last_buf = vim.api.nvim_get_current_buf()
-- 	end))
-- end, {})

-- Auto-correct spelling mistake
-- Source: https://castel.dev/post/lecture-notes-1/
vim.keymap.set('i', '<c-s>', '<c-g>u<esc>[s1z=`]a<c-g>u')
