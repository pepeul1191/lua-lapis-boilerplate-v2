local M = {}
local constants = require('configs.constants')

local function LoadCSS(csss)
  rpta = ''
  if csss ~= nil then
    for i, css in ipairs(csss) do
      rpta = rpta .. '<link rel="stylesheet" type="text/css" href="' .. constants.STATIC_URL .. css .. '.css" />'
    end
  end
  return rpta
end

local function LoadJS(jss)
  rpta = ''
  if jss ~= nil then
    for i, js in ipairs(jss) do
      rpta = rpta .. '<script src="' .. constants.STATIC_URL .. js .. '.js"></script>'
    end
  end
  return rpta
end

M.LoadCSS = LoadCSS
M.LoadJS = LoadJS
return M
