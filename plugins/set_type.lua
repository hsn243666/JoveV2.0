local function run(msg, matches, callback, extra)

local data = load_data(_config.moderation.data)

local group_type = data[tostring(msg.to.id)]['group_type']

if matches[1] and is_sudo(msg) then
    
data[tostring(msg.to.id)]['group_type'] = matches[1]
        save_data(_config.moderation.data, data)
        
        return 'نوع گروه : '..matches[1]

end
if not is_owner(msg) then 
    return 'شما نميتوانيد نوع گروه را عوض کنيد!'
    end
end
return {
  patterns = {
  "^نوع (.*)$",
  },
  run = run
}

