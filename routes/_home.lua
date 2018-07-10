local M = {}
local config = require('lapis.config')
local inspect = require('inspect')
local constants = require('configs.constants')
local helpers = require('configs.helpers')
local home_helper = require('helpers._home_helper')
local middleware = require('configs.middleware')
local json = require('cjson')
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
      self.modulos = json.encode({
        {url = "accesos/", nombre = "Accesos"},
        {url = "administracion/", nombre = "Administración"},
      })
      self.items =  json.encode({
        {subtitulo = "Opciones", items =
    			{
            {item = "Gestión de Eventos", url = "administracion#/evento"},
            {item = "Gestión de Alumnos", url = "administracion#/alumno"},
    				{item = "Gestión de Empleados", url = "administracion#/empleado"},
    				{item = "Gestión de Externos", url = "administracion#/externo"},
    			}
    		},
      })
      self.data = json.encode({
        modulo = "Accesos"
      })
      return { render = 'home.index', layout = 'layouts.app'}
    end
  }
end

M.Index = Index
return M
