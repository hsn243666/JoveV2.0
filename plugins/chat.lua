function run(msg)
local reply_id = msg['id']
if msg.text == "hi" and is_sudo(msg) then
local text = "Hi Dad❤"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "Hi" and is_sudo(msg) then
local text = "Hi Dad❤"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "Hello" and is_sudo(msg) then
local text = "Hi Dad❤"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "hello" and is_sudo(msg) then
local text = "Hi Dad❤"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "Bot" and is_sudo(msg) then
local text = "Yes Dad❤?"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "bot" and is_sudo(msg) then
local text = "Yes Dad❤?"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "bye" and is_sudo(msg) then
local text = "Bye Dad❤"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "Bye" and is_sudo(msg) then
local text = "Bye Dad❤"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "?" and is_sudo(msg) then
local text = "Yes Dad❤?"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "؟" and is_sudo(msg) then
local text = "Yes Dad❤?"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "Salam" and is_sudo(msg) then
local text = "Hi Dad❤"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "salam" and is_sudo(msg) then
local text = "Hi Dad❤"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "Slm" and is_sudo(msg) then
local text = "Hi Dad❤"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "slm" and is_sudo(msg) then
local text = "Hi Dad❤"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "jove" and is_sudo(msg) then
local text = "Yes Dad❤?"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "Jove" and is_sudo(msg) then
local text = "Yes Dad❤?"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "s" and is_sudo(msg) then
local text = "Hi Dad❤"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "S" and is_sudo(msg) then
local text = "Hi Dad❤"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "jove" then
local text = "Ha?Benal😐"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "Jove" then
local text = "Ha?Benal😐"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "Pouya" then
local text = "Benal Be dadi migam😐"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "pouya" then
local text = "Benal Be dadi migam😐"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "Erfan" then
local text = "Benal Be dadi migam😐"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "erfan" then
local text = "Benal Be dadi migam😐"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "Bot" then
local text = "Benal😐"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "bot" then
local text = "Benal😐"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "S" then
local text = "Dorost Salam Bede Goshad😐"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "s" then
local text = "Dorost Salam Bede Goshad😐"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "?" then
local text = "Benal😐"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "؟" then
local text = "Benal😐"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "poya" then
local text = "Benal Be dadi migam😐"
 reply_msg(reply_id, text, ok_cb, false)
end
if msg.text == "Poya" then
local text = "Benal Be dadi migam😐"
 reply_msg(reply_id, text, ok_cb, false)
end
end

return {
 description = "Chat With Robot Server", 
 usage = "chat with robot",
 patterns = {
  "^[Hh]i$",
  "^[Hh]ello$",
  "^[Bb]ot$",
  "^[Bb]ye$",
  "^?$",
  "^؟$",
  "^[Ss]alam$",
  "^[Ss]lm$",
  "^[Jj]ove$",
  "^[Pp]ouya$",
  "^[Ee]rfan$",
  "^[Pp]oya$",
  "^[Ss]$"
  },
 run = run,
    --privileged = true,
 pre_process = pre_process
}