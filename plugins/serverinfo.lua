local function run(msg, matches)
local text = io.popen("sh ./data/cmd.sh"):read('*all')
if is_sudo(msg) then
  return text
end
  end
return {
  patterns = {
    '^مشخصات سرور$',
    '^serverinfo$',
  },
  run = run,
  moderated = true
}

-- @vVv_ERPO_vVv
