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
local function warn_by_username(extra, success, result) -- /warn <@username>
  if success == 1 then  
  local msg = result
  local target = extra.target
  local receiver = extra.receiver 
  local hash = 'warn:'..target
  local value = redis:hget(hash, msg.id)
  local text = ''
  local name = ''
  if msg.first_name then
   name = string.sub(msg.first_name, 1, 40)
  else
   name = string.sub(msg.last_name, 1, 40)
  end
----------------------------------
  if is_momod2(msg.id, target) and not is_admin2(extra.fromid) then
  return send_msg(receiver, 'You can not give a warn to owner🚫!', ok_cb, false) end
--endif--
  if is_admin2(msg.id) then return send_msg(receiver, 'You can not give a warn to Sudo🚫!', ok_cb, false) end
--endif--
  if value then
   if value == '1' then
    redis:hset(hash, msg.id, '2')
   text = '[ '..name..' ]\n You received a warning for do not observe rules⚫️\nYour Warnings : 2/4'
   elseif value == '2' then
  redis:hset(hash, msg.id, '3')
  text = '[ '..name..' ]\n You received a warning for do not observe rules🔵\nYour Warnings : 3/4'
   elseif value == '3' then
   redis:hdel(hash, msg.id, '0')
   local hash =  'banned:'..target
   redis:sadd(hash, msg.id)
  text = '[ '..name..' ]\n You received a warning for do not observe rules🔴 (banned)\nYour Warnings : 4/4'
  chat_del_user(receiver, 'user#id'..msg.id, ok_cb, false)
   end
  else
   redis:hset(hash, msg.id, '1')
   text = '[ '..name..' ]\n You received a warning for do not observe rules⚪️\nYour Warnings : 1/4'
  end
  send_msg(receiver, text, ok_cb, false)
  else
   send_msg(receiver, ' The username not found❌', ok_cb, false)
  end
end

--

local function warn_by_reply(extra, success, result) -- (on reply) /warn
  local msg = result
  local target = extra.target
  local receiver = extra.receiver 
  local hash = 'warn:'..msg.to.id
  local value = redis:hget(hash, msg.from.id)
  local text = ''
  local name = ''
  if msg.from.first_name then
   name = string.sub(msg.from.first_name, 1, 40)
  else
   name = string.sub(msg.from.last_name, 1, 40)
  end
----------------------------------
  if is_momod2(msg.from.id, msg.to.id) and not is_admin2(extra.fromid) then
  return send_msg(receiver, 'You can not give a warn to owner!', ok_cb, false) end
--endif--
  if is_admin2(msg.from.id) then return send_msg(receiver, 'You can not give a warn to Sudo🚫!', ok_cb, false) end
--endif--
  if value then
   if value == '1' then
    redis:hset(hash, msg.from.id, '2')
   text = '[ '..name..' ]\n You received a warning for do not observe rules⚫️\nYour Warnings : 2/4'
   elseif value == '2' then
  redis:hset(hash, msg.from.id, '3')
  text = '[ '..name..' ]\n You received a warning for do not observe rules🔵\nYour Warnings : 3/4'
   elseif value == '3' then
   redis:hdel(hash, msg.from.id, '0')
  text = '[ '..name..' ]\n You received a warning for do not observe rules🔴 (banned)\nYour Warnings : 4/4'
  local hash =  'banned:'..target
  redis:sadd(hash, msg.from.id)
  chat_del_user(receiver, 'user#id'..msg.from.id, ok_cb, false)
   end
  else
   redis:hset(hash, msg.from.id, '1')
   text = '[ '..name..' ]\n You received a warning for do not observe rules⚪️\nYour Warnings : 1/4'
  end
  send_msg(receiver, text, ok_cb, false)
end

--

local function unwarn_by_username(extra, success, result) -- /unwarn <@username>
  if success == 1 then  
  local msg = result
  local target = extra.target
  local receiver = extra.receiver 
  local hash = 'warn:'..target
  local value = redis:hget(hash, msg.id)
  local text = ''
