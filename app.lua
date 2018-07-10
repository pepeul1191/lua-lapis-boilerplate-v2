local lapis = require('lapis')
local respond_to = require('lapis.application').respond_to
local app = lapis.Application()
app:enable('etlua')

app:get('/test/conexion', function(self)
  return 'OK... Welcome to Lapis' .. require('lapis.version')
end)

-- importaciones de rutas
local login = require('routes.login')
-- rutas
app:match('loginIndex', '/login', respond_to(login.Index(self)))

return app
