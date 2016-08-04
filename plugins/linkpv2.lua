do

function run(msg, matches)
       if not is_momod(msg) then
        return "Only for admins and Sudo!"
       end
    local data = load_data(_config.moderation.data)
      local group_link = data[tostring(msg.to.id)]['settings']['set_link']
       if not group_link then 
        return "First create new link!"
       end
         local text = "Group link:\n"..group_link
          send_large_msg('user#id'..msg.from.id, text, ok_cb, false)
           return "Sended to your PV"
end

return {
  patterns = {
    "^([Ll]inkpv)$"
  },
  run = run
}

end