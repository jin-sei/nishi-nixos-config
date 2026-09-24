local builtin = require("statuscol.builtin")

local function padded_lnum(args)
  if args.virtnum ~= 0 then
    return ""
  end

  local total_lines = vim.api.nvim_buf_line_count(args.buf or 0)

  local width = math.max(3, string.len(tostring(total_lines)))

  local is_relnum = vim.wo[args.win or 0].relativenumber
  local num = (is_relnum and args.relnum > 0) and args.relnum or args.lnum

  return string.format("%0" .. width .. "d", num)
end

require("statuscol").setup({
  segments = {
    { text = { builtin.foldfunc }, click = "v:lua.ScFa" },
    {
      text = { padded_lnum, " " },
      click = "v:lua.ScLa",
    },
    { text = { builtin.gitsignsfunc }, click = "v:lua.ScSa" },
  },
})
