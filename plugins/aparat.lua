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
	if matches[1]:lower() == 'آپارات' then
		local url = http.request('http://www.aparat.com/etc/api/videoBySearch/text/'..URL.escape(matches[2]))
		local jdat = json:decode(url)

		local items = jdat.videobysearch
		text = 'نتیجه جستوجو در آپارات: \n'
		for i = 1, #items do
		text = text..'\n'..i..'- '..items[i].title..'  -  تعداد بازدید: '..items[i].visit_cnt..'\n    لینک: aparat.com/v/'..items[i].uid
		end
		text = text..'\n\n@JoveTG'
		return text
	end
end

return {
   patterns = {
"^(آپارات) (.*)$",
   },
   run = run
}
