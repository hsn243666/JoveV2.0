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
local function todoc(msg, success, result)
  local receiver = get_receiver(msg)
  if success then
    local file = 'data/files/'..msg.from.id..'.png'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    send_document(get_receiver(msg), file, ok_cb, false)
    redis:del("sticker:doc")
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
  end
end
local function tophoto(msg, success, result)
  local receiver = get_receiver(msg)
  if success then
    local file = 'data/photos/'..msg.from.id..'.jpg'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    send_photo(get_receiver(msg), file, ok_cb, false)
    redis:del("sticker:photo")
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
  end
end
local function tosticker(msg, success, result)
  local receiver = get_receiver(msg)
  if success then
    local file = 'data/stickers-/'..msg.from.id..'.webp'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    send_document(get_receiver(msg), file, ok_cb, false)
    redis:del("photo:sticker")
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
  end
end
local function dtosticker(msg, success, result)
  local receiver = get_receiver(msg)
  if success then
    local file = 'data/stickers-/'..msg.from.id..'.webp'
    print('File downloaded to:', result)
    os.rename(result, file)
    print('File moved to:', file)
    send_photo(get_receiver(msg), file, ok_cb, false)
    redis:del("sticker:photodoc")
  else
    print('Error downloading: '..msg.id)
    send_large_msg(receiver, 'Failed, please try again!', ok_cb, false)
  end
end
local function run(msg,matches)
    local receiver = get_receiver(msg)
    local group = msg.to.id
    if msg.reply_id then
       if msg.to.type == 'document' and redis:get("sticker:photo") then
        if redis:set("sticker:photo", "waiting") then
        end
       end
    
      if matches[1]:lower() == "photo" then
     redis:get("sticker:photo")  
        load_document(msg.reply_id, tophoto, msg)
    end
       if msg.to.type == 'document' and redis:get("sticker:doc") then
        if redis:set("sticker:doc", "waiting") then
        end
       end
    
      if matches[1]:lower() == "file" then
     redis:get("sticker:doc")  
        load_document(msg.reply_id, todoc, msg)
    end
       if msg.to.type == 'photo' and redis:get("photo:sticker") then
        if redis:set("photo:sticker", "waiting") then
        end
       end
    
      if matches[1]:lower() == "sticker" then
     redis:get("photo:sticker")  
        load_photo(msg.reply_id, tosticker, msg)
    end
       if msg.to.type == 'document' and redis:get("sticker:photodoc") then
        if redis:set("sticker:photodoc", "waiting") then
        end
       end
    
      if matches[1]:lower() == "sticker" then
     redis:get("sticker:photodoc")  
        load_document(msg.reply_id, dtosticker, msg)
    end
end
end
return {
  patterns = {
 "^(sticker)$",
 "%[(photo)%]",
 "^(file)$",
 "^(photo)$",
 "%[(document)%]",
  },
  run = run,
  }
  end