----------------------------------
  if is_momod2(msg.id, target) and not is_admin2(extra.fromid) then return end
--endif--
  if is_admin2(msg.id) then return end
--endif--
  if value then
  redis:hdel(hash, msg.id, '0')
  text = 'User Warnings ('..msg.id..') Cleaned🚫\nWarnings : 0/4'
  else
   text = 'This user did not have any warning🚫'
  end
  send_msg(receiver, text, ok_cb, false)
  else
   send_msg(receiver, ' 🚫The username not found.', ok_cb, false)
  end
end

--

local function unwarn_by_reply(extra, success, result) -- (on reply) /unwarn
  local msg = result
  local target = extra.target
  local receiver = extra.receiver 
  local hash = 'warn:'..msg.to.id
  local value = redis:hget(hash, msg.from.id)
  local text = ''
  local name = ''
  if msg.from.first_name then
   name = string.sub(msg.from.first_name, 1, 40)
  else
   name = string.sub(msg.from.last_name, 1, 40)
end
----------------------------------
  if is_momod2(msg.from.id, msg.to.id) and not is_admin2(extra.fromid) then
  return end
--endif--
  if is_admin2(msg.from.id) then return end
--endif--
  if value then
  redis:hdel(hash, msg.from.id, '0')
  text = 'User Warnings ('..name..') Cleaned🚫\nWarnings : 0/4'
  else
   text = 'This user did not have any warning🚫'
  end
  send_msg(receiver, text, ok_cb, false)
end

--

local function run(msg, matches)
 local target = msg.to.id
 local fromid = msg.from.id
 local user = matches[2]
 local target = msg.to.id
 local receiver = get_receiver(msg)
 if msg.to.type == 'user' then return end
 --endif--
 if not is_momod(msg) then return '🚫You are not a admin' end
 --endif--
 ----------------------------------
 if matches[1]:lower() == 'warn' and not matches[2] then -- (on reply) /warn
  if msg.reply_id then
    local Reply = msg.reply_id
    msgr = get_message(msg.reply_id, warn_by_reply, {receiver=receiver, Reply=Reply, target=target, fromid=fromid})
  else return 'Use Reply or Id for give Warning🚫' end
 --endif--
 end
 if matches[1]:lower() == 'warn' and matches[2] then -- /warn <@username>
   if string.match(user, '^%d+$') then
      return 'Use Reply or Id for give Warning🚫'
    elseif string.match(user, '^@.+$') then
      username = string.gsub(user, '@', '')
      msgr = res_user(username, warn_by_username, {receiver=receiver, user=user, target=target, fromid=fromid})
   end
 end
 if matches[1]:lower() == 'unwarn' and not matches[2] then -- (on reply) /unwarn
  if msg.reply_id then
    local Reply = msg.id
    msgr = get_message(msg.reply_id, unwarn_by_reply, {receiver=receiver, Reply=Reply, target=target, fromid=fromid})
  else return 'Use Reply or Id for give Warning🚫' end
 --endif--
 end
 if matches[1]:lower() == 'unwarn' and matches[2] then -- /unwarn <@username>
   if string.match(user, '^%d+$') then
      return 'Use Reply or Id for give Warning🚫'
    elseif string.match(user, '^@.+$') then
      username = string.gsub(user, '@', '')
      msgr = res_user(username, unwarn_by_username, {receiver=receiver, user=user, target=target, fromid=fromid})
   end
 end
end

return {
  patterns = {
    "^([Ww][Aa][Rr][Nn])$",
    "^([Ww][Aa][Rr][Nn]) (.*)$",
    "^([Uu][Nn][Ww][Aa][Rr][Nn])$",
    "^([Uu][Nn][Ww][Aa][Rr][Nn]) (.*)$",
    "^[!/]([Ww][Aa][Rr][Nn])$",
    "^[!/]([Ww][Aa][Rr][Nn]) (.*)$",
    "^[!/]([Uu][Nn][Ww][Aa][Rr][Nn])$",
    "^[!/]([Uu][Nn][Ww][Aa][Rr][Nn]) (.*)$"
  }, 
  run = run 
}
