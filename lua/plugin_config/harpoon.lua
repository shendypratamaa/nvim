local harpoon_ok, harpoon = pcall(require, 'harpoon')

if not harpoon_ok then
  return
end

harpoon.setup()

