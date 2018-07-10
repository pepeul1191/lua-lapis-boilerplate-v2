local M = {}
local config = require('lapis.config')
local inspect = require('inspect')
local constants = require('configs.constants')
local helpers = require('configs.helpers')
local login_helper = require('helpers.login_helper')
local middleware = require('configs.middleware')
--local accesos_usuario = require('providers.accesos_usuario')
--local accesos_sistema = require('providers.accesos_sistema')
-- local inspect = require('inspect')

local function Index(self)
  return {
    before = function(self)
      --TODO
    end,
    GET = function(self)
      self.constants = constants
      self.helpers = helpers
      self.csss = login_helper.IndexCSS()
      self.jss = login_helper.IndexJS()
      self.title = 'Login'
      self.mensaje = ''
      return { render = 'login.index', layout = 'layouts.blank'}
    end
  }
end

M.Index = Index
return M
