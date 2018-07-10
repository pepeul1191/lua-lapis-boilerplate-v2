local M = {}
local config = require('lapis.config')
local inspect = require('inspect')
local constants = require('configs.constants')
local middleware = require('configs.middleware')
local inspect = require('inspect')
local json = require('cjson')
local ubicaciones_departamento = require('providers.ubicaciones_departamento')

local function Listar(self)
  return {
    before = function(self)
      --middleware.ValidarCSRF(self)
    end,
    GET = function(self)
      local resp = ubicaciones_departamento.DepartamentoListar()
      local rpta = ''
      local status = 200
      if resp['status'] == 200 then
        rpta = resp['mensaje']
      else
        rpta = json.encode(resp['mensaje'])
        status = resp['status']
      end
      return { rpta, layout = false, status = status}
    end
  }
end

M.Listar = Listar
return M
