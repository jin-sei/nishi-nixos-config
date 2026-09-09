-- use 'jk' or 'kj' simultaneously to exit insert mode
vim.keymap.set('i', 'jk', '<Esc>', { noremap = true, silent = true })
vim.keymap.set('i', 'kj', '<Esc>', { noremap = true, silent = true })

-- swap ":" and ";" (for us keybaord)
-- vim.keymap.set({ "n", "v" }, ";", ":", { noremap = true })
-- vim.keymap.set({ "n", "v" }, ":", ";", { noremap = true })
