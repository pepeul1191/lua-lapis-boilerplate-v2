local M = {}
local http = require('socket.http')
local ltn12 = require('ltn12')
local constants = require('configs.constants')
local json = require('cjson')
--local inspect = require('inspect')

local function ValidarUsuario(usuario)
  local request_body = 'usuario=' .. usuario .. '&sistema_id=' .. constants.SISTEMA_ID
  local headers = {}
  headers[constants.SERVICIOS.accesos.csrf_key] = constants.SERVICIOS.accesos.csrf_value
  headers['Content-Type'] = 'application/x-www-form-urlencoded'
  headers['Content-Length'] = #request_body
  local chunks = {}
  local body, code, headers = http.request{
    url = constants.SERVICIOS.accesos.url .. 'sistema/usuario/validar',
    method = 'POST',
    headers = headers,
    source = ltn12.source.string(request_body),
    sink = ltn12.sink.table(chunks)
  }
  local response = table.concat(chunks)
  local rpta = ''
  local status = 200
  if (code == 'connection refused') then
    rpta = {
      tipo_mensaje = 'error',
      mensaje = {
        'No se puede acceder al servicio de validación de usuario/sistema' ,
        'Servidor de accesos no disponible'
      },
      status = 500
    }
  elseif code == 200 then
    rpta = {
      tipo_mensaje = 'success',
      mensaje = json.decode(response),
      status = 200
    }
  elseif code == 500 then
    rpta = json.decode(response)
    rpta['status'] = 500
  else
    rpta = json.decode(response)
    rpta['status'] = 404
  end
  return rpta
end

M.ValidarUsuario = ValidarUsuario
return M
