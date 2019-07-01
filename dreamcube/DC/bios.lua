local w, h = term.getSize()

-- load icons

local playIcon = paintutils.loadImage("/DC/icons/play")
local fileIcon = paintutils.loadImage("/DC/icons/file")
local musicIcon = paintutils.loadImage("/DC/icons/music")
local systemIcon = paintutils.loadImage("/DC/icons/system")

local function dcTopBar()
  term.setBackgroundColour(colours.white)
  term.setCursorPos(1, 1)
  term.clearLine()
  term.setTextColour(colours.grey)
  term.setCursorPos(3, 1)
  print("Dreamcube")
end 

-- and main function time!
local function menuAdvanced()
  term.setBackgroundColour(colours.lightBlue)
  term.clear()
  dcTopBar()
  
  -- Play button
  paintutils.drawImage(playIcon, (w/2 - 15), 3)
  term.setBackgroundColour(colours.orange)
  term.setTextColour(colours.white)
  term.setCursorPos((w/2 - 10), 8)
  print("            ")
  term.setCursorPos((w/2 - 10), 9)
  print("  [1] Play  ")
  term.setCursorPos((w/2 - 10), 10)
  print("            ")
  
  -- File button
  paintutils.drawImage(fileIcon, (w/2 + 5), 3)
  term.setBackgroundColour(colours.green)
  term.setCursorPos((w/2 + 11), 8)
  print("            ")
  term.setCursorPos((w/2 + 11), 9)
  print("  [2] File  ")
  term.setCursorPos((w/2 + 11), 10)
  print("            ")
  
  -- Music button
  paintutils.drawImage(musicIcon, (w/2 - 17), 12)
  term.setBackgroundColour(colours.cyan)
  term.setCursorPos((w/2 - 10), 15)
  print("            ")
  term.setCursorPos((w/2 - 10), 16)
  print(" [3] Melody ")
  term.setCursorPos((w/2 - 10), 17)
  print("            ")
  
  -- System button
  paintutils.drawImage(systemIcon, (w/2 + 5), 12)
  term.setBackgroundColour(colours.purple)
  term.setCursorPos((w/2 + 11), 15)
  print("            ")
  term.setCursorPos((w/2 + 11), 16)
  print(" [4] System ")
  term.setCursorPos((w/2 + 11), 17)
  print("            ")  
end

local function menuStandard()
  term.setBackgroundColour(colours.lightGrey)
  term.clear()
  dcTopBar()
  term.setBackgroundColour(colours.grey)
  term.setTextColour(colours.white)
  
  -- Play button
  paintutils.drawFilledBox((w/2 - 16), (h/2 - 5), (w/2 - 3), (h/2 - 1))
  term.setCursorPos((w/2 - 13), (h/2 - 3))
  print("[1] Play")
  
  -- File button
  paintutils.drawFilledBox((w/2 + 5), (h/2 - 5), (w/2 + 18), (h/2 - 1))
  term.setCursorPos((w/2 + 8), (h/2 - 3))
  print("[2] File")
  
  -- Music button
  paintutils.drawFilledBox((w/2 - 16), (h/2 + 2), (w/2 - 3), (h/2 + 6))
  term.setCursorPos((w/2 - 14), (h/2 + 4))
  print("[3] Melody")
  
  -- System button
  paintutils.drawFilledBox((w/2 + 5), (h/2 + 2), (w/2 + 18), (h/2 + 6))
  term.setCursorPos((w/2 + 7), (h/2 + 4))
  print("[4] System")
end

while true do

if term.isColour() then
  menuAdvanced()
else
  menuStandard()
end

local event, key = os.pullEvent("key")
  
  if key == keys.one then
    -- Play
    term.setBackgroundColour(colours.black)
    term.setTextColour(colours.white)
    paintutils.drawFilledBox((w/2 - 15), (h/2 - 2), (w/2 + 15), (h/2 + 3))
    centre(9, "Please wait")
    centre(10, "while disk is being checked.")
    sleep(1)
    if fs.exists("/disk/game.dc") then
      shell.run("/disk/game.dc")
    else
      term.setBackgroundColour(colours.white)
      term.setTextColour(colours.black)
      term.clear()
      centre(8, "Error!")
      centre(10, "No valid Dreamcube disk inserted!")
      sleep(2)
    end
  
  elseif key == keys.two then
    shell.run("/DC/file")
  
  elseif key == keys.three then
    shell.run("/DC/melody")
    
  elseif key == keys.four  then
    shell.run("/DC/system")
    
  else
  sleep()
  end
 end
