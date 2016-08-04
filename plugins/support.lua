do

function run(msg, matches)
  return " 🔰راه هاي پشتيباني🔰 : \n🔰ربات رسمي: @JoveTGBot\n🔰سودو و مديريت: @vVv_ERPO_vVv\n🔰سودو دوم: @vWv_ERPO_vWv\n🔰کانال: @JoveCH"
  end
return {
  description = "shows support link", 
  usage = "tosupport : Return supports link",
  patterns = {
    "^ساپورت$",
     "^پشتیبانی$"
  },
  run = run
}
end
