local M = {}
local constants = require('configs.constants')

local function IndexCSS()
  if constants.AMBIENTE_STATIC == 'desarrollo' then
    return {
      'bower_components/bootstrap/dist/css/bootstrap.min',
      'bower_components/font-awesome/css/font-awesome.min',
      'bower_components/swp-backbone/assets/css/constants',
      'bower_components/swp-backbone/assets/css/dashboard',
      'bower_components/swp-backbone/assets/css/table',
      'assets/css/constants',
      'assets/css/styles',
    }
  else
    return {
      'dist/home-min'
    }
  end
end

local function IndexJS()
  if constants.AMBIENTE_STATIC == 'desarrollo' then
    return {
      'bower_components/jquery/dist/jquery.min',
      'bower_components/bootstrap/dist/js/bootstrap.min',
      'bower_components/underscore/underscore-min',
      'bower_components/backbone/backbone-min',
      'bower_components/handlebars/handlebars.min',
      'bower_components/swp-backbone/layouts/application',
      'bower_components/swp-backbone/views/table',
      'bower_components/swp-backbone/views/modal',
    }
  else
    return {
      'dist/home-min'
    }
  end
end

M.IndexCSS = IndexCSS
M.IndexJS = IndexJS
return M
