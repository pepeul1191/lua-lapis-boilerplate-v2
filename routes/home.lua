local M = {}
local config = require('lapis.config')
local inspect = require('inspect')
local constants = require('configs.constants')
local helpers = require('configs.helpers')
local home_helper = require('helpers.home_helper')
local middleware = require('configs.middleware')
--local accesos_usuario = require('providers.accesos_usuario')
--local accesos_sistema = require('providers.accesos_sistema')
-- local inspect = require('inspect')

local function Index(self)
  return {
    before = function(self)
      middleware.ViewSessionTrue(self)
    end,
    GET = function(self)
      self.constants = constants
      self.helpers = helpers
      self.csss = home_helper.IndexCSS()
      self.jss = home_helper.IndexJS()
      self.title = 'Home'
      self.mensaje = ''
      return { render = 'home.index', layout = 'layouts.blank'}
    end
  }
end

M.Index = Index
return M
