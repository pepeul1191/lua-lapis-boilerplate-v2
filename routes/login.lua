local M = {}
local config = require('lapis.config')
local inspect = require('inspect')
local constants = require('configs.constants')
local helpers = require('configs.helpers')
local login_helper = require('helpers.login_helper')
local middleware = require('configs.middleware')
local accesos_usuario = require('providers.accesos_usuario')
local accesos_sistema = require('providers.accesos_sistema')
local inspect = require('inspect')

local function Index(self)
  return {
    before = function(self)
      middleware.ViewSessionFalse(self)
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

local function Acceder(self)
  return {
    before = function(self)
      --middleware.ValidarCSRF(self)
    end,
    POST = function(self)
      usuario = self.params['usuario']
      contrasenia = self.params['contrasenia']
      mensaje = ''
      local resp1 = accesos_sistema.ValidarUsuario(usuario)
      if resp1['status'] == 200 then
        if resp1['mensaje'] == 0 then
          mensaje = 'Usuario no se encuentra registrado en el sistema'
        else
          local resp2 = accesos_usuario.ValidarUsuarioREST(usuario, contrasenia)
          if resp2['status'] == 200 then
            if resp2['mensaje'] == 1 then
              self.session.estado = 'activo'
      				self.session.tiempo = os.date('*t')
      				self.session.usuario = self.params['usuario']
              return self:write({redirect_to = constants.BASE_URL})
            else
              mensaje = 'Usuario y/o contraseña no válidos'
            end
          elseif resp2['status'] == 500 then
            mensaje = resp2['mensaje'][1]
          end
        end
      elseif resp1['status'] == 500 then
        mensaje = resp1['mensaje'][1]
      end
      self.constants = constants
      self.helpers = helpers
      self.csss = login_helper.IndexCSS()
      self.jss = login_helper.IndexJS()
      self.title = 'Login'
      self.mensaje = mensaje
      return { render = 'login.index', layout = 'layouts.blank', status = 500}
    end
  }
end

M.Index = Index
M.Acceder = Acceder
return M
