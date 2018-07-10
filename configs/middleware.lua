local M = {}
local json = require('cjson')
local constants = require('configs.constants')
local inspect = require('inspect')

local function ViewSessionTrue(self)
  if constants.AMBIENTE_SESSION == 'activo' then
    if self.session.estado ~= 'activo' then
      self:write({redirect_to = constants.BASE_URL .. 'error/access/505'})
    end
  end
end

local function ViewSessionFalse(self)
  if constants.AMBIENTE_SESSION == 'activo' then
    if self.session.estado == 'activo' then
      self:write({redirect_to = constants.BASE_URL})
    end
  end
end

local function CSRFHeader(self)
  if constants.AMBIENTE_CSRF == 'activo' then
    if self.req.headers[constants.CSRF.key] ~= constants.CSRF.secret then
      -- request method : self.req.cmd_mth
      local response = {
        tipo_mensaje = 'error',
        mensaje = {
          'No se puede acceder al recurso',
          'CSRF Token key error'
        },
      }
      local status = 500
      local rpta = json.encode(response)
      self:write { rpta, layout = false, status = status}
    end
  end
end

M.ViewSessionTrue = ViewSessionTrue
M.ViewSessionFalse = ViewSessionFalse
M.CSRFHeader = CSRFHeader
return M
