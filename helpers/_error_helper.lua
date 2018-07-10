local M = {}
local constants = require('configs.constants')

local function IndexCSS()
  if constants.AMBIENTE_STATIC == 'desarrollo' then
    return {
      'bower_components/bootstrap/dist/css/bootstrap.min',
      'bower_components/font-awesome/css/font-awesome.min',
      'assets/css/constants',
      'assets/css/error',
    }
  else
    return {
      'dist/error-min'
    }
  end
end

local function IndexJS()
  if constants.AMBIENTE_STATIC == 'desarrollo' then
    return {

    }
  else
    return {

    }
  end
end

M.IndexCSS = IndexCSS
M.IndexJS = IndexJS
return M
