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
do

local function run(msg, matches)
  if matches[1] == 'me' then
    if is_sudo(msg) then
    send_document(get_receiver(msg), "/root/jove/data/me/sudo.webp", ok_cb, false)
      return "You are Sudo!🌟🌟🌟🌟"
    elseif is_admin(msg) then
    send_document(get_receiver(msg), "/root/jove/me/admin.webp", ok_cb, false)
      return "You are Admin!🌟🌟🌟"
    elseif is_owner(msg) then
    send_document(get_receiver(msg), "/root/jove/me/owner.webp", ok_cb, false)
      return "You are Owner!🌟🌟"
    elseif is_momod(msg) then
    send_document(get_receiver(msg), "/root/jove/me/mod.webp", ok_cb, false)
      return "You are Moderation!🌟"
    else
    send_document(get_receiver(msg), "/root/jove/me/mmbr.webp", ok_cb, false)
      return "You are just a member! :("
    end
  end
end

return {
  patterns = {
    "^([Mm]e)$",
    },
  run = run
}
end

--[[BY @vVv_ERPO_vVv:)]]
