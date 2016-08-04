--[[
|------------------------------------------------- |--------- ______-----------------_________---|
|   ______   __   ______    _____     _____    __  |  _____  |  ____|  __     __    /  _______/  |
|  |__  __| |  | |__  __|  /     \   |     \  |  | | |__   | | |____  |  |   |  |  /  /______    |
|    |  |   |  |   |  |   /  /_\  \  |  |\  \ |  | |   /  /  |  ____| |  |   |  |  \______   /   |
|    |  |   |  |   |  |  /  _____  \ |  | \  \|  | |  /  /_  | |____  |  |___|  |   _____/  /    |
|    |__|   |__|   |__| /__/     \__\|__|  \_____| | |_____| |______|  \_______/  /________/     |
|--------------------------------------------------|---------------------------------------------|
|  This Project Powered by : Pouya Poorrahman CopyRight 2016 Jove Version 2.0 Anti Spam Cli Bot  |
|------------------------------------------------------------------------------------------------|
]]
local function Mosy(msg, matches)
if matches[1]:lower() == 'clean' then 
      if not is_sudo(msg) then
        return "Only for Sudo!"
      end
if matches[2] == 'gbanlist' then 
local hash = 'gbanned'
    --[[    local data_cat = 'gbanlist'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)]]
send_large_msg(get_receiver(msg), "gbanlist cleand.")
redis:del(hash)
     end
if matches[2] == 'banlist' and is_owner(msg) then
local chat_id = msg.to.id
local hash = 'banned:'..chat_id
      --[[  local data_cat = 'banlist'
        data[tostring(msg.to.id)][data_cat] = nil
        save_data(_config.moderation.data, data)]]
send_large_msg(get_receiver(msg), "bnlist cleand.")
redis:del(hash)
end
end
 end

return {
  patterns = {
  "([Cc]lean) (.*)$",
  },
  run = Mosy
}

--By @Mosy15
-- @HiddenTM
--کپی بدون ذکر منبع شرعا حرام است
