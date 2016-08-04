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
  if matches[1] == 'من' then
    if is_sudo(msg) then
    send_document(get_receiver(msg), "/root/jove/data/me/version.webp", ok_cb, false)
      return "شما سودو هستید!🌟🌟🌟🌟"
    elseif is_admin(msg) then
    send_document(get_receiver(msg), "/root/jove/me/admin.webp", ok_cb, false)
      return "شما ادمین هستید!🌟🌟🌟"
    elseif is_owner(msg) then
    send_document(get_receiver(msg), "/root/jove/me/owner.webp", ok_cb, false)
      return "شما صاحب گروه هستید!🌟🌟"
    elseif is_momod(msg) then
    send_document(get_receiver(msg), "/root/jove/me/mod.webp", ok_cb, false)
      return "شما مد هستید!🌟"
    else
    send_document(get_receiver(msg), "/root/jove/me/mmbr.webp", ok_cb, false)
      return "شما فقط یک کاربری! :("
    end
  end
end

return {
  patterns = {
    "^(من)$",
    },
  run = run
}
end

--[[BY @vVv_ERPO_vVv:)]]
