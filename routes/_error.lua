local M = {}
local config = require('lapis.config')
local inspect = require('inspect')
local json = require('cjson')
local constants = require('configs.constants')
local helpers = require('configs.helpers')
local error_helper = require('helpers._error_helper')

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
    GET = function(self)
      local numero = ''
      local mensaje = ''
      local descripcion = ''
      local status = 404
      if self.params.error == '505' then
        numero = '505'
        mensaje = 'Acceso restringido'
        descripcion = 'Necesita estar logueado'
        status = 500
      elseif self.params.error == '8080' then
        numero = '8080'
        mensaje = 'Acceso restringido'
        descripcion = 'Tiempo de sesión agotado'
        status = 500
      else
        numero = '404'
        mensaje = 'Archivo no encontrado'
        descripcion = 'La página que busca no se encuentra en el servidor'
      end
      self.constants = constants
      self.helpers = helpers
      self.csss = error_helper.IndexCSS()
      self.jss = error_helper.IndexJS()
      self.title = 'Error'
      self.numero = numero
      self.mensaje = mensaje
      self.descripcion = descripcion
      return { render = 'error.access', layout = 'layouts.blank', status = status}
    end,
  }
end

M.NotFound = NotFound
M.Access = Access
return M
