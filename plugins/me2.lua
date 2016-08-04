do

local function run(msg, matches)
  if matches[1] == 'me' then
    if is_sudo(msg) then
	  send_document(get_receiver(msg), "./files/me/sudo.webp", ok_cb, false)
      return "You are Sudo🔰🔰🔰🔰!"
    elseif is_admin(msg) then
	  send_document(get_receiver(msg), "./files/me/admin.webp", ok_cb, false)
      return "You are Admin🔰🔰🔰!"
    elseif is_owner(msg) then
	  send_document(get_receiver(msg), "./files/me/leader.webp", ok_cb, false)
      return "You are Leader🔰🔰!"
    elseif is_momod(msg) then
	  send_document(get_receiver(msg), "./files/me/moderator.webp", ok_cb, false)
      return "You are Mod🔰!"
    else
	  send_document(get_receiver(msg), "./files/me/member.webp", ok_cb, false)
      return "You are just User!"
    end
  end
end

return {
  patterns = {
    "^([Mm][Ee])$"
    },
  run = run
}
end

--[[BY @MehdiHS:)]]