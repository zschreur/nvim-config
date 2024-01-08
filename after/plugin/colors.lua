local defaultColor = "tokyonight-night"

local currentColor = defaultColor
local isTransparent = true;

function ColorMyPencils(color)
   currentColor = color or defaultColor

   vim.cmd.colorscheme(currentColor)

   if (isTransparent) then
      vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
      vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
   end
end

function ToggleTransparency()
   isTransparent = not isTransparent
   ColorMyPencils(currentColor)
end

ColorMyPencils()
