local status_ok, colorizer = pcall(require, "colorizer")
if not status_ok then
  return
end

colorizer.setup()

--local status_ok, transparent = pcall(require, "transparent")
--if not status_ok then
--  return
--end
--
--transparent.setup({
--  enable = true,
--})

local status_ok, impatient = pcall(require, "impatient")
if not status_ok then
  return
end

impatient.enable_profile()

local status_ok, _ = pcall(require, "galaxyline.themes.eviline")
if not status_ok then
  return
end

