--- === Split ===

local m = {
  name = "Split",
  version = "1.0",
  author = "Evan Travers <evantravers@gmail.com>",
  license = "MIT <https://opensource.org/licenses/MIT>",
  homepage = "https://github.com/evantravers/split.spoon",
}

--- Split:split() -> table
--- Method
--- Presents an hs.chooser to pick a window to split your monitor with
m.split = function()
  local windows = hs.fnutils.map(hs.window.orderedWindows(), function(win)
    if win ~= hs.window.focusedWindow() then
      return {
        text = win:title(),
        subText = win:application():title(),
        image = hs.image.imageFromAppBundle(win:application():bundleID()),
        id = win:id()
      }
    end
  end)

  local chooser = hs.chooser.new(function(choice)
    if choice ~= nil then
      local focused = hs.window.focusedWindow()
      local toRead  = hs.window.find(choice.id)
      if hs.eventtap.checkKeyboardModifiers()['alt'] then
        hs.layout.apply({
          {nil, focused, focused:screen(), hs.layout.left70, 0, 0},
          {nil, toRead, focused:screen(), hs.layout.right30, 0, 0}
        })
      else
        hs.layout.apply({
          {nil, focused, focused:screen(), hs.layout.left50, 0, 0},
          {nil, toRead, focused:screen(), hs.layout.right50, 0, 0}
        })
      end
      toRead:raise()
      focused:focus()
    end
  end)

  chooser
    :placeholderText("Choose window for 50/50 split. Hold ⎇ for 70/30.")
    :searchSubText(true)
    :choices(windows)
    :show()
end

function m:bindHotKeys(mapping)
  local spec = {
    split = hs.fnutils.partial(self.split, self)
  }
  hs.spoons.bindHotkeysToSpec(spec, mapping)

  return self
end


return m
