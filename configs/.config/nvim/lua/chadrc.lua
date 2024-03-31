---@type ChadrcConfig
local M = {}

M.ui = {
  theme = "oxocarbon",
  transparency = true,
  nvdash = {
    load_on_startup = true,
  },
  lsp = {
    signature = false,
    hover = false,
    semantic_tokens = false,
  },
  term = {
    -- hl = "Normal:term,WinSeparator:WinSeparator",
    float = {
      relative = "editor",
      row = 0.3,
      col = 0.25,
      width = 1,
      height = 1,
      border = "single",
    },
  },
}

return M
