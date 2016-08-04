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
antifosh= {}-- An empty table for solving multiple kicking problem

do
local function run(msg, matches)
  if is_momod(msg) then -- Ignore mods,owner,admins
    return
  end
  local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)]['settings']['fosh'] then
    if data[tostring(msg.to.id)]['settings']['fosh'] == 'yes' then
	  if is_whitelisted(msg.from.id) then
		return
	  end
      if antifosh[msg.from.id] == true then 
        return
      end
	  if msg.to.type == 'channel' then
		local receiver = get_receiver(msg)
		local username = msg.from.username
		local name = msg.from.first_name
		if username and is_super_group(msg) then
			send_large_msg(receiver , "User > @"..msg.from.username.." Fosh Was Not Allowed Here!🚫\nSickOut!🚫\n\nیوزر @"..msg.from.username.." فحش دادن ممنوع بود!سیکتیر!🚫")
		else
			send_large_msg(receiver , "Name > : "..name.."["..msg.from.id.."] Fosh Was Not Allowed Here!🚫\n\n🚫وضعیت: فرد اخراج شد!")
		end
		local name = user_print_name(msg.from)
		savelog(msg.to.id, name.." ["..msg.from.id.."] kicked (fosh was locked) ")
		local channel_id = msg.to.id
		local user_id = msg.from.id
		  delete_msg(msg.id,ok_cb,false)
			kick_user(user_id, channel_id)
		end
		antifosh[msg.from.id] = true
    end
  end
  return
end

local function cron()
  antifosh = {} -- Clear antifosh table 
end

return {
  patterns = {
 "koskesh(.*)",
	"fuck(.*)",
	"son of bich(.*)",
	"jakesh(.*)",
	"dayous(.*)",
	"koni(.*)",
	"kos nanat(.*)",
	"kosnanat(.*)",
	"madarjende(.*)",
	"kir(.*)",
	"kos(.*)",
	"nnt(.*)",
	"konde(.*)",
	"kon(.*)",
	"kunde(.*)",
	"kun(.*)",
	"sex(.*)",
	"sexy(.*)",
	"alexis(.*)",
	"حروم زاده(.*)",
	"مادرجنده(.*)",
	"جنده(.*)",
	"کسکش(.*)",
	"کس(.*)",
	"کیر(.*)",
	"کس ننت(.*)",
	"ننت(.*)",
	"اوبی(.*)",
	"جاکش(.*)",
	"کس نگو(.*)",
	"مادر خراب",
	"جقی(.*)",
	"جغی(.*)",
	"مادر به خطا",
	"حرومی(.*)",
	"گاییدم(.*)",
	"نگاییدم",
	"مادرتو گاییدم",
	"خارکسده",
	"کون(.*)",
	"اب کون",
	"مادر لامپی",
	"خواهرتو گاییدم",
	"سکس(.*)",
	"سکسی(.*)",
	"کیرم به ارزو های مادرت",
	"کیرم به کانون گرم خانوادت",
	"کیرم به دستای زحمت کش پدرت",
	"استخون مرده هات به کون زنده هات",
	"از عصا به دست تا شیشه شیر به دست ناموستو گاییدم",
	"کسخل(.*)",
    "کس کش(.*)",
	"بی پدر مادر",
    },
  run = run,
  cron = cron
}

end
--
