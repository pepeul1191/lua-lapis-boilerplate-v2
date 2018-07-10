local lapis = require('lapis')
local respond_to = require('lapis.application').respond_to
local app = lapis.Application()
app:enable('etlua')

app:get('/test/conexion', function(self)
  return 'OK... Welcome to Lapis' .. require('lapis.version')
end)

-- importaciones de rutas
local login = require('routes.login')
local error = require('routes.error')
local home = require('routes.home')
-- rutas
-- login
app:match('loginIndex', '/login', respond_to(login.Index(self)))
app:match('loginAcceder', '/login/acceder', respond_to(login.Acceder(self)))
-- homepage
app:match('homeIndex', '/', respond_to(home.Index(self)))
-- default
app:match('errorAccess', '/error/access/:error', respond_to(error.Access(self)))
app:match('handle_404', respond_to(error.NotFound(self)))

return app
