local lapis = require('lapis')
local respond_to = require('lapis.application').respond_to
local app = lapis.Application()
app:enable('etlua')

app:get('/', function()
  return 'Welcome to Lapis ' .. require('lapis.version')
end)

app:match("/test/conexion", function(self)
  return "ok"
end)

return app
