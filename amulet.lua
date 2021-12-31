local sha = require("sha2") -- https://github.com/Egor-Skriptunoff/pure_lua_SHA

-- Solver for https://text.bargains/amulet/

-- "An amulet is a kind of poem that depends on language, code, and luck."

-- 8888: common
-- 88888: uncommon
-- 888888: rare
-- 8888888: epic
-- 88888888: legendary
-- 888888888: mythic
-- 8888888888+: ???

function solve(text)
  local hashed = sha.sha256(text)
  local size = #text
  local rarist = ""

  for rarity in hashed:gmatch("8+") do
    if #rarity > #rarist then
      rarist = rarity
    end
  end

  if #text > 64 then
    size = size .. '!'
  end

  return rarist, size, hashed
end

local secret = [[If you can't write poems,
write me]]

print('\n' .. secret .. '\n\n' .. solve(secret))
