-- turn off true colors to fall back to ANSI palette
vim.opt.termguicolors = false

-- keep default colorscheme (terminal)
vim.cmd("colorscheme default")

-- transparent background
vim.api.nvim_set_hl(0, "Normal", { ctermbg = "NONE", bg = "NONE" })
vim.api.nvim_set_hl(0, "NormalFloat", { ctermbg = "NONE", bg = "NONE" })

-- grey comments
vim.api.nvim_set_hl(0, "Comment", { ctermfg = 8, fg = "#555555", italic = true })
vim.api.nvim_set_hl(0, "@comment", { link = "Comment" })

-- grey line numbers
vim.api.nvim_set_hl(0, 'LineNr', { ctermfg = 8, fg = '#555555' })
