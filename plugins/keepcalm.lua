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
function run(msg, matches)
		local text1 = matches[2]
        local text2 = matches[3]
		local text3 = matches[4]
		local url = "http://www.keepcalmstudio.com/-/p.php?t=%EE%BB%AA%0D%0AKEEP%0D%0ACALM%0D%0A"..text1.."%0D%0A"..text2.."%0D%0A"..text3.."&bc=E31F17&tc=FFFFFF&cc=FFFFFF&uc=true&ts=true&ff=PNG&w=500&ps=sq"
		 local  file = download_to_file(url,'keep.webp')
			send_document(get_receiver(msg), file, ok_cb, false)

        
end


return {
  description = "تبدیل متن به لوگو",
  usage = {
    "/keep calm font text: ساخت لوگو",
  },
  patterns = {
   "^(کیپ کالم) (.+) (.+) (.+)$",
  },
  run = run
}

