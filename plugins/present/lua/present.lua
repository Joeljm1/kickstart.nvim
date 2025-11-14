local M = {}

---takes lines and parses them
---@param opts string[]: array of strings
M.setup = function(opts)
  --nothing
  opts = opts or {}
end

---@class present.Slides
---@field slides string[] : The slides of the file

---@param lines string[]: The lines in the buffer
---@return present.Slides
local parse_slides = function(lines)
  local slides = { slides = {} }
  local current_slide = {}

  local seperator = '^#'

  for _, line in ipairs(lines) do
    print(line, 'find: ', line:find(seperator), '|')
    if line:find(seperator) then
    end
  end
  return slides
end

vim.print(parse_slides {
  '#Hello',
  'world',
  '#How',
  'Are you',
})

return M
