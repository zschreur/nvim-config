local defaultColor = "carbonfox"

local currentColor = defaultColor
function ColorMyPencils(color)
   currentColor = color or defaultColor

   vim.cmd.colorscheme(currentColor)
end

local isTransparent = false;
function ToggleTransparency()
   if isTransparent then
      ColorMyPencils(currentColor)
   else
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
   end

   isTransparent = not isTransparent
end

ColorMyPencils()
-- ToggleTransparency()
