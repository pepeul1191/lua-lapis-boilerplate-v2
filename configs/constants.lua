local M = {}

M.BASE_URL = 'http://localhost:8080/'
M.STATIC_URL = 'http://localhost:8080/static/'
M.SISTEMA_ID = '4'
M.CSRF = {
  key = 'csrf-key',
  secret = 'valueUnknow',
}
M.SERVICIOS = {
  accesos = {
    url = 'http://localhost:5000/',
    csrf_key = 'csrf_val',
    csrf_value = 'PKBcauXg6sTXz7Ddlty0nejVgoUodXL89KNxcrfwkEme0Huqtj6jjt4fP7v2uF4L',
  },
}
M.AMBIENTE_STATIC = 'desarrollo'

return M
