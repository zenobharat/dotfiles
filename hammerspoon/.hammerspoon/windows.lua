hs.window.animationDuration = 0.2
local window = hs.getObjectMetatable("hs.window")
local spaces = require("hs.spaces")
local wf=hs.window.filter

-- +-----------------+
-- |        |        |
-- |  HERE  |        |
-- |        |        |
-- +-----------------+
function window.left(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |        |        |
-- |        |  HERE  |
-- |        |        |
-- +-----------------+
function window.right(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f)
end

-- +-----------------+
-- |      HERE       |
-- +-----------------+
-- |                 |
-- +-----------------+
function window.up(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.w = max.w
  f.y = max.y
  f.h = max.h / 2
  win:setFrame(f)
end

-- +-----------------+
-- |                 |
-- +-----------------+
-- |      HERE       |
-- +-----------------+
function window.down(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()

  f.x = max.x
  f.w = max.w
  f.y = max.y + (max.h / 2)
  f.h = max.h / 2
  win:setFrame(f)
end

-- +-----------------+
-- |  HERE  |        |
-- +--------+        |
-- |                 |
-- +-----------------+
function window.upLeft(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:fullFrame()

  f.x = max.x
  f.y = max.y
  f.w = max.w/2
  f.h = max.h/2
  win:setFrame(f)
end

-- +-----------------+
-- |                 |
-- +--------+        |
-- |  HERE  |        |
-- +-----------------+
function window.downLeft(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:fullFrame()

  f.x = max.x
  f.y = max.y + (max.h / 2)
  f.w = max.w/2
  f.h = max.h/2
  win:setFrame(f)
end

-- +-----------------+
-- |                 |
-- |        +--------|
-- |        |  HERE  |
-- +-----------------+
function window.downRight(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:fullFrame()

  f.x = max.x + (max.w / 2)
  f.y = max.y + (max.h / 2)
  f.w = max.w/2
  f.h = max.h/2

  win:setFrame(f)
end

-- +-----------------+
-- |        |  HERE  |
-- |        +--------|
-- |                 |
-- +-----------------+
function window.upRight(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:fullFrame()

  f.x = max.x + (max.w / 2)
  f.y = max.y
  f.w = max.w/2
  f.h = max.h/2
  win:setFrame(f)
end

-- +--------------+
-- |  |        |  |
-- |  |  HERE  |  |
-- |  |        |  |
-- +---------------+
function window.centerWithFullHeight(win)
  local f = win:frame()
  local screen = win:screen()
  local max = screen:fullFrame()

  f.x = max.x + (max.w / 5)
  f.w = max.w * 3/5
  f.y = max.y
  f.h = max.h
  win:setFrame(f)
end

-- function window.focus_left(w)
--   hs.window.focusedWindow():focusWindowWest()
-- end

-- function window.focus_right(w)
--   hs.window.focusedWindow():focusWindowEast()
-- end

-- function window.focus_north(w)
--   hs.window.focusedWindow():focusWindowNorth()
-- end

-- function window.focus_south(w)
--   hs.window.focusedWindow():focusWindowSouth()
-- end

function has_value (tab, val)
  for index, value in ipairs(tab) do
    if value == val then
      return true
    end
  end

  return false
end

function getWindowsInSpace(win)
  local currentSpaceId = spaces.windowSpaces(win:id())[1]
  local windows = spaces.windowsForSpace(currentSpaceId)
  local filteredWindows = wf.new(function(w)
    return has_value(windows, w:id()) and w:isVisible() and w:isStandard()
  end):getWindows()
  return filteredWindows
end

function window.nextScreen(win)
  local currentScreen = win:screen()
  local allScreens = hs.screen.allScreens()
  currentScreenIndex = hs.fnutils.indexOf(allScreens, currentScreen)
  nextScreenIndex = currentScreenIndex + 1

  if allScreens[nextScreenIndex] then
    win:moveToScreen(allScreens[nextScreenIndex])
  else
    win:moveToScreen(allScreens[1])
  end
end

function window.moveToPrevSpace(win)
  local currentScreen = win:screen()
  local currentSpaceId = spaces.windowSpaces(win:id())[1]
  local allSpaces = spaces.spacesForScreen(currentScreen:id())

  local length = #allSpaces
  for i=length, 1, -1 do
    if allSpaces[i] == currentSpaceId then
      local prevSpace = ((i - 1) % length) + ((i == 1 and 1 or 0) * length)
      spaces.moveWindowToSpace(win:id(), allSpaces[prevSpace])
      spaces.gotoSpace(allSpaces[prevSpace])
      break
    end
  end
end

function window.moveToNextSpace(win)
  local currentScreen = win:screen()
  local currentSpaceId = spaces.windowSpaces(win:id())[1]
  local allSpaces = spaces.spacesForScreen(currentScreen:id())

  for i, v in pairs(allSpaces) do
    if v == currentSpaceId then
      local nextSpace = (i % #allSpaces) + 1
      spaces.moveWindowToSpace(win:id(), allSpaces[nextSpace])
      spaces.gotoSpace(allSpaces[nextSpace])
      break;
    end
  end
end

function window.columnLayout(win)
  local windows = getWindowsInSpace(win)
  local windowCount = #windows
  local counter = 0
  hs.fnutils.each(windows, function(w)
      local f = w:frame()
      local screen = w:screen()
      local max = screen:frame()
      local width = max.w/windowCount

      f.x = max.x + (counter * width)
      f.w = width
      f.y = max.y
      f.h = max.h
      w:setFrame(f)
      counter = counter + 1
  end)
end

windowLayoutMode = hs.hotkey.modal.new({}, 'F16')

windowLayoutMode.entered = function()
  windowLayoutMode.statusMessage:show()
end
windowLayoutMode.exited = function()
  windowLayoutMode.statusMessage:hide()
end

-- Bind the given key to call the given function and exit WindowLayout mode
function windowLayoutMode.bindWithAutomaticExit(mode, modifiers, key, fn)
  mode:bind(modifiers, key, function()
    mode:exit()
    fn()
  end)
end

local status, windowMappings = pcall(require, 'windows-bindings')

if not status then
  windowMappings = require('windows-bindings-defaults')
end

local modifiers = windowMappings.modifiers
local showHelp  = windowMappings.showHelp
local trigger   = windowMappings.trigger
local mappings  = windowMappings.mappings

function getModifiersStr(modifiers)
  local modMap = { shift = '⇧', ctrl = '⌃', alt = '⌥', cmd = '⌘' }
  local retVal = ''

  for i, v in ipairs(modifiers) do
    retVal = retVal .. modMap[v]
  end

  return retVal
end

local msgStr = getModifiersStr(modifiers)
msgStr = 'Window Layout Mode (' .. msgStr .. (string.len(msgStr) > 0 and '+' or '') .. trigger .. ')'

for i, mapping in ipairs(mappings) do
  local modifiers, trigger, winFunction = table.unpack(mapping)
  local hotKeyStr = getModifiersStr(modifiers)

  if showHelp == true then
    if string.len(hotKeyStr) > 0 then
      msgStr = msgStr .. (string.format('\n%10s+%s => %s', hotKeyStr, trigger, winFunction))
    else
      msgStr = msgStr .. (string.format('\n%11s => %s', trigger, winFunction))
    end
  end

  windowLayoutMode:bindWithAutomaticExit(modifiers, trigger, function()
    --example: hs.window.focusedWindow():upRight()
    local fw = hs.window.focusedWindow()
    fw[winFunction](fw)
  end)
end

local message = require('status-message')
windowLayoutMode.statusMessage = message.new(msgStr)

-- Use modifiers+trigger to toggle WindowLayout Mode
hs.hotkey.bind(modifiers, trigger, function()
  windowLayoutMode:enter()
end)
windowLayoutMode:bind(modifiers, trigger, function()
  windowLayoutMode:exit()
end)

