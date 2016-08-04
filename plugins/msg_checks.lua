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
local function pre_process(msg)
if is_chat_msg(msg) or is_super_group(msg) then
	if msg and not is_momod(msg) and not is_whitelisted(msg.from.id) then --if regular user
	local data = load_data(_config.moderation.data)
	local print_name = user_print_name(msg.from):gsub("‮", "") -- get rid of rtl in names
	local name_log = print_name:gsub("_", " ") -- name for log
	local to_chat = msg.to.type == 'chat'
	if data[tostring(msg.to.id)] and data[tostring(msg.to.id)]['settings'] then
		settings = data[tostring(msg.to.id)]['settings']
	else
		return
	end
	if settings.lock_arabic then
		lock_arabic = settings.lock_arabic
	else
		lock_arabic = 'no'
	end
	if settings.lock_rtl then
		lock_rtl = settings.lock_rtl
	else
		lock_rtl = 'no'
	end
	if settings.lock_tgservice then
		lock_tgservice = settings.lock_tgservice
	else
		lock_tgservice = 'no'
	end
	if settings.lock_link then
		lock_link = settings.lock_link
	else
		lock_link = 'no'
	end
	if settings.member then
		member = settings.member
	else
		member = 'no'
	end
	if settings.lock_spam then
		lock_spam = settings.lock_spam
	else
		lock_spam = 'no'
	end
	if settings.lock_sticker then
		lock_sticker = settings.lock_sticker
	else
		lock_sticker = 'no'
	end
	if settings.join then   --lock_webpage
		join = settings.join
	else
		join = 'no'
	end
	if settings.lock_bots then  --lock_badw
		lock_bots = settings.lock_bots
	else
		lock_bots = 'no'
	end
	if settings.media then  --lock_audio
		media = settings.media
	else
		media = 'no'
	end
	if settings.tag then  --lock_tag
		tag = settings.tag
	else
		tag = 'no'
	end
	if settings.fwd then  --lock_fwd
		fwd = settings.fwd
	else
		fwd = 'no'
	end
	if settings.emoji then  --lock_emoji
		emoji = settings.emoji
	else
		emoji = 'no'
	end
	if settings.username then  --lock_photo
		username = settings.username
	else
		username = 'no'
	end
	if settings.reply then   --lock_gif
		reply = settings.reply
	else
		reply = 'no'
	end
	if settings.operator then  --lock_video
		operator = settings.operator
	else
		operator = 'no'
	end
	if settings.etehad then  --new
		etehad = settings.etehad
	else
		etehad = 'no'
	end
	if settings.all then  --new
		all = settings.all
	else
		all = 'no'
	end
	if settings.lock_contacts then
		lock_contacts = settings.lock_contacts
	else
		lock_contacts = 'no'
	end
	if settings.english then
		english = settings.english
	else
		english = 'no'
	end
	if settings.strict then
		strict = settings.strict
	else
		strict = 'no'
	end
		if msg and not msg.service and is_muted(msg.to.id, 'All: yes') or is_muted_user(msg.to.id, msg.from.id) and not msg.service then
			delete_msg(msg.id, ok_cb, false)
			if to_chat then
			--	kick_user(msg.from.id, msg.to.id)
			end
		end
		if msg.text then -- msg.text checks
			local _nl, ctrl_chars = string.gsub(msg.text, '%c', '')
			 local _nl, real_digits = string.gsub(msg.text, '%d', '')
			if lock_spam == "yes" and string.len(msg.text) > 2049 or ctrl_chars > 40 or real_digits > 2000 then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					delete_msg(msg.id, ok_cb, false)
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_link_msg = msg.text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
			local is_bot = msg.text:match("?[Ss][Tt][Aa][Rr][Tt]=")
			if is_link_msg and lock_link == "yes" and not is_bot then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
		end
		if msg.service then 
			if lock_tgservice == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if to_chat then
					return
				end
			end
		end
			local is_squig_msg = msg.text:match("[\216-\219][\128-\191]")
			if is_squig_msg and lock_arabic == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_badw_msg = msg.text:match("سلام") or msg.text:match("[Ss][Tt][Aa][Rr][Tt]") or msg.text:match(") or msg.to.id:match("[Bb][Oo][Tt]") or msg.from.id:match("[Bb][Oo][Tt]")
			if is_badw_msg and lock_bots == "yes" and is_bot then
				delete_msg(msg.id, ok_cb, false)
				kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_tag_msg = msg.text:match("#")
			if is_tag_msg and tag == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_fwd_msg = 'mate:'..msg.to.id
             if is_fwd_msg and fwd == "yes" and msg.fwd_from and not is_momod(msg)  then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_emoji_msg = msg.text:match("[😀😬😁😂😃😄😅☺️🙃🙂😊😉😇😆😋😌😍😘😗😙😚🤗😎🤓🤑😛😝😜😏😶😐😑😒🙄🤔😕😔😡😠😟😞😳🙁☹️😣😖😫😩😤😧😦😯😰😨😱😮😢😥😪😓😭😵😲💩💤😴🤕🤒😷🤐😈👿👹👺💀👻👽😽😼😻😹😸😺🤖🙀😿😾🙌🏻👏🏻👋🏻👍🏻👎🏻👊🏻✊🏻✌🏻👌🏻✋🏻👐🏻💪🏻🙏🏻☝🏻️👆🏻👇🏻👈🏻👉🏻🖕🏻🖐🏻🤘🏻🖖🏻✍🏻💅🏻👄👅👂🏻👃🏻👁👀👤👥👱🏻👩🏻👨🏻👧🏻👦🏻👶🏻🗣👴🏻👵🏻👲🏻🏃🏻🚶🏻💑👩‍❤️‍👩👨‍❤️‍👨💏👩‍❤️‍💋‍👩👨‍❤️‍💋‍👨👪👩‍👩‍👧‍👦👩‍👩‍👧👩‍👩‍👦👨‍👩‍👧‍👧👨‍👩‍👦‍👦👨‍👩‍👧‍👦👨‍👩‍👧👩‍👩‍👦‍👦👩‍👩‍👧‍👧👨‍👨‍👦👨‍👨‍👧👨‍👨‍👧‍👦👨‍👨‍👦‍👦👨‍👨‍👧‍👧👘👙👗👔👖👕👚💄💋👣👠👡👢👞🎒⛑👑🎓🎩👒👟👝👛👜💼👓🕶💍🌂🐶🐱🐭🐹🐰🐻🐼🐸🐽🐷🐮🦁🐯🐨🐙🐵🙈🙉🙊🐒🐔🐗🐺🐥🐣🐤🐦🐧🐴🦄🐝🐛🐌🐞🐜🕷🦂🦀🐍🐢🐠🐟🐅🐆🐊🐋🐬🐡🐃🐂🐄🐪🐫🐘🐐🐓🐁🐀🐖🐎🐑🐏🦃🕊🐕]")
			if is_emoji_msg and emoji == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_eng_msg = msg.text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]")
			if is_eng_msg and english == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
		end
			local is_username_msg = msg.text:match("@")
			if is_username_msg and username == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
		end
		local is_ope_msg = msg.text:match("ایرانسل") or msg.text:match("همراه اول") or msg.text:match("رایتل") or msg.text:match("شارژ") or msg.text:match("ارسال کد")
			if is_ope_msg and operator == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local print_name = msg.from.print_name
			local is_rtl = print_name:match("‮") or msg.text:match("‮")
			if is_rtl and lock_rtl == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			if is_muted(msg.to.id, "Text: yes") and msg.text and not msg.media and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
		end
		if msg.media then -- msg.media checks
			if msg.media.title then
				local is_link_title = msg.media.title:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.media.title:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
				if is_link_title and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local is_squig_title = msg.media.title:match("[\216-\219][\128-\191]")
				if is_squig_title and lock_arabic == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local is_tag_title = msg.media.title:match("#")
			if is_tag_title and tag == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
				local is_eng_title = msg.media.title:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]")
			if is_eng_title and english == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
		end
		local is_username_title = msg.media.title:match("@")
			if is_username_title and username == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
		end
		local is_ope_title = msg.media.title:match("ایرانسل") or msg.media.title:match("همراه اول") or msg.media.title:match("رایتل") or msg.media.title:match("شارژ") or msg.media.title:match("ارسال کد")
			if is_ope_title and operator == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			    local is_fwd_title = redis:get(hash) and msg.fwd_from
            if is_fwd_title and fwd == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			    local is_emoji_title = msg.media.title:match("[😀😬😁😂😃😄😅☺️🙃🙂😊😉😇😆😋😌😍😘😗😙😚🤗😎🤓🤑😛😝😜😏😶😐😑😒🙄🤔😕😔😡😠😟😞😳🙁☹️😣😖😫😩😤😧😦😯😰😨😱😮😢😥😪😓😭😵😲💩💤😴🤕🤒😷🤐😈👿👹👺💀👻👽😽😼😻😹😸😺🤖🙀😿😾🙌🏻👏🏻👋🏻👍🏻👎🏻👊🏻✊🏻✌🏻👌🏻✋🏻👐🏻💪🏻🙏🏻☝🏻️👆🏻👇🏻👈🏻👉🏻🖕🏻🖐🏻🤘🏻🖖🏻✍🏻💅🏻👄👅👂🏻👃🏻👁👀👤👥👱🏻👩🏻👨🏻👧🏻👦🏻👶🏻🗣👴🏻👵🏻👲🏻🏃🏻🚶🏻💑👩‍❤️‍👩👨‍❤️‍👨💏👩‍❤️‍💋‍👩👨‍❤️‍💋‍👨👪👩‍👩‍👧‍👦👩‍👩‍👧👩‍👩‍👦👨‍👩‍👧‍👧👨‍👩‍👦‍👦👨‍👩‍👧‍👦👨‍👩‍👧👩‍👩‍👦‍👦👩‍👩‍👧‍👧👨‍👨‍👦👨‍👨‍👧👨‍👨‍👧‍👦👨‍👨‍👦‍👦👨‍👨‍👧‍👧👘👙👗👔👖👕👚💄💋👣👠👡👢👞🎒⛑👑🎓🎩👒👟👝👛👜💼👓🕶💍🌂🐶🐱🐭🐹🐰🐻🐼🐸🐽🐷🐮🦁🐯🐨🐙🐵🙈🙉🙊🐒🐔🐗🐺🐥🐣🐤🐦🐧🐴🦄🐝🐛🐌🐞🐜🕷🦂🦀🐍🐢🐠🐟🐅🐆🐊🐋🐬🐡🐃🐂🐄🐪🐫🐘🐐🐓🐁🐀🐖🐎🐑🐏🦃🕊🐕]")
			if is_emoji_title and emoji == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
		end
			if msg.media.description then
				local is_link_desc = msg.media.description:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.media.description:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
				if is_link_desc and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local is_squig_desc = msg.media.description:match("[\216-\219][\128-\191]")
				if is_squig_desc and lock_arabic == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
			local is_tag_desc = msg.media.description:match("#")
			if is_tag_desc and tag == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_eng_desc = msg.media.description:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]")
			if is_eng_desc and english == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
		end
		local is_username_desc = msg.media.description:match("@")
			if is_username_desc and username == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
		end
				local is_ope_desc = msg.media.description:match("ایرانسل") or msg.media.description:match("همراه اول") or msg.media.description:match("رایتل") or msg.media.description:match("شارژ") or msg.media.description:match("ارسال کد")
			if is_ope_desc and operator == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_fwd_desc = redis:get(hash) and msg.fwd_from
            if is_fwd_desc and fwd == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_emoji_desc = msg.media.description:match("[😀😬😁😂😃😄😅☺️🙃🙂😊😉😇😆😋😌😍😘😗😙😚🤗😎🤓🤑😛😝😜😏😶😐😑😒🙄🤔😕😔😡😠😟😞😳🙁☹️😣😖😫😩😤😧😦😯😰😨😱😮😢😥😪😓😭😵😲💩💤😴🤕🤒😷🤐😈👿👹👺💀👻👽😽😼😻😹😸😺🤖🙀😿😾🙌🏻👏🏻👋🏻👍🏻👎🏻👊🏻✊🏻✌🏻👌🏻✋🏻👐🏻💪🏻🙏🏻☝🏻️👆🏻👇🏻👈🏻👉🏻🖕🏻🖐🏻🤘🏻🖖🏻✍🏻💅🏻👄👅👂🏻👃🏻👁👀👤👥👱🏻👩🏻👨🏻👧🏻👦🏻👶🏻🗣👴🏻👵🏻👲🏻🏃🏻🚶🏻💑👩‍❤️‍👩👨‍❤️‍👨💏👩‍❤️‍💋‍👩👨‍❤️‍💋‍👨👪👩‍👩‍👧‍👦👩‍👩‍👧👩‍👩‍👦👨‍👩‍👧‍👧👨‍👩‍👦‍👦👨‍👩‍👧‍👦👨‍👩‍👧👩‍👩‍👦‍👦👩‍👩‍👧‍👧👨‍👨‍👦👨‍👨‍👧👨‍👨‍👧‍👦👨‍👨‍👦‍👦👨‍👨‍👧‍👧👘👙👗👔👖👕👚💄💋👣👠👡👢👞🎒⛑👑🎓🎩👒👟👝👛👜💼👓🕶💍🌂🐶🐱🐭🐹🐰🐻🐼🐸🐽🐷🐮🦁🐯🐨🐙🐵🙈🙉🙊🐒🐔🐗🐺🐥🐣🐤🐦🐧🐴🦄🐝🐛🐌🐞🐜🕷🦂🦀🐍🐢🐠🐟🐅🐆🐊🐋🐬🐡🐃🐂🐄🐪🐫🐘🐐🐓🐁🐀🐖🐎🐑🐏🦃🕊🐕]")
			if is_emoji_desc and emoji == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
		end
			if msg.media.caption then -- msg.media.caption checks
				local is_link_caption = msg.media.caption:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.media.caption:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
				if is_link_caption and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local is_squig_caption = msg.media.caption:match("[\216-\219][\128-\191]")
					if is_squig_caption and lock_arabic == "yes" then
						delete_msg(msg.id, ok_cb, false)
						if strict == "yes" or to_chat then
							kick_user(msg.from.id, msg.to.id)
						end
					end
				if lock_sticker == "yes" and msg.media.caption:match(".webp") then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
			local is_tag_caption = msg.media.caption:match("#")
			if is_tag_caption and tag == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_eng_caption = msg.media.caption:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]")
			if is_eng_caption and english == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
		end
		local is_username_caption = msg.media.caption:match("@")
			if is_username_caption and username == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
		end
			local is_ope_caption = msg.media.caption:match("ایرانسل") or msg.media.caption:match("همراه اول") or msg.media.caption:match("رایتل") or msg.media.caption:match("شارژ") or msg.media.caption:match("ارسال کد")
			if is_ope_caption and operator == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_fwd_caption = redis:get(hash) and msg.fwd_from
            if is_fwd_caption and fwd == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_emoji_caption = msg.media.caption:match("[😀😬😁😂😃😄😅☺️🙃🙂😊😉😇😆😋😌😍😘😗😙😚🤗😎🤓🤑😛😝😜😏😶😐😑😒🙄🤔😕😔😡😠😟😞😳🙁☹️😣😖😫😩😤😧😦😯😰😨😱😮😢😥😪😓😭😵😲💩💤😴🤕🤒😷🤐😈👿👹👺💀👻👽😽😼😻😹😸😺🤖🙀😿😾🙌🏻👏🏻👋🏻👍🏻👎🏻👊🏻✊🏻✌🏻👌🏻✋🏻👐🏻💪🏻🙏🏻☝🏻️👆🏻👇🏻👈🏻👉🏻🖕🏻🖐🏻🤘🏻🖖🏻✍🏻💅🏻👄👅👂🏻👃🏻👁👀👤👥👱🏻👩🏻👨🏻👧🏻👦🏻👶🏻🗣👴🏻👵🏻👲🏻🏃🏻🚶🏻💑👩‍❤️‍👩👨‍❤️‍👨💏👩‍❤️‍💋‍👩👨‍❤️‍💋‍👨👪👩‍👩‍👧‍👦👩‍👩‍👧👩‍👩‍👦👨‍👩‍👧‍👧👨‍👩‍👦‍👦👨‍👩‍👧‍👦👨‍👩‍👧👩‍👩‍👦‍👦👩‍👩‍👧‍👧👨‍👨‍👦👨‍👨‍👧👨‍👨‍👧‍👦👨‍👨‍👦‍👦👨‍👨‍👧‍👧👘👙👗👔👖👕👚💄💋👣👠👡👢👞🎒⛑👑🎓🎩👒👟👝👛👜💼👓🕶💍🌂🐶🐱🐭🐹🐰🐻🐼🐸🐽🐷🐮🦁🐯🐨🐙🐵🙈🙉🙊🐒🐔🐗🐺🐥🐣🐤🐦🐧🐴🦄🐝🐛🐌🐞🐜🕷🦂🦀🐍🐢🐠🐟🐅🐆🐊🐋🐬🐡🐃🐂🐄🐪🐫🐘🐐🐓🐁🐀🐖🐎🐑🐏🦃🕊🐕]")
			if is_emoji_caption and emoji == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
		end
			if msg.media.type:match("contact") and lock_contacts == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_photo_caption =  msg.media.caption and msg.media.caption:match("photo")--".jpg",
			if is_muted(msg.to.id, 'Photo: yes') and msg.media.type:match("photo") or is_photo_caption and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					--	kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_gif_caption =  msg.media.caption and msg.media.caption:match(".mp4")
			if is_muted(msg.to.id, 'Gifs: yes') and is_gif_caption and msg.media.type:match("document") and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					--	kick_user(msg.from.id, msg.to.id)
				end
			end
			if is_muted(msg.to.id, 'Audio: yes') and msg.media.type:match("audio") and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			local is_video_caption = msg.media.caption and msg.media.caption:lower(".mp4","video")
			if  is_muted(msg.to.id, 'Video: yes') and msg.media.type:match("video") and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
			if is_muted(msg.to.id, 'Documents: yes') and msg.media.type:match("document") and not msg.service then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
		end
		if msg.fwd_from then
			if msg.fwd_from.title then
				local is_link_title = msg.fwd_from.title:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or msg.fwd_from.title:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/")
				if is_link_title and lock_link == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local is_squig_title = msg.fwd_from.title:match("[\216-\219][\128-\191]")
				if is_squig_title and lock_arabic == "yes" then
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local is_tag_title = msg.fwd_from.title:match("#")
			if is_tag_title and tag == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
				local is_eng_title = msg.fwd_from.title:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]")
			if is_eng_title and english == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
		end
		local is_username_title = msg.fwd_from.title:match("@")
			if is_username_title and username == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
		end
			local is_ope_title = msg.fwd_from.title:match("ایرانسل") or msg.fwd_from.title:match("همراه اول") or msg.fwd_from.title:match("رایتل") or msg.fwd_from.title:match("شارژ") or msg.fwd_from.title:match("ارسال کد")
			if is_ope_title and operator == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
				local is_fwd_title = redis:get(hash) and msg.fwd_from
            if is_fwd_title and fwd == "yes" then
				delete_title(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end
				local is_emoji_title = msg.fwd_from.title:match("[😀😬😁😂😃😄😅☺️🙃🙂😊😉😇😆😋😌😍😘😗😙😚🤗😎🤓🤑😛😝😜😏😶😐😑😒🙄🤔😕😔😡😠😟😞😳🙁☹️😣😖😫😩😤😧😦😯😰😨😱😮😢😥😪😓😭😵😲💩💤😴🤕🤒😷🤐😈👿👹👺💀👻👽😽😼😻😹😸😺🤖🙀😿😾🙌🏻👏🏻👋🏻👍🏻👎🏻👊🏻✊🏻✌🏻👌🏻✋🏻👐🏻💪🏻🙏🏻☝🏻️👆🏻👇🏻👈🏻👉🏻🖕🏻🖐🏻🤘🏻🖖🏻✍🏻💅🏻👄👅👂🏻👃🏻👁👀👤👥👱🏻👩🏻👨🏻👧🏻👦🏻👶🏻🗣👴🏻👵🏻👲🏻🏃🏻🚶🏻💑👩‍❤️‍👩👨‍❤️‍👨💏👩‍❤️‍💋‍👩👨‍❤️‍💋‍👨👪👩‍👩‍👧‍👦👩‍👩‍👧👩‍👩‍👦👨‍👩‍👧‍👧👨‍👩‍👦‍👦👨‍👩‍👧‍👦👨‍👩‍👧👩‍👩‍👦‍👦👩‍👩‍👧‍👧👨‍👨‍👦👨‍👨‍👧👨‍👨‍👧‍👦👨‍👨‍👦‍👦👨‍👨‍👧‍👧👘👙👗👔👖👕👚💄💋👣👠👡👢👞🎒⛑👑🎓🎩👒👟👝👛👜💼👓🕶💍🌂🐶🐱🐭🐹🐰🐻🐼🐸🐽🐷🐮🦁🐯🐨🐙🐵🙈🙉🙊🐒🐔🐗🐺🐥🐣🐤🐦🐧🐴🦄🐝🐛🐌🐞🐜🕷🦂🦀🐍🐢🐠🐟🐅🐆🐊🐋🐬🐡🐃🐂🐄🐪🐫🐘🐐🐓🐁🐀🐖🐎🐑🐏🦃🕊🐕]")
			if is_emoji_msg and emoji == "yes" then
				delete_msg(msg.id, ok_cb, false)
				if strict == "yes" or to_chat then
					kick_user(msg.from.id, msg.to.id)
				end
			end --sticker
			end
			if is_muted_user(msg.to.id, msg.fwd_from.peer_id) then
				delete_msg(msg.id, ok_cb, false)
			end
		end
		if msg.service then -- msg.service checks
		local action = msg.action.type
			if action == 'chat_add_user_link' then
				local user_id = msg.from.id
				local _nl, ctrl_chars = string.gsub(msg.text, '%c', '')
				if string.len(msg.from.print_name) > 70 or ctrl_chars > 40 and lock_group_spam == 'yes' then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] joined and Service Msg deleted (#spam name)")
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						savelog(msg.to.id, name_log.." ["..msg.from.id.."] joined and kicked (#spam name)")
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local print_name = msg.from.print_name
				local is_rtl_name = print_name:match("‮")
				if is_rtl_name and lock_rtl == "yes" then
					savelog(msg.to.id, name_log.." User ["..msg.from.id.."] joined and kicked (#RTL char in name)")
					kick_user(user_id, msg.to.id)
				end
				if member == 'yes' then
					savelog(msg.to.id, name_log.." User ["..msg.from.id.."] joined and kicked (#lockmember)")
					kick_user(user_id, msg.to.id)
					delete_msg(msg.id, ok_cb, false)
				end
			end
			if action == 'chat_add_user' and not is_momod2(msg.from.id, msg.to.id) then
				local user_id = msg.action.user.id
				if string.len(msg.action.user.print_name) > 70 and lock_group_spam == 'yes' then
					savelog(msg.to.id, name_log.." ["..msg.from.id.."] added ["..user_id.."]: Service Msg deleted (#spam name)")
					delete_msg(msg.id, ok_cb, false)
					if strict == "yes" or to_chat then
						savelog(msg.to.id, name_log.." ["..msg.from.id.."] added ["..user_id.."]: added user kicked (#spam name) ")
						delete_msg(msg.id, ok_cb, false)
						kick_user(msg.from.id, msg.to.id)
					end
				end
				local print_name = msg.action.user.print_name
				local is_rtl_name = print_name:match("‮")
				if is_rtl_name and lock_rtl == "yes" then
					savelog(msg.to.id, name_log.." User ["..msg.from.id.."] added ["..user_id.."]: added user kicked (#RTL char in name)")
					kick_user(user_id, msg.to.id)
				end
				if msg.to.type == 'channel' and member == 'yes' then
					savelog(msg.to.id, name_log.." User ["..msg.from.id.."] added ["..user_id.."]: added user kicked  (#lockmember)")
					kick_user(user_id, msg.to.id)
					delete_msg(msg.id, ok_cb, false)
				end
			end
		end
	end
end

	return msg
end

return {
	patterns = {},
	pre_process = pre_process
}
