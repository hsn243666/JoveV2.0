local function run(msg, matches)
if matches[1] == 'اخراجم کن' then
local hash = 'kick:'..msg.to.id..':'..msg.from.id
     redis:set(hash, "waite")
      return '🔖کاربر عزیز ('..msg.from.username..')\nشما درخواست اخراج خود از گروه را ارسال کردید\nاگر با این درخواست موافقت دارید عبارت بله را ارسال کنید'
    end

    if msg.text then
  local hash = 'kick:'..msg.to.id..':'..msg.from.id
      if msg.text:match("^بله$") and redis:get(hash) == "waite" then
    redis:set(hash, "این کاربر شوت شد  از گروه بیرون")
  elseif msg.text:match("^خیر$") and redis:get(hash) == "waite" then
  send_large_msg(get_receiver(msg), "مرض داری ؟ ")
    redis:del(hash, true)

      end
    end
  local hash = 'kick:'..msg.to.id..':'..msg.from.id
   if redis:get(hash) then
        if redis:get(hash) == "ok" then
         channel_kick("channel#id"..msg.to.id, "user#id"..msg.from.id, ok_cb, false)
         return '❌کاربر مورد نظر بنابر درخواست خود از گروه ('..msg.to.title..') اخراج شد'
        end
      end
    end

return {
  patterns = {
  "^اخراجم کن$",
  "^بله$",
  "^خیر$"
  },
  run = run,
}