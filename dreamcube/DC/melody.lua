local w, h = term.getSize()

--[[
local function centre(y, s)
  local x = (w/2-#s/2)
  term.setCursorPos(x,y)
  print(s)
end
]]--

local function guiAdvanced()
  term.setBackgroundColour(colours.lightBlue)
  term.clear()
  
  term.setBackgroundColour(colours.cyan)
  term.setTextColour(colours.white)
  paintutils.drawFilledBox((w/2 - 5), 4, (w/2 + 5), 6)
  centre(5, "   TITLE   ")
  
  -- todo: icons?
  paintutils.drawFilledBox(2, 15, 12, 17)
  term.setCursorPos(3, 16)
  print("[1] Back") 
  
  paintutils.drawFilledBox(14, 15, 24, 17)
  term.setCursorPos(15, 16)
  print("[2] Play")
  
  paintutils.drawFilledBox(26, 15, 36, 17)
  term.setCursorPos(27, 16)
  print("[3] Stop")
  
  paintutils.drawFilledBox(38, 15, 48, 17)
  term.setCursorPos(39, 16)
  print("[4] Eject")
end

while true do

if term.isColour() then
  guiAdvanced()
else
  guiStandard()
end

sleep() -- avoid too long without yielding
end

