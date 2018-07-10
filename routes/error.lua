local M = {}
local config = require('lapis.config')
local inspect = require('inspect')
local json = require('cjson')
local constants = require('configs.constants')
local helpers = require('configs.helpers')

local function NotFound(self)
  return {
    before = function(self)
      --TODO: Nada
    end,
    POST = function(self)
      error = {
        tipo_mensaje = 'error',
        mensaje = {
          'Recurso no disponible' ,
          'Error 404'
        }
      }
      return {status = 404, json.encode(error)}
    end,
    GET = function(self)
      --error = self.params.error
      self:write({redirect_to = constants.BASE_URL .. 'error/access/404'})
    end,
  }
end

local function Access(self)
  return {
    before = function(self)
      --TODO: Nada
    end,
    POST = function(self)
      --error = self.params.error
      return { 'error: 404' }
    end,
    GET = function(self)
      --error = self.params.error
      return { 'error: 404' }
    end,
  }
end

M.NotFound = NotFound
M.Access = Access
return M
