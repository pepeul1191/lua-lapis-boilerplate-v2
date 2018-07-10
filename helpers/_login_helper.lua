local M = {}
local constants = require('configs.constants')

local function IndexCSS()
  if constants.AMBIENTE_STATIC == 'desarrollo' then
    return {
      'bower_components/bootstrap/dist/css/bootstrap.min',
      'bower_components/font-awesome/css/font-awesome.min',
      'bower_components/swp-backbone/assets/css/constants',
      'bower_components/swp-backbone/assets/css/login',
      'assets/css/login',
    }
  else
    return {
      'dist/login-min'
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
