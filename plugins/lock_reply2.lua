do

local function pre_process(msg)
    
    --Checking mute
    local hash = 'mate:'..msg.to.id
    if redis:get(hash) and msg.reply_id and not is_sudo(msg) and not is_owner(msg) and not is_momod(msg) and not is_admin1(msg) then
            delete_msg(msg.id, ok_cb, true)
            return "done"
        end
    
        return msg
    end

  


local function run(msg, matches)
    chat_id =  msg.to.id
    
    if is_momod(msg) and matches[1] == 'قفل' then
      
            
                    local hash = 'mate:'..msg.to.id
                    redis:set(hash, true)
                    return ""
  elseif is_momod(msg) and matches[1] == 'بازکردن' then
                    local hash = 'mate:'..msg.to.id
                    redis:del(hash)
                    return ""
end

end

return {
    patterns = {
        '^(قفل) ريپلاي$',
        '^(بازکردن) ريپلاي$'
    },
    run = run,
    pre_process = pre_process
}
end