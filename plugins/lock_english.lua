antieng= {}-- An empty table for solving multiple kicking problem

do
local function run(msg, matches)
  if is_momod(msg) then -- Ignore mods,owner,admins
    return
  end
  local data = load_data(_config.moderation.data)
  if data[tostring(msg.to.id)]['settings']['english'] then
    if data[tostring(msg.to.id)]['settings']['english'] == 'yes' then
	  if is_whitelisted(msg.from.id) then
		return
	  end
      if antieng[msg.from.id] == true then 
        return
      end
	  if msg.to.type == 'channel' then
		local receiver = get_receiver(msg)
		local username = msg.from.username
		local name = msg.from.first_name
		if username and is_super_group(msg) then
			send_large_msg(receiver , "⚠️ کاربر "..name.." با آیدی کاربری "..msg.from.id.."\n🚫 استفاده از زبان انگلیسی برا چت کردن ممنوع است!\n🔺یوزرنیم شما : "..msg.from.username.."\n🚩 #وضعیت : پیام شما حذف شد!")
		else
			send_large_msg(receiver , "⚠️ کاربر "..name.." با آیدی کاربری "..msg.from.id.."\n🚫 استفاده از زبان انگلیسی برا چت کردن ممنوع است!\n🚩 #وضعیت : پیام شما حذف شد!")
		end
		local name = user_print_name(msg.from)
		savelog(msg.to.id, name.." ["..msg.from.id.."] kicked (eng was locked) ")
		local channel_id = msg.to.id
		local user_id = msg.from.id
		  delete_msg(msg.id,ok_cb,false) 
		  end
		antieng[msg.from.id] = true
    end
  end
  return
end

local function cron()
  antieng = {} -- Clear antifosh table 
end

return {
  patterns = {
"(Q)",
"(W)",
"(E)",
"(R)",
"(T)",
"(Y)",
"(U)",
"(I)",
"(O)",
"(P)",
"(A)",
"(S)",
"(D)",
"(F)",
"(G)",
"(H)",
"(J)",
"(K)",
"(L)",
"(Z)",
"(X)",
"(C)",
"(V)",
"(B)",
"(N)",
"(M)",
"(q)",
"(w)",
"(e)",
"(r)",
"(t)",
"(y)",
"(u)",
"(i)",
"(o)",
"(p)",
"(a)",
"(s)",
"(d)",
"(f)",
"(g)",
"(h)",
"(j)",
"(k)",
"(l)",
"(z)",
"(x)",
"(c)",
"(v)",
"(b)",
"(n)",
"(m)",
    },
  run = run,
  cron = cron
}

end
--