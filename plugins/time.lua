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
local url , res = http.request('http://api.gpmod.ir/time/')
if res ~= 200 then return "" end
local jdat = json:decode(url)
local url = "http://latex.codecogs.com/png.download?".."\\dpi{800}%20\\huge%20\\mathfrak{{\\color{black}"..jdat.ENtime.."}}"
local file = download_to_file(url,'time.webp')
send_document(get_receiver(msg) , file, ok_cb, false)
end
 
return {
  patterns = {
    "^[#/]time$",
    "^[Tt]ime$",
     "^زمان$",
  }, 
  run = run 
