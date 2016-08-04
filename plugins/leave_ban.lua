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
local function run(msg, matches)
	local data = load_data(_config.moderation.data)
	if msg.action and msg.action.type then
	local action = msg.action.type 
    if data[tostring(msg.to.id)] then
		if data[tostring(msg.to.id)]['settings'] then
			if data[tostring(msg.to.id)]['settings']['leave'] then 
				leave_ban = data[tostring(msg.to.id)]['settings']['leave']
			end
		end
    end
	if action == 'chat_del_user' and not is_momod2(msg.action.user.id) and leave_ban == 'yes' then
			local user_id = msg.action.user.id
			local chat_id = msg.to.id
			ban_user(user_id, chat_id)
		end
	end
end


return {
  patterns = {
    "^!!tgservice (.*)$"
  },
  run = run
}
-- :)
