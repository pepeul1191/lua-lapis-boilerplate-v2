local M = {}
local constants = require('configs.constants')

local function ViewSessionTrue(self)
  if constants.AMBIENTE_SESSION == 'activo' then
    if self.session.estado ~= 'activo' then
      self:write({redirect_to = constants.BASE_URL .. 'error/access/505'})
    end
  end
end

local function ViewSessionFalse(self)
  if self.session.estado == 'activo' then
    self:write({redirect_to = constants.BASE_URL})
  end
end

M.ViewSessionTrue = ViewSessionTrue
M.ViewSessionFalse = ViewSessionFalse
return M
