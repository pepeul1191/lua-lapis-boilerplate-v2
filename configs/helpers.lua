local M = {}
local constants = require('configs.constants')
local http = require('socket.http')
local ltn12 = require('ltn12')
local json = require('cjson')

local function LoadCSS(csss)
  rpta = ''
  if csss ~= nil then
    for i, css in ipairs(csss) do
      rpta = rpta .. '<link rel="stylesheet" type="text/css" href="' .. constants.STATIC_URL .. css .. '.css" />'
    end
  end
  return rpta
end

local function LoadJS(jss)
  rpta = ''
  if jss ~= nil then
    for i, js in ipairs(jss) do
      rpta = rpta .. '<script src="' .. constants.STATIC_URL .. js .. '.js"></script>'
    end
  end
  return rpta
end

local function LoadModulos()
  local request_body = ''
  local headers = {}
  headers[constants.SERVICIOS.accesos.csrf_key] = constants.SERVICIOS.accesos.csrf_value
  headers['Content-Type'] = 'application/x-www-form-urlencoded'
  headers['Content-Length'] = #request_body
  local chunks = {}
  local body, code, headers = http.request{
    url = constants.SERVICIOS.accesos.url .. 'modulo/menu/' .. constants.SISTEMA_ID,
    method = 'GET',
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
        'No se puede acceder al servicio de accesos para el listado de módulos' ,
        'Servidor de accesos no disponible'
      },
      status = 500
    }
    print('LoadItems - Error 500 Coneción')
    rpta = '[]'
  elseif code == 200 then
    rpta = response
  elseif code == 500 then
    print('LoadModulos - Error 500')
    print(json.decode(response))
    rpta = {}
  else
    print('LoadModulos - Error 404')
    print(json.decode(response))
    rpta = {}
  end
  return rpta
end

local function LoadItems(modulo)
  local request_body = ''
  local headers = {}
  headers[constants.SERVICIOS.accesos.csrf_key] = constants.SERVICIOS.accesos.csrf_value
  headers['Content-Type'] = 'application/x-www-form-urlencoded'
  headers['Content-Length'] = #request_body
  local chunks = {}
  local body, code, headers = http.request{
    url = constants.SERVICIOS.accesos.url .. 'item/menu?' .. 'modulo=' .. modulo .. '&sistema_id=' .. constants.SISTEMA_ID,
    method = 'GET',
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
        'No se puede acceder al servicio de accesos para el listado de itemes' ,
        'Servidor de accesos no disponible'
      },
      status = 500
    }
    print('LoadItems - Error 500 Coneción')
    rpta = '[]'
  elseif code == 200 then
    rpta = response
  elseif code == 500 then
    print('LoadItems - Error 500')
    print(json.decode(response))
    rpta = '[]'
  else
    print('LoadItems - Error 404')
    print(json.decode(response))
    rpta = '[]'
  end
  return rpta
end

M.LoadCSS = LoadCSS
M.LoadJS = LoadJS
M.LoadModulos = LoadModulos
M.LoadItems = LoadItems
return M
