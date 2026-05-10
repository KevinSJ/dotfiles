---@enum Direction
Direction = {
  UP = "up",
  DOWN = "down",
  LEFT = "left",
  RIGHT = "right"
}

---@param direction Direction
function MoveFocus(direction)
  return hl.dsp.focus({ direction = direction })
end

---@param direction Direction
function MoveWorkSpace(direction)
  return hl.dsp.window.move({ direction = direction })
end

---@class Binding
---@field keys string|integer
---@field command function|HL.Dispatcher
---@field opts? HL.BindOptions

---@param binding Binding
---@param mod string
function BindKey(mod, binding)
  hl.bind(mod .. '+' .. binding.keys, binding.command, binding.opts)
end

function BindPermission()

end
