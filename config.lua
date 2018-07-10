-- config.lua
local config = require('lapis.config')

config('dev1', {
  port = tonumber(8080),
  url_statics = 'http://localhost:8080/static/'
})

config('dev2', {
  port = tonumber(8080),
  url_statics = 'http://localhost:8081/static/'
})
