URL     = require("./libs/url")
JSON    = require("./libs/dkjson")
serpent = require("libs/serpent")
json = require('libs/json')
Redis = require('libs/redis').connect('127.0.0.1', 6379)
http  = require("socket.http")
https   = require("ssl.https")
SshId = io.popen("echo $SSH_CLIENT ︙ awk '{ print $1}'"):read('*a')
Fx = require './libs/td'
local Fasttt =  require('tdlua') 
local client = Fasttt()
local tdf = Fx.xnxx()
local FileInformation = io.open("./Information.lua","r")
if not FileInformation then
if not Redis:get(SshId.."Info:Redis:Token") then
io.write('\27[1;31mارسل لي توكن البوت الان \nSend Me a Bot Token Now ↡\n\27[0;39;49m')
local TokenBot = io.read()
if TokenBot and TokenBot:match('(%d+):(.*)') then
local url , res = https.request('https://api.telegram.org/bot'..TokenBot..'/getMe')
local Json_Info = JSON.decode(url)
if res ~= 200 then
print('\27[1;34mعذرا توكن البوت خطأ تحقق منه وارسله مره اخره \nBot Token is Wrong\n')
else
io.write('\27[1;34mتم حفظ التوكن بنجاح \nThe token been saved successfully \n\27[0;39;49m')
TheTokenBot = TokenBot:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..TheTokenBot)
Redis:set(SshId.."Info:Redis:Token",TokenBot)
Redis:set(SshId.."Info:Redis:Token:User",Json_Info.result.username)
end 
else
print('\27[1;34mلم يتم حفظ التوكن جرب مره اخره \nToken not saved, try again')
end 
os.execute('lua5.2 Fast.lua')
end
if not Redis:get(SshId.."Info:Redis:User") then
io.write('\27[1;31mارسل معرف المطور الاساسي الان \nDeveloper UserName saved ↡\n\27[0;39;49m')
local UserSudo = io.read():gsub('@','')
if UserSudo ~= '' then
io.write('\n\27[1;34mتم حفظ معرف المطور \nDeveloper UserName saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User",UserSudo)
else
print('\n\27[1;34mلم يتم حفظ معرف المطور الاساسي \nDeveloper UserName not saved\n')
end 
os.execute('lua5.2 Fast.lua')
end
if not Redis:get(SshId.."Info:Redis:User:ID") then
io.write('\27[1;31mارسل ايدي المطور الاساسي الان \nDeveloper ID saved ↡\n\27[0;39;49m')
local UserId = io.read()
if UserId and UserId:match('(%d+)') then
io.write('\n\27[1;34mتم حفظ ايدي المطور \nDeveloper ID saved \n\n\27[0;39;49m')
Redis:set(SshId.."Info:Redis:User:ID",UserId)
else
print('\n\27[1;34mلم يتم حفظ ايدي المطور الاساسي \nDeveloper ID not saved\n')
end 
os.execute('lua5.2 Fast.lua')
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Redis:get(SshId.."Info:Redis:Token")..[[",
UserBot = "]]..Redis:get(SshId.."Info:Redis:Token:User")..[[",
UserSudo = "]]..Redis:get(SshId.."Info:Redis:User")..[[",
SudoId = ]]..Redis:get(SshId.."Info:Redis:User:ID")..[[
}
]])
Informationlua:close()
local Fast = io.open("Fast", 'w')
Fast:write([[
cd $(cd $(dirname $0); pwd)
while(true) do
lua5.3 Fast.lua
done
]])
Fast:close()
Redis:del(SshId.."Info:Redis:User:ID");Redis:del(SshId.."Info:Redis:User");Redis:del(SshId.."Info:Redis:Token:User");Redis:del(SshId.."Info:Redis:Token")
os.execute('rm -rf bot.zip ;chmod +x *;./Run')
end
Information = dofile('./Information.lua')
Sudo_Id = Information.SudoId
UserSudo = Information.UserSudo
Token = Information.Token
UserBot = Information.UserBot
Fast = Token:match("(%d+)")
os.execute('sudo rm -fr .CallBack-Bot/'..Fast)
bot = Fx.Fastbots.set_config{api_id=2692371,api_hash='fe85fff033dfe0f328aeb02b4f784930',session_name=Fast,token=Token}
chsource = Redis:get(Fast..'chsource') or "source_av"
devsource = Redis:get(Fast..'devsource') or "TR_E2S_ON_MY_MOoN"
function var(value)  
print(serpent.block(value, {comment=false}))   
end 
function requestt(req)
local link = io.popen('curl -s "'..req..'"'):read('*a')
return link
end
clock = os.clock
function sleep(n)
local t0 = clock()
while clock() - t0 <= n do end
end
function convert_time(hours)
  local second = 0
  if hours ~= nil then
      second = hours * 3600
  end
  return second
end
function request(req)
local link = io.popen('curl -s "'..req..'"'):read('*a')
return link
end
function ctime(seconds)
local seconds = tonumber(seconds)
if seconds <= 0 then
return "00:00"
else
hours = string.format("%02.f", math.floor(seconds/3600));
mins = string.format("%02.f", math.floor(seconds/60 - (hours*60)));
secs = string.format("%02.f", math.floor(seconds - hours*3600 - mins *60));
return mins..":"..secs
end
end
function plugins(msg)
for v in io.popen('ls plugin'):lines() do
if v:match(".lua$") and not Redis:sismember(Fast..'files',v) then
plugin = dofile("plugin/"..v)
if plugin and plugin.Fast and msg then
results = plugin.Fast(msg)
end
end
end
end
function RunCallBack(msg)
plugin = dofile("src/Callback.lua")
if plugin and plugin.Fast and msg then
results = plugin.Fast(msg)
end
end

function src(msg)
for v in io.popen('ls src'):lines() do
if v:match(".lua$") then
src_files = dofile("src/"..v)
if src_files and src_files.Fast and msg then
results = src_files.Fast(msg)
end
end
end
end
function start_src()
i = 0
t = "source files \n"
for v in io.popen('ls src'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
end
start_src()
function start_plugin()
i = 0
t = "plugins \n"
for v in io.popen('ls plugin'):lines() do
if v:match(".lua$") then
i = i + 1
t = t.."\27[39m"..i.."\27[36m".." - \27[10;32m"..v..",\27[m \n"
end
end
print(t)
end
start_plugin()
function s_api(web) 
local info, res = https.request(web) 
local req = json:decode(info) 
if res ~= 200 then 
return false 
end 
if not req.ok then 
return false end 
return req 
end 
function send_inlin_key(chat_id,text,inline,reply_id) 
local keyboard = {} 
keyboard.inline_keyboard = inline 
local send_api = "https://api.telegram.org/bot"..Token.."/sendMessage?chat_id="..chat_id.."&text="..URL.escape(text).."&parse_mode=Markdown&disable_web_page_preview=true&reply_markup="..URL.escape(JSON.encode(keyboard)) 
if reply_id then 
local msg_id = reply_id/2097152/0.5
send_api = send_api.."&reply_to_message_id="..msg_id 
end 
return s_api(send_api) 
end
function edit(chat,rep,text,parse, dis, disn, reply_markup)
shh = tostring(text)
if Redis:get(Fast..'rmzsource') then
shh = shh:gsub("⎋ ",Redis:get(Fast..'rmzsource'))
end
local listm = Redis:smembers(Fast.."Words:r")
for k,v in pairs(listm) do
i ,j  = string.find(shh, v)
if j and i then
local x = string.sub(shh, i,j)
local neww = Redis:get(Fast.."Word:Replace"..x)  
shh = shh:gsub(x,neww)
else
shh = shh
end
end
return bot.editMessageText(chat,rep,shh, parse, dis, disn, reply_markup)
end
function send(chat,rep,text,parse,dis,clear,disn,back,markup)
sh = tostring(text)
if Redis:get(Fast..'rmzsource') then
sh = sh:gsub("⎋ ",Redis:get(Fast..'rmzsource'))
end
local listm = Redis:smembers(Fast.."Words:r")
for k,v in pairs(listm) do
i ,j  = string.find(sh, v)
if j and i then
local x = string.sub(sh, i,j)
local neww = Redis:get(Fast.."Word:Replace"..x)  
sh = sh:gsub(x,neww)
else
sh = sh
end
end
return bot.sendText(chat,rep,sh,parse,dis, clear, disn, back, markup)
end
function ss(msg,text) 
return send(msg.chat_id,msg.id,text)
end
function calc(math) 
math = math:gsub(" ","")
if math:match("%d+") then
local res = io.popen("echo 'scale=1; "..math.."' | bc"):read('*a')
return res
else
return "⎋ لم استطيع اجراء العمليه الحسابيه"
end
end
function getbio(User)
kk = "لا يوجد"
local url = https.request("https://api.telegram.org/bot"..Token.."/getchat?chat_id="..User);
data = json:decode(url)
if data.result then
if data.result.bio then
kk = data.result.bio
end
end
return kk
end
function chat_type(ChatId)
if ChatId then
local id = tostring(ChatId)
if id:match("-100(%d+)") then
Chat_Type = 'GroupBot' 
elseif id:match("^(%d+)") then
Chat_Type = 'UserBot' 
else
Chat_Type = 'GroupBot' 
end
end
return Chat_Type
end
function coin(coin)
local Coins = tostring(coin)
local Coins = Coins:gsub('٠','0')
local Coins = Coins:gsub('١','1')
local Coins = Coins:gsub('٢','2')
local Coins = Coins:gsub('٣','3')
local Coins = Coins:gsub('٤','4')
local Coins = Coins:gsub('٥','5')
local Coins = Coins:gsub('٦','6')
local Coins = Coins:gsub('٧','7')
local Coins = Coins:gsub('٨','8')
local Coins = Coins:gsub('٩','9')
local Coins = Coins:gsub('-','')
local conis = tonumber(Coins)
return conis
end
function The_ControllerAll(UserId)
ControllerAll = false
local ListSudos = {Sudo_Id,1400467850,5092041118,5566753847,6126868374}
for k, v in pairs(ListSudos) do
if tonumber(UserId) == tonumber(v) then
ControllerAll = true
end
if Redis:sismember(Fast.."ControlAll:Groups",UserId) then
ControllerAll = true
end
end
return ControllerAll
end
function mderall(msg)
mderall = false
local statuse = Redis:sismember(Fast.."Specialall:Group",senderr)
if statuse then
mderall = true
end
return mderall
end
function Controllerbanall(ChatId,UserId)
Status = 0
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Devss = Redis:sismember(Fast.."Devss:Groups",UserId) 
if UserId == 1400467850 or UserId ==1965297568 or UserId ==9999999990 or UserId ==2133333333 or UserId ==5191619476743 or UserId ==2222222220 then
Status = true
elseif UserId == 5092041118 then
Status = true
elseif UserId == 6126868374 then
Status = true
elseif UserId == 5566753847 then
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif UserId == Fast then
Status = true
elseif Controll2 then
Status = true
elseif Devss then
Status = true
else
Status = false
end
return Status
end
function Controller(ChatId,UserId)
Status = 0
UserId = tonumber(UserId)
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Dev = Redis:sismember(Fast.."Dev:Groups",UserId) 
Devss = Redis:sismember(Fast.."Devss:Groups",UserId) 
Ownerss = Redis:sismember(Fast.."Ownerss:Group"..ChatId,UserId) 
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId) 
Creator = Redis:sismember(Fast.."Creator:Group"..ChatId,UserId)
Manger = Redis:sismember(Fast.."Manger:Group"..ChatId,UserId)
Admin = Redis:sismember(Fast.."Admin:Group"..ChatId,UserId)
Special = Redis:sismember(Fast.."Special:Group"..ChatId,UserId)
StatusMember = bot.getChatMember(ChatId,UserId).status.Fastbots
if UserId == 1400467850 then
Status = 'مطـور السـورس '
elseif UserId == 5092041118 then
Status = 'مطـور السـورس '
elseif UserId == 6126868374 then
Status = 'كريسـبــي آلـ هـقـر'
elseif UserId == 5566753847 then
Status = 'مطـور السـورس '
elseif UserId == Sudo_Id then  
Status = 'المطـور الاساسي '
elseif Controll2 then
Status = 'المطـور الاساسي '
elseif UserId == Fast then
Status = 'البوت'
elseif Devss then
Status = 'المطـور الثانوي '
elseif Dev then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Developer:Bot:Reply"..ChatId) or 'المطـــور '
elseif Ownerss then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."PresidentQ:Group:Reply"..ChatId) or  'المــــــالك 🌟'
elseif SuperCreator then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."President:Group:Reply"..ChatId) or 'المنشئ الاساسي 🌟'
elseif Creator then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Constructor:Group:Reply"..ChatId) or 'المنشــىء 🌟'
elseif Manger then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Manager:Group:Reply"..ChatId) or 'المـــــدير 🌟'
elseif Admin then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Admin:Group:Reply"..ChatId) or 'الادمـــــن 🌟'
elseif StatusMember == "chatMemberStatusCreator" then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or 'مالك الجروب'
elseif StatusMember == "chatMemberStatusAdministrator" then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or 'مشرف الجروب'
elseif Special then
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Vip:Group:Reply"..ChatId) or 'المميــز ⭐️'
else
Status = Redis:get(Fast..'SetRt'..ChatId..':'..UserId) or Redis:get(Fast.."Mempar:Group:Reply"..ChatId) or 'العضـو'
end  
return Status
end 
function Controller_Num(Num)
Status = 0
if tonumber(Num) == 1 then  
Status = 'المطور الاساسي'
elseif tonumber(Num) == 2 then  
Status = 'المطور الثانوي'
elseif tonumber(Num) == 3 then  
Status = 'المطور'
elseif tonumber(Num) == 4 then  
Status = 'المنشئ الاساسي'
elseif tonumber(Num) == 5 then  
Status = 'المنشئ'
elseif tonumber(Num) == 6 then  
Status = 'المدير'
elseif tonumber(Num) == 7 then  
Status = 'الادمن'
elseif tonumber(Num) == 8 then  
Status = 'المالك'
else
Status = 'المميز'
end  
return Status
end 
function FlterBio(Bio)
local Bio = tostring(Bio)
Bio = Bio:gsub("https://[%a%d_]+",'') 
Bio = Bio:gsub("http://[%a%d_]+",'') 
Bio = Bio:gsub("telegram.dog/[%a%d_]+",'') 
Bio = Bio:gsub("telegram.me/[%a%d_]+",'') 
Bio = Bio:gsub("t.me/[%a%d_]+",'') 
Bio = Bio:gsub("[%a%d_]+.pe[%a%d_]+",'') 
Bio = Bio:gsub("@[%a%d_]+",'')
Bio = Bio:gsub("]","")
Bio = Bio:gsub("[[]","")
return Bio
end
function last_id(channel)
local api = https.request("https://anubis.fun/api/post_num.php?channel="..channel)
local api_decode = JSON.decode(api)
local num = api_decode["last_post_id"]
return tonumber(num)
end
function GetAdminsSlahe(ChatId,UserId,user2,MsgId,t1,t2,t3,t4,t5,t6)
local GetMemberStatus = bot.getChatMember(ChatId,user2).status 
if GetMemberStatus.can_change_info then
change_info = '❬ ✔️ ❭' else change_info = '❬ ❌ ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ ✔️ ❭' else delete_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ ✔️ ❭' else invite_users = '❬ ❌ ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ ✔️ ❭' else pin_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ ✔️ ❭' else restrict_members = '❬ ❌ ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ ✔️ ❭' else promote = '❬ ❌ ❭'
end
local reply_markupp = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- تغيير معلومات الجروب : '..(t1 or change_info), data = UserId..'/groupNum1//'..user2}, 
},
{
{text = '- تثبيت الرسائل : '..(t2 or pin_messages), data = UserId..'/groupNum2//'..user2}, 
},
{
{text = '- حظر المستخدمين : '..(t3 or restrict_members), data = UserId..'/groupNum3//'..user2}, 
},
{
{text = '- دعوة المستخدمين : '..(t4 or invite_users), data = UserId..'/groupNum4//'..user2}, 
},
{
{text = '- مسح الرسائل : '..(t5 or delete_messages), data = UserId..'/groupNum5//'..user2}, 
},
{
{text = '- اضافة مشرفين : '..(t6 or promote), data = UserId..'/groupNum6//'..user2}, 
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
edit(ChatId,MsgId,"⎋ صلاحيات الادمن - ", 'md', false, false, reply_markupp)
end
function editrtp(chat,user,msgid,useri)
if Redis:sismember(Fast.."BanGroup:Group"..chat,useri) then
BanGroupz = "✔"
else
BanGroupz = "❌"
end
if Redis:sismember(Fast.."SilentGroup:Group"..chat,useri) then
SilentGroupz = "✔"
else
SilentGroupz = "❌"
end
if Redis:sismember(Fast.."SuperCreator:Group"..chat,useri)  then
SuperCreatorz = "✔"
else
SuperCreatorz = "❌"
end
if Redis:sismember(Fast.."Creator:Group"..chat,useri) then
Creatorz = "✔"
else
Creatorz = "❌"
end
if Redis:sismember(Fast.."Manger:Group"..chat,useri) then
Mangerz = "✔"
else
Mangerz = "❌"
end
if Redis:sismember(Fast.."Admin:Group"..chat,useri) then
Adminz = "✔"
else
Adminz = "❌"
end
if Redis:sismember(Fast.."Special:Group"..chat,useri) then
Specialz = "✔"
else
Specialz = "❌"
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = '- منشئ اساسي : '..SuperCreatorz, data =user..'/statusSuperCreatorz/'..useri},{text = '- منشئ : '..Creatorz, data =user..'/statusCreatorz/'..useri},
},
{
{text = '- مدير : '..Mangerz, data =user..'/statusMangerz/'..useri},{text = '- ادمن : '..Adminz, data =user..'/statusAdminz/'..useri},
},
{
{text = '- مميز : '..Specialz, data =user..'/statusSpecialz/'..useri},
},
{
{text = '- الحظر : '..BanGroupz, data =user..'/statusban/'..useri},{text = '- الكتم : '..SilentGroupz, data =user..'/statusktm/'..useri},
},
{
{text = '- عضو  ', data =user..'/statusmem/'..useri},
},
{
{text = '- اخفاء الامر ', data ='/delAmr1'}
}
}
}
return edit(chat,msgid,'*\n⎋ تحكم برتب الشخص .*', 'md', true, false, reply_markup)
end
function GetAdminsNum(ChatId,UserId)
local GetMemberStatus = bot.getChatMember(ChatId,UserId).status 
if GetMemberStatus.can_change_info then
change_info = 1 else change_info = 0
end
if GetMemberStatus.can_delete_messages then
delete_messages = 1 else delete_messages = 0
end
if GetMemberStatus.can_invite_users then
invite_users = 1 else invite_users = 0
end
if GetMemberStatus.can_pin_messages then
pin_messages = 1 else pin_messages = 0
end
if GetMemberStatus.can_restrict_members then
restrict_members = 1 else restrict_members = 0
end
if GetMemberStatus.can_promote_members then
promote = 1 else promote = 0
end
return{
promote = promote,
restrict_members = restrict_members,
invite_users = invite_users,
pin_messages = pin_messages,
delete_messages = delete_messages,
change_info = change_info
}
end
function GetSetieng(ChatId)
if Redis:get(Fast.."Lock:phshar"..ChatId) then    
alphsar = "✔️"
else 
alphsar = "❌"    
end
if Redis:get(Fast.."Lock:alkfr"..ChatId) then    
alkfr = "✔️"
else 
alkfr = "❌"    
end
if Redis:get(Fast.."Lock:tphlesh"..ChatId) then    
tphlesh = "✔️"
else 
tphlesh = "❌"    
end
if Redis:get(Fast.."Lock:farsia"..ChatId) then    
farsia = "✔️"
else 
farsia = "❌"    
end

if Redis:get(Fast.."lockpin"..ChatId) then    
lock_pin = "✔️"
else 
lock_pin = "❌"    
end
if Redis:get(Fast.."Lock:tagservr"..ChatId) then    
lock_tagservr = "✔️"
else 
lock_tagservr = "❌"
end
if Redis:get(Fast.."Lock:text"..ChatId) then    
lock_text = "✔️"
else 
lock_text = "❌ "    
end
if Redis:get(Fast.."Lock:AddMempar"..ChatId) == "kick" then
lock_add = "✔️"
else 
lock_add = "❌ "    
end    
if Redis:get(Fast.."Lock:Join"..ChatId) == "kick" then
lock_join = "✔️"
else 
lock_join = "❌ "    
end    
if Redis:get(Fast.."Lock:edit"..ChatId) then    
lock_edit = "✔️"
else 
lock_edit = "❌ "    
end
if Redis:get(Fast.."Chek:Welcome"..ChatId) then
welcome = "✔️"
else 
welcome = "❌ "    
end
if Redis:hget(Fast.."Spam:Group:User"..ChatId, "Spam:User") == "kick" then     
flood = "بالطرد "     
elseif Redis:hget(Fast.."Spam:Group:User"..ChatId,"Spam:User") == "keed" then     
flood = "بالتقييد "     
elseif Redis:hget(Fast.."Spam:Group:User"..ChatId,"Spam:User") == "mute" then     
flood = "بالكتم "           
elseif Redis:hget(Fast.."Spam:Group:User"..ChatId,"Spam:User") == "del" then     
flood = "✔️"
else     
flood = "❌ "     
end
if Redis:get(Fast.."Lock:Photo"..ChatId) == "del" then
lock_photo = "✔️" 
elseif Redis:get(Fast.."Lock:Photo"..ChatId) == "ked" then 
lock_photo = "بالتقييد "   
elseif Redis:get(Fast.."Lock:Photo"..ChatId) == "ktm" then 
lock_photo = "بالكتم "    
elseif Redis:get(Fast.."Lock:Photo"..ChatId) == "kick" then 
lock_photo = "بالطرد "   
else
lock_photo = "❌ "   
end    
if Redis:get(Fast.."Lock:Contact"..ChatId) == "del" then
lock_phon = "✔️" 
elseif Redis:get(Fast.."Lock:Contact"..ChatId) == "ked" then 
lock_phon = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Contact"..ChatId) == "ktm" then 
lock_phon = "بالكتم "    
elseif Redis:get(Fast.."Lock:Contact"..ChatId) == "kick" then 
lock_phon = "بالطرد "    
else
lock_phon = "❌ "    
end    
if Redis:get(Fast.."Lock:Link"..ChatId) == "del" then
lock_links = "✔️"
elseif Redis:get(Fast.."Lock:Link"..ChatId) == "ked" then
lock_links = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Link"..ChatId) == "ktm" then
lock_links = "بالكتم "    
elseif Redis:get(Fast.."Lock:Link"..ChatId) == "kick" then
lock_links = "بالطرد "    
else
lock_links = "❌ "    
end
if Redis:get(Fast.."Lock:Cmd"..ChatId) == "del" then
lock_cmds = "✔️"
elseif Redis:get(Fast.."Lock:Cmd"..ChatId) == "ked" then
lock_cmds = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Cmd"..ChatId) == "ktm" then
lock_cmds = "بالكتم "   
elseif Redis:get(Fast.."Lock:Cmd"..ChatId) == "kick" then
lock_cmds = "بالطرد "    
else
lock_cmds = "❌ "    
end
if Redis:get(Fast.."Lock:User:Name"..ChatId) == "del" then
lock_user = "✔️"
elseif Redis:get(Fast.."Lock:User:Name"..ChatId) == "ked" then
lock_user = "بالتقييد "    
elseif Redis:get(Fast.."Lock:User:Name"..ChatId) == "ktm" then
lock_user = "بالكتم "    
elseif Redis:get(Fast.."Lock:User:Name"..ChatId) == "kick" then
lock_user = "بالطرد "    
else
lock_user = "❌ "    
end
if Redis:get(Fast.."Lock:hashtak"..ChatId) == "del" then
lock_hash = "✔️"
elseif Redis:get(Fast.."Lock:hashtak"..ChatId) == "ked" then 
lock_hash = "بالتقييد "    
elseif Redis:get(Fast.."Lock:hashtak"..ChatId) == "ktm" then 
lock_hash = "بالكتم "    
elseif Redis:get(Fast.."Lock:hashtak"..ChatId) == "kick" then 
lock_hash = "بالطرد "    
else
lock_hash = "❌ "    
end
if Redis:get(Fast.."Lock:vico"..ChatId) == "del" then
lock_muse = "✔️"
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ked" then 
lock_muse = "بالتقييد "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ktm" then 
lock_muse = "بالكتم "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "kick" then 
lock_muse = "بالطرد "    
else
lock_muse = "❌ "    
end 
if Redis:get(Fast.."Lock:Video"..ChatId) == "del" then
lock_ved = "✔️"
elseif Redis:get(Fast.."Lock:Video"..ChatId) == "ked" then 
lock_ved = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Video"..ChatId) == "ktm" then 
lock_ved = "بالكتم "    
elseif Redis:get(Fast.."Lock:Video"..ChatId) == "kick" then 
lock_ved = "بالطرد "    
else
lock_ved = "❌ "    
end
if Redis:get(Fast.."Lock:Animation"..ChatId) == "del" then
lock_gif = "✔️"
elseif Redis:get(Fast.."Lock:Animation"..ChatId) == "ked" then 
lock_gif = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Animation"..ChatId) == "ktm" then 
lock_gif = "بالكتم "    
elseif Redis:get(Fast.."Lock:Animation"..ChatId) == "kick" then 
lock_gif = "بالطرد "    
else
lock_gif = "❌ "    
end
if Redis:get(Fast.."Lock:Sticker"..ChatId) == "del" then
lock_ste = "✔️"
elseif Redis:get(Fast.."Lock:Sticker"..ChatId) == "ked" then 
lock_ste = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Sticker"..ChatId) == "ktm" then 
lock_ste = "بالكتم "    
elseif Redis:get(Fast.."Lock:Sticker"..ChatId) == "kick" then 
lock_ste = "بالطرد "    
else
lock_ste = "❌ "    
end
if Redis:get(Fast.."Lock:geam"..ChatId) == "del" then
lock_geam = "✔️"
elseif Redis:get(Fast.."Lock:geam"..ChatId) == "ked" then 
lock_geam = "بالتقييد "    
elseif Redis:get(Fast.."Lock:geam"..ChatId) == "ktm" then 
lock_geam = "بالكتم "    
elseif Redis:get(Fast.."Lock:geam"..ChatId) == "kick" then 
lock_geam = "بالطرد "    
else
lock_geam = "❌ "    
end    
if Redis:get(Fast.."Lock:vico"..ChatId) == "del" then
lock_vico = "✔️"
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ked" then 
lock_vico = "بالتقييد "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "ktm" then 
lock_vico = "بالكتم "    
elseif Redis:get(Fast.."Lock:vico"..ChatId) == "kick" then 
lock_vico = "بالطرد "    
else
lock_vico = "❌ "    
end    
if Redis:get(Fast.."Lock:Keyboard"..ChatId) == "del" then
lock_inlin = "✔️"
elseif Redis:get(Fast.."Lock:Keyboard"..ChatId) == "ked" then 
lock_inlin = "بالتقييد "
elseif Redis:get(Fast.."Lock:Keyboard"..ChatId) == "ktm" then 
lock_inlin = "بالكتم "    
elseif Redis:get(Fast.."Lock:Keyboard"..ChatId) == "kick" then 
lock_inlin = "بالطرد "
else
lock_inlin = "❌ "
end
if Redis:get(Fast.."Lock:forward"..ChatId) == "del" then
lock_fwd = "✔️"
elseif Redis:get(Fast.."Lock:forward"..ChatId) == "ked" then 
lock_fwd = "بالتقييد "    
elseif Redis:get(Fast.."Lock:forward"..ChatId) == "ktm" then 
lock_fwd = "بالكتم "    
elseif Redis:get(Fast.."Lock:forward"..ChatId) == "kick" then 
lock_fwd = "بالطرد "    
else
lock_fwd = "❌ "    
end    
if Redis:get(Fast.."Lock:Document"..ChatId) == "del" then
lock_file = "✔️"
elseif Redis:get(Fast.."Lock:Document"..ChatId) == "ked" then 
lock_file = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Document"..ChatId) == "ktm" then 
lock_file = "بالكتم "    
elseif Redis:get(Fast.."Lock:Document"..ChatId) == "kick" then 
lock_file = "بالطرد "    
else
lock_file = "❌ "    
end    
if Redis:get(Fast.."Lock:Unsupported"..ChatId) == "del" then
lock_self = "✔️"
elseif Redis:get(Fast.."Lock:Unsupported"..ChatId) == "ked" then 
lock_self = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Unsupported"..ChatId) == "ktm" then 
lock_self = "بالكتم "    
elseif Redis:get(Fast.."Lock:Unsupported"..ChatId) == "kick" then 
lock_self = "بالطرد "    
else
lock_self = "❌ "    
end
if Redis:get(Fast.."Lock:Bot:kick"..ChatId) == "del" then
lock_bots = "✔️"
elseif Redis:get(Fast.."Lock:Bot:kick"..ChatId) == "ked" then
lock_bots = "بالتقييد "   
elseif Redis:get(Fast.."Lock:Bot:kick"..ChatId) == "kick" then
lock_bots = "بالطرد "    
else
lock_bots = "❌ "    
end
if Redis:get(Fast.."Lock:Markdaun"..ChatId) == "del" then
lock_mark = "✔️"
elseif Redis:get(Fast.."Lock:Markdaun"..ChatId) == "ked" then 
lock_mark = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Markdaun"..ChatId) == "ktm" then 
lock_mark = "بالكتم "    
elseif Redis:get(Fast.."Lock:Markdaun"..ChatId) == "kick" then 
lock_mark = "بالطرد "    
else
lock_mark = "❌ "    
end
if Redis:get(Fast.."Lock:Spam"..ChatId) == "del" then    
lock_spam = "✔️"
elseif Redis:get(Fast.."Lock:Spam"..ChatId) == "ked" then 
lock_spam = "بالتقييد "    
elseif Redis:get(Fast.."Lock:Spam"..ChatId) == "ktm" then 
lock_spam = "بالكتم "    
elseif Redis:get(Fast.."Lock:Spam"..ChatId) == "kick" then 
lock_spam = "بالطرد "    
else
lock_spam = "❌ "    
end        
return{
lock_pin = lock_pin,
lock_tagservr = lock_tagservr,
lock_text = lock_text,
lock_add = lock_add,
lock_join = lock_join,
lock_edit = lock_edit,
flood = flood,
lock_photo = lock_photo,
lock_phon = lock_phon,
lock_links = lock_links,
lock_cmds = lock_cmds,
lock_mark = lock_mark,
lock_user = lock_user,
lock_hash = lock_hash,
lock_muse = lock_muse,
lock_ved = lock_ved,
lock_gif = lock_gif,
lock_ste = lock_ste,
lock_geam = lock_geam,
lock_vico = lock_vico,
lock_inlin = lock_inlin,
lock_fwd = lock_fwd,
lock_file = lock_file,
lock_self = lock_self,
lock_bots = lock_bots,
lock_spam = lock_spam,
farsia = farsia,
tphlesh = tphlesh,
alkfr = alkfr,
alphsar = alphsar
}
end
function Total_message(Message)  
local MsgText = ''  
if tonumber(Message) < 100 then 
MsgText = 'انت مش بتتفاعل لي ؟'
elseif tonumber(Message) < 200 then 
MsgText = 'متشد شويه في التفاعل'
elseif tonumber(Message) < 400 then 
MsgText = 'انتي مكسوفه تتكلمي يبطه 🙈'
elseif tonumber(Message) < 700 then 
MsgText = 'في احسن من كدا هه'
elseif tonumber(Message) < 1200 then 
MsgText = 'انا عاوزك تولعها 😂🔥'
elseif tonumber(Message) < 2000 then 
MsgText = 'انت متفاعل يبن عمي'
elseif tonumber(Message) < 3500 then 
MsgText = 'بحبك اتفاعل كمان بقا 🥺♥'
elseif tonumber(Message) < 4000 then 
MsgText = 'استمر يبن عمي 😂🔥'
elseif tonumber(Message) < 4500 then 
MsgText = 'عاش كيك ليك'
elseif tonumber(Message) < 5500 then 
MsgText = 'انت مولعها وخاربها هنا 😂♥🔥'
elseif tonumber(Message) < 7000 then 
MsgText = 'تفاعل مفاعل نووي 😂'
elseif tonumber(Message) < 9500 then 
MsgText = 'تفاعل ام عبير وهي بتكلم ام احمد عشان تجوز احمد لعبير'
elseif tonumber(Message) < 15092041118 then 
MsgText = 'كتفم التفاعل لاجلك 😂'
end 
return MsgText 
end
function Total_groups(Message)  
local MsgText = ''  
if tonumber(Message) < 200 then 
MsgText = 'سايق مخده 😹' 
elseif tonumber(Message) < 400 then 
MsgText = 'الله بالخير 👋'
elseif tonumber(Message) < 600 then 
MsgText = 'عفيه اتفاعل 😽' 
elseif tonumber(Message) < 800 then 
MsgText = 'بدأ يتحسن 😐' 
elseif tonumber(Message) < 1000 then 
MsgText = 'شكد تحجي 😒' 
elseif tonumber(Message) < 1300 then 
MsgText = 'استمر بطل 😍' 
elseif tonumber(Message) < 1600 then 
MsgText = 'تفاعل غنبله 🙂'  
elseif tonumber(Message) < 1800 then 
MsgText = 'استمر يعسل 🥳' 
elseif tonumber(Message) < 2200 then 
MsgText = 'جيد جدا ♥️' 
elseif tonumber(Message) < 2600 then 
MsgText = 'ممتاز جدا 🥰' 
elseif tonumber(Message) < 3000 then 
MsgText = 'مــلــک 💯😻' 
elseif tonumber(Message) < 3600 then 
MsgText = 'اسطورة التفاعل❤️' 
elseif tonumber(Message) < 15092041118 then 
MsgText = 'ملك التلكرام 💖'  
end 
return MsgText 
end

function Getpermissions(ChatId)
local Get_Chat = bot.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = true else web = false
end
if Get_Chat.permissions.can_change_info then
info = true else info = false
end
if Get_Chat.permissions.can_invite_users then
invite = true else invite = false
end
if Get_Chat.permissions.can_pin_messages then
pin = true else pin = false
end
if Get_Chat.permissions.can_send_media_messages then
media = true else media = false
end
if Get_Chat.permissions.can_send_messages then
messges = true else messges = false
end
if Get_Chat.permissions.can_send_other_messages then
other = true else other = false
end
if Get_Chat.permissions.can_send_polls then
polls = true else polls = false
end

return{
web = web,
info = info,
invite = invite,
pin = pin,
media = media,
messges = messges,
other = other,
polls = polls
}
end
function Get_permissions(ChatId,UserId,MsgId)
local Get_Chat = bot.getChat(ChatId)
if Get_Chat.permissions.can_add_web_page_previews then
web = '❬ ✔️ ❭' else web = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_change_info then
info = '❬ ✔️ ❭' else info = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_invite_users then
invite = '❬ ✔️ ❭' else invite = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_pin_messages then
pin = '❬ ✔️ ❭' else pin = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_media_messages then
media = '❬ ✔️ ❭' else media = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_messages then
messges = '❬ ✔️ ❭' else messges = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_other_messages then
other = '❬ ✔️ ❭' else other = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_polls then
polls = '❬ ✔️ ❭' else polls = '❬ ❌ ❭'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- ارسال الويب : '..web, data = UserId..'/web'}, 
},
{
{text = '- تغيير معلومات الجروب : '..info, data = UserId.. '/info'}, 
},
{
{text = '- اضافه مستخدمين : '..invite, data = UserId.. '/invite'}, 
},
{
{text = '- تثبيت الرسائل : '..pin, data = UserId.. '/pin'}, 
},
{
{text = '- ارسال الميديا : '..media, data = UserId.. '/media'}, 
},
{
{text = '- ارسال الرسائل : .'..messges, data = UserId.. '/messges'}, 
},
{
{text = '- اضافه البوتات : '..other, data = UserId.. '/other'}, 
},
{
{text = '- ارسال استفتاء : '..polls, data = UserId.. '/polls'}, 
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
edit(ChatId,MsgId,"⎋ صلاحيات الجروب - ", 'md', false, false, reply_markup)
end
function Statusrestricted(ChatId,UserId)
return{
KtmAll = Redis:sismember(Fast.."KtmAll:Groups",UserId) ,
BanAll = Redis:sismember(Fast.."BanAll:Groups",UserId) ,
BanGroup = Redis:sismember(Fast.."BanGroup:Group"..ChatId,UserId) ,
SilentGroup = Redis:sismember(Fast.."SilentGroup:Group"..ChatId,UserId)
}
end
function Reply_Status(UserId,TextMsg)
local UserInfo = bot.getUser(UserId)
Name_User = FlterBio(UserInfo.first_name)
UserInfousername = '['..Name_User..'](tg://user?id='..UserId..')'
return {
Lock     = '\n*⎋ بواسطه ← *'..UserInfousername..'\n*'..TextMsg..'\n⎋ خاصيه المسح *',
unLock   = '\n*⎋ بواسطه ← *'..UserInfousername..'\n'..TextMsg,
lockKtm  = '\n*⎋ بواسطه ← *'..UserInfousername..'\n*'..TextMsg..'\n⎋ خاصيه الكتم *',
lockKid  = '\n*⎋ بواسطه ← *'..UserInfousername..'\n*'..TextMsg..'\n⎋ خاصيه التقييد *',
lockKick = '\n*⎋ بواسطه ← *'..UserInfousername..'\n*'..TextMsg..'\n⎋ خاصيه الطرد *',
Reply    = '\n*⎋ المستخدم ← *'..UserInfousername..'\n*'..TextMsg..'*'
}
end
function StatusCanOrNotCan(ChatId,UserId)
Status = nil
UserId = tonumber(UserId)
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Devss = Redis:sismember(Fast.."Devss:Groups",UserId) 
Dev = Redis:sismember(Fast.."Dev:Groups",UserId) 
Ownerss = Redis:sismember(Fast.."Ownerss:Group"..ChatId,UserId) 
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId) 
Creator = Redis:sismember(Fast.."Creator:Group"..ChatId,UserId)
Manger = Redis:sismember(Fast.."Manger:Group"..ChatId,UserId)
Admin = Redis:sismember(Fast.."Admin:Group"..ChatId,UserId)
Special = Redis:sismember(Fast.."Special:Group"..ChatId,UserId)
StatusMember = bot.getChatMember(ChatId,UserId).status.Fastbots
if UserId == 1400467850 or UserId ==1965297568 or UserId ==9999999990 or UserId ==2133333333 or UserId ==5191619476743 or UserId ==2222222220 then
Status = true
elseif UserId == 5092041118 then
Status = true
elseif UserId == 6126868374 then
Status = true
elseif UserId == 5566753847 then
Status = true
elseif UserId == Sudo_Id then  
Status = true
elseif Controll2 then
Status = true
elseif UserId == Fast then
Status = true
elseif Devss then
Status = true
elseif Dev then
Status = true
elseif Ownerss then
Status = true
elseif SuperCreator then
Status = true
elseif Creator then
Status = true
elseif Manger then
Status = true
elseif Admin then
Status = true
elseif Special then
Status = true
else
Status = false
end  
return Status
end 
function StatusSilent(ChatId,UserId)
Status = nil
UserId = tonumber(UserId)
local Controll2 = Redis:sismember(Fast.."ControlAll:Groups",UserId)
Devss = Redis:sismember(Fast.."Devss:Groups",UserId) 
Dev = Redis:sismember(Fast.."Dev:Groups",UserId) 
Ownerss = Redis:sismember(Fast.."Ownerss:Group"..ChatId,UserId) 
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..ChatId,UserId) 
Creator = Redis:sismember(Fast.."Creator:Group"..ChatId,UserId)
Manger = Redis:sismember(Fast.."Manger:Group"..ChatId,UserId)
Admin = Redis:sismember(Fast.."Admin:Group"..ChatId,UserId)
Special = Redis:sismember(Fast.."Special:Group"..ChatId,UserId)
StatusMember = bot.getChatMember(ChatId,UserId).status.Fastbots
if UserId == 1400467850 or UserId ==1965297568 or UserId ==9999999990 or UserId ==2133333333 or UserId ==5191619476743 or UserId ==2222222220 then
Status = true
elseif UserId == 5092041118 then
Status = true
elseif UserId == 6126868374 then
Status = true
elseif UserId == 5566753847 then
Status = true
elseif UserId == Sudo_Id then    
Status = true
elseif Controll2 then
Status = true
elseif UserId == Fast then
Status = true
elseif Devss then
Status = true
elseif Dev then
Status = true
elseif Ownerss then
Status = true
elseif SuperCreator then
Status = true
elseif Creator then
Status = true
elseif Manger then
Status = true
elseif Admin then
Status = true
elseif StatusMember == "chatMemberStatusCreator" then
Status = true
else
Status = false
end  
return Status
end 
function GetInfoBot(msg)
local GetMemberStatus = bot.getChatMember(msg.chat_id,Fast).status 
if GetMemberStatus.can_change_info then
change_info = true else change_info = false
end
if GetMemberStatus.can_delete_messages then
delete_messages = true else delete_messages = false
end
if GetMemberStatus.can_invite_users then
invite_users = true else invite_users = false
end
if GetMemberStatus.can_pin_messages then
pin_messages = true else pin_messages = false
end
if GetMemberStatus.can_restrict_members then
restrict_members = true else restrict_members = false
end
if GetMemberStatus.can_promote_members then
promote = true else promote = false
end
return{
SetAdmin = promote,
BanUser = restrict_members,
Invite = invite_users,
PinMsg = pin_messages,
DelMsg = delete_messages,
Info = change_info
}
end
function download_to_file(url, file_path) 
local respbody = {} 
local options = { url = url, sink = ltn12.sink.table(respbody), redirect = true } 
local response = nil 
options.redirect = false 
response = {https.request(options)} 
local code = response[2] 
local headers = response[3] 
local status = response[4] 
if code ~= 200 then return false, code 
end 
file = io.open(file_path, "w+") 
file:write(table.concat(respbody)) 
file:close() 
return file_path, code 
end 
function download(url,name)
if not name then
name = url:match('([^/]+)$')
end
if string.find(url,'https') then
data,res = https.request(url)
elseif string.find(url,'http') then
data,res = http.request(url)
else
return 'The link format is incorrect.'
end
if res ~= 200 then
return 'check url , error code : '..res
else
file = io.open(name,'w')
file:write(data)
file:close()
print('Downloaded :> '..name)
return './'..name
end
end
local function Info_Video(x)
local f=io.popen(x)
if f then
local s=f:read"*a"
f:close()
if s == 'a' then
end
return s
end
end
function ChannelJoinch(msg)
JoinChannel = true
local Channel = Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..senderr)
local ChannelJoin = JSON.decode(url)
if ChannelJoin.result.status == "left" then
JoinChannel = false
end
end
return JoinChannel
end
function ChannelJoin(msg)
JoinChannel = true
if not Redis:sismember(Fast.."BotFree:Group:",msg.chat_id) then
local Channel = Redis:get(Fast..'Channel:Join')
if Channel then
local url , res = https.request('https://api.telegram.org/bot'..Token..'/getchatmember?chat_id=@'..Channel..'&user_id='..senderr)
local ChannelJoin = JSON.decode(url)
if ChannelJoin_result_status == "left" then
JoinChannel = false
end
end
end
return JoinChannel
end

function File_Bot_Run(msg,data)  
--var(data)
local msg_chat_id = msg.chat_id
local msg_reply_id = msg.reply_to_message_id
local msg_user_send_id = msg.sender_id.user_id
senderr = msg.sender_id.user_id
local msg_id = msg.id
local text = nil
if msg.reply_to_message_id ~= 0 then
local mrply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if mrply and mrply.sender_id then
rep_idd = mrply.sender_id.user_id or mrply.sender_id.chat_id
else
return false 
end
end
--[[
if msg.content.voice_note and Redis:get(Fast..msg_chat_id.."sound:cmd") then 
local mr = msg.content.voice_note.voice.remote.id
local url = http.request("http://159.223.13.231/oda/voiceRecognise?token="..Token.."&file_id="..mr)
local json = JSON.decode(url)
if json and json.msg then
text = json.msg
print(text)
end --]]
if data.content.text then
xname =  (Redis:get(Fast.."Name:Bot") or "[آڤتآر]") 
text = data.content.text.text
if text:match("^"..xname.." (.*)$") then
text = text:match("^"..xname.." (.*)$")
end
end


if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end 

if tonumber(senderr) == 1400467850 or tonumber(senderr) ==1965297568 or tonumber(senderr) ==9999999990 or tonumber(senderr) ==2133333333 or tonumber(senderr) ==5191619476743 or tonumber(senderr) ==2222222220 then
msg.Name_Controller = 'مطـور السـورس  '
msg.The_Controller = 1
elseif tonumber(senderr) == 6126868374 then
msg.Name_Controller = 'كريسـبــي آلـ هـقـر'
msg.The_Controller = 1
elseif tonumber(senderr) == 5092041118 then
msg.Name_Controller = 'مطـور السـورس  '
msg.The_Controller = 1
elseif tonumber(senderr) == 5566753847 then
msg.Name_Controller = 'مطـور السـورس  '
msg.The_Controller = 1
elseif The_ControllerAll(senderr) == true then  
msg.The_Controller = 1
msg.Name_Controller = 'المطـور الاساسي  '
elseif Redis:sismember(Fast.."Devss:Groups",senderr) == true then
msg.The_Controller = 2
msg.Name_Controller = 'المطـور الثانوي '
elseif Redis:sismember(Fast.."Dev:Groups",senderr) == true then
msg.The_Controller = 3
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Developer:Bot:Reply"..msg.chat_id) or 'المطـــور  '
elseif Redis:sismember(Fast.."Ownerss:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 44
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."PresidentQ:Group:Reply"..msg.chat_id) or 'المــــــالك 🌟 '
elseif Redis:sismember(Fast.."SuperCreator:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 4
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."President:Group:Reply"..msg.chat_id) or 'المنشئ الاساسي 🌟'
elseif Redis:sismember(Fast.."Creator:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 5
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Constructor:Group:Reply"..msg.chat_id) or 'المنشــىء 🌟 '
elseif Redis:sismember(Fast.."Manger:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 6
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Manager:Group:Reply"..msg.chat_id) or 'المــــدير 🌟 '
elseif Redis:sismember(Fast.."Admin:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 7
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Admin:Group:Reply"..msg.chat_id) or 'الادمـــــن 🌟 '
elseif Redis:sismember(Fast.."Special:Group"..msg.chat_id,senderr) == true then
msg.The_Controller = 8
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Vip:Group:Reply"..msg.chat_id) or 'المميــز ⭐️ '
elseif tonumber(senderr) == tonumber(Fast) then
msg.The_Controller = 9
else
msg.The_Controller = 10
msg.Name_Controller = Redis:get(Fast..'SetRt'..msg.chat_id..':'..senderr) or Redis:get(Fast.."Mempar:Group:Reply"..msg.chat_id) or 'العضـو '
end  
if msg.The_Controller == 1 then  
msg.Asasy = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 then
msg.Devss = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 then
msg.Dev = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 9 then
msg.Ownerss = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 9 then
msg.SuperCreator = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 9 then
msg.Creator = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 9 then
msg.Manger = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 9 then
msg.Admin = true
end
if msg.The_Controller == 1 or msg.The_Controller == 2 or msg.The_Controller == 3 or msg.The_Controller == 44 or msg.The_Controller == 4 or msg.The_Controller == 5 or msg.The_Controller == 6 or msg.The_Controller == 7 or msg.The_Controller == 8 or msg.The_Controller == 9 then
msg.Special = true
end
if text and Redis:get(Fast.."chmembers") == "on" then
if ChannelJoin(msg) == false then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local n = UserInfo.first_name
local d = UserInfo.id
local chinfo = Redis:get(Fast.."Channel:Redis")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
bot.deleteMessages(msg.chat_id,{[1]= msg_id})
return send(msg.chat_id,0,'⎋ تنبيه يا ['..n..']('..d..') \n⎋ عليك الاشتراك في قناه البوت للتمكن من التحدث هنا\n',"md",false, false, false, false, reply_markup)
end 
end
list_A_files = {"Callback.lua","script.lua","pvbot.lua","rtba.lua"}
if text and text:match("^تعطيل ملف (.*)$") then
if msg.Asasy then
local file = text:match("^تعطيل ملف (.*)$")
if file:match("(.*).lua") then
for k,c in pairs(list_A_files) do
if c == file then
return send(msg.chat_id,msg.id,"⎋ من الملفات الاساسيه لا يمكن التحكم به")
end
end
for v in io.popen('ls plugin'):lines() do
if v == file then
Redis:sadd(Fast..'files',file)
return send(msg.chat_id,msg.id,"⎋ تم تعطيل ملف "..file)
end
end
send(msg.chat_id,msg.id,"⎋ لا يوجد ملف بهذا الاسم")
else
send(msg.chat_id,msg.id,"⎋ يجيب ان يكون الملف بصيغه lua")
end
else
send(msg.chat_id,msg.id,"⎋ هذا الامر يخص المطور الاساسي")
end
end

if text and text:match("^تفعيل ملف (.*)$") then
if msg.Asasy then
local file = text:match("^تفعيل ملف (.*)$")
if file:match("(.*).lua") then
for k,c in pairs(list_A_files) do
if c == file then
return send(msg.chat_id,msg.id,"⎋ من الملفات الاساسيه لا يمكن التحكم به")
end
end
for v in io.popen('ls plugin'):lines() do
if v == file then
Redis:srem(Fast..'files',file)
return send(msg.chat_id,msg.id,"⎋ تم تفعيل ملف "..file)
end
end
send(msg.chat_id,msg.id,"⎋ لا يوجد ملف بهذا الاسم")
else
send(msg.chat_id,msg.id,"⎋ يجيب ان يكون الملف بصيغه lua")
end
else
send(msg.chat_id,msg.id,"⎋ هذا الامر يخص المطور الاساسي")
end
end
if text == "الملفات" then
if msg.Asasy then
i = 0 
txx = "قائمه ملفاتك (*اضغط علي اسم ملف ليتم نسخه*)\n\n"
for v in io.popen('ls plugin'):lines() do
if Redis:sismember(Fast..'files',v) then
state = "{معطل}"
else 
state = "{مفعل}"
end
i = i +1
txx = txx..i..'- `'..v..'` '..state..'\n'
end
if i < 1 then
send(msg.chat_id,msg.id,"⎋ لا توجد ملفات","md")
else
send(msg.chat_id,msg.id,txx.."\n\n *يمكنك تفعيل الملف عن طريق امر  (تفعيل ملف + اسم الملف)*","md")
end
else
send(msg.chat_id,msg.id,"⎋ هذا الامر يخص المطور الاساسي")
end
end

plugins(msg)
src(msg)

if text then
local neww = Redis:get(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text) or Redis:get(Fast.."All:Get:Reides:Commands:Group"..text)
if neww and not Redis:get(Fast.."Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender_id.user_id) then
text = neww or text
end
end
if msg.sender_id.Fastbots ~= "messageSenderChat" then
if Statusrestricted(msg.chat_id,msg.sender_id.user_id).KtmAll == true then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
elseif Statusrestricted(msg.chat_id,msg.sender_id.user_id).BanAll == true then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id}),bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender_id.user_id).BanGroup == true then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id}),bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
elseif Statusrestricted(msg.chat_id,msg.sender_id.user_id).SilentGroup == true then
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end
if (Redis:get(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'DelFilterq') then   
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.Fastbots == "messagePhoto" then
Filters = 'الصوره'
Redis:srem(Fast.."All:List:Filter",'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:del(Fast.."All:Filter:Group:"..msg.content.photo.sizes[1].photo.id)  
elseif msg.content.Fastbots == "messageAnimation" then
Filters = 'المتحركه'
Redis:srem(Fast.."All:List:Filter",'animation:'..msg.content.animation.animation.id)  
Redis:del(Fast.."All:Filter:Group:"..msg.content.animation.animation.id)  
elseif msg.content.Fastbots == "messageSticker" then
Filters = 'الملصق'
Redis:srem(Fast.."All:List:Filter",'sticker:'..msg.content.sticker.sticker.id)  
Redis:del(Fast.."All:Filter:Group:"..msg.content.sticker.sticker.id)  
elseif text then
Redis:srem(Fast.."All:List:Filter",'text:'..text)  
Redis:del(Fast.."All:Filter:Group:"..text)  
Filters = 'النص'
end
Redis:del(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"⎋ تم الغاء منع عام ("..Filters..")","md",true)  
end
end

if Redis:get(Fast.."Lock:text"..msg_chat_id) and not msg.Special then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end 
if msg.content.Fastbots == "messageChatJoinByLink" and not msg.Special then
if Redis:get(Fast.."Lock:Join"..msg.chat_id) == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end
end
if msg.content.Fastbots == "messageChatAddMembers" then -- اضافه اشخاص
local Lock_Bots = Redis:get(Fast.."Lock:Bot:kick"..msg_chat_id)
for k,v in pairs(msg.content.member_user_ids) do
if tonumber(v) ~= tonumber(Fast) then
local Info_User = bot.getUser(v) 
if Info_User.type.Fastbots == "userTypeBot" then
if Lock_Bots == "del" and not msg.Manger then
bot.setChatMemberStatus(msg.chat_id,v,'banned',0)
elseif Lock_Bots == "kick" and not msg.Manger then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.setChatMemberStatus(msg.chat_id,v,'banned',0)
end
end
end
end
end

if msg.content.Fastbots == "messageChatAddMembers" then
Redis:incr(Fast.."Num:Add:Memp"..msg_chat_id..":"..msg.sender_id.user_id) 
end

if msg.content.Fastbots == "messageChatJoinByLink" or msg.content.Fastbots == "messageChatAddMembers" then
if msg.sender_id.user_id == tonumber(1400467850) then
send(msg_chat_id,msg_id,"مرحبآ بك عزيزي المبرمج كينج نورت الجروب -🔥","md",true)
end
end
if msg.content.Fastbots == "messageChatJoinByLink" or msg.content.Fastbots == "messageChatAddMembers" then
if msg.sender_id.user_id == tonumber(5092041118) then
send(msg_chat_id,msg_id,"هلا و غلا حبيبي المـ‌هـنـ‌دسـ‌ شـيگـو -🔥","md",true)
end
end
if msg.content.Fastbots == "messageChatJoinByLink" or msg.content.Fastbots == "messageChatAddMembers" then
if msg.sender_id.user_id == tonumber(5092041118578) then
send(msg_chat_id,msg_id,"مرحبآ بك عزيزي المبرمجه شيكو نورتي الجروب -🔥","md",true)
end
end
if msg.content.Fastbots == "messageChatJoinByLink" or msg.content.Fastbots == "messageChatAddMembers" then
if msg.sender_id.user_id == tonumber(1965297565877558) then
send(msg_chat_id,msg_id,"مرحبآ بك عزيزي المبرمج محمد وسع يبني منك لي   -🔥","md",true)
end
end
if msg.content.Fastbots == "messageChatJoinByLink" or msg.content.Fastbots == "messageChatAddMembers" then
if msg.sender_id.user_id == tonumber(9497675544) then
send(msg_chat_id,msg_id,"كتفم الكون لاجلك يا 𓆩 الايـ‌'ـطـ‌'ـالـ‌'ـي 𓆪","md",true)
end
end
if msg.content.Fastbots == "messageChatJoinByLink" or msg.content.Fastbots == "messageChatAddMembers" then
if msg.sender_id.user_id == tonumber(5566753847) then
send(msg_chat_id,msg_id,"مرحبا بك عزيزي المبرمج سواد نورت الجروب - 🤗💙","md",true)
end
end
if msg.content.Fastbots == "messageChatJoinByLink" or msg.content.Fastbots == "messageChatAddMembers" then
if Redis:get(Fast.."Status:Welcome"..msg_chat_id) then
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Welcome = Redis:get(Fast.."Welcome:Group"..msg_chat_id)
if Welcome then 
if UserInfo.username then
UserInfousername = '@'..UserInfo.username
else
UserInfousername = 'لا يوجد '
end
Welcome = Welcome:gsub('{الاسم}',(FlterBio(UserInfo.first_name) or '---')) 
Welcome = Welcome:gsub('{المعرف}',("@"..UserInfo.username or '---')) 
Welcome = Welcome:gsub('{الجروب}',(Get_Chat.title or '---')) 
Welcome = Welcome:gsub('{الاعضاء}',Info_Chats.member_count) 
Welcome = Welcome:gsub('{الادمنيه}',Info_Chats.administrator_count) 
Welcome = Welcome:gsub('{الوقت}',os.date("%H:%M:%S")) 
Welcome = Welcome:gsub('{التاريخ}',os.date("%Y/%m/%d")) 
return send(msg_chat_id,msg_id,Welcome,"md")  
else 
local GroupsWelcome = Redis:get(Fast.."Welcome:Groups")
if GroupsWelcome then
GroupsWelcome = GroupsWelcome:gsub('{الاسم}',(FlterBio(UserInfo.first_name) or '---')) 
GroupsWelcome = GroupsWelcome:gsub('{المعرف}',("@"..UserInfo.username or '---')) 
GroupsWelcome = GroupsWelcome:gsub('{الجروب}',(Get_Chat.title or '---')) 
GroupsWelcome = GroupsWelcome:gsub('{الاعضاء}',Info_Chats.member_count) 
GroupsWelcome = GroupsWelcome:gsub('{الادمنيه}',Info_Chats.administrator_count) 
GroupsWelcome = GroupsWelcome:gsub('{الوقت}',os.date("%H:%M:%S")) 
GroupsWelcome = GroupsWelcome:gsub('{التاريخ}',os.date("%Y/%m/%d")) 
local TextWelcome = (GroupsWelcome or '*⎋نورت يقمر ♥♡\n ْ'..(FlterBio(UserInfo.first_name) or '---')..'\n ْ'..(Get_Chat.title or '---')..' \n⎋ يجب احترام الادمنية\n⎋ الالتزام بالقوانين في الوصف\n⎋ الاعضاء '..Info_Chats.member_count..'~ الادمنيه '..Info_Chats.administrator_count..' \n⎋ وقت الانضمام :('..os.date("%H:%M:%S")..')\n⎋ تاريخ الانضمام :('..os.date("%Y/%m/%d")..')*\n')
send(msg_chat_id,msg_id,TextWelcome,"md")  
else
local TextWelcome = ('*⎋نورت يقمر♥♡\n ْ'..(FlterBio(UserInfo.first_name) or '---')..'\n ْ'..(Get_Chat.title or '---')..' \n⎋ يجب احترام الادمنية\n⎋ الالتزام بالقوانين في الوصف\n⎋ الاعضاء '..Info_Chats.member_count..'~ الادمنيه '..Info_Chats.administrator_count..' \n⎋ وقت الانضمام :('..os.date("%H:%M:%S")..')\n⎋ تاريخ الانضمام :('..os.date("%Y/%m/%d")..')*\n')
send(msg_chat_id,msg_id,TextWelcome,"md")  
end
end
end
end 
if not msg.Special and msg.content.Fastbots ~= "messageChatAddMembers" and Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Spam:User") then 
if tonumber(msg.sender_id.user_id) == tonumber(Fast) then
return false
end
local floods = Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Spam:User") or "nil"
local Num_Msg_Max = Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Num:Spam") or 5
local post_count = tonumber(Redis:get(Fast.."Spam:Cont"..msg.sender_id.user_id..":"..msg_chat_id) or 0)
if post_count >= tonumber(Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Num:Spam") or 5) then 
local type = Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Spam:User") 
if type == "kick" then 
return bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0), send(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"⎋ قام بالتكرار في الجروب وتم طرده").Reply,"md",true)
end
if type == "del" then 
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end
if type == "keed" then
return bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0}), send(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"⎋ قام بالتكرار في الجروب وتم تقييده").Reply,"md",true)  
end
if type == "mute" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,tonumber(msg.sender_id.user_id)) 
return send(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"⎋ قام بالتكرار في الجروب وتم كتمه").Reply,"md",true)  
end
end
Redis:setex(Fast.."Spam:Cont"..msg.sender_id.user_id..":"..msg_chat_id, tonumber(5), post_count+1) 
local edit_id = data.text_ or "nil"  
Num_Msg_Max = 5
if Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Num:Spam") then
Num_Msg_Max = Redis:hget(Fast.."Spam:Group:User"..msg_chat_id,"Num:Spam") 
end
end 
if text and not msg.Special then
local _nl, ctrl_ = string.gsub(text, "%c", "")  
local _nl, real_ = string.gsub(text, "%d", "")   
sens = 400  
if Redis:get(Fast.."Lock:Spam"..msg.chat_id) == "del" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الكلايش \n ✓',"md")
end
elseif Redis:get(Fast.."Lock:Spam"..msg.chat_id) == "ked" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الكلايش \n ✓',"md")
end
elseif Redis:get(Fast.."Lock:Spam"..msg.chat_id) == "kick" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الكلايش \n ✓',"md")
end
elseif Redis:get(Fast.."Lock:Spam"..msg.chat_id) == "ktm" and string.len(text) > (sens) or ctrl_ > (sens) or real_ > (sens) then 
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,tonumber(msg.sender_id.user_id))
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الكلايش \n ✓',"md")
end
end
end
if msg.forward_info and not msg.Admin then -- التوجيه
local Fwd_Group = Redis:get(Fast.."Lock:forward"..msg_chat_id)
if Fwd_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال التوجيه \n ✓',"md")
end
elseif Fwd_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال التوجيه \n ✓',"md")
end
elseif Fwd_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,tounmber(msg.sender_id.user_id)) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال التوجيه \n ✓',"md")
end
elseif Fwd_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال التوجيه \n ✓',"md")
end
end

return false
end 
if msg.content.Fastbots == "messagePhoto" or msg.content.Fastbots == "messageAnimation" or msg.content.Fastbots == "messageSticker" or msg.content.Fastbots == "messageVoiceNote" or msg.content.Fastbots == "messageVideo" or msg.content.Fastbots == "messageAudio" or msg.content.Fastbots == "messageVideoNote" then
if not msg.Admin then
if Redis:get(Fast.."Lock:AlUasat"..msg_chat_id) then 
return bot.deleteMessages(msg.chat_id,{[1]= msg.id})
end
end
end

if msg.reply_markup and msg.reply_markup.Fastbots == "replyMarkupInlineKeyboard" then
if not msg.Special then  -- الكيبورد
local Keyboard_Group = Redis:get(Fast.."Lock:Keyboard"..msg_chat_id)
if Keyboard_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الكيبورد \n ✓',"md")
end
elseif Keyboard_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الكيبورد \n ✓',"md")
end
elseif Keyboard_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,toumber(msg.sender_id.user_id)) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الكيبورد \n ✓',"md")
end
elseif Keyboard_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الكيبورد \n ✓',"md")
end
end
end

end 

if msg.content.location and not msg.Special then  -- الموقع
if location then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال المواقع \n ✓',"md")
end
end

end 

if msg.content.entities and msg..content.entities[0] and msg.content.entities[0].type.Fastbots == "textEntityTypeUrl" and not msg.Special then  -- الماركداون
local Markduan_Gtoup = Redis:get(Fast.."Lock:Markdaun"..msg_chat_id)
if Markduan_Gtoup == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الماركداون \n ✓',"md")
end
elseif Markduan_Gtoup == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الماركداون \n ✓',"md")
end
elseif Markduan_Gtoup == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,tonumber(msg.sender_id.user_id)) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الماركداون \n ✓',"md")
end
elseif Markduan_Gtoup == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الماركداون \n ✓',"md")
end
end

end 

if msg.content.game and not msg.Special then  -- الالعاب
local Games_Group = Redis:get(Fast.."Lock:geam"..msg_chat_id)
if Games_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الالعاب \n ✓',"md")
end
elseif Games_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الالعاب \n ✓',"md")
end
elseif Games_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الالعاب \n ✓',"md")
end
elseif Games_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الالعاب \n ✓',"md")
end
end

end 
if msg.content.Fastbots == "messagePinMessage" then -- رساله التثبيت
local Pin_Msg = Redis:get(Fast.."lockpin"..msg_chat_id)
if Pin_Msg and not msg.Manger then
if Pin_Msg:match("(%d+)") then 
local PinMsg = bot.pinChatMessage(msg_chat_id,Pin_Msg,true)
if PinMsg.Fastbots~= "ok" then
return send(msg_chat_id,msg_id,"\n⎋ لا استطيع تثبيت الرسائل ليست لديه صلاحيه","md",true)
end
end
local UnPin = bot.unpinChatMessage(msg_chat_id) 
if UnPin.Fastbots ~= "ok" then
return send(msg_chat_id,msg_id,"\n⎋ لا استطيع الغاء تثبيت الرسائل ليست لديه صلاحيه","md",true)
end
return send(msg_chat_id,msg_id,"\n⎋ التثبيت معطل من قبل المدراء ","md",true)
end

end 

if msg.content.Fastbots == "messageChatJoinByLink" then
if Redis:get(Fast.."Lock:Join"..msg.chat_id) == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
return false
end
end

if msg.content.Fastbots == "messageChatDeleteMember" and not Redis:get(Fast.."spammkick"..msg.chat_id) then 
if msg.sender_id.user_id ~= Fast then
Num_Msg_Max = 4
local UserInfo = bot.getUser(msg.sender_id.user_id)
local names = FlterBio(UserInfo.first_name)
local monsha = Redis:smembers(Fast.."Ownerss:Group"..msg_chat_id) 
if Redis:ttl(Fast.."mkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id) < 0 then
Redis:del(Fast.."delmembars"..msg.chat_id..msg.sender_id.user_id)
end
local ttsaa = (Redis:get(Fast.."delmembars"..msg.chat_id..msg.sender_id.user_id) or 0)
if tonumber(ttsaa) >= tonumber(3) then 
local type = Redis:hget(Fast.."Storm:Spam:Group:User"..msg.chat_id,"Spam:User") 
local removeMembars = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. msg.chat_id .. "&user_id=" ..msg.sender_id.user_id.."&can_change_info=false&can_manage_chat=false&can_manage_voice_chats=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
local Json_Info = JSON.decode(removeMembars)
Redis:srem(Fast.."SuperCreator:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Creator:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Manger:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Admin:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Special:Group"..msg.chat_id,msg.sender_id.user_id)
if Json_Info.ok == false and Json_Info.error_code == 400 and Json_Info.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
if #monsha ~= 0 then 
local ListMembers = '\n*⎋ تاك للمالكين  \n ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local v = monsha[1]
local tecxt = ListMembers.."\n⎋ نداء للمالك {[ > Click < ](tg://user?id="..v..")}"..
"\n⎋ المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n⎋ قام بالتكرار في ازاله الاعضاء \n⎋ لا يمكنني تنزيله من المشرفين"
send(msg_chat_id,msg_id,tecxt,"md")
end
end
if Json_Info.ok == false and Json_Info.error_code == 400 and Json_Info.description == "Bad Request: can't remove chat owner" then
if #monsha ~= 0 then 
local ListMembers = '\n*⎋ تاك للمالكين  \n ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local tecxt = ListMembers.."\n⎋ نداء للمالك {[ > Click < ](tg://user?id="..v..")}"..
"\n⎋ المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n⎋ هناك عمليه تخريب وطرد الاعضاء , ليست لدي صلاحيه اضافه مشرفين لتنزيله"
send(msg_chat_id,msg_id,tecxt,"md")
end
end
if Json_Info.ok == true and Json_Info.result == true then
if #monsha ~= 0 then 
local ListMembers = '\n*⎋ تاك للمالكين  \n ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local v = monsha[1]
local tecxt = ListMembers.."\n⎋ نداء للمالك {[ > Click < ](tg://user?id="..v..")}"..
"\n⎋ المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n⎋ قام بتكرار طرد الاعضاء وطرد اكثر من 3 وتم تنزيله من المشرفين "
send(msg_chat_id,msg_id,tecxt,"md")
end
end
Redis:del(Fast.."delmembars"..msg.chat_id..msg.sender_id.user_id)
end
Redis:setex(Fast.."mkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id, 3600, true) 
Redis:incrby(Fast.."delmembars"..msg.chat_id..msg.sender_id.user_id, 1)  
end
end 

if text and text:match('طرد @(.*)') or text and text:match('حظر @(.*)') or text and text:match('طرد (%d+)') or text and text:match('حظر (%d+)') then 
if not Redis:get(Fast.."spammkick"..msg.chat_id) then 
if msg.sender_id.user_id ~= Fast then
Num_Msg_Max = 4
local UserInfo = bot.getUser(msg.sender_id.user_id)
local names = FlterBio(UserInfo.first_name) 
local monsha = Redis:smembers(Fast.."Ownerss:Group"..msg_chat_id) 
if Redis:ttl(Fast.."qmkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id) < 0 then
Redis:del(Fast.."qdelmembars"..msg.chat_id..msg.sender_id.user_id)
end
local ttsaa = (Redis:get(Fast.."qdelmembars"..msg.chat_id..msg.sender_id.user_id) or 0)
if tonumber(ttsaa) >= tonumber(5) then 
local removeMembars = https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. msg.chat_id .. "&user_id=" ..msg.sender_id.user_id.."&can_change_info=false&can_manage_chat=false&can_manage_voice_chats=false&can_delete_messages=false&can_invite_users=false&can_restrict_members=false&can_pin_messages=false&can_promote_members=false")
local Json_Info = JSON.decode(removeMembars)
Redis:srem(Fast.."SuperCreator:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Creator:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Manger:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Admin:Group"..msg.chat_id,msg.sender_id.user_id)
Redis:srem(Fast.."Special:Group"..msg.chat_id,msg.sender_id.user_id)
if Json_Info.ok == false and Json_Info.error_code == 400 and Json_Info.description == "Bad Request: CHAT_ADMIN_REQUIRED" then
if #monsha ~= 0 then 
local ListMembers = '\n*⎋ تاك للمالكين  \n ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local tecxt = ListMembers.."\n⎋ المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n⎋ قام بالتكرار في ازاله الاعضاء \n⎋ لا يمكنني تنزيله من المشرفين"
send(msg_chat_id,msg_id,tecxt,"md")
end
end
if Json_Info.ok == false and Json_Info.error_code == 400 and Json_Info.description == "Bad Request: can't remove chat owner" then
if #monsha ~= 0 then 
local ListMembers = '\n*⎋ تاك للمالكين  \n ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local tecxt = ListMembers.."\n⎋ المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n⎋ هناك عمليه تخريب وطرد الاعضاء , ليست لدي صلاحيه اضافه مشرفين لتنزيله"
send(msg_chat_id,msg_id,tecxt,"md")
end
end
if Json_Info.ok == true and Json_Info.result == true then
if #monsha ~= 0 then 
local ListMembers = '\n*⎋ تاك للمالكين  \n ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗*\n'
for k, v in pairs(monsha) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local tecxt = ListMembers.."\n⎋ المشرف {["..names.." ](tg://user?id="..msg.sender_id.user_id..")}"..
"\n⎋ هناك عمليه تخريب وطرد الاعضاء , ليست لدي صلاحيه اضافه مشرفين لتنزيله"
send(msg_chat_id,msg_id,tecxt,"md")
end
end
Redis:del(Fast.."qdelmembars"..msg.chat_id..msg.sender_id.user_id)
end
Redis:setex(Fast.."qmkal:setex:" .. msg.chat_id .. ":" .. msg.sender_id.user_id, 3600, true) 
Redis:incrby(Fast.."qdelmembars"..msg.chat_id..msg.sender_id.user_id, 1)  
end
end 
end

if msg.content.Fastbots == "messagePhoto" and Redis:get(Fast..'welcom_ph:witting'..msg.sender_id.user_id) then  -- الصور
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast..':WELCOME_BOT',idPhoto)
Redis:del(Fast..'welcom_ph:witting'..msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, '⎋ تم تغيير صـورهہ‏‏ آلترحيب للبوت\n✓')
end

if msg.content.Fastbots == "messageChatAddMembers" then -- اضافه اشخاص

Redis:incr(Fast.."Num:Add:Memp"..msg_chat_id..":"..msg.sender_id.user_id) 
local AddMembrs = Redis:get(Fast.."Lock:AddMempar"..msg_chat_id) 
local Lock_Bots = Redis:get(Fast.."Lock:Bot:kick"..msg_chat_id)
for k,v in pairs(msg.content.member_user_ids) do
if tonumber(v) == tonumber(Fast) then
local idephoto = Redis:get(Fast..':WELCOME_BOT')
if idephoto then
local Bot_Name = (Redis:get(Fast.."Name:Bot") or "افتار")
return bot.sendPhoto(msg.chat_id, msg.id, idephoto,
'\n*⎋ اهلا انآ بوت اسمي '..Bot_Name..''..
'\n⎋ آختصـآصـي حمـآيهہ‌‏ آلمـجمـوعآت'..
'\n⎋ مـن آلسـبآم وآلتوجيهہ‌‏ وآلتگرآر وآلخ...'..
'\n⎋ مـعـرف الـمـطـور  : @'..UserSudo..
'*', "md")
end
end
local Info_User = bot.getUser(v) 
if Info_User.type.Fastbots == "userTypeRegular" then
Redis:incr(Fast.."Num:Add:Memp"..msg.chat_id..":"..msg.sender_id.user_id) 
if AddMembrs == "kick" and not msg.Special then
bot.setChatMemberStatus(msg.chat_id,v,'banned',0)
end
end
end
end 


if msg.content.Fastbots == "messageContact" and not msg.Special then  -- الجهات
local Contact_Group = Redis:get(Fast.."Lock:Contact"..msg_chat_id)
if Contact_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الجهات \n ✓',"md")
end
elseif Contact_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الجهات \n ✓',"md")
end
elseif Contact_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الجهات \n ✓',"md")
end
elseif Contact_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الجهات \n ✓',"md")
end
end

end 

if msg.content.Fastbots == "messageVideoNote" and not msg.Special then  -- بصمه الفيديو
local Videonote_Group = Redis:get(Fast.."Lock:Unsupported"..msg_chat_id)
if Videonote_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال بصمات الفيديو \n ✓',"md")
end
elseif Videonote_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال بصمات الفيديو  \n ✓',"md")
end
elseif Videonote_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال بصمات الفيديو  \n ✓',"md")
end
elseif Videonote_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال بصمات الفيديو  \n ✓',"md")
end
end

end 

if msg.content.Fastbots == "messageDocument" and not msg.Special then  -- الملفات
local Document_Group = Redis:get(Fast.."Lock:Document"..msg_chat_id)
if Document_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الملفات \n ✓',"md")
end
elseif Document_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الملفات \n ✓',"md")
end
elseif Document_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الملفات \n ✓',"md")
end
elseif Document_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الملفات \n ✓',"md")
end
end

end 

if msg.content.Fastbots == "messageAudio" and not msg.Special then  -- الملفات الصوتيه
local Audio_Group = Redis:get(Fast.."Lock:Audio"..msg_chat_id)
if Audio_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الصوتيات \n ✓',"md")
end
elseif Audio_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الصوتيات \n ✓',"md")
end
elseif Audio_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الصوتيات \n ✓',"md")
end
elseif Audio_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الصوتيات \n ✓',"md")
end
end

end 

if msg.content.Fastbots == "messageVideo" then  -- الفيديو
if Redis:sismember(Fast.."Specialall:Group",msg.sender_id.user_id) then
testmod = true
elseif msg.Special then
testmod = true
else
testmod = false
end
if testmod == false then
local Video_Grouo = Redis:get(Fast.."Lock:Video"..msg_chat_id)
if Video_Grouo == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الفيديو \n ✓',"md")
end
elseif Video_Grouo == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الفيديو \n ✓',"md")
end
elseif Video_Grouo == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الفيديو \n ✓',"md")
end
elseif Video_Grouo == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الفيديو \n ✓',"md")
end
end
end

end 
if text and text:match("[A-Z]") or text and text:match("[a-z]") then
if not msg.Special and Redis:get(Fast.."Lock:english"..msg_chat_id) then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال كلمات انكليزيه \n ✓',"md")
end
end
end
if msg.content.Fastbots == "messageVoiceNote" and not msg.Special then  -- البصمات
local Voice_Group = Redis:get(Fast.."Lock:vico"..msg_chat_id)
if Voice_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال البصمات \n ✓',"md")
end
elseif Voice_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال البصمات \n ✓',"md")
end
elseif Voice_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال البصمات \n ✓',"md")
end
elseif Voice_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال البصمات \n ✓',"md")
end
end

end 

if msg.content.Fastbots == "messageSticker" then  -- الملصقات
if Redis:sismember(Fast.."Specialall:Group",msg.sender_id.user_id) then
testmod = true
elseif msg.Special then
testmod = true
else
testmod = false
end
if testmod == false then
local Sticker_Group = Redis:get(Fast.."Lock:Sticker"..msg_chat_id)
if Sticker_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الملصقات \n ✓',"md")
end
elseif Sticker_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الملصقات \n ✓',"md")
end
elseif Sticker_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الملصقات \n ✓',"md")
end
elseif Sticker_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الملصقات \n ✓',"md")
end
end
end

end 

if msg.via_bot_user_id ~= 0 and not msg.Admin then  -- انلاين
local Inlen_Group = Redis:get(Fast.."Lock:Inlen"..msg_chat_id)
if Inlen_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الاونلاين \n ✓',"md")
end
elseif Inlen_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الاونلاين \n ✓',"md")
end
elseif Inlen_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الاونلاين \n ✓',"md")
end
elseif Inlen_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الاونلاين \n ✓',"md")
end
end

end

if msg.content.Fastbots == "messageAnimation"  then  -- المتحركات
if Redis:sismember(Fast.."Specialall:Group",msg.sender_id.user_id) then
testmod = true
elseif msg.Special then
testmod = true
else
testmod = false
end
if testmod == false then
local Gif_group = Redis:get(Fast.."Lock:Animation"..msg_chat_id)
if Gif_group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال المتحركات \n ✓',"md")
end
elseif Gif_group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال المتحركات \n ✓',"md")
end
elseif Gif_group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال المتحركات \n ✓',"md")
end
elseif Gif_group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال المتحركات \n ✓',"md")
end
end
end

end 
if text and (text:match("ه‍") or text:match("ی") or text:match("ک")) and not msg.Special then 
local phshar_Group = Redis:get(Fast.."Lock:farsia"..msg_chat_id)
if phshar_Group then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الفارسيه \n ✓',"md")
end
end
end
if text and (text:match("كسمك") or text:match("منيوج") or text:match("عير") or text:match("منيوك") or text:match("طويز") or text:match("العيوره") or text:match("مناويج") or text:match("عيوره") or text:match("كسج") or text:match("sex") or text:match("نيج")  or text:match("كحاب")  or text:match("طيازه")or text:match("طيز")or text:match("كس") or text:match("زب") or text:match("نيك") or text:match("فرخ") or text:match("كحبه") or text:match("انيكك") or text:match("منيوك")) and not msg.Special then 
local phshar_Group = Redis:get(Fast.."Lock:phshar"..msg_chat_id)
if phshar_Group then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الفشار \n ✓',"md")
end
end
end
if text and (text:match("خره بالله") or text:match("خبربك") or text:match("كسدينربك") or text:match("خرب بالله") or text:match("خرب الله") or text:match("خره بربك") or text:match("الله الكواد") or text:match("خره بمحمد") or text:match("كسم الله") or text:match("كسم ربك") or text:match("كسربك") or text:match("كسختالله") or text:match("كسخت الله") or text:match("خره بدينك") or text:match("خرهبدينك") or text:match("كسالله") or text:match("خربالله")) and not msg.Special then 
local phsharr_Group = Redis:get(Fast.."Lock:alkfr"..msg_chat_id)
if phsharr_Group then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الكفر \n ✓',"md")
end
end
end
if msg.content.Fastbots == "messagePhoto" then  -- الصور
if Redis:sismember(Fast.."Specialall:Group",msg.sender_id.user_id) then
testmod = true
elseif msg.Special then
testmod = true
else
testmod = false
end
if testmod == false then
local Photo_Group = Redis:get(Fast.."Lock:Photo"..msg_chat_id)
if Photo_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الصور \n ✓',"md")
end
elseif Photo_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الصور \n ✓',"md")
end
elseif Photo_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الصور \n ✓',"md")
end
elseif Photo_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الصور \n ✓',"md")
end
end
end

end
if msg.content.photo and Redis:get(Fast.."Chat:Photo"..msg_chat_id..":"..msg.sender_id.user_id) then
local ChatPhoto = bot.setChatPhoto(msg_chat_id,msg.content.photo.sizes[2].photo.remote.id)
if (ChatPhoto.Fastbots == "error") then
Redis:del(Fast.."Chat:Photo"..msg_chat_id..":"..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"⎋ لا استطيع تغيير صوره الجروب لاني لست ادمن او ليست لديه الصلاحيه ","md",true)    
end
Redis:del(Fast.."Chat:Photo"..msg_chat_id..":"..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"⎋ تم تغيير صوره الجروب بنـجاح ","md",true)    
end
if  (text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or text and text:match("[Tt].[Mm][Ee]/") 
or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or text and text:match(".[Pp][Ee]")  
or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or text and text:match("[Hh][Tt][Tt][Pp]://") 
or text and text:match("[Ww][Ww][Ww].") 
or text and text:match(".[Cc][Oo][Mm]")) or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match(".[Tt][Kk]") or text and text:match(".[Mm][Ll]") or text and text:match(".[Oo][Rr][Gg]")
or msg.content.Fastbots == "messageContact" 
or msg.content.Fastbots == "messageSticker"
or msg.content.Fastbots == "messageVideoNote" 
or msg.content.Fastbots == "messageDocument" 
or msg.content.Fastbots == "messageAudio" 
or msg.content.Fastbots == "messageVideo" 
or msg.content.Fastbots == "messageVoiceNote" 
or msg.content.Fastbots == "messageAnimation" 
or msg.content.Fastbots == "messagePhoto" then
local tphlesh_Group = Redis:get(Fast.."Lock:tphlesh"..msg_chat_id)
if not msg.Special and tphlesh_Group then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ عذرا التفليش مقفل تم المسح \n ✓',"md")
end
end
end

if (text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]/") 
or text and text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Dd][Oo][Gg]/") 
or text and text:match("[Tt].[Mm][Ee]/") 
or text and text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]/") 
or text and text:match(".[Pp][Ee]") 
or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") 
or text and text:match("[Hh][Tt][Tt][Pp]://") 
or text and text:match("[Ww][Ww][Ww].") 
or text and text:match(".[Cc][Oo][Mm]")) or text and text:match("[Hh][Tt][Tt][Pp][Ss]://") or text and text:match("[Hh][Tt][Tt][Pp]://") or text and text:match("[Ww][Ww][Ww].") or text and text:match(".[Cc][Oo][Mm]") or text and text:match(".[Tt][Kk]") or text and text:match(".[Mm][Ll]") or text and text:match(".[Oo][Rr][Gg]") then 
local link_Group = Redis:get(Fast.."Lock:Link"..msg_chat_id)  
if not msg.Admin then
if link_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الروابط \n ✓',"md")
end
elseif link_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الروابط \n ✓',"md")
end
elseif link_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الروابط \n ✓',"md")
end
elseif link_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الروابط \n ✓',"md")
end
end

return false
end
end
if text and text:match("@[%a%d_]+") then 
if Redis:sismember(Fast.."Specialall:Group",msg.sender_id.user_id) then
testmod = true
elseif msg.Special then
testmod = true
else
testmod = false
end
if testmod == false then
local UserName_Group = Redis:get(Fast.."Lock:User:Name"..msg_chat_id)
if UserName_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال المعرفات \n ✓',"md")
end
elseif UserName_Group == "ked" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال المعرفات \n ✓',"md")
end
elseif UserName_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال المعرفات \n ✓',"md")
end
elseif UserName_Group == "kick" then
bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال المعرفات \n ✓',"md")
end
end

end
end
if text and text:match("#[%a%d_]+") and not msg.Special then 
local Hashtak_Group = Redis:get(Fast.."Lock:hashtak"..msg_chat_id)
if Hashtak_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الهاشتاك \n ✓',"md")
end
elseif Hashtak_Group == "ked" then
 bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
 bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الهاشتاك \n ✓',"md")
end
elseif Hashtak_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الهاشتاك \n ✓',"md")
end
elseif Hashtak_Group == "kick" then
 bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
 bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الهاشتاك \n ✓',"md")
end
end

end
if text and text:match("^/(.*)$") and not msg.Special then 
local comd_Group = Redis:get(Fast.."Lock:Cmd"..msg_chat_id)
if comd_Group == "del" then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الشارحه \n ✓',"md")
end
elseif comd_Group == "ked" then
 bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'restricted',{1,0,0,0,0,0,0,0,0})
 bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الشارحه \n ✓',"md")
end
elseif comd_Group == "ktm" then
Redis:sadd(Fast.."SilentGroup:Group"..msg.chat_id,msg.sender_id.user_id) 
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الشارحه \n ✓',"md")
end
elseif comd_Group == "kick" then
 bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
 bot.deleteMessages(msg.chat_id,{[1]= msg.id})
if Redis:get(Fast..'AlThther:Chat'..msg.chat_id)  then
local num = Redis:get(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
if not num then 
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"1")
inth = "⎋ عدد تحذيراتك 1"
elseif num == "1" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"2")
inth = "⎋ عدد تحذيراتك 2"
elseif num == "2" then
Redis:set(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id,"3")
inth = "⎋ عدد تحذيراتك 3"
elseif num == "3" then
Redis:del(Fast..msg.sender_id.user_id..'inthaar'..msg.chat_id)
inth = "⎋ تم حظرك " bot.setChatMemberStatus(msg.chat_id,msg.sender_id.user_id,'banned',0)
end
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Teext = '⎋ المستخدم : ['..FlterBio(UserInfo.first_name)..'](tg://user?id='..msg.sender_id.user_id..')\n'..inth..'\n'
return send(msg_chat_id,msg_id,Teext..'⎋ ممنوع ارسال الشارحه \n ✓',"md")
end
end
end
if (Redis:get(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'true') then
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
Filters = 'صوره'
Redis:sadd(Fast.."List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:set(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.photo.sizes[1].photo.id)  
elseif msg.content.animation then
Filters = 'متحركه'
Redis:sadd(Fast.."List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:set(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.animation.animation.id)  
elseif msg.content.sticker then
Filters = 'ملصق'
Redis:sadd(Fast.."List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:set(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.sticker.sticker.id)  
elseif text then
Redis:set(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, text)  
Redis:sadd(Fast.."List:Filter"..msg_chat_id,'text:'..text)  
Filters = 'نص'
end
Redis:set(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id,'true1')
return send(msg_chat_id,msg_id,"\n⎋ ارسل تحذير ( "..Filters.." ) عند ارساله","md",true)  
end
end
if text and (Redis:get(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'true1') then
local Text_Filter = Redis:get(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id)  
if Text_Filter then   
Redis:set(Fast.."Filter:Group:"..Text_Filter..msg_chat_id,text)  
end  
Redis:del(Fast.."Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id)  
Redis:del(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"\n⎋ تم اضافه رد التحذير","md",true)  
end
if (Redis:get(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'DelFilter') then   
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
Filters = 'الصوره'
Redis:srem(Fast.."List:Filter"..msg_chat_id,'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:del(Fast.."Filter:Group:"..msg.content.photo.sizes[1].photo.id..msg_chat_id)  
elseif msg.content.animation then
Filters = 'المتحركه'
Redis:srem(Fast.."List:Filter"..msg_chat_id,'animation:'..msg.content.animation.animation.id)  
Redis:del(Fast.."Filter:Group:"..msg.content.animation.animation.id..msg_chat_id)  
elseif msg.content.sticker then
Filters = 'الملصق'
Redis:srem(Fast.."List:Filter"..msg_chat_id,'sticker:'..msg.content.sticker.sticker.id)  
Redis:del(Fast.."Filter:Group:"..msg.content.sticker.sticker.id..msg_chat_id)  
elseif text then
Redis:srem(Fast.."List:Filter"..msg_chat_id,'text:'..text)  
Redis:del(Fast.."Filter:Group:"..text..msg_chat_id)  
Filters = 'النص'
end
Redis:del(Fast..'FilterText'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"⎋ تم الغاء منع ("..Filters..")","md",true)  
end
end
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
DelFilters = msg.content.photo.sizes[1].photo.id
statusfilter = 'الصوره'
elseif msg.content.animation then
DelFilters = msg.content.animation.animation.id
statusfilter = 'المتحركه'
elseif msg.content.sticker then
DelFilters = msg.content.sticker.sticker.id
statusfilter = 'الملصق'
elseif text then
DelFilters = text
statusfilter = 'الرساله'
end
local ReplyFilters = Redis:get(Fast.."Filter:Group:"..DelFilters..msg_chat_id)
if ReplyFilters and not msg.Special then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
return send(msg_chat_id,msg_id,"*⎋ لقد تم منع هذه ( "..statusfilter.." ) هنا*\n⎋ "..ReplyFilters,"md",true)   
end
end
if text and Redis:get(Fast..msg.chat_id..msg.sender_id.user_id.."replace") == "true1" then
Redis:del(Fast..msg.chat_id..msg.sender_id.user_id.."replace")
local word = Redis:get(Fast..msg.sender_id.user_id.."word")
Redis:set(Fast.."Word:Replace"..word,text)
Redis:sadd(Fast..'Words:r',word)  
bot.sendText(msg_chat_id,msg_id,"⎋ تم حفظ الكلمه","md",true)  
return false 
end
if text and Redis:get(Fast..msg.chat_id..msg.sender_id.user_id.."replace") == "true" then
Redis:set(Fast..msg.sender_id.user_id.."word",text)
Redis:set(Fast..msg.chat_id..msg.sender_id.user_id.."replace","true1")
bot.sendText(msg_chat_id,msg_id,'\n⎋ ارسل كلمه جديده ليتم استبدالها مكان *'..text..'*',"md",true)  
return false 
end
if text and Redis:get(Fast.."Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender_id.user_id) == "true" then
local NewCmmd = Redis:get(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
Redis:del(Fast.."Command:Reids:Group:New"..msg_chat_id)
Redis:srem(Fast.."Command:List:Group"..msg_chat_id,text)
send(msg_chat_id,msg_id,"⎋ تم ازالة هذا الامر ← { "..text.." }","md",true)
else
send(msg_chat_id,msg_id,"⎋ لا يوجد امر بهذا الاسم","md",true)
end
Redis:del(Fast.."Command:Reids:Group:Del"..msg_chat_id..":"..msg.sender_id.user_id)
return false
end
if text and Redis:get(Fast.."Command:Reids:Group"..msg_chat_id..":"..msg.sender_id.user_id) == "true" then
Redis:set(Fast.."Command:Reids:Group:New"..msg_chat_id,text)
Redis:del(Fast.."Command:Reids:Group"..msg_chat_id..":"..msg.sender_id.user_id)
Redis:set(Fast.."Command:Reids:Group:End"..msg_chat_id..":"..msg.sender_id.user_id,"true1") 
return send(msg_chat_id,msg_id,"⎋ ارسل الامر الجديد ليتم وضعه مكان القديم","md",true)  
end
if text and Redis:get(Fast.."Command:Reids:Group:End"..msg_chat_id..":"..msg.sender_id.user_id) == "true1" then
local NewCmd = Redis:get(Fast.."Command:Reids:Group:New"..msg_chat_id)
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text,NewCmd)
Redis:sadd(Fast.."Command:List:Group"..msg_chat_id,text)
Redis:del(Fast.."Command:Reids:Group:End"..msg_chat_id..":"..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"⎋ تم حفظ الامر باسم ← { "..text..' }',"md",true)
end
if Redis:get(Fast.."Set:Link"..msg_chat_id..""..msg.sender_id.user_id) then
if text == "الغاء" then
Redis:del(Fast.."Set:Link"..msg_chat_id..""..msg.sender_id.user_id) 
return send(msg_chat_id,msg_id,"⎋ تم الغاء حفظ الرابط","md",true)         
end
if text and text:match("(https://telegram.me/joinchat/%S+)") or text and text:match("(https://t.me/joinchat/%S+)") then     
local LinkGroup = text:match("(https://telegram.me/joinchat/%S+)") or text:match("(https://t.me/joinchat/%S+)")   
Redis:set(Fast.."Group:Link"..msg_chat_id,LinkGroup)
Redis:del(Fast.."Set:Link"..msg_chat_id..""..msg.sender_id.user_id) 
return send(msg_chat_id,msg_id,"⎋ تم حفظ الرابط بنجاح","md",true)         
end
end 
if Redis:get(Fast.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender_id.user_id) then 
if text == "الغاء" then 
Redis:del(Fast.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender_id.user_id)  
return send(msg_chat_id,msg_id,"⎋ تم الغاء حفظ الترحيب","md",true)   
end 
Redis:del(Fast.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. msg.sender_id.user_id)  
Redis:set(Fast.."Welcome:Group"..msg_chat_id,text) 
return send(msg_chat_id,msg_id,"⎋ تم حفظ ترحيب الجروب","md",true)     
end
if Redis:get(Fast.."Set:Rules:" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" then 
Redis:del(Fast.."Set:Rules:" .. msg_chat_id .. ":" .. msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"⎋ تم الغاء حفظ القوانين","md",true)   
end 
Redis:set(Fast.."Group:Rules" .. msg_chat_id,text) 
Redis:del(Fast.."Set:Rules:" .. msg_chat_id .. ":" .. msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"⎋ تم حفظ قوانين الجروب","md",true)  
end  
if Redis:get(Fast.."Set:Description:" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" then 
Redis:del(Fast.."Set:Description:" .. msg_chat_id .. ":" .. msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"⎋ تم الغاء حفظ وصف الجروب","md",true)   
end 
bot.setChatDescription(msg_chat_id,text) 
Redis:del(Fast.."Set:Description:" .. msg_chat_id .. ":" .. msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"⎋ تم حفظ وصف الجروب","md",true)  
end  

if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(Fast.."Text:Manager"..msg.sender_id.user_id..":"..msg_chat_id.."")
if Redis:get(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true1" then
Redis:del(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id)
if msg.content.sticker then   
Redis:set(Fast.."Add:Rd:Manager:Stekrs"..test..msg_chat_id, msg.content.sticker.sticker.remote.id)  
end   
if msg.content.voice_note then  
Redis:set(Fast.."Add:Rd:Manager:Vico"..test..msg_chat_id, msg.content.voice_note.voice.remote.id)  
end   
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Manager:Text"..test..msg_chat_id, text)  
end  
if msg.content.audio then
if msg.content.caption.text then
Redis:set(Fast.."Add:Rd:caption:audio"..msg.content.audio.audio.remote.id..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Fast.."Add:Rd:Manager:Audio"..test..msg_chat_id, msg.content.audio.audio.remote.id)  
end
if msg.content.document then
if msg.content.caption.text then
Redis:set(Fast.."Add:Rd:caption:document"..msg.content.document.document.remote.id..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Fast.."Add:Rd:Manager:File"..test..msg_chat_id, msg.content.document.document.remote.id)  
end
if msg.content.animation then
Redis:set(Fast.."Add:Rd:Manager:Gif"..test..msg_chat_id, msg.content.animation.animation.remote.id)  
end
if msg.content.video_note then
Redis:set(Fast.."Add:Rd:Manager:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
end
if msg.content.video then
if msg.content.caption.text then
Redis:set(Fast.."Add:Rd:caption:video"..msg.content.video.video.remote.id..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Fast.."Add:Rd:Manager:Video"..test..msg_chat_id, msg.content.video.video.remote.id)  
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
if msg.content.caption.text then
Redis:set(Fast.."Add:Rd:caption:Photo"..idPhoto..msg_chat_id, msg.content.caption.text)  
end
Redis:set(Fast.."Add:Rd:Manager:Photo"..test..msg_chat_id, idPhoto)  
end
return send(msg_chat_id,msg_id,"⎋ تم حفظ الرد  بنجاح \n⎋ ارسل ( ["..test.."] ) لعرض الرد","md",true)  
end  
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id,"true1")
Redis:set(Fast.."Text:Manager"..msg.sender_id.user_id..":"..msg_chat_id, text)
Redis:del(Fast.."Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(Fast.."Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:sadd(Fast.."List:Manager"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ⎋ملصق ⎋متحركه ⎋صوره
 ⎋فيديو ⎋بصمه الفيديو ⎋بصمه ⎋صوت ⎋رساله ❩
↯︙يمكنك اضافة الى النص ⎋
⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)  
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id.."") == "true2" then
Redis:del(Fast.."Add:Rd:Manager:Gif"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Vico"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
Redis:del(Fast.."Add:Rd:Manager:Text"..text..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Photo"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note"..text..msg_chat_id)
Redis:del(Fast.."Set:Manager:rd"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:srem(Fast.."List:Manager"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,"⎋ تم مسح الرد من الردود المضافه","md",true)  
return false
end
end
if text and Redis:get(Fast.."Status:ReplySudo"..msg_chat_id) then
local anemi = Redis:get(Fast.."Add:Rd:Sudo:Gif"..text)   
local veico = Redis:get(Fast.."Add:Rd:Sudo:vico"..text)   
local stekr = Redis:get(Fast.."Add:Rd:Sudo:stekr"..text)     
local Text = Redis:get(Fast.."Add:Rd:Sudo:Text"..text)   
local photo = Redis:get(Fast.."Add:Rd:Sudo:Photo"..text)
local video = Redis:get(Fast.."Add:Rd:Sudo:Video"..text)
local document = Redis:get(Fast.."Add:Rd:Sudo:File"..text)
local audio = Redis:get(Fast.."Add:Rd:Sudo:Audio"..text)
local video_note = Redis:get(Fast.."Add:Rd:Sudo:video_note"..text)
if Text then 
local UserInfo = bot.getUser(msg.sender_id.user_id)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local Text = Text:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Text = Text:gsub('#name',FlterBio(UserInfo.first_name))
local Text = Text:gsub('#id',msg.sender_id.user_id)
local Text = Text:gsub('#edit',NumMessageEdit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
if Text:match("]") then
send(msg_chat_id,msg_id,Text,"md",true) 
else
send(msg_chat_id,msg_id,"["..Text.."]","md",true) 
end
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note)
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,'')
end  
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr)
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, '', "md")
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md')
end  
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, '', "md") 
end
end
if text and Redis:get(Fast.."Status:Reply"..msg_chat_id) then
local anemi = Redis:get(Fast.."Add:Rd:Manager:Gif"..text..msg_chat_id)   
local veico = Redis:get(Fast.."Add:Rd:Manager:Vico"..text..msg_chat_id)   
local stekr = Redis:get(Fast.."Add:Rd:Manager:Stekrs"..text..msg_chat_id)     
local Texingt = Redis:get(Fast.."Add:Rd:Manager:Text"..text..msg_chat_id)   
local photo = Redis:get(Fast.."Add:Rd:Manager:Photo"..text..msg_chat_id)
local video = Redis:get(Fast.."Add:Rd:Manager:Video"..text..msg_chat_id)
local document = Redis:get(Fast.."Add:Rd:Manager:File"..text..msg_chat_id)
local audio = Redis:get(Fast.."Add:Rd:Manager:Audio"..text..msg_chat_id)
local video_note = Redis:get(Fast.."Add:Rd:Manager:video_note"..text..msg_chat_id)
if Texingt then 
local UserInfo = bot.getUser(msg.sender_id.user_id)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..msg.sender_id.user_id) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..msg.sender_id.user_id) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',FlterBio(UserInfo.first_name))
local Texingt = Texingt:gsub('#id',msg.sender_id.user_id)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
if Texingt:match("]") then
send(msg_chat_id,msg_id,Texingt,"md",true)  
else
send(msg_chat_id,msg_id,"["..Texingt.."]","md",true)  
end
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note)
end
if photo then
local captionsend = Redis:get(Fast.."Add:Rd:caption:Photo"..photo..msg_chat_id) or ''
bot.sendPhoto(msg.chat_id, msg.id, photo,'['..captionsend..']',"md")
end  
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr)
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
end
if video then 
local captionsend = Redis:get(Fast.."Add:Rd:caption:video"..video..msg_chat_id) or ''
bot.sendVideo(msg_chat_id, msg.id, video, '['..captionsend..']', "md")
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
end
if document then
local captionsend = Redis:get(Fast.."Add:Rd:caption:document"..document..msg_chat_id) or ''
bot.sendDocument(msg_chat_id, msg.id, document, '['..captionsend..']', 'md')
end  
if audio then
local captionsend = Redis:get(Fast.."Add:Rd:caption:audio"..audio..msg_chat_id) or ''
bot.sendAudio(msg_chat_id, msg.id, audio, '['..captionsend..']',"md")
end
end
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(Fast.."Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg_chat_id)
if Redis:get(Fast.."Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true1" then
Redis:del(Fast.."Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id)
if msg.content.sticker then   
Redis:set(Fast.."Add:Rd:Sudo:stekr"..test, msg.content.sticker.sticker.remote.id)  
end   
if msg.content.voice_note then  
Redis:set(Fast.."Add:Rd:Sudo:vico"..test, msg.content.voice_note.voice.remote.id)  
end   
if msg.content.animation then   
Redis:set(Fast.."Add:Rd:Sudo:Gif"..test, msg.content.animation.animation.remote.id)  
end  
if text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Sudo:Text"..test, text)  
end  
if msg.content.audio then
Redis:set(Fast.."Add:Rd:Sudo:Audio"..test, msg.content.audio.audio.remote.id)  
end
if msg.content.document then
Redis:set(Fast.."Add:Rd:Sudo:File"..test, msg.content.document.document.remote.id)  
end
if msg.content.video then
Redis:set(Fast.."Add:Rd:Sudo:Video"..test, msg.content.video.video.remote.id)  
end
if msg.content.video_note then
Redis:set(Fast.."Add:Rd:Sudo:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Sudo:Photo"..test, idPhoto)  
end
send(msg_chat_id,msg_id,"⎋ تم حفظ رد للمطور \n⎋ ارسل ( ["..test.."] ) لعرض الرد","md",true)  
return false
end  
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Rd"..msg.sender_id.user_id..":"..msg_chat_id, "true1")
Redis:set(Fast.."Text:Sudo:Bot"..msg.sender_id.user_id..":"..msg_chat_id, text)
Redis:sadd(Fast.."List:Rd:Sudo", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ⎋ملصق ⎋متحركه ⎋صوره
 ⎋فيديو ⎋بصمه الفيديو ⎋بصمه ⎋صوت ⎋رساله ❩
↯︙يمكنك اضافة الى النص ⎋
⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)  
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:On"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
list = {"Add:Rd:Sudo:video_note","Add:Rd:Sudo:Audio","Add:Rd:Sudo:File","Add:Rd:Sudo:Video","Add:Rd:Sudo:Photo","Add:Rd:Sudo:Text","Add:Rd:Sudo:stekr","Add:Rd:Sudo:vico","Add:Rd:Sudo:Gif"}
for k,v in pairs(list) do
Redis:del(Fast..''..v..text)
end
Redis:del(Fast.."Set:On"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:srem(Fast.."List:Rd:Sudo", text)
return send(msg_chat_id,msg_id,"⎋ تم مسح الرد من الردود العامه","md",true)  
end
end
if Redis:get(Fast.."Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 

if text == "الغاء" or text == 'الغاء الامر ⎋' then   
Redis:del(Fast.."Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n⎋ تم الغاء الاذاعه للمجموعات","md",true)  
end 
local list = Redis:smembers(Fast.."ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
bot.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
Redis:set(Fast.."PinMsegees:"..v,msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
bot.sendPhoto(v, 0, idPhoto,'')
Redis:set(Fast.."PinMsegees:"..v,idPhoto)
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
bot.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
Redis:set(Fast.."PinMsegees:"..v,msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
bot.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
Redis:set(Fast.."PinMsegees:"..v,msg.content.voice_note.voice.remote.id)
end
elseif msg.content.video then 
for k,v in pairs(list) do 
bot.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
Redis:set(Fast.."PinMsegees:"..v,msg.content.video.video.remote.id)
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
bot.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
Redis:set(Fast.."PinMsegees:"..v,msg.content.animation.animation.remote.id)
end
elseif msg.content.document then
for k,v in pairs(list) do 
bot.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
Redis:set(Fast.."PinMsegees:"..v,msg.content.document.document.remote.id)
end
elseif msg.content.audio then
for k,v in pairs(list) do 
bot.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
Redis:set(Fast.."PinMsegees:"..v,msg.content.audio.audio.remote.id)
end
elseif text then
for k,v in pairs(list) do 
send(v,0,text,"html",true)
Redis:set(Fast.."PinMsegees:"..v,text)
end
end
send(msg_chat_id,msg_id,"⎋ تمت الاذاعه الى *- "..#list.." * جروب في البوت ","md",true)      
Redis:del(Fast.."Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(Fast.."Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر ⎋' then   
Redis:del(Fast.."Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n⎋ تم الغاء الاذاعه خاص","md",true)  
end 
local list = Redis:smembers(Fast..'Num:User:Pv')  
if msg.content.video_note then
for k,v in pairs(list) do 
bot.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
bot.sendPhoto(v, 0, idPhoto,'')
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
bot.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
bot.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
end
elseif msg.content.video then 
for k,v in pairs(list) do 
bot.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
bot.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
end
elseif msg.content.document then
for k,v in pairs(list) do 
bot.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
end
elseif msg.content.audio then
for k,v in pairs(list) do 
bot.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
end
elseif text then
for k,v in pairs(list) do 
send(v,0,text,"html",true)
end
end
send(msg_chat_id,msg_id,"⎋ تمت الاذاعه الى *- "..#list.." * مشترك في البوت ","md",true)      
Redis:del(Fast.."Broadcasting:Users" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(Fast.."Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر ⎋' then   
Redis:del(Fast.."Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n⎋ تم الغاء الاذاعه للمجموعات","md",true)  
end 
local list = Redis:smembers(Fast.."ChekBotAdd") 
if msg.content.video_note then
for k,v in pairs(list) do 
bot.sendVideoNote(v, 0, msg.content.video_note.video.remote.id)
end
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
for k,v in pairs(list) do 
bot.sendPhoto(v, 0, idPhoto,'')
end
elseif msg.content.sticker then 
for k,v in pairs(list) do 
bot.sendSticker(v, 0, msg.content.sticker.sticker.remote.id)
end
elseif msg.content.voice_note then 
for k,v in pairs(list) do 
bot.sendVoiceNote(v, 0, msg.content.voice_note.voice.remote.id, '', 'md')
end
elseif msg.content.video then 
for k,v in pairs(list) do 
bot.sendVideo(v, 0, msg.content.video.video.remote.id, '', "md")
end
elseif msg.content.animation then 
for k,v in pairs(list) do 
bot.sendAnimation(v,0, msg.content.animation.animation.remote.id, '', 'md')
end
elseif msg.content.document then
for k,v in pairs(list) do 
bot.sendDocument(v, 0, msg.content.document.document.remote.id, '', 'md')
end
elseif msg.content.audio then
for k,v in pairs(list) do 
bot.sendAudio(v, 0, msg.content.audio.audio.remote.id, '', "md") 
end
elseif text then
for k,v in pairs(list) do 
send(v,0,text,"html",true)
end
end
send(msg_chat_id,msg_id,"⎋ تمت الاذاعه الى *- "..#list.." * جروب في البوت ","md",true)      
Redis:del(Fast.."Broadcasting:Groups" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(Fast.."Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر ⎋' then   
Redis:del(Fast.."Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n⎋ تم الغاء الاذاعه بالتوجيه للمجموعات","md",true)    
end 
if msg.forward_info then 
local list = Redis:smembers(Fast.."ChekBotAdd")   
send(msg_chat_id,msg_id,"⎋ تم التوجيه الى *- "..#list.." * جروب في البوت ","md",true)      
for k,v in pairs(list) do  
bot.forwardMessages(v, msg_chat_id, msg_id,0,0,true,false,false)
end   
Redis:del(Fast.."Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
end 
return false
end
------------------------------------------------------------------------------------------------------------
if Redis:get(Fast.."Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر ⎋' then   
Redis:del(Fast.."Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n⎋ تم الغاء الاذاعه بالتوجيه خاص","md",true)    
end 
if msg.forward_info then 
local list = Redis:smembers(Fast.."Num:User:Pv")   
send(msg_chat_id,msg_id,"⎋ تم التوجيه الى *- "..#list.." * جروب في البوت ","md",true) 
for k,v in pairs(list) do  
bot.forwardMessages(v, msg_chat_id, msg_id,0,1,msg.media_album_id,false,true)
end   
Redis:del(Fast.."Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. msg.sender_id.user_id) 
end 
return false
end
if text and Redis:get(Fast..'GetTexting:DevFast'..msg_chat_id..':'..msg.sender_id.user_id) then
if text == 'الغاء' or text == 'الغاء الامر ⎋' then 
Redis:del(Fast..'GetTexting:DevFast'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,'⎋ تم الغاء حفظ كليشة المطور')
end
Redis:set(Fast..'Texting:DevFast',text)
Redis:del(Fast..'GetTexting:DevFast'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,'⎋ تم حفظ كليشة المطور')
end
if Redis:get(Fast.."Redis:Id:Group"..msg.chat_id..""..msg.sender_id.user_id) then 
if text == 'الغاء' then 
send(msg_chat_id,msg_id, "\n⎋ تم الغاء امر تعيين الايدي","md",true)  
Redis:del(Fast.."Redis:Id:Group"..msg.chat_id..""..msg.sender_id.user_id) 
return false  
end 
Redis:del(Fast.."Redis:Id:Group"..msg.chat_id..""..msg.sender_id.user_id) 
Redis:set(Fast.."Set:Id:Group"..msg.chat_id,text:match("(.*)"))
send(msg_chat_id,msg_id,'⎋ تم تعيين الايدي الجديد',"md",true)  
end
if Redis:get(Fast.."Redis:Id:Groups"..msg.chat_id..""..msg.sender_id.user_id) then 
if text == 'الغاء' then 
send(msg_chat_id,msg_id, "\n⎋ تم الغاء امر تعيين الايدي","md",true)  
Redis:del(Fast.."Redis:Id:Groups"..msg.chat_id..""..msg.sender_id.user_id) 
return false  
end 
Redis:del(Fast.."Redis:Id:Groups"..msg.chat_id..""..msg.sender_id.user_id) 
Redis:set(Fast.."Set:Id:Groups",text:match("(.*)"))
send(msg_chat_id,msg_id,'⎋ تم تعيين الايدي الجديد عام',"md",true)  
end
if Redis:get(Fast.."Change:Name:Bot"..msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر ⎋' then   
Redis:del(Fast.."Change:Name:Bot"..msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n⎋ تم الغاء امر تغير اسم البوت","md",true)  
end 
Redis:del(Fast.."Change:Name:Bot"..msg.sender_id.user_id) 
Redis:set(Fast.."Name:Bot",text) 
return send(msg_chat_id,msg_id, "⎋ تم تغير اسم البوت الى - "..text,"md",true)    
end 
if Redis:get(Fast.."Change:Start:Bot"..msg.sender_id.user_id) then 
if text == "الغاء" or text == 'الغاء الامر ⎋' then   
Redis:del(Fast.."Change:Start:Bot"..msg.sender_id.user_id) 
return send(msg_chat_id,msg_id, "\n⎋ تم الغاء امر تغير كليشه start","md",true)  
end 
Redis:del(Fast.."Change:Start:Bot"..msg.sender_id.user_id) 
Redis:set(Fast.."Start:Bot",text) 
return send(msg_chat_id,msg_id, "⎋ تم تغيير كليشه start - "..text,"md",true)    
end 

-------*****************-------*****************-------*****************

if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:Set:Manager:rd"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(Fast.."gamebot:Set:Manager:rd"..msg.sender_id.user_id..":"..msg.chat_id,"true1uu")
Redis:sadd(Fast.."gamebot:List:Manager", text)
return send(msg.chat_id,msg.id,'\nتم حفظ السؤال بنجاح')
end
end

if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:Set:Manager:rdd"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(Fast.."gamebot:Set:Manager:rdd"..msg.sender_id.user_id..":"..msg.chat_id,"true1uu")
Redis:srem(Fast.."gamebot:List:Manager", text)
return send(msg.chat_id,msg.id,'\nتم مسح السؤال بنجاح')
end
end
if msg.content.audio then  
if Redis:get(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'start' then
Redis:set(Fast.."audio:Games"..msg.sender_id.user_id..":"..msg.chat_id,msg.content.audio.audio.remote.id)  
Redis:sadd(Fast.."audio:Games:Bot",msg.content.audio.audio.remote.id)  
Redis:set(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id,'started')
return send(msg.chat_id, msg.id,'⎋ ارسل اسم الموسيقى الان ...')
end   
end

if Redis:get(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'started' then
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
local Id_audio = Redis:get(Fast.."audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:set(Fast..'Text:Games:audio'..Id_audio,text)
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
return send(msg.chat_id, msg.id,'⎋ تم حفظ الصوت ')
end

if Redis:get(Fast..'Games:Set:Answer'..msg.chat_id) then
if text == ""..(Redis:get(Fast..'Games:Set:Answer'..msg.chat_id) or '66765$47').."" then 
Redis:del(Fast.."Games:Set:Answer"..msg.chat_id)
Redis:incrby(Fast.."Num:Add:Games"..msg.chat_id..msg.sender_id.user_id,5)  
Redis:del(Fast.."Games:Set:Answer"..msg.chat_id)
return send(msg.chat_id,msg.id,'*⎋ الف مبروك اجابتك صحيحه تم اضافه لك 5 نقاط*')
end
end
if Redis:get(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'startdel' then
if not Redis:sismember(Fast.."All:text:Games:Bot",text) then
send(msg_chat_id,msg_id,'⎋ لا يوجد صوتيه بهذا الاسم في العامه')
Redis:del(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
return false
end
Redis:del(Fast.."All:audio:Games"..text)
Redis:srem(Fast.."All:text:Games:Bot",text)  
Redis:del(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg_chat_id,msg_id,'⎋ تم مسح الصوتيه بنجاح')
return false
end

if Redis:get(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'start' then
Redis:set(Fast..'All:Text:Games:audio'..msg.chat_id,text)
Redis:sadd(Fast.."All:text:Games:Bot",text)  
Redis:set(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id,'started')
send(msg_chat_id,msg_id,'⎋ الان ارسل الصوتيه ليتم حفظها باسم  : '..text)
return false
end
if Redis:get(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'started' then
if msg.content.audio then  
local nameaudio = Redis:get(Fast..'All:Text:Games:audio'..msg.chat_id)
Redis:set(Fast.."All:audio:Games"..nameaudio,msg.content.audio.audio.remote.id)  
Redis:del(Fast.."All:Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg_chat_id,msg_id,'⎋ تم حفظ الصوتيه باسم : '..nameaudio)
return false
end   
end
if text and not Redis:get(Fast..'lock_geamsAudio'..msg.chat_id) then
local nameaudio = Redis:get(Fast.."All:audio:Games"..text)
if nameaudio then
bot.sendAudio(msg_chat_id, msg.id,nameaudio , '', "md") 
end
end

if Redis:get(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'startdel' then
if not Redis:sismember(Fast.."text:Games:Bot"..msg.chat_id,text) then
send(msg_chat_id,msg_id,'⎋ لا يوجد صوتيه بهذا الاسم في الجروب')
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
return false
end
Redis:del(Fast.."audio:Games"..msg.chat_id..text)
Redis:srem(Fast.."text:Games:Bot"..msg.chat_id,text)  
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg_chat_id,msg_id,'⎋ تم مسح الصوتيه بنجاح')
return false
end


if Redis:get(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id) == 'started' then
if msg.content.audio then  
local nameaudio = Redis:get(Fast..'Text:Games:audio'..msg.chat_id)
Redis:set(Fast.."audio:Games"..msg.chat_id..nameaudio,msg.content.audio.audio.remote.id)  
Redis:del(Fast.."Add:audio:Games"..msg.sender_id.user_id..":"..msg.chat_id)
send(msg_chat_id,msg_id,'⎋ تم حفظ الصوتيه باسم : '..nameaudio)
return false
end   
end
if text and not Redis:get(Fast..'lock_geamsAudio1'..msg.chat_id) then
local nameaudio = Redis:get(Fast.."audio:Games"..msg.chat_id..text)
if nameaudio then
bot.sendAudio(msg_chat_id, msg.id,nameaudio , '', "md") 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "truedel" then
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"truefguigf1")
Redis:del(Fast.."gamebot:newqus"..msg.chat_id,text)
Redis:srem(Fast.."gamebot:new1", text)
return send(msg_chat_id,msg_id, '\nتم مسح السؤال بنجاح') 
end
end

if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true1")
Redis:set(Fast.."gamebot:newqus"..msg.chat_id,text)
Redis:sadd(Fast.."gamebot:new1", text)
return send(msg_chat_id,msg_id, '\nتم حفظ السؤال بنجاح \n ارسل الجواب الاول') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true1" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as1"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true2")
return send(msg_chat_id,msg_id, ' \n ارسل الجواب الثاني') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true2" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as2"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true3")
return send(msg_chat_id,msg_id, '\n ارسل الجواب الثالث') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true3" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as3"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true4")
return send(msg_chat_id,msg_id, '\n ارسل الجواب الرابع') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true4" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as0"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true44")
return send(msg_chat_id,msg_id, '\nتم حفظ الاجوبه \n ارسل الجواب الصحيح') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true44" then
local quschen = Redis:get(Fast.."gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."gamebot:newqus:as4"..quschen,text)
Redis:set(Fast.."gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true186")
return send(msg_chat_id,msg_id, '\nتم حفظ الجواب الصحيح') 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "truedel" then
send(msg_chat_id,msg_id, '\nتم مسح الغز بنجاح')
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"truefguigf1")
Redis:del(Fast.."lkz:gamebot:newqus"..msg.chat_id,text)
Redis:srem(Fast.."lkz:gamebot:new1", text)
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true" then
send(msg_chat_id,msg_id, '\nتم حفظ اللغز بنجاح \n ارسل الجواب الاول')
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true1")
Redis:set(Fast.."lkz:gamebot:newqus"..msg.chat_id,text)
Redis:sadd(Fast.."lkz:gamebot:new1", text)
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true1" then
send(msg_chat_id,msg_id, ' \n ارسل الجواب الثاني')
local quschen = Redis:get(Fast.."lkz:gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."lkz:gamebot:newqus:as1"..quschen,text)
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true2")
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true2" then
send(msg_chat_id,msg_id, '\n ارسل الجواب الثالث')
local quschen = Redis:get(Fast.."lkz:gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."lkz:gamebot:newqus:as2"..quschen,text)
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true3")
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true3" then
send(msg_chat_id,msg_id, ' \n ارسل الجواب الصحيح')
local quschen = Redis:get(Fast.."lkz:gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."lkz:gamebot:newqus:as3"..quschen,text)
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true44")
return false 
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id) == "true44" then
send(msg_chat_id,msg_id, '\nتم حفظ الجواب الصحيح')
local quschen = Redis:get(Fast.."lkz:gamebot:newqus"..msg.chat_id)
Redis:set(Fast.."lkz:gamebot:newqus:as4"..quschen,text)
Redis:set(Fast.."lkz:gamebot:new"..msg.sender_id.user_id..":"..msg.chat_id,"true186")
return false 
end
end
if Redis:get(Fast..":"..msg.sender_id.user_id..":lov_Bots"..msg.chat_id) == "sendlove" then
num = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","😁 98","😀 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnum = num[math.random(#num)]
local tttttt = '✫: اليك النتائج الخـاصة :\n\n✫: نسبة الحب بيـن : *'..text..'* '..sendnum..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":lov_Bots"..msg.chat_id)
end
if Redis:get(Fast..":"..msg.sender_id.user_id..":lov_Bottts"..msg.chat_id) == "sendlove" then
num = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","😁 98","😀 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnum = num[math.random(#num)]
local tttttt = '✫: اليك النتائج الخـاصة :\n\n✫: نسبة الغباء  : *'..text..'* '..sendnum..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":lov_Bottts"..msg.chat_id)
end
if Redis:get(Fast..":"..msg.sender_id.user_id..":lov_Botttuus"..msg.chat_id) == "sendlove" then
num = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","😁 98","😀 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnum = num[math.random(#num)]
local tttttt = '✫: اليك النتائج الخـاصة :\n\n✫: نسبة الذكاء  : *'..text..'* '..sendnum..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":lov_Botttuus"..msg.chat_id)
end
if text and Redis:get(Fast..":"..msg.sender_id.user_id..":krh_Bots"..msg.chat_id) == "sendkrhe" then
num = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","😁 98","😀 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnum = num[math.random(#num)]
local tttttt = '⌯ اليك النتائج الخـاصة :\n\n⌯ نسبه الكرة : *'..text..'* '..sendnum..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":krh_Bots"..msg.chat_id)
end
if text and text ~="نسبه الرجوله" and Redis:get(Fast..":"..msg.sender_id.user_id..":rjo_Bots"..msg.chat_id) == "sendrjoe" then
numj = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","😁 98","🥰 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnuj = numj[math.random(#numj)]
local tttttt = '✫: اليك النتائج الخـاصة :\n\n✫:  نسبة الرجوله لـ : *'..text..'* '..sendnuj..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":rjo_Bots"..msg.chat_id)
end
if text and text ~="نسبه الانوثه" and Redis:get(Fast..":"..msg.sender_id.user_id..":ano_Bots"..msg.chat_id) == "sendanoe" then
numj = {"😂 10","🤤 20","😢 30","😔 35","😒 75","🤩 34","😗 66","🤐 82","😪 23","😫 19","😛 55","😜 80","😲 63","😓 32","🙂 27","😎 89","😋 99","?? 98","😀 79","🤣 100","😣 8","🙄 3","😕 6","🤯 0",};
sendnuj = numj[math.random(#numj)]
local tttttt = '✫: اليك النتائج الخـاصة :\n\n✫:  نسبه الانوثة لـ : *'..text..'* '..sendnuj..'%'
send(msg_chat_id,msg_id,tttttt) 
Redis:del(Fast..":"..msg.sender_id.user_id..":ano_Bots"..msg.chat_id)
end
if text == "كشف الكدب" or text == "كشف الكذب" and msg.reply_to_message_id == 0  then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
Redis:set(Fast.."kahzm"..msg.sender_id.user_id,"sendnumh") 
Text = 'ارسل لى الجمله لتعرف صدق ام كذب🌚✨'
return bot.sendText(msg_chat_id,msg_id,Text,"md",true) 
end
end
if text and Redis:get(Fast.."kahzm"..msg.sender_id.user_id) == "sendnumh" then
num = {"اما قله ادب صحيح كلو كدب فى كدب💔😔"," ده مظبوط🙂😹"," اقلك الكلام ده كدب واللى قالولك كداب وانت كداب واللى بيتفرج كمان كداب??😂"," ده برجوله وموثق كمان❤️😁","فعلا بتتكلم صح🤗","يجدع قول كلام غير دا😹","احس هل شي كذب🌚💕","طب عيني ف عينك كدا ??","انت صح",};
sendnum = num[math.random(#num)]
sl = ' ⟨  '..text..'  ⟩ \n '..sendnum..' '
 bot.sendText(msg_chat_id,msg_id,sl,"md",true) 
Redis:del(Fast.."kahzm"..msg.sender_id.user_id)
return false
end

if text then
local NewCmmd = Redis:get(Fast.."All:Get:Reides:Commands:Group"..text) or Redis:get(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..text)
if NewCmmd then
text = (NewCmmd or text)
end
end
if Redis:get(Fast.."Channel:Redis"..msg.sender_id.user_id) == "on" then
Redis:set(Fast.."Channel:Redis"..msg.sender_id.user_id,"off")
local m = https.request("http://api.telegram.org/bot"..Token.."/getchat?chat_id="..text)
data = json:decode(m)
if data.result.invite_link then
local ch = data.result.id
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '1', data = msg.sender_id.user_id..'/setallmember'}, {text = '2', data = msg.sender_id.user_id..'/setforcmd'}, 
},
}
}
send(msg_chat_id,msg_id,'⎋ تم حفظ القناه \n⎋ اختار كيف تريد تفعيله \n⎋ 1 : وضع الاشتراك الاجباري لكل الاعضاء \n⎋ 2 : وضع الاشتراك الاجباري عند استخدام الاوامر فقط \n',"md",false, false, false, false, reply_markup)
Redis:del(Fast.."Chat:Channel:Join")
Redis:set(Fast.."Chat:Channel:Join",ch)
Redis:del(Fast.."Channel:Join")
Redis:set(Fast.."Channel:Join",data.result.invite_link)
else
send(msg_chat_id,msg_id,'⎋ المعرف خطأ او البوت ليس مشرف في القناه ',"md",true)  
end
end
if Redis:get(Fast.."Channel:Redis"..msg.sender_id.user_id) == "on" then
Redis:set(Fast.."Channel:Redis"..msg.sender_id.user_id,"off")
local m = https.request("http://api.telegram.org/bot"..Token.."/getchat?chat_id="..text)
data = json:decode(m)
if data.result.invite_link then
local ch = data.result.id
send(msg_chat_id,msg_id,'⎋ تم حفظ القناه ',"md",true)  
Redis:del(Fast.."Chat:Channel:Join")
Redis:set(Fast.."Chat:Channel:Join",ch)
Redis:del(Fast.."Channel:Join")
Redis:set(Fast.."Channel:Join",data.result.invite_link)
else
send(msg_chat_id,msg_id,'⎋ المعرف خطأ او البوت ليس مشرف في القناه ',"md",true)  
end
end
if text == 'تفعيل الاشتراك الاجباري' or text == 'تفعيل الاشتراك الاجباري ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(Fast..'Channel:Redis'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,"\n⎋ ارسل الي الان قناة الاشتراك ","md",true)  
end
if text == 'تعطيل الاشتراك الاجباري' or text == 'تعطيل الاشتراك الاجباري ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:del(Fast..'Channel:Join')
return send(msg_chat_id,msg_id,"\n⎋ تم تعطيل الاشتراك الاجباري","md",true)  
end


if text == "مسح قائمه المنع عام" then   
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'All:Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'All:Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'All:Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'All:Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."All:List:Filter"..msg_chat_id)  
if #list == 0 then  
return send(msg_chat_id,msg_id,"*⎋ لا يوجد كلمات ممنوعه هنا *","md",true)   
end  
for k,v in pairs(list) do  
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
Redis:del(Fast.."All:Filter:Group:"..v)  
Redis:srem(Fast.."All:List:Filter",v)  
end  
return send(msg_chat_id,msg_id,"*⎋ تم مسح ("..#list..") كلمات ممنوعه *","md",true)   
end
if text == "قائمه المنع عام" then   
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'All:Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'All:Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'All:Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'All:Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."All:List:Filter")  
if #list == 0 then  
return send(msg_chat_id,msg_id,"*⎋ لا يوجد كلمات ممنوعه هنا *","md",true)   
end  
Filter = '\n*⎋ قائمه المنع \n ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗*\n'
for k,v in pairs(list) do  
if v:match('photo:(.*)') then
ver = 'صوره'
elseif v:match('animation:(.*)') then
ver = 'متحركه'
elseif v:match('sticker:(.*)') then
ver = 'ملصق'
elseif v:match('text:(.*)') then
ver = v:gsub('text:',"") 
end
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
local Text_Filter = Redis:get(Fast.."All:Filter:Group:"..v)   
Filter = Filter.."*"..k.."- "..ver.." » { "..Text_Filter.." }*\n"    
end  
send(msg_chat_id,msg_id,Filter,"md",true)  
end  
if text == "منع عام" then       
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'All:Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'All:Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'All:Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'All:Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id,'true')
return send(msg_chat_id,msg_id,'\n*⎋ ارسل الان { ملصق ,متحركه ,صوره ,رساله } *',"md",true)  
end    
if text == "الغاء منع عام" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'All:Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'All:Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'All:Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'All:Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id,'DelFilterq')
return send(msg_chat_id,msg_id,'\n*⎋ ارسل الان { ملصق ,متحركه ,صوره ,رساله } *',"md",true)  
end
if (Redis:get(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'true') then
if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
Filters = 'صوره'
Redis:sadd(Fast.."All:List:Filter",'photo:'..msg.content.photo.sizes[1].photo.id)  
Redis:set(Fast.."All:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.photo.sizes[1].photo.id)  
elseif msg.content.animation then
Filters = 'متحركه'
Redis:sadd(Fast.."All:List:Filter",'animation:'..msg.content.animation.animation.id)  
Redis:set(Fast.."All:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.animation.animation.id)  
elseif msg.content.sticker then
Filters = 'ملصق'
Redis:sadd(Fast.."All:List:Filter",'sticker:'..msg.content.sticker.sticker.id)  
Redis:set(Fast.."All:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, msg.content.sticker.sticker.id)  
elseif text then
Redis:set(Fast.."All:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id, text)  
Redis:sadd(Fast.."All:List:Filter",'text:'..text)  
Filters = 'نص'
end
Redis:set(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id,'true1')
return send(msg_chat_id,msg_id,"\n⎋ ارسل تحذير ( "..Filters.." ) عند ارساله","md",true)  
end
end
if text and (Redis:get(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id) == 'true1') then
local Text_Filter = Redis:get(Fast.."All:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id)  
if Text_Filter then   
Redis:set(Fast.."All:Filter:Group:"..Text_Filter,text)  
end  
Redis:del(Fast.."All:Filter:Text"..msg.sender_id.user_id..':'..msg_chat_id)  
Redis:del(Fast..'All:FilterText'..msg_chat_id..':'..msg.sender_id.user_id)
return send(msg_chat_id,msg_id,"\n⎋ تم اضافه رد التحذير","md",true)  
end

if text or msg.content.photo or msg.content.animation or msg.content.sticker then
if msg.content.photo then
DelFilters = msg.content.photo.sizes[1].photo.id
statusfilter = 'الصوره'
elseif msg.content.animation then
DelFilters = msg.content.animation.animation.id
statusfilter = 'المتحركه'
elseif msg.content.sticker then
DelFilters = msg.content.sticker.sticker.id
statusfilter = 'الملصق'
elseif text then
DelFilters = text
statusfilter = 'الرساله'
end
local ReplyFilters = Redis:get(Fast.."All:Filter:Group:"..DelFilters)
if ReplyFilters and not msg.Special then
bot.deleteMessages(msg.chat_id,{[1]= msg.id})
return send(msg_chat_id,msg_id,"*⎋ لقد تم منع هذه ( "..statusfilter.." ) هنا*\n⎋ "..ReplyFilters,"md",true)   
end
end
if text == 'رفع المطورين' and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local FilesJson = JSON.decode(Get_Info)
i = 0
if FilesJson and FilesJson.dev then
for k,v in pairs(FilesJson.dev) do
i = i + 1
Redis:sadd(Fast.."Dev:Groups",v)  
end
x = 0
for k,v in pairs(FilesJson.devss) do
x = x + 1
Redis:sadd(Fast.."Devss:Groups",v)  
end
send(msg.chat_id,msg.id,"⎋ تم رفع "..i.." من المطورين و "..x.." من المطورين الثانويين")
else
send(msg.chat_id,msg.id,"⎋ الملف غير صالح")
end
end
end
if text == 'رفع النسخه الاحتياطيه' and msg.reply_to_message_id ~= 0 or text == 'رفع نسخه احتياطيه' and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name

local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
var(File)
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local FilesJson = JSON.decode(Get_Info)
if tonumber(Fast) ~= tonumber(FilesJson.BotId) then
return send(msg_chat_id,msg_id,'⎋ عذرا هذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- end botid
send(msg_chat_id,msg_id,'⎋ جاري استرجاع المشتركين والجروبات ...')
Y = 0
for k,v in pairs(FilesJson.UsersBot) do
Y = Y + 1
Redis:sadd(Fast..'Num:User:Pv',v)  
end
X = 0
for GroupId,ListGroup in pairs(FilesJson.GroupsBot) do
X = X + 1
Redis:sadd(Fast.."ChekBotAdd",GroupId) 
if ListGroup.President then
for k,v in pairs(ListGroup.President) do
Redis:sadd(Fast.."SuperCreator:Group"..GroupId,v)
end
end
if ListGroup.Constructor then
for k,v in pairs(ListGroup.Constructor) do
Redis:sadd(Fast.."Creator:Group"..GroupId,v)
end
end
if ListGroup.Manager then
for k,v in pairs(ListGroup.Manager) do
Redis:sadd(Fast.."Manger:Group"..GroupId,v)
end
end
if ListGroup.Admin then
for k,v in pairs(ListGroup.Admin) do
Redis:sadd(Fast.."Admin:Group"..GroupId,v)
end
end
if ListGroup.Vips then
for k,v in pairs(ListGroup.Vips) do
Redis:sadd(Fast.."Special:Group"..GroupId,v)
end
end 
end
return send(msg_chat_id,msg_id,'⎋ تم استرجاع {'..X..'} جروب \n⎋ واسترجاع {'..Y..'} مشترك في البوت')
end
end
if text == 'رفع نسخه تشاكي' and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply.content.document then
local File_Id = Message_Reply.content.document.document.remote.id
local Name_File = Message_Reply.content.document.file_name
if tonumber(Name_File:match('(%d+)')) ~= tonumber(Fast) then 
return send(msg_chat_id,msg_id,'⎋ عذرا هذا الملف غير مطابق مع البوت يرجى جلب النسخه الحقيقيه')
end -- end Namefile
local File = json:decode(https.request('https://api.telegram.org/bot'..Token..'/getfile?file_id='..File_Id)) 
local download_ = download('https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path,''..Name_File) 
local Get_Info = io.open(download_,"r"):read('*a')
local All_Groups = JSON.decode(Get_Info)
if All_Groups.GP_BOT then
for idg,v in pairs(All_Groups.GP_BOT) do
Redis:sadd(Fast.."ChekBotAdd",idg) 
if v.MNSH then
for k,idmsh in pairs(v.MNSH) do
Redis:sadd(Fast.."Creator:Group"..idg,idmsh)
end;end
if v.MDER then
for k,idmder in pairs(v.MDER) do
Redis:sadd(Fast.."Manger:Group"..idg,idmder)  
end;end
if v.MOD then
for k,idmod in pairs(v.MOD) do
Redis:sadd(Fast.."Admin:Group"..idg,idmod)
end;end
if v.ASAS then
for k,idASAS in pairs(v.ASAS) do
Redis:sadd(Fast.."SuperCreator:Group"..idg,idASAS)
end;end
end
return send(msg_chat_id,msg_id,'⎋ تم استرجاع المجموعات من نسخه تشاكي')
else
return send(msg_chat_id,msg_id,'⎋ الملف لا يدعم هذا البوت')
end
end
end

if (Redis:get(Fast.."AddSudosNew"..msg_chat_id) == 'true') then
if text == "الغاء" or text == 'الغاء الامر ⎋' then   
Redis:del(Fast.."AddSudosNew"..msg_chat_id)
return send(msg_chat_id,msg_id, "\n⎋ تم الغاء امر تغيير المطور الاساسي","md",true)    
end 
Redis:del(Fast.."AddSudosNew"..msg_chat_id)
if text and text:match("^@[%a%d_]+$") then
local UserId_Info = bot.searchPublicChat(text)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا يوجد حساب بهاذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName[2]:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local Informationlua = io.open("Information.lua", 'w')
Informationlua:write([[
return {
Token = "]]..Token..[[",
UserBot = "]]..UserBot..[[",
UserSudo = "]]..text:gsub('@','')..[[",
SudoId = ]]..UserId_Info.id..[[
}
]])
Informationlua:close()
send(msg_chat_id,msg_id,"\n⎋ تم تغيير المطور الاساسي اصبح على : [@"..text:gsub('@','').."]","md",true)  
dofile('Fast.lua')  
return false
end
end

if text == 'تغيير المطور الاساسي' or text == '⎋ تغيير المطور الاساسي' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(Fast.."AddSudosNew"..msg_chat_id,true)
return send(msg_chat_id,msg_id,"⎋ ارسل معرف المطور الاساسي مع @","md",true)
end
if text == 'تحديث السورس' or text == 'تحديث السورس ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
os.execute('rm -rf Fast.lua')
download('http://45.32.238.150/Mero/Fast.lua','Fast.lua')
return send(msg_chat_id,msg_id,'\n*⎋ تم تحديث السورس * ',"md",true)  
end
if text == 'معلومات التنصيب' or text == 'معلومات التنصيب ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
return send(msg_chat_id,msg_id,'\n* عيب ي كآبتن تم ألغاء الكود لحفظ الآمان للبوت * ',"md",true)  
end
if text == "ضع صوره للترحيب" or text == "ضع صوره للترحيب ⎋" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:setex(Fast..'welcom_ph:witting'..senderr,300,true) 
return send(msg_chat_id,msg_id, '⎋ حسننا عزيزي \n⎋ ︙الان قم بارسال الصوره للترحيب \n' )
end


if text and text:match("^تعيين عدد الاعضاء (%d+)$") then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'Num:Add:Bot',text:match("تعيين عدد الاعضاء (%d+)$") ) 
send(msg_chat_id,msg_id,'*⎋ تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعيين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
elseif text =='الاحصائيات' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,'*⎋ عدد احصائيات البوت الكامله \n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗\n⎋ عدد المجموعات : '..(Redis:scard(Fast..'ChekBotAdd') or 0)..'\n⎋ عدد المشتركين : '..(Redis:scard(Fast..'Num:User:Pv') or 0)..'*',"md",true)  
end
if text == 'تفعيل' and msg.Dev then
if Redis:sismember(Fast..'ban:online',msg.chat_id) then
send(msg_chat_id,msg_id,"\n*⎋ عذرا هذا الجروب محظور من قبل المطور الاساسي سوف اغادر*","md",true)  
sleep(2)
bot.leaveChat(msg.chat_id)
return false 
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
Redis:set(Fast..'lock_chengname'..msg.chat_id,true)  
Redis:set(Fast.."Status:Games"..msg.chat_id,true) 
Redis:set(Fast.."smsme"..msg.chat_id,true)
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..msg.chat_id,true) 
Redis:set(Fast.."Status:Reply"..msg.chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:Welcome"..msg.chat_id,true) 
Redis:set(Fast.."Status:Link"..msg.chat_id,true) 
Redis:set(Fast.."Status:Games"..msg.chat_id,true) 
Redis:set(Fast..'tagallgroup'..msg.chat_id,'open') 
Redis:set(Fast..'tagall@all'..msg.chat_id,'open') 
Redis:del(Fast.."knele"..msg.chat_id)
Redis:set(Fast.."Status:Link"..msg.chat_id,true) 
Redis:set(Fast.."Status:Welcome"..msg.chat_id,true) 
Redis:set(Fast.."Status:BanId"..msg.chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..msg.chat_id,true) 
Redis:set(Fast.."Status:Reply"..msg.chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:SetId"..msg.chat_id,true) 
Redis:set(Fast.."Status:KickMe"..msg.chat_id,true) 
Redis:set(Fast.."replayallbot"..msg.chat_id,true)
Redis:del(Fast.."amrthshesh"..msg.chat_id)
Redis:del(Fast.."spammkick"..msg.chat_id)
Redis:del(Fast.."intg"..msg.chat_id)
Redis:del(Fast.."kadmeat"..msg.chat_id)
Redis:del(Fast.."zhrfa"..msg.chat_id)
Redis:del(Fast.."brjj"..msg.chat_id)
Redis:del(Fast.."idnotmembio"..msg.chat_id)
Redis:del(Fast.."idnotmem"..msg.chat_id)
Redis:del(Fast..'lock_geamsAudio1'..msg.chat_id) 
Redis:del(Fast..'lock_geamsAudio'..msg.chat_id) 
Redis:del(Fast.."Lock:tagservrbot"..msg.chat_id)   
list11 ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list11) do 
Redis:del(Fast..''..lock..msg.chat_id)    
end
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
if Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(Fast..'Num:Add:Bot') or 0)) and not msg.Asasy then
return send(msg_chat_id,msg_id,'⎋عدد الاعضاء قليل لا يمكن تفعيل الجروب  يجب ان يكوم اكثر من :'..Redis:get(Fast..'Num:Add:Bot'),"md",true)  
end
return send(msg_chat_id,msg_id,'\n*⎋الجروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n⎋ تم تفعيلها مسبقا *',"md",true)  
else
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- رفع المالك والادمنيه', data = senderr..'/addAdmins@'..msg_chat_id},
},
{
{text = '- قفل جميع الاوامر ', data =senderr..'/LockAllGroup@'..msg_chat_id},{text = '- ترتيب الاوامر', data = senderr..'/trtep@'..msg_chat_id},
},
}
}
if not msg.Asasy then
local UserInfo = bot.getUser(msg.sender_id.user_id)
UserInfo.first_name = Name_User
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- مغادرة الجروب ', data = '/leftgroup@'..msg_chat_id}, 
},
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
send(Sudo_Id,0,'*\n⎋ تم تفعيل جروب جديده \n⎋من قام بتفعيلها : {*['..UserInfo.first_name..'](tg://user?id='..msg.sender_id.user_id..')*} \n⎋معلومات الجروب :\n⎋عدد الاعضاء : '..Info_Chats.member_count..'\n⎋عدد الادمنيه : '..Info_Chats.administrator_count..'\n⎋عدد المطرودين : '..Info_Chats.banned_count..'\n⎋ عدد المقيدين : '..Info_Chats.restricted_count..'*',"md",true, false, false, false, reply_markup)
end
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
Redis:set(Fast.."Status:Id"..msg_chat_id,true) ;Redis:del(Fast.."Status:Reply"..msg_chat_id) ;Redis:del(Fast.."Status:ReplySudo"..msg_chat_id) ;Redis:set(Fast.."Status:BanId"..msg_chat_id,true) ;Redis:set(Fast.."Status:SetId"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,'\n*⎋الجروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n⎋ تم تفعيل الجروب *','md', true, false, false, false, reply_markup)
end
end 
if text == 'تفعيل' and not msg.Dev then
if Redis:sismember(Fast..'ban:online',msg.chat_id) then
send(msg_chat_id,msg_id,"\n*⎋ عذرا هذا الجروب محظور من قبل المطور الاساسي سوف اغادر*","md",true)  
sleep(2)
bot.leaveChat(msg.chat_id)
return false 
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end

local StatusMember = bot.getChatMember(msg_chat_id,msg.sender_id.user_id).status.bot
if (StatusMember == "chatMemberStatusCreator") then
local AddedBot = true
elseif (StatusMember == "chatMemberStatusAdministrator") then
local AddedBot = true
else
local AddedBot = false
end
if AddedBot == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرا انته لست ادمن او مالك الجروب *","md",true)  
end
if not Redis:get(Fast.."BotFree") then
return send(msg_chat_id,msg_id,"\n*⎋الوضع الخدمي تم تعطيله من قبل مطور البوت *","md",true)  
end
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
Redis:set(Fast..'lock_chengname'..msg.chat_id,true)  
Redis:set(Fast.."Status:Games"..msg.chat_id,true) 
Redis:set(Fast.."smsme"..msg.chat_id,true)
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..msg.chat_id,true) 
Redis:set(Fast.."Status:Reply"..msg.chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:Welcome"..msg.chat_id,true) 
Redis:set(Fast.."Status:Link"..msg.chat_id,true) 
Redis:set(Fast.."Status:Games"..msg.chat_id,true) 
Redis:set(Fast..'tagallgroup'..msg.chat_id,'open') 
Redis:set(Fast..'tagall@all'..msg.chat_id,'open') 
Redis:del(Fast.."knele"..msg.chat_id)
Redis:set(Fast.."Status:Link"..msg.chat_id,true) 
Redis:set(Fast.."Status:Welcome"..msg.chat_id,true) 
Redis:set(Fast.."Status:BanId"..msg.chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..msg.chat_id,true) 
Redis:set(Fast.."Status:Reply"..msg.chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:SetId"..msg.chat_id,true) 
Redis:set(Fast.."Status:KickMe"..msg.chat_id,true) 
Redis:set(Fast.."replayallbot"..msg.chat_id,true)
Redis:del(Fast.."amrthshesh"..msg.chat_id)
Redis:del(Fast.."spammkick"..msg.chat_id)
Redis:del(Fast.."intg"..msg.chat_id)
Redis:del(Fast.."kadmeat"..msg.chat_id)
Redis:del(Fast.."zhrfa"..msg.chat_id)
Redis:del(Fast.."brjj"..msg.chat_id)
Redis:del(Fast.."idnotmembio"..msg.chat_id)
Redis:del(Fast.."idnotmem"..msg.chat_id)
Redis:del(Fast..'lock_geamsAudio1'..msg.chat_id) 
Redis:del(Fast..'lock_geamsAudio'..msg.chat_id) 
Redis:del(Fast.."Lock:tagservrbot"..msg.chat_id)   
list11 ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list11) do 
Redis:del(Fast..''..lock..msg.chat_id)    
end
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
if Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
if tonumber(Info_Chats.member_count) < tonumber((Redis:get(Fast..'Num:Add:Bot') or 0)) and not msg.Asasy then
return send(msg_chat_id,msg_id,'⎋عدد الاعضاء قليل لا يمكن تفعيل الجروب  يجب ان يكوم اكثر من :'..Redis:get(Fast..'Num:Add:Bot'),"md",true)  
end
return send(msg_chat_id,msg_id,'\n*⎋الجروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n⎋ تم تفعيلها مسبقا *',"md",true)  
else
if not msg.Asasy then
local UserInfo = bot.getUser(msg.sender_id.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- مغادرة الجروب ', data = '/leftgroup@'..msg_chat_id}, 
},
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
send(Sudo_Id,0,'*\n⎋ تم تفعيل جروب جديده \n⎋من قام بتفعيلها : {*['..UserInfo.first_name..'](tg://user?id='..msg.sender_id.user_id..')*} \n⎋معلومات الجروب :\n⎋عدد الاعضاء : '..Info_Chats.member_count..'\n⎋عدد الادمنيه : '..Info_Chats.administrator_count..'\n⎋عدد المطرودين : '..Info_Chats.banned_count..'\n⎋ عدد المقيدين : '..Info_Chats.restricted_count..'*',"md",true, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- رفع المالك والادمنيه', data = senderr..'/addAdmins@'..msg_chat_id},
},
{
{text = '- قفل جميع الاوامر ', data =senderr..'/LockAllGroup@'..msg_chat_id},{text = '- ترتيب الاوامر', data = senderr..'/trtep@'..msg_chat_id},
},
}
}
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
Redis:set(Fast.."Status:Id"..msg_chat_id,true) ;Redis:del(Fast.."Status:Reply"..msg_chat_id) ;Redis:del(Fast.."Status:ReplySudo"..msg_chat_id) ;Redis:set(Fast.."Status:BanId"..msg_chat_id,true) ;Redis:set(Fast.."Status:SetId"..msg_chat_id,true) 
return send(msg_chat_id,msg_id,'\n*⎋الجروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n⎋ تم تفعيل الجروب *','md', true, false, false, false, reply_markup)
end
end

if text == 'تعطيل' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص  '..Controller_Num(8)..' * ',"md",true)  
end
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
if not Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
return send(msg_chat_id,msg_id,'\n*⎋الجروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n⎋ تم تعطيلها مسبقا *',"md",true)  
else
if not msg.Asasy then
local UserInfo = bot.getUser(msg.sender_id.user_id)
for Name_User in string.gmatch(UserInfo.first_name, "[^%s]+" ) do
UserInfo.first_name = Name_User
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
send(Sudo_Id,0,'*\n⎋ تم تعطيل جروب جديده \n⎋من قام بتعطيلها : {*['..UserInfo.first_name..'](tg://user?id='..msg.sender_id.user_id..')*} \n⎋معلومات الجروب :\n⎋عدد الاعضاء : '..Info_Chats.member_count..'\n⎋عدد الادمنيه : '..Info_Chats.administrator_count..'\n⎋عدد المطرودين : '..Info_Chats.banned_count..'\n⎋ عدد المقيدين : '..Info_Chats.restricted_count..'*',"md",true, false, false, false, reply_markup)
end
Redis:srem(Fast.."ChekBotAdd",msg_chat_id)
return send(msg_chat_id,msg_id,'\n*⎋الجروب : {*['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')*}\n⎋ تم تعطيلها بنجاح *','md',true)
end
end
if chat_type(msg.chat_id) == "GroupBot" and not Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then
Redis:sadd(Fast.."ChekBotAdd",msg_chat_id)
Redis:set(Fast..'lock_chengname'..msg.chat_id,true)  
Redis:set(Fast.."Status:Games"..msg.chat_id,true) 
Redis:set(Fast.."smsme"..msg.chat_id,true)
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..msg.chat_id,true) 
Redis:set(Fast.."Status:Reply"..msg.chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:Welcome"..msg.chat_id,true) 
Redis:set(Fast.."Status:Link"..msg.chat_id,true) 
Redis:set(Fast.."Status:Games"..msg.chat_id,true) 
Redis:set(Fast..'tagallgroup'..msg.chat_id,'open') 
Redis:set(Fast..'tagall@all'..msg.chat_id,'open') 
Redis:del(Fast.."knele"..msg.chat_id)
Redis:set(Fast.."Status:Link"..msg.chat_id,true) 
Redis:set(Fast.."Status:Welcome"..msg.chat_id,true) 
Redis:set(Fast.."Status:BanId"..msg.chat_id,true) 
Redis:set(Fast.."Status:ReplySudo"..msg.chat_id,true) 
Redis:set(Fast.."Status:Reply"..msg.chat_id,true) 
Redis:set(Fast.."Status:IdPhoto"..msg.chat_id,true) 
Redis:set(Fast.."Status:Id"..msg.chat_id,true) 
Redis:set(Fast.."Status:SetId"..msg.chat_id,true) 
Redis:set(Fast.."Status:KickMe"..msg.chat_id,true) 
Redis:set(Fast.."replayallbot"..msg.chat_id,true)
Redis:del(Fast.."amrthshesh"..msg.chat_id)
Redis:del(Fast.."spammkick"..msg.chat_id)
Redis:del(Fast.."intg"..msg.chat_id)
Redis:del(Fast.."kadmeat"..msg.chat_id)
Redis:del(Fast.."zhrfa"..msg.chat_id)
Redis:del(Fast.."brjj"..msg.chat_id)
Redis:del(Fast.."idnotmembio"..msg.chat_id)
Redis:del(Fast.."idnotmem"..msg.chat_id)
Redis:del(Fast..'lock_geamsAudio1'..msg.chat_id) 
Redis:del(Fast..'lock_geamsAudio'..msg.chat_id) 
Redis:del(Fast.."Lock:tagservrbot"..msg.chat_id)   
list11 ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list11) do 
Redis:del(Fast..''..lock..msg.chat_id)    
end
local list = Redis:smembers(Fast.."ChekBotAdd")
send(Sudo_Id,0,"*⎋ تم تفعيل جروب تلقائيا عن طريق البوت*\n⎋ اصبح عدد جروباتك *"..#list.."* مجموعه","md",true)
end
if chat_type(msg.chat_id) == "GroupBot" and Redis:sismember(Fast.."ChekBotAdd",msg_chat_id) then

if text then
local GetMsg = Redis:incr(Fast..'Num:Message:User'..msg.chat_id..':'..senderr) 
Redis:hset(Fast..':GroupUserCountMsg:'..msg.chat_id,senderr,GetMsg)
local UserInfo = bot.getUser(senderr) 
if FlterBio(UserInfo.first_name) then
NameLUser = FlterBio(UserInfo.first_name)
else
NameLUser = FlterBio(UserInfo.first_name)
end
NameLUser = NameLUser
NameLUser = NameLUser:gsub("]","")
NameLUser = NameLUser:gsub("[[]","")
Redis:hset(Fast..':GroupNameUser:'..msg.chat_id,senderr,NameLUser)
end



if text == "ترند" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
GroupAllRtba = Redis:hgetall(Fast..':GroupUserCountMsg:'..msg.chat_id)
GetAllNames  = Redis:hgetall(Fast..':GroupNameUser:'..msg.chat_id)
GroupAllRtbaL = {}
for k,v in pairs(GroupAllRtba) do table.insert(GroupAllRtbaL,{v,k}) end
Count,Kount,i = 8 , 0 , 1
for _ in pairs(GroupAllRtbaL) do Kount = Kount + 1 end
table.sort(GroupAllRtbaL, function(a, b) return tonumber(a[1]) > tonumber(b[1]) end)
if Count >= Kount then Count = Kount end
Text = " الاكثر تفاعلا هو : \n\n"
for k,v in ipairs(GroupAllRtbaL) do
if i <= Count then  Text = Text..i.."ـ ["..(GetAllNames[v[2]] or "خطأ بالأسـم").."](tg://user?id="..v[2]..") ـ~> {*"..v[1].."*}  \n" end ; i=i+1
end
return send(msg.chat_id,msg.id,Text,"md")
end


if text and text:match('^ذيع (-100%d+)$') and tonumber(msg.reply_to_message_id) ~= 0 then
local Chatid = text:match('^ذيع (-100%d+)$') 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end 
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local Get_Chat = bot.getChat(Chatid)
if not data.id then
send(msg_chat_id,msg_id,'- لا توجد جروب في البوت بهذا الايدي')
return false
end
send(Chatid,0,Message_Reply.content.text.text)
send(msg_chat_id,msg_id,'- تم الاذاعه الى  : '..Get_Chat.title..'\n ')
end 



if text and text:match('^حظر جروب (-100%d+)$') then
local Chatid = text:match('^حظر جروب (-100%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local Get_Chat = bot.getChat(Chatid)
if not data.id then
send(msg_chat_id,msg_id,'- لا توجد جروب في البوت بهذا الايدي')
return false
end
bot.leaveChat(Chatid)
Redis:sadd(Fast.."Black:listBan:",Chatid)
send(msg_chat_id,msg_id,'- تم حظر الجروب  : ['..Get_Chat.title..']\n - وتم مغادره البوت من الجروب')
end 
if text and text:match('^الغاء حظر جروب (-100%d+)$') then
local Chatid = text:match('^الغاء حظر جروب (-100%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:srem(Fast.."Black:listBan:",Chatid)
send(msg_chat_id,msg_id,'- تم الغاء حظر الجروب ')
end 

if text == "معرفي" or text == "يوزري" then
local ban = bot.getUser(msg.sender_id.user_id)
if ban.username then
banusername = '[@'..ban.username..']'
else
banusername = 'لا يوجد'
end
return send(msg_chat_id,msg_id,banusername,"md",true) 
end

if text == "الوقت" then
local date = os.date('*t')
local time = os.date("*t")
local hour = time.hour
local min = time.min
local sec = time.sec
return send(msg_chat_id,msg_id,"التاريخ : "..os.date("%A, %d %B %Y").."\nالساعه : "..os.date("%I:%M:%S %p"),"md",true)
end

if text == "التاريخ" then
local ramsesj20 =  "\n التاريخ : "..os.date("%Y/%m/%d")
send(msg_chat_id,msg_id,ramsesj20)
end

if text == "زخرفه" or text == "زخرفة" then
local ban = bot.getUser(senderr)
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = ' زخرفه عاديه ⎋ ', data = senderr..'/ZhrAde'},{text = 'زخرفه اونلاين ⎋', data = senderr..'/Zhrfinlin'},},
{{text = 'زخرفه جاهزه ⎋', data = senderr..'/decor'},},
}
}
return send(msg_chat_id,msg_id,"*مرحبا ⇿* "..Name.." 👋\n* ⎋ اختار نوع الزخرفه الان*","md",false ,false ,false ,false ,reply_markup) 
end

if text == "اذكار" or text == "الاذكار" then
local ban = bot.getUser(senderr)
local Name = '['..ban.first_name..'](tg://user?id='..ban.id..')' or 'لا يوجد اسم'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'قـسم الاذكـار ⎋', data = senderr..'/Azkary1'},},
}
}
return send(msg_chat_id,msg_id,"*مرحبا ⇿* "..Name.." ❤️‍🩹\n* ⎋ اختار نوع الاذكار*","md",false ,false ,false ,false ,reply_markup) 
end

if text == "افلام" then
local Jabwa = bot.getUser(senderr)
local news = Jabwa.first_name
local t = "*اليك قائمة الافلام من سورس افــاتـار ⎋ *"
local m = "https://t.me/source_av"
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '🇪🇬 مصري', callback_data=senderr.."/3nkpot"},{text = '🇳🇿 أجنبي', callback_data=senderr.."/wahed"},
},
{
{text = '🧸 كارتون', callback_data=senderr.."/zombiez"},{text = '🎬 مسرحيات', callback_data=senderr.."/3mohm"},
},
{
{text =news, url = "https://t.me/"..Jabwa.username..""},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&photo="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown&reply_markup="..JSON.encode(keyboard))
end

if Text and Text:match('(%d+)/3nkpot') then
local UserId = Text:match('(%d+)/3nkpot')
if tonumber(IdUser) == tonumber(UserId) then
local Jabwa = bot.getUser(IdUser)
JABWA ={type = "video",media = "https://t.me/jsjbdvbx/10",caption = '⎋ بواسطة ⇿ '..Jabwa.first_name..'\n⎋ 𝙱𝙾𝚃 ➻ @'..UserBot..'\n✧ 𝙲𝙷 ➻ @source_av\nتم تحميل الاغنيه بنجاح ✅\n',parse_mode = "html"}     
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجوع ', callback_data=IdUser.."/Azkary1"},
},
{
{text = 'القائمه الرئيسيه ', callback_data=IdUser.."/back"},
},
}
local Mostafa = Msg_id/2097152/0.5
https.request("http://api.telegram.org/bot"..Token.."/editmessagevideo?chat_id="..ChatId.."&message_id="..Mostafa.."&video="..JSON.encode(JABWA).."&reply_markup="..JSON.encode(keyboard))
end
end
------------------------------

if Redis:get(Fast..":ZhrfNow:ar"..msg.sender_id.user_id) then
Redis:del(Fast..":ZhrfNow:ar"..msg.sender_id.user_id)
if string.len(text) > 300 then
return send(msg_chat_id,msg_id,"⎋  لا يمكنك زخرفه اكثر من 20 حرف \n⎋  ارسل امر زخرفه وحاول مجددا بحروف اقل","md",true)      
elseif text:match("\n") then
return send(msg_chat_id,msg_id,"⎋  لا يمكن زخرفه نص يحتوي على اكثر من سطر .","md",true)  
end
local Zh_Ar13 = text:gsub('ض', 'ضِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('ص', 'صِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('ث', 'ثِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('ق', 'قِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('ف', 'فِٰ͒ــ' ) Zh_Ar13 = Zh_Ar13:gsub('غ', 'غِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('ع', 'عِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('خ', 'خِٰ̐ــ' ) Zh_Ar13 = Zh_Ar13:gsub('ح', 'حِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('ج', 'جِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('ش', 'شِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('س', 'سِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('ي', 'يِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('ب', 'بِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('ل', 'لِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('ا', 'آ' ) Zh_Ar13 = Zh_Ar13:gsub('ت', 'تِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('ن', 'نِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('م', 'مِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('ك', 'ڪِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('ط', 'طِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('ظ', 'ظِٰــ' ) Zh_Ar13 = Zh_Ar13:gsub('ء', 'ء' ) Zh_Ar13 = Zh_Ar13:gsub('ؤ', 'ؤ' ) Zh_Ar13 = Zh_Ar13:gsub('ر', 'ر' ) Zh_Ar13 = Zh_Ar13:gsub('ى', 'ى' ) Zh_Ar13 = Zh_Ar13:gsub('ز', 'ز' ) Zh_Ar13 = Zh_Ar13:gsub('و', 'ﯛ̲୭' ) Zh_Ar13 = Zh_Ar13:gsub("ه", "໋۠هہؚ")
local Zh_Ar12 = text:gsub('ا','آ' ) Zh_Ar12 = Zh_Ar12:gsub("ب","بّہ" ) Zh_Ar12 = Zh_Ar12:gsub("ت","تَہَٰ" ) Zh_Ar12 = Zh_Ar12:gsub("ح","حہٰٰ" ) Zh_Ar12 = Zh_Ar12:gsub("ج","جْۧ" ) Zh_Ar12 = Zh_Ar12:gsub("خ","خٰ̐ہ" ) Zh_Ar12 = Zh_Ar12:gsub("د","د" ) Zh_Ar12 = Zh_Ar12:gsub("ذ","ذِ" ) Zh_Ar12 = Zh_Ar12:gsub("ر","ر" ) Zh_Ar12 = Zh_Ar12:gsub("ز","زَ" ) Zh_Ar12 = Zh_Ar12:gsub("س","سٰٰٓ" ) Zh_Ar12 = Zh_Ar12:gsub("ش","شِٰہٰٰ" ) Zh_Ar12 = Zh_Ar12:gsub("ص","صۛہٰٰ" ) Zh_Ar12 = Zh_Ar12:gsub("ض","ضۜہٰٰ" ) Zh_Ar12 = Zh_Ar12:gsub("ظ","ظۗہٰٰ" ) Zh_Ar12 = Zh_Ar12:gsub("غ","غہٰٰ" ) Zh_Ar12 = Zh_Ar12:gsub("ف","ف͒ہٰٰ" ) Zh_Ar12 = Zh_Ar12:gsub("ق","قྀ̲ہٰٰٰ" ) Zh_Ar12 = Zh_Ar12:gsub("ك","ڪٰྀہٰٰٖ" ) Zh_Ar12 = Zh_Ar12:gsub("ل","ل" ) Zh_Ar12 = Zh_Ar12:gsub("ن","نَِٰہٰ" ) Zh_Ar12 = Zh_Ar12:gsub("ه","ھہ" ) Zh_Ar12 = Zh_Ar12:gsub("و","وِ" ) Zh_Ar12 = Zh_Ar12:gsub("طۨہٰٰ","ط" ) Zh_Ar12 = Zh_Ar12:gsub("ث","ثہٰٰ" ) Zh_Ar12 = Zh_Ar12:gsub("ي","يِٰہ" ) Zh_Ar12 = Zh_Ar12:gsub("ع","؏ۤـہٰٰ")
local Zh_Ar11 = text:gsub('ض', 'ضُ͠' ) Zh_Ar11 = Zh_Ar11:gsub('ص', 'صّ͠' ) Zh_Ar11 = Zh_Ar11:gsub('ث', 'ثُ͠' ) Zh_Ar11 = Zh_Ar11:gsub('ق', 'ق͠' ) Zh_Ar11 = Zh_Ar11:gsub('ف', 'ف͠' ) Zh_Ar11 = Zh_Ar11:gsub('غ', 'غ͠' ) Zh_Ar11 = Zh_Ar11:gsub('ع', 'ع͠' ) Zh_Ar11 = Zh_Ar11:gsub('خ', 'ٌخ͠' ) Zh_Ar11 = Zh_Ar11:gsub('ح', 'حُ͠' ) Zh_Ar11 = Zh_Ar11:gsub('ج', 'جْ͠' ) Zh_Ar11 = Zh_Ar11:gsub('ش', 'شِ͠' ) Zh_Ar11 = Zh_Ar11:gsub('س', 'سِ͠' ) Zh_Ar11 = Zh_Ar11:gsub('ي', 'ي͠' ) Zh_Ar11 = Zh_Ar11:gsub('ب', 'بّ͠' ) Zh_Ar11 = Zh_Ar11:gsub('ل', 'ل͠' ) Zh_Ar11 = Zh_Ar11:gsub('ا', 'ا' ) Zh_Ar11 = Zh_Ar11:gsub('ت', 'تْ͠' ) Zh_Ar11 = Zh_Ar11:gsub('ن', 'ن͠' ) Zh_Ar11 = Zh_Ar11:gsub('م', 'م͠' ) Zh_Ar11 = Zh_Ar11:gsub('ك', 'گ͠' ) Zh_Ar11 = Zh_Ar11:gsub('طِ', 'ط͠' ) Zh_Ar11 = Zh_Ar11:gsub('ظ', 'ظٌ͠' ) Zh_Ar11 = Zh_Ar11:gsub('ء', '͠ء' ) Zh_Ar11 = Zh_Ar11:gsub('وَ', 'و͠' ) Zh_Ar11 = Zh_Ar11:gsub('ر', 'ر͠' ) Zh_Ar11 = Zh_Ar11:gsub('ى', '͠ى' ) Zh_Ar11 = Zh_Ar11:gsub('ز', 'ز͠' ) Zh_Ar11 = Zh_Ar11:gsub('ض','ض͠' ) Zh_Ar11 = Zh_Ar11:gsub('و', 'وَ͠' ) Zh_Ar11 = Zh_Ar11:gsub("ه", "ه͠")
local Zh_Ar10 = text:gsub('ض', 'ضِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ص', 'صِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ث', 'ثِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ق', 'قِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ف', 'فِ͒ـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('غ', 'غِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ع', 'عِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('خ', 'خِ̐ـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ح', 'حِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ج', 'جِـٰٚـِِـٰٚـِْ' ) Zh_Ar10 = Zh_Ar10:gsub('ش', 'شِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('س', 'سِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ي', 'يِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ب', 'بِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ل', 'لِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ا', 'آ' ) Zh_Ar10 = Zh_Ar10:gsub('ت', 'تِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ن', 'نِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('م', 'مِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ك', 'ڪِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ط', 'طِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ذ', 'ذِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ظ', 'ظِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('ء', 'ء' ) Zh_Ar10 = Zh_Ar10:gsub('ؤ', 'ؤ' ) Zh_Ar10 = Zh_Ar10:gsub('ر', 'ر' ) Zh_Ar10 = Zh_Ar10:gsub('ى', 'ى' ) Zh_Ar10 = Zh_Ar10:gsub('ز', 'ز' ) Zh_Ar10 = Zh_Ar10:gsub('ظ', 'ظِـٰٚـ' ) Zh_Ar10 = Zh_Ar10:gsub('و', 'ﯛ̲୭' ) Zh_Ar10 = Zh_Ar10:gsub("ه", "ۿۿہ")
local Zh_Ar9  = text:gsub('ض', 'ض' ) Zh_Ar9 = Zh_Ar9:gsub('ص', 'صہٰ' ) Zh_Ar9 = Zh_Ar9:gsub('ث', 'ثہٰـ' ) Zh_Ar9 = Zh_Ar9:gsub('ق', 'قہٰ' ) Zh_Ar9 = Zh_Ar9:gsub('ف', 'فہٰ' ) Zh_Ar9 = Zh_Ar9:gsub('غ', 'غـْ' ) Zh_Ar9 = Zh_Ar9:gsub('ع', 'ع' ) Zh_Ar9 = Zh_Ar9:gsub('ه', 'هٰہٰٖ' ) Zh_Ar9 = Zh_Ar9:gsub('خ', 'خخَـ' ) Zh_Ar9 = Zh_Ar9:gsub('ح', 'حہٰ' ) Zh_Ar9 = Zh_Ar9:gsub('ج', 'ججہٰ' ) Zh_Ar9 = Zh_Ar9:gsub('د', 'دَ' ) Zh_Ar9 = Zh_Ar9:gsub('ذ', 'ذّ' ) Zh_Ar9 = Zh_Ar9:gsub('ش', 'ششہٰ' ) Zh_Ar9 = Zh_Ar9:gsub('س', 'سہٰ' ) Zh_Ar9 = Zh_Ar9:gsub('ي', 'يٰ' ) Zh_Ar9 = Zh_Ar9:gsub('ب', 'بٰٰ' ) Zh_Ar9 = Zh_Ar9:gsub('ل', 'لہٰ' ) Zh_Ar9 = Zh_Ar9:gsub('ا', 'آ' ) Zh_Ar9 = Zh_Ar9:gsub('ت', 'تہٰ' ) Zh_Ar9 = Zh_Ar9:gsub('ن', 'نہٰ' ) Zh_Ar9 = Zh_Ar9:gsub('م', 'مہٰ' ) Zh_Ar9 = Zh_Ar9:gsub('ك', 'ككہٰ' ) Zh_Ar9 = Zh_Ar9:gsub('ط', 'طہٰ' ) Zh_Ar9 = Zh_Ar9:gsub('ئ', ' ْئٰ' ) Zh_Ar9 = Zh_Ar9:gsub('ء', 'ء' ) Zh_Ar9 = Zh_Ar9:gsub('ؤ', 'ؤؤَ' ) Zh_Ar9 = Zh_Ar9:gsub('ر', 'رَ' ) Zh_Ar9 = Zh_Ar9:gsub('لا', 'لہٰا' ) Zh_Ar9 = Zh_Ar9:gsub('ى', 'ىہٰ' ) Zh_Ar9 = Zh_Ar9:gsub('ة', 'ة' ) Zh_Ar9 = Zh_Ar9:gsub('و', 'ہٰو' ) Zh_Ar9 = Zh_Ar9:gsub('ز', 'ز' ) Zh_Ar9 = Zh_Ar9:gsub('ظ', 'ظہٰ')
local Zh_Ar8  = text:gsub('ض', 'ضہ' ) Zh_Ar8 = Zh_Ar8:gsub('ص', 'صہ' ) Zh_Ar8 = Zh_Ar8:gsub('ث', 'ثہ' ) Zh_Ar8 = Zh_Ar8:gsub('ق', 'قہ' ) Zh_Ar8 = Zh_Ar8:gsub('ف', 'فہ' ) Zh_Ar8 = Zh_Ar8:gsub('غ', 'غہ' ) Zh_Ar8 = Zh_Ar8:gsub('ع', 'عہ' ) Zh_Ar8 = Zh_Ar8:gsub('خ', 'خہ' ) Zh_Ar8 = Zh_Ar8:gsub('ح', 'حہ' ) Zh_Ar8 = Zh_Ar8:gsub('ج', 'جہ' ) Zh_Ar8 = Zh_Ar8:gsub('ش', 'شہ' ) Zh_Ar8 = Zh_Ar8:gsub('س', 'سہ' ) Zh_Ar8 = Zh_Ar8:gsub('ي', 'يہ' ) Zh_Ar8 = Zh_Ar8:gsub('ب', 'بہ' ) Zh_Ar8 = Zh_Ar8:gsub('ل', 'ل' ) Zh_Ar8 = Zh_Ar8:gsub('ا', 'آ' ) Zh_Ar8 = Zh_Ar8:gsub('ت', 'تہ' ) Zh_Ar8 = Zh_Ar8:gsub('ن', 'نہ' ) Zh_Ar8 = Zh_Ar8:gsub('م', 'مہ' ) Zh_Ar8 = Zh_Ar8:gsub('ك', 'كہ' ) Zh_Ar8 = Zh_Ar8:gsub('ط', 'طہ' ) Zh_Ar8 = Zh_Ar8:gsub('ظ', 'ظہ' ) Zh_Ar8 = Zh_Ar8:gsub('ء', 'ء' ) Zh_Ar8 = Zh_Ar8:gsub('ؤ', 'ؤ' ) Zh_Ar8 = Zh_Ar8:gsub('ر', 'ر' ) Zh_Ar8 = Zh_Ar8:gsub('ى', 'ى' ) Zh_Ar8 = Zh_Ar8:gsub('ز', 'ز' ) Zh_Ar8 = Zh_Ar8:gsub('و', 'ﯛ̲୭' ) Zh_Ar8 = Zh_Ar8:gsub("ه", "ۿۿہ")
local Zh_Ar7  = text:gsub('ض', 'ﺿ̭͠' ) Zh_Ar7 = Zh_Ar7:gsub('ص', 'ﺻ͡' ) Zh_Ar7 = Zh_Ar7:gsub('ث', 'ﺜ̲' ) Zh_Ar7 = Zh_Ar7:gsub('ق', 'ﭰ' ) Zh_Ar7 = Zh_Ar7:gsub('ف', 'ﻓ̲' ) Zh_Ar7 = Zh_Ar7:gsub('غ', 'ﻏ̲' ) Zh_Ar7 = Zh_Ar7:gsub('ع', 'ﻌ̲' ) Zh_Ar7 = Zh_Ar7:gsub('ه', 'ﮬ̲̌' ) Zh_Ar7 = Zh_Ar7:gsub('خ', 'خٌ' ) Zh_Ar7 = Zh_Ar7:gsub('ح', 'ﺣ̅' ) Zh_Ar7 = Zh_Ar7:gsub('ج', 'جُ' ) Zh_Ar7 = Zh_Ar7:gsub('د', 'ډ̝' ) Zh_Ar7 = Zh_Ar7:gsub('ذ', 'ذً' ) Zh_Ar7 = Zh_Ar7:gsub('ش', 'ﺷ̲' ) Zh_Ar7 = Zh_Ar7:gsub('س', 'ﺳ̉' ) Zh_Ar7 = Zh_Ar7:gsub('ي', 'ﯾ̃̐' ) Zh_Ar7 = Zh_Ar7:gsub('ب', 'ﺑ̲' ) Zh_Ar7 = Zh_Ar7:gsub('ل', 'ا̄ﻟ' ) Zh_Ar7 = Zh_Ar7:gsub('ا', 'ﺈ̃' ) Zh_Ar7 = Zh_Ar7:gsub('ت', 'ټُ' ) Zh_Ar7 = Zh_Ar7:gsub('ن', 'ﻧ̲' ) Zh_Ar7 = Zh_Ar7:gsub('م', 'ﻣ̲̉' ) Zh_Ar7 = Zh_Ar7:gsub('ك', 'گ' ) Zh_Ar7 = Zh_Ar7:gsub('ط', 'ﻁ̲' ) Zh_Ar7 = Zh_Ar7:gsub('ئ', ' ْٰئ' ) Zh_Ar7 = Zh_Ar7:gsub('ء', 'ء' ) Zh_Ar7 = Zh_Ar7:gsub('ؤ', 'ؤ' ) Zh_Ar7 = Zh_Ar7:gsub('ر', 'ہڕ' ) Zh_Ar7 = Zh_Ar7:gsub('لا', 'ﻟ̲ﺂ̲' ) Zh_Ar7 = Zh_Ar7:gsub('ى', 'ى' ) Zh_Ar7 = Zh_Ar7:gsub('ة', 'ة' ) Zh_Ar7 = Zh_Ar7:gsub('و', 'ۇۈۉ' ) Zh_Ar7 = Zh_Ar7:gsub('ز', 'زُ' ) Zh_Ar7 = Zh_Ar7:gsub('ظ', 'ﻇ̲')
local Zh_Ar6  = text:gsub('ض', 'ض͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ص', 'ص͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ث', 'ث͜ـ͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ق', 'ق͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ف', 'ف͒͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('غ', 'غ͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ع', 'ع͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('خ', 'خ̐͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ح', 'ح͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ج', 'ج͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ش', 'ش͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('س', 'س͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ي', 'ي͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ب', 'ب͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ل', 'ل͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ا', 'آ' ) Zh_Ar6 = Zh_Ar6:gsub('ت', 'ت͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ن', 'ن͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('م', 'م͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ك', 'ڪ͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ط', 'ط͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ظ', 'ظ͜ـ' ) Zh_Ar6 = Zh_Ar6:gsub('ء', 'ء' ) Zh_Ar6 = Zh_Ar6:gsub('ؤ', 'ؤ' ) Zh_Ar6 = Zh_Ar6:gsub('ر', 'ر' ) Zh_Ar6 = Zh_Ar6:gsub('ى', 'ى' ) Zh_Ar6 = Zh_Ar6:gsub('ز', 'ز' ) Zh_Ar6 = Zh_Ar6:gsub('ظ', 'ظـ' ) Zh_Ar6 = Zh_Ar6:gsub('و', 'ﯛ̲୭' ) Zh_Ar6 = Zh_Ar6:gsub("ه", "ۿۿہ")
local Zh_Ar5  = text:gsub('ض', 'ضۜہٰٰ' ) Zh_Ar5 = Zh_Ar5:gsub('ص', 'ضۜہٰٰ' ) Zh_Ar5 = Zh_Ar5:gsub('ث', 'ثہٰٰ' ) Zh_Ar5 = Zh_Ar5:gsub('ق', 'قྀ̲ہٰٰ' ) Zh_Ar5 = Zh_Ar5:gsub('ف', 'ف͒ہٰٰ' ) Zh_Ar5 = Zh_Ar5:gsub('غ', 'غہٰٰ' ) Zh_Ar5 = Zh_Ar5:gsub('ع', 'عہٰٰ' ) Zh_Ar5 = Zh_Ar5:gsub('ه', 'هٰہٰٖ' ) Zh_Ar5 = Zh_Ar5:gsub('خ', 'خٰ̐ہ ' ) Zh_Ar5 = Zh_Ar5:gsub('ح', 'حہٰٰ' ) Zh_Ar5 = Zh_Ar5:gsub('ج', 'جـٰ̲ـہْۧ' ) Zh_Ar5 = Zh_Ar5:gsub('د', 'دٰ' ) Zh_Ar5 = Zh_Ar5:gsub('ذ', 'ذِٰ' ) Zh_Ar5 = Zh_Ar5:gsub('ش', 'شِٰہٰٰ' ) Zh_Ar5 = Zh_Ar5:gsub('س', 'سٰٓ' ) Zh_Ar5 = Zh_Ar5:gsub('ي', 'يِٰہ' ) Zh_Ar5 = Zh_Ar5:gsub('ب', 'بّہ' ) Zh_Ar5 = Zh_Ar5:gsub('ل', 'لـٰ̲ـہ' ) Zh_Ar5 = Zh_Ar5:gsub('ا', 'آ' ) Zh_Ar5 = Zh_Ar5:gsub('ت', 'تَہَٰ' ) Zh_Ar5 = Zh_Ar5:gsub('ن', 'نَِہ' ) Zh_Ar5 = Zh_Ar5:gsub('م', 'مٰ̲ہ' ) Zh_Ar5 = Zh_Ar5:gsub('ك', 'ڪٰྀہٰٰ' ) Zh_Ar5 = Zh_Ar5:gsub('ط', 'طۨہٰٰ' ) Zh_Ar5 = Zh_Ar5:gsub('ئ', 'ئ ْٰ' ) Zh_Ar5 = Zh_Ar5:gsub('ء', 'ء' ) Zh_Ar5 = Zh_Ar5:gsub('ؤ', 'ؤ' ) Zh_Ar5 = Zh_Ar5:gsub('ر', 'رَ' ) Zh_Ar5 = Zh_Ar5:gsub('لا', 'لہا' ) Zh_Ar5 = Zh_Ar5:gsub('ى', 'ىْ' ) Zh_Ar5 = Zh_Ar5:gsub('ة', 'ة' ) Zh_Ar5 = Zh_Ar5:gsub('و', 'وِٰ' ) Zh_Ar5 = Zh_Ar5:gsub('ز', 'زَٰ' ) Zh_Ar5 = Zh_Ar5:gsub('ظ', 'ظۗہٰٰ')
local Zh_Ar4  = text:gsub('ض', 'ضـٰ̲ـہۜہٰٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ص', 'صـٰ̲ـہۛہٰٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ث', 'ثـٰ̲ـہہٰٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ق', 'قـٰ̲ـہྀ̲ہٰٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ف', 'فـٰ̲ـہ͒ہٰٰ' ) Zh_Ar4 = Zh_Ar4:gsub('غ', 'غـٰ̲ـہہٰٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ع', 'غـٰ̲ـہہٰٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ه', 'هٰہٰٖ' ) Zh_Ar4 = Zh_Ar4:gsub('خ', 'خـٰ̲ـہٰ̐ہ ' ) Zh_Ar4 = Zh_Ar4:gsub('ح', 'حـٰ̲ـہہٰٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ج', 'جـٰ̲ـہْۧ' ) Zh_Ar4 = Zh_Ar4:gsub('د', 'دٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ذ', 'ذِٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ش', 'شـٰ̲ـہِٰہٰٰ' ) Zh_Ar4 = Zh_Ar4:gsub('س', 'شـٰ̲ـہِٰہٰٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ي', 'شـٰ̲ـہِٰہٰٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ب', 'بـٰ̲ـہّہ' ) Zh_Ar4 = Zh_Ar4:gsub('ل', 'لـٰ̲ـہ' ) Zh_Ar4 = Zh_Ar4:gsub('ا', 'آ' ) Zh_Ar4 = Zh_Ar4:gsub('ت', 'تـٰ̲ـہَہَٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ن', 'نـٰ̲ـہَِہ' ) Zh_Ar4 = Zh_Ar4:gsub('م', 'مـٰ̲ـہٰ̲ہ' ) Zh_Ar4 = Zh_Ar4:gsub('ك', 'ڪٰྀہٰٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ط', 'طـٰ̲ـہۨہٰٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ئ', 'ئ ْٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ء', 'ء' ) Zh_Ar4 = Zh_Ar4:gsub('ؤ', 'ؤ' ) Zh_Ar4 = Zh_Ar4:gsub('ر', 'رَ' ) Zh_Ar4 = Zh_Ar4:gsub('لا', 'لہا' ) Zh_Ar4 = Zh_Ar4:gsub('ى', 'ىْ' ) Zh_Ar4 = Zh_Ar4:gsub('ة', 'ة' ) Zh_Ar4 = Zh_Ar4:gsub('و', 'وِٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ز', 'زَٰ' ) Zh_Ar4 = Zh_Ar4:gsub('ظ', 'ظۗہٰٰ')
local Zh_Ar3  = text:gsub('ض', 'ض' ) Zh_Ar3 = Zh_Ar3:gsub('ص', 'ص' ) Zh_Ar3 = Zh_Ar3:gsub('ث', 'ثہ' ) Zh_Ar3 = Zh_Ar3:gsub('ق', 'ق' ) Zh_Ar3 = Zh_Ar3:gsub('ف', 'فُہ' ) Zh_Ar3 = Zh_Ar3:gsub('غ', 'غہ' ) Zh_Ar3 = Zh_Ar3:gsub('ع', 'عہ' ) Zh_Ar3 = Zh_Ar3:gsub('ه', 'هٰہٰٖ' ) Zh_Ar3 = Zh_Ar3:gsub('خ', 'خہ' ) Zh_Ar3 = Zh_Ar3:gsub('ح', 'حہ' ) Zh_Ar3 = Zh_Ar3:gsub('ج', 'جہ' ) Zh_Ar3 = Zh_Ar3:gsub('د', 'د' ) Zh_Ar3 = Zh_Ar3:gsub('ذ', 'ذ' ) Zh_Ar3 = Zh_Ar3:gsub('ش', 'شہ' ) Zh_Ar3 = Zh_Ar3:gsub('س', 'سہ' ) Zh_Ar3 = Zh_Ar3:gsub('ي', 'يہ' ) Zh_Ar3 = Zh_Ar3:gsub('ب', 'بّ' ) Zh_Ar3 = Zh_Ar3:gsub('ل', 'لہ' ) Zh_Ar3 = Zh_Ar3:gsub('ا', 'ا' ) Zh_Ar3 = Zh_Ar3:gsub('ت', 'تہ' ) Zh_Ar3 = Zh_Ar3:gsub('ن', 'نٰہٰٖ' ) Zh_Ar3 = Zh_Ar3:gsub('م', 'مٰہٰٖ' ) Zh_Ar3 = Zh_Ar3:gsub('ك', 'كُہ' ) Zh_Ar3 = Zh_Ar3:gsub('ط', 'طہ' ) Zh_Ar3 = Zh_Ar3:gsub('ئ', 'ئ ْٰ' ) Zh_Ar3 = Zh_Ar3:gsub('ء', 'ء' ) Zh_Ar3 = Zh_Ar3:gsub('ؤ', 'ؤ' ) Zh_Ar3 = Zh_Ar3:gsub('ر', 'رَ' ) Zh_Ar3 = Zh_Ar3:gsub('لا', 'لہا' ) Zh_Ar3 = Zh_Ar3:gsub('ى', 'ىْ' ) Zh_Ar3 = Zh_Ar3:gsub('ة', 'ة' ) Zh_Ar3 = Zh_Ar3:gsub('و', 'و' ) Zh_Ar3 = Zh_Ar3:gsub('ز', 'ز' ) Zh_Ar3 = Zh_Ar3:gsub('ظ', 'ظۗہٰٰ')
local Zh_Ar2  = text:gsub('ض', 'ضَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ص', 'صَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ث', 'ثَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ق', 'قَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ف', 'فَٰ͒ـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('غ', 'غَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ع', 'عَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('خ', 'خَٰ̐ـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ح', 'حَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ج', 'جَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ش', 'شَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('س', 'سَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ي', 'يَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ب', 'بَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ل', 'لَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ا', 'آ' ) Zh_Ar2 = Zh_Ar2:gsub('ت', 'تَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ن', 'نَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('م', 'مَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ك', 'ڪَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ط', 'طَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ظ', 'ظَٰـُـٰٓ' ) Zh_Ar2 = Zh_Ar2:gsub('ء', 'ء' ) Zh_Ar2 = Zh_Ar2:gsub('ؤ', 'ؤ' ) Zh_Ar2 = Zh_Ar2:gsub('ر', 'ر' ) Zh_Ar2 = Zh_Ar2:gsub('ى', 'ى' ) Zh_Ar2 = Zh_Ar2:gsub('ز', 'ز' ) Zh_Ar2 = Zh_Ar2:gsub('و', 'ﯛ̲୭' ) Zh_Ar2 = Zh_Ar2:gsub("ه", "ۿۿہ")
local Zh_Ar1  = text:gsub('ض', 'ضِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ص', 'صِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ث', 'ثِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ق', 'قِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ف', 'فِٰ͒ـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('غ', 'غِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ع', 'عِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('خ', 'خِٰ̐ـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ح', 'حِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ج', 'جِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ش', 'شِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('س', 'سِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ي', 'يِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ب', 'بِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ل', 'لِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ا', 'آ' ) Zh_Ar1 = Zh_Ar1:gsub('ت', 'تِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ن', 'نِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('م', 'مِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ك', 'ڪِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ط', 'طِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ظ', 'ظِٰـِۢ' ) Zh_Ar1 = Zh_Ar1:gsub('ء', 'ء' ) Zh_Ar1 = Zh_Ar1:gsub('ؤ', 'ؤ' ) Zh_Ar1 = Zh_Ar1:gsub('ر', 'ر' ) Zh_Ar1 = Zh_Ar1:gsub('ى', 'ى' ) Zh_Ar1 = Zh_Ar1:gsub('ز', 'ز' ) Zh_Ar1 = Zh_Ar1:gsub('و', 'ﯛ̲୭' ) Zh_Ar1 = Zh_Ar1:gsub("ه", "ۿۿہ")
Text_Zhrfa = '1 -`'..Zh_Ar1..'`'..
'\n2 -`'..Zh_Ar2..'`'..
'\n3 -`'..Zh_Ar3..'`'..
'\n4 -`'..Zh_Ar4..'`'..
'\n5 -`'..Zh_Ar5..'`'..
'\n6 -`'..Zh_Ar6..'`'..
'\n7 -`'..Zh_Ar7..'`'..
'\n8 -`'..Zh_Ar8..'`'..
'\n9 -`'..Zh_Ar9..'`'..
'\n10 -`'..Zh_Ar10..'`'..
'\n11 -`'..Zh_Ar11..'`'..
'\n12 -`'..Zh_Ar12..'`'..
'\n13 -`'..Zh_Ar13..'`'
Text_Zhrfa = Text_Zhrfa.."\n⎋  اضغط ع الاسم ليتم النسخ \n✓"
return send(msg_chat_id,msg_id,Text_Zhrfa,"md",true)  
end
if Redis:get(Fast..":Zhrfinlin:en"..msg.sender_id.user_id) then
Redis:del(Fast..":Zhrfinlin:en"..msg.sender_id.user_id)
Redis:set(Fast..msg_chat_id..msg.sender_id.user_id.."zkrf:text", text)
if string.len(text) > 300 then
return send(msg_chat_id,msg_id,"⎋  لا يمكنك زخرفه اكثر من 20 حرف \n⎋  ارسل امر زخرفه وحاول مجددا بحروف اقل","md",true)  
elseif text:match("\n") then
return send(msg_chat_id,msg_id,"⎋  لا يمكن زخرفه نص يحتوي على اكثر من سطر .","md",true)  
end
text = text:gsub('A','a') text = text:gsub('S','s') text = text:gsub('D','d') text = text:gsub('F','f') text = text:gsub('G','g') text = text:gsub('H','h') text = text:gsub('J','j') text = text:gsub('K','k') text = text:gsub('L','l') text = text:gsub('Q','q') text = text:gsub('W','w') text = text:gsub('E','e' ) text = text:gsub('R','r' ) text = text:gsub('T','t' ) text = text:gsub('Y','y' ) text = text:gsub('U','u' ) text = text:gsub('I','i' ) text = text:gsub('O','o' ) text = text:gsub('P','p' ) text = text:gsub('Z','z' ) text = text:gsub('X','x' ) text = text:gsub('C','c' ) text = text:gsub('V','v' ) text = text:gsub('B','b' ) text = text:gsub('N','n' ) text = text:gsub('M','m')
local Q_bna1 = text:gsub('a','ᥲ️' ) Q_bna1 = Q_bna1:gsub('b','Ⴆ' ) Q_bna1 = Q_bna1:gsub('c','ᥴ' ) Q_bna1 = Q_bna1:gsub('d','ძ' ) Q_bna1 = Q_bna1:gsub('e','ᥱ' ) Q_bna1 = Q_bna1:gsub('f','f' ) Q_bna1 = Q_bna1:gsub('g','ᧁ' ) Q_bna1 = Q_bna1:gsub('h','Ꮒ' ) Q_bna1 = Q_bna1:gsub('i','Ꭵ' ) Q_bna1 = Q_bna1:gsub('j','᧒' ) Q_bna1 = Q_bna1:gsub('k','𝚔' ) Q_bna1 = Q_bna1:gsub('l','ᗩ' ) Q_bna1 = Q_bna1:gsub('m',' ꧑' ) Q_bna1 = Q_bna1:gsub('n','ꪀ' ) Q_bna1 = Q_bna1:gsub('o','ρ' ) Q_bna1 = Q_bna1:gsub('p','ρ' ) Q_bna1 = Q_bna1:gsub('q','ǫ' ) Q_bna1 = Q_bna1:gsub('r','ℛ' ) Q_bna1 = Q_bna1:gsub('s','᥉' ) Q_bna1 = Q_bna1:gsub('t','ƚ' ) Q_bna1 = Q_bna1:gsub('u','ᥙ' ) Q_bna1 = Q_bna1:gsub('v','᥎' ) Q_bna1 = Q_bna1:gsub('w','ꪝ' ) Q_bna1 = Q_bna1:gsub('x','᥊' ) Q_bna1 = Q_bna1:gsub('y','ꪗ' ) Q_bna1 = Q_bna1:gsub('z','ᤁ')
local Q_bna2 = text:gsub('a','ᴀ' ) Q_bna2 = Q_bna2:gsub('b','ʙ' ) Q_bna2 = Q_bna2:gsub('c','ᴄ' ) Q_bna2 = Q_bna2:gsub('d','ᴅ' ) Q_bna2 = Q_bna2:gsub('e','ᴇ' ) Q_bna2 = Q_bna2:gsub('f','ғ' ) Q_bna2 = Q_bna2:gsub('g','ɢ' ) Q_bna2 = Q_bna2:gsub('h','ʜ' ) Q_bna2 = Q_bna2:gsub('i','ɪ' ) Q_bna2 = Q_bna2:gsub('j','ᴊ' ) Q_bna2 = Q_bna2:gsub('k','ᴋ' ) Q_bna2 = Q_bna2:gsub('l','ʟ' ) Q_bna2 = Q_bna2:gsub('m','ᴍ' ) Q_bna2 = Q_bna2:gsub('n','ɴ' ) Q_bna2 = Q_bna2:gsub('o','ᴏ' ) Q_bna2 = Q_bna2:gsub('p','ᴘ' ) Q_bna2 = Q_bna2:gsub('q','ǫ' ) Q_bna2 = Q_bna2:gsub('r','ʀ' ) Q_bna2 = Q_bna2:gsub('s','s' ) Q_bna2 = Q_bna2:gsub('t','ᴛ' ) Q_bna2 = Q_bna2:gsub('u','ᴜ' ) Q_bna2 = Q_bna2:gsub('v','ᴠ' ) Q_bna2 = Q_bna2:gsub('w','ᴡ' ) Q_bna2 = Q_bna2:gsub('x','x' ) Q_bna2 = Q_bna2:gsub('y','ʏ' ) Q_bna2 = Q_bna2:gsub('z','ᴢ')
local Q_bna3 = text:gsub('a','Ａ' ) Q_bna3 = Q_bna3:gsub('b','Ｂ' ) Q_bna3 = Q_bna3:gsub('c','Ｃ' ) Q_bna3 = Q_bna3:gsub('d','Ｄ' ) Q_bna3 = Q_bna3:gsub('e','Ｅ' ) Q_bna3 = Q_bna3:gsub('f','Ｆ' ) Q_bna3 = Q_bna3:gsub('g','Ｇ' ) Q_bna3 = Q_bna3:gsub('h','Ｈ' ) Q_bna3 = Q_bna3:gsub('i','Ｉ' ) Q_bna3 = Q_bna3:gsub('j','Ｊ' ) Q_bna3 = Q_bna3:gsub('k','Ｋ' ) Q_bna3 = Q_bna3:gsub('l','Ｌ' ) Q_bna3 = Q_bna3:gsub('m','Ｍ' ) Q_bna3 = Q_bna3:gsub('n','Ｎ' ) Q_bna3 = Q_bna3:gsub('o','Ｏ' ) Q_bna3 = Q_bna3:gsub('p','Ｐ' ) Q_bna3 = Q_bna3:gsub('q','Ｑ' ) Q_bna3 = Q_bna3:gsub('r','Ｒ' ) Q_bna3 = Q_bna3:gsub('s','Ｓ' ) Q_bna3 = Q_bna3:gsub('t','Ｔ' ) Q_bna3 = Q_bna3:gsub('u','Ｕ' ) Q_bna3 = Q_bna3:gsub('v','Ｖ' ) Q_bna3 = Q_bna3:gsub('w','Ｗ' ) Q_bna3 = Q_bna3:gsub('x','Ｘ' ) Q_bna3 = Q_bna3:gsub('y','Ｙ' ) Q_bna3 = Q_bna3:gsub('z','Ｚ')
local Q_bna4 = text:gsub('a','𝗔' ) Q_bna4 = Q_bna4:gsub('b','𝗕' ) Q_bna4 = Q_bna4:gsub('c','𝗖' ) Q_bna4 = Q_bna4:gsub('d','𝗗' ) Q_bna4 = Q_bna4:gsub('e','𝗘' ) Q_bna4 = Q_bna4:gsub('f','f' ) Q_bna4 = Q_bna4:gsub('g','𝗚' ) Q_bna4 = Q_bna4:gsub('h','𝗛' ) Q_bna4 = Q_bna4:gsub('i','𝗜' ) Q_bna4 = Q_bna4:gsub('j','𝗝' ) Q_bna4 = Q_bna4:gsub('k','𝗞' ) Q_bna4 = Q_bna4:gsub('l','𝗟' ) Q_bna4 = Q_bna4:gsub('m','𝗠' ) Q_bna4 = Q_bna4:gsub('n','𝗡' ) Q_bna4 = Q_bna4:gsub('o','𝗢' ) Q_bna4 = Q_bna4:gsub('p','𝗣' ) Q_bna4 = Q_bna4:gsub('q','𝗤' ) Q_bna4 = Q_bna4:gsub('r','𝗥' ) Q_bna4 = Q_bna4:gsub('s','𝗦' ) Q_bna4 = Q_bna4:gsub('t','𝗧' ) Q_bna4 = Q_bna4:gsub('u','𝗨' ) Q_bna4 = Q_bna4:gsub('v','𝗩' ) Q_bna4 = Q_bna4:gsub('w','𝗪' ) Q_bna4 = Q_bna4:gsub('x','𝗫' ) Q_bna4 = Q_bna4:gsub('y','𝗬' ) Q_bna4 = Q_bna4:gsub('z','𝗭')
local Q_bna5 = text:gsub('a','𝐀' ) Q_bna5 = Q_bna5:gsub('b','𝐁' ) Q_bna5 = Q_bna5:gsub('c','𝐂' ) Q_bna5 = Q_bna5:gsub('d','𝐃' ) Q_bna5 = Q_bna5:gsub('e','𝐄' ) Q_bna5 = Q_bna5:gsub('f','𝐅' ) Q_bna5 = Q_bna5:gsub('g','𝐆' ) Q_bna5 = Q_bna5:gsub('h','𝐇' ) Q_bna5 = Q_bna5:gsub('i','𝐈' ) Q_bna5 = Q_bna5:gsub('j','𝐉' ) Q_bna5 = Q_bna5:gsub('k','𝐊' ) Q_bna5 = Q_bna5:gsub('l','𝑳' ) Q_bna5 = Q_bna5:gsub('m','𝐌' ) Q_bna5 = Q_bna5:gsub('n','𝐍' ) Q_bna5 = Q_bna5:gsub('o','𝐎' ) Q_bna5 = Q_bna5:gsub('p','𝐏' ) Q_bna5 = Q_bna5:gsub('q','𝐐' ) Q_bna5 = Q_bna5:gsub('r','𝐑' ) Q_bna5 = Q_bna5:gsub('s','𝐒' ) Q_bna5 = Q_bna5:gsub('t','𝐓' ) Q_bna5 = Q_bna5:gsub('u','𝐔' ) Q_bna5 = Q_bna5:gsub('v','𝐕' ) Q_bna5 = Q_bna5:gsub('w','𝐖' ) Q_bna5 = Q_bna5:gsub('x','𝐗' ) Q_bna5 = Q_bna5:gsub('y','𝐘' ) Q_bna5 = Q_bna5:gsub('z','𝐙')
local Q_bna6 = text:gsub('a','𝐚' ) Q_bna6 = Q_bna6:gsub('b','𝐛' ) Q_bna6 = Q_bna6:gsub('c','𝐜' ) Q_bna6 = Q_bna6:gsub('d','𝐝' ) Q_bna6 = Q_bna6:gsub('e','𝐞' ) Q_bna6 = Q_bna6:gsub('f','𝐅' ) Q_bna6 = Q_bna6:gsub('g','𝐠' ) Q_bna6 = Q_bna6:gsub('h','𝐡' ) Q_bna6 = Q_bna6:gsub('i','𝐢' ) Q_bna6 = Q_bna6:gsub('j','𝐣' ) Q_bna6 = Q_bna6:gsub('k','𝐤' ) Q_bna6 = Q_bna6:gsub('l','𝐥' ) Q_bna6 = Q_bna6:gsub('m','𝐦' ) Q_bna6 = Q_bna6:gsub('n','𝐧' ) Q_bna6 = Q_bna6:gsub('o','𝐨' ) Q_bna6 = Q_bna6:gsub('p','𝐩' ) Q_bna6 = Q_bna6:gsub('q','𝐪' ) Q_bna6 = Q_bna6:gsub('r','𝐫' ) Q_bna6 = Q_bna6:gsub('s','𝐬' ) Q_bna6 = Q_bna6:gsub('t','𝐭' ) Q_bna6 = Q_bna6:gsub('u','𝐮' ) Q_bna6 = Q_bna6:gsub('v','𝐯' ) Q_bna6 = Q_bna6:gsub('w','𝐰' ) Q_bna6 = Q_bna6:gsub('x','𝐱' ) Q_bna6 = Q_bna6:gsub('y','𝐲' ) Q_bna6 = Q_bna6:gsub('z','𝐳')
local Q_bna7 = text:gsub('a','𝑎' ) Q_bna7 = Q_bna7:gsub('b','𝑏' ) Q_bna7 = Q_bna7:gsub('c','𝑐' ) Q_bna7 = Q_bna7:gsub('d','𝑑' ) Q_bna7 = Q_bna7:gsub('e','𝑒' ) Q_bna7 = Q_bna7:gsub('f','𝒇' ) Q_bna7 = Q_bna7:gsub('g','𝑔' ) Q_bna7 = Q_bna7:gsub('h','ℎ' ) Q_bna7 = Q_bna7:gsub('i','𝑖' ) Q_bna7 = Q_bna7:gsub('j','𝑗' ) Q_bna7 = Q_bna7:gsub('k','𝑘' ) Q_bna7 = Q_bna7:gsub('l','𝑙' ) Q_bna7 = Q_bna7:gsub('m','𝑚' ) Q_bna7 = Q_bna7:gsub('n','𝑛' ) Q_bna7 = Q_bna7:gsub('o','𝑜' ) Q_bna7 = Q_bna7:gsub('p','𝑝' ) Q_bna7 = Q_bna7:gsub('q','𝑞' ) Q_bna7 = Q_bna7:gsub('r','𝑟' ) Q_bna7 = Q_bna7:gsub('s','𝑠' ) Q_bna7 = Q_bna7:gsub('t','𝑡' ) Q_bna7 = Q_bna7:gsub('u','𝑢' ) Q_bna7 = Q_bna7:gsub('v','𝑣' ) Q_bna7 = Q_bna7:gsub('w','𝑤' ) Q_bna7 = Q_bna7:gsub('x','𝑥' ) Q_bna7 = Q_bna7:gsub('y','𝑦' ) Q_bna7 = Q_bna7:gsub('z','𝑧')
local Q_bna8 = text:gsub('a','ᗩ' ) Q_bna8 = Q_bna8:gsub('b','β' ) Q_bna8 = Q_bna8:gsub('c','Ｃ' ) Q_bna8 = Q_bna8:gsub('d','Ɗ' ) Q_bna8 = Q_bna8:gsub('e','Ｅ' ) Q_bna8 = Q_bna8:gsub('f','Բ' ) Q_bna8 = Q_bna8:gsub('g','Ｇ' ) Q_bna8 = Q_bna8:gsub('h','ⴼ' ) Q_bna8 = Q_bna8:gsub('i','Ｉ' ) Q_bna8 = Q_bna8:gsub('j','Ј' ) Q_bna8 = Q_bna8:gsub('k','₭' ) Q_bna8 = Q_bna8:gsub('l','Ł' ) Q_bna8 = Q_bna8:gsub('m','ᗰ' ) Q_bna8 = Q_bna8:gsub('n','Ŋ' ) Q_bna8 = Q_bna8:gsub('o','σ' ) Q_bna8 = Q_bna8:gsub('p','Ꝑ' ) Q_bna8 = Q_bna8:gsub('q','℺' ) Q_bna8 = Q_bna8:gsub('r','Ꮢ' ) Q_bna8 = Q_bna8:gsub('s','₷' ) Q_bna8 = Q_bna8:gsub('t','Ƭ' ) Q_bna8 = Q_bna8:gsub('u','ᵿ' ) Q_bna8 = Q_bna8:gsub('v','ѵ' ) Q_bna8 = Q_bna8:gsub('w','Ꮤ' ) Q_bna8 = Q_bna8:gsub('x','χ' ) Q_bna8 = Q_bna8:gsub('y','ɣ' ) Q_bna8 = Q_bna8:gsub('z','Ꙃ')
local Q_bna9 = text:gsub('a','𝒂' ) Q_bna9 = Q_bna9:gsub('b','𝒃' ) Q_bna9 = Q_bna9:gsub('c','𝒄' ) Q_bna9 = Q_bna9:gsub('d','𝒅' ) Q_bna9 = Q_bna9:gsub('e','𝒆' ) Q_bna9 = Q_bna9:gsub('f','𝒇' ) Q_bna9 = Q_bna9:gsub('g','𝒈' ) Q_bna9 = Q_bna9:gsub('h','𝒉' ) Q_bna9 = Q_bna9:gsub('i','𝒊' ) Q_bna9 = Q_bna9:gsub('j','𝒋' ) Q_bna9 = Q_bna9:gsub('k','𝒌' ) Q_bna9 = Q_bna9:gsub('l','𝒍' ) Q_bna9 = Q_bna9:gsub('m','𝒎' ) Q_bna9 = Q_bna9:gsub('n','𝒏' ) Q_bna9 = Q_bna9:gsub('o','𝒐' ) Q_bna9 = Q_bna9:gsub('p','𝒑' ) Q_bna9 = Q_bna9:gsub('q','𝒒' ) Q_bna9 = Q_bna9:gsub('r','𝒓' ) Q_bna9 = Q_bna9:gsub('s','𝒔' ) Q_bna9 = Q_bna9:gsub('t','𝒕' ) Q_bna9 = Q_bna9:gsub('u','𝒖' ) Q_bna9 = Q_bna9:gsub('v','𝒗' ) Q_bna9 = Q_bna9:gsub('w','𝒘' ) Q_bna9 = Q_bna9:gsub('x','𝒙' ) Q_bna9 = Q_bna9:gsub('y','𝒚' ) Q_bna9 = Q_bna9:gsub('z','𝒛')
local Q_bna10 = text:gsub('a','𝔸' ) Q_bna10 = Q_bna10:gsub('b','𝔹' ) Q_bna10 = Q_bna10:gsub('c','ℂ' ) Q_bna10 = Q_bna10:gsub('d','𝔻' ) Q_bna10 = Q_bna10:gsub('e','𝔼' ) Q_bna10 = Q_bna10:gsub('f','𝔽' ) Q_bna10 = Q_bna10:gsub('g','𝔾' ) Q_bna10 = Q_bna10:gsub('h','ℍ' ) Q_bna10 = Q_bna10:gsub('i','𝕀' ) Q_bna10 = Q_bna10:gsub('j','𝕁' ) Q_bna10 = Q_bna10:gsub('k','𝕂' ) Q_bna10 = Q_bna10:gsub('l','𝕃' ) Q_bna10 = Q_bna10:gsub('m','𝕄' ) Q_bna10 = Q_bna10:gsub('n','ℕ' ) Q_bna10 = Q_bna10:gsub('o','𝕆' ) Q_bna10 = Q_bna10:gsub('p','ℙ' ) Q_bna10 = Q_bna10:gsub('q','ℚ' ) Q_bna10 = Q_bna10:gsub('r','ℝ' ) Q_bna10 = Q_bna10:gsub('s','𝕊' ) Q_bna10 = Q_bna10:gsub('t','𝕋' ) Q_bna10 = Q_bna10:gsub('u','𝕌' ) Q_bna10 = Q_bna10:gsub('v','𝕍' ) Q_bna10 = Q_bna10:gsub('w','𝕎' ) Q_bna10 = Q_bna10:gsub('x','𝕏' ) Q_bna10 = Q_bna10:gsub('y','𝕐' ) Q_bna10 = Q_bna10:gsub('z','ℤ')
local Q_bna11 = text:gsub('a','𝕬 ' ) Q_bna11 = Q_bna11:gsub('b','𝕭' ) Q_bna11 = Q_bna11:gsub('c','𝕮' ) Q_bna11 = Q_bna11:gsub('d','𝕯' ) Q_bna11 = Q_bna11:gsub('e','𝕰' ) Q_bna11 = Q_bna11:gsub('f','f' ) Q_bna11 = Q_bna11:gsub('g','𝕲' ) Q_bna11 = Q_bna11:gsub('h','𝕳' ) Q_bna11 = Q_bna11:gsub('i','𝕴' ) Q_bna11 = Q_bna11:gsub('j','𝕵' ) Q_bna11 = Q_bna11:gsub('k','𝕶' ) Q_bna11 = Q_bna11:gsub('l','𝕷' ) Q_bna11 = Q_bna11:gsub('m','𝕸' ) Q_bna11 = Q_bna11:gsub('n','𝕹' ) Q_bna11 = Q_bna11:gsub('o','𝕺' ) Q_bna11 = Q_bna11:gsub('p','𝕻' ) Q_bna11 = Q_bna11:gsub('q','𝕼' ) Q_bna11 = Q_bna11:gsub('r','𝕽' ) Q_bna11 = Q_bna11:gsub('s','𝕾' ) Q_bna11 = Q_bna11:gsub('t','𝕿' ) Q_bna11 = Q_bna11:gsub('u','𝖀' ) Q_bna11 = Q_bna11:gsub('v','𝖁' ) Q_bna11 = Q_bna11:gsub('w','𝖂' ) Q_bna11 = Q_bna11:gsub('x','𝖃' ) Q_bna11 = Q_bna11:gsub('y','𝖄' ) Q_bna11 = Q_bna11:gsub('z','𝖅')
local Q_bna12 = text:gsub('a','𝐴' ) Q_bna12 = Q_bna12:gsub('b','b' ) Q_bna12 = Q_bna12:gsub('c','𝐶' ) Q_bna12 = Q_bna12:gsub('d','𝐷' ) Q_bna12 = Q_bna12:gsub('e','𝐸' ) Q_bna12 = Q_bna12:gsub('f','𝐹' ) Q_bna12 = Q_bna12:gsub('g','𝐺' ) Q_bna12 = Q_bna12:gsub('h','𝐻' ) Q_bna12 = Q_bna12:gsub('i','𝐼' ) Q_bna12 = Q_bna12:gsub('j','𝐽' ) Q_bna12 = Q_bna12:gsub('k','𝐾' ) Q_bna12 = Q_bna12:gsub('l','𝐿' ) Q_bna12 = Q_bna12:gsub('m','𝑀' ) Q_bna12 = Q_bna12:gsub('n','𝑁' ) Q_bna12 = Q_bna12:gsub('o','𝑂' ) Q_bna12 = Q_bna12:gsub('p','𝑃' ) Q_bna12 = Q_bna12:gsub('q','𝑄' ) Q_bna12 = Q_bna12:gsub('r','𝑅' ) Q_bna12 = Q_bna12:gsub('s','𝑆' ) Q_bna12 = Q_bna12:gsub('t','𝑇' ) Q_bna12 = Q_bna12:gsub('u','𝐔' ) Q_bna12 = Q_bna12:gsub('v','𝑉' ) Q_bna12 = Q_bna12:gsub('w','𝑊' ) Q_bna12 = Q_bna12:gsub('x','𝑋' ) Q_bna12 = Q_bna12:gsub('y','𝑌' ) Q_bna12 = Q_bna12:gsub('z','𝑍')
local Q_bna13 = text:gsub('a','𝓪 ' ) Q_bna13 = Q_bna13:gsub('b','𝓫' ) Q_bna13 = Q_bna13:gsub('c','𝓬' ) Q_bna13 = Q_bna13:gsub('d','𝓭' ) Q_bna13 = Q_bna13:gsub('e','𝓮' ) Q_bna13 = Q_bna13:gsub('f','𝓯' ) Q_bna13 = Q_bna13:gsub('g','𝓰' ) Q_bna13 = Q_bna13:gsub('h','𝓱' ) Q_bna13 = Q_bna13:gsub('i','𝓲' ) Q_bna13 = Q_bna13:gsub('j','𝓳' ) Q_bna13 = Q_bna13:gsub('k','𝓴' ) Q_bna13 = Q_bna13:gsub('l','𝓵' ) Q_bna13 = Q_bna13:gsub('m','𝓶' ) Q_bna13 = Q_bna13:gsub('n','𝓷' ) Q_bna13 = Q_bna13:gsub('o','𝓸' ) Q_bna13 = Q_bna13:gsub('p','𝓹' ) Q_bna13 = Q_bna13:gsub('q','𝓺' ) Q_bna13 = Q_bna13:gsub('r','𝓻' ) Q_bna13 = Q_bna13:gsub('s','𝓼' ) Q_bna13 = Q_bna13:gsub('t','𝓽' ) Q_bna13 = Q_bna13:gsub('u','??' ) Q_bna13 = Q_bna13:gsub('v','𝓾' ) Q_bna13 = Q_bna13:gsub('w','𝔀' ) Q_bna13 = Q_bna13:gsub('x','𝔁' ) Q_bna13 = Q_bna13:gsub('y','𝔂' ) Q_bna13 = Q_bna13:gsub('z','𝔃')
local Q_bna14 = text:gsub('a','𝙰' ) Q_bna14 = Q_bna14:gsub('b','𝙱' ) Q_bna14 = Q_bna14:gsub('c','𝙲' ) Q_bna14 = Q_bna14:gsub('d','𝙳' ) Q_bna14 = Q_bna14:gsub('e','𝙴' ) Q_bna14 = Q_bna14:gsub('f','𝙵' ) Q_bna14 = Q_bna14:gsub('g','𝙶' ) Q_bna14 = Q_bna14:gsub('h','𝙷' ) Q_bna14 = Q_bna14:gsub('i','𝙸' ) Q_bna14 = Q_bna14:gsub('j','𝙹' ) Q_bna14 = Q_bna14:gsub('k','𝙺' ) Q_bna14 = Q_bna14:gsub('l','𝙻' ) Q_bna14 = Q_bna14:gsub('m','𝙼' ) Q_bna14 = Q_bna14:gsub('n','𝙽' ) Q_bna14 = Q_bna14:gsub('o','𝙾' ) Q_bna14 = Q_bna14:gsub('p','𝙿' ) Q_bna14 = Q_bna14:gsub('q','𝚀' ) Q_bna14 = Q_bna14:gsub('r','𝚁' ) Q_bna14 = Q_bna14:gsub('s','𝚂' ) Q_bna14 = Q_bna14:gsub('t','𝚃' ) Q_bna14 = Q_bna14:gsub('u','𝙺' ) Q_bna14 = Q_bna14:gsub('v','𝚅' ) Q_bna14 = Q_bna14:gsub('w','𝚆' ) Q_bna14 = Q_bna14:gsub('x','𝚇' ) Q_bna14 = Q_bna14:gsub('y','𝚈' ) Q_bna14 = Q_bna14:gsub('z','𝚉')
local Q_bna15 = text:gsub('a','𝖆' ) Q_bna15 = Q_bna15:gsub('b','𝖇' ) Q_bna15 = Q_bna15:gsub('c','𝖈' ) Q_bna15 = Q_bna15:gsub('d','𝖉' ) Q_bna15 = Q_bna15:gsub('e','𝖊' ) Q_bna15 = Q_bna15:gsub('f','𝖋' ) Q_bna15 = Q_bna15:gsub('g','𝖌' ) Q_bna15 = Q_bna15:gsub('h','𝖍' ) Q_bna15 = Q_bna15:gsub('i','𝖎' ) Q_bna15 = Q_bna15:gsub('j','𝖏' ) Q_bna15 = Q_bna15:gsub('k','𝖐' ) Q_bna15 = Q_bna15:gsub('l','𝖑' ) Q_bna15 = Q_bna15:gsub('m','𝖒' ) Q_bna15 = Q_bna15:gsub('n','𝖓' ) Q_bna15 = Q_bna15:gsub('o','𝖔' ) Q_bna15 = Q_bna15:gsub('p','𝖕' ) Q_bna15 = Q_bna15:gsub('q','𝖖' ) Q_bna15 = Q_bna15:gsub('r','𝖗' ) Q_bna15 = Q_bna15:gsub('s','𝖘' ) Q_bna15 = Q_bna15:gsub('t','𝖙' ) Q_bna15 = Q_bna15:gsub('u','𝖚' ) Q_bna15 = Q_bna15:gsub('v','𝖛' ) Q_bna15 = Q_bna15:gsub('w','𝖜' ) Q_bna15 = Q_bna15:gsub('x','𝖝' ) Q_bna15 = Q_bna15:gsub('y','𝖞' ) Q_bna15 = Q_bna15:gsub('z','𝖟')
local Q_bna16 = text:gsub('a','🅰' ) Q_bna16 = Q_bna16:gsub('b','🅱' ) Q_bna16 = Q_bna16:gsub('c','🅲' ) Q_bna16 = Q_bna16:gsub('d','🅳' ) Q_bna16 = Q_bna16:gsub('e','🅴' ) Q_bna16 = Q_bna16:gsub('f','🅵' ) Q_bna16 = Q_bna16:gsub('g','🅶' ) Q_bna16 = Q_bna16:gsub('h','🅷' ) Q_bna16 = Q_bna16:gsub('i','🅸' ) Q_bna16 = Q_bna16:gsub('j','🅹' ) Q_bna16 = Q_bna16:gsub('k','🅺' ) Q_bna16 = Q_bna16:gsub('l','🅻' ) Q_bna16 = Q_bna16:gsub('m','🅼' ) Q_bna16 = Q_bna16:gsub('n','🅽' ) Q_bna16 = Q_bna16:gsub('o','🅾' ) Q_bna16 = Q_bna16:gsub('p','🅿' ) Q_bna16 = Q_bna16:gsub('q','🆀' ) Q_bna16 = Q_bna16:gsub('r','🆁' ) Q_bna16 = Q_bna16:gsub('s','🆂' ) Q_bna16 = Q_bna16:gsub('t','🆃' ) Q_bna16 = Q_bna16:gsub('u','🆄' ) Q_bna16 = Q_bna16:gsub('v','🆅' ) Q_bna16 = Q_bna16:gsub('w','🆆' ) Q_bna16 = Q_bna16:gsub('x','🆇' ) Q_bna16 = Q_bna16:gsub('y','🆈' ) Q_bna16 = Q_bna16:gsub('z','🆉')                
local Q_bna17 = text:gsub('a','🄰' ) Q_bna17 = Q_bna17:gsub('b','🄱' ) Q_bna17 = Q_bna17:gsub('c','🄲' ) Q_bna17 = Q_bna17:gsub('d','🄳' ) Q_bna17 = Q_bna17:gsub('e','🄴' ) Q_bna17 = Q_bna17:gsub('f','🄵' ) Q_bna17 = Q_bna17:gsub('g','🄶' ) Q_bna17 = Q_bna17:gsub('h','🄷' ) Q_bna17 = Q_bna17:gsub('i','🄸' ) Q_bna17 = Q_bna17:gsub('j','🄹' ) Q_bna17 = Q_bna17:gsub('k','🄺' ) Q_bna17 = Q_bna17:gsub('l','🄻' ) Q_bna17 = Q_bna17:gsub('m','🄼' ) Q_bna17 = Q_bna17:gsub('n','🄽' ) Q_bna17 = Q_bna17:gsub('o','🄾' ) Q_bna17 = Q_bna17:gsub('p','🄿' ) Q_bna17 = Q_bna17:gsub('q','🅀' ) Q_bna17 = Q_bna17:gsub('r','🅁' ) Q_bna17 = Q_bna17:gsub('s','🅂' ) Q_bna17 = Q_bna17:gsub('t','🅃' ) Q_bna17 = Q_bna17:gsub('u','🅄' ) Q_bna17 = Q_bna17:gsub('v','🅅' ) Q_bna17 = Q_bna17:gsub('w','🅆' ) Q_bna17 = Q_bna17:gsub('x','🅇' ) Q_bna17 = Q_bna17:gsub('y','🅈' ) Q_bna17 = Q_bna17:gsub('z','🅉')
local Q_bna18 = text:gsub('a','🅐' ) Q_bna18= Q_bna18:gsub('b','🅑' ) Q_bna18= Q_bna18:gsub('c','🅒' ) Q_bna18= Q_bna18:gsub('d','🅓') Q_bna18 = Q_bna18:gsub('e','🅔' ) Q_bna18= Q_bna18:gsub('f','🅕' ) Q_bna18= Q_bna18:gsub('g','🅖' ) Q_bna18= Q_bna18:gsub('h','🅗' ) Q_bna18= Q_bna18:gsub('i','🅘' ) Q_bna18= Q_bna18:gsub('j','🅙' ) Q_bna18= Q_bna18:gsub('k','🅚' ) Q_bna18= Q_bna18:gsub('l','🅛' ) Q_bna18= Q_bna18:gsub('m','🅜' ) Q_bna18= Q_bna18:gsub('n','🅝' ) Q_bna18= Q_bna18:gsub('o','🅞' ) Q_bna18= Q_bna18:gsub('p','🅟' ) Q_bna18= Q_bna18:gsub('q','🅠' ) Q_bna18= Q_bna18:gsub('r','🅡' ) Q_bna18= Q_bna18:gsub('s','🅢' ) Q_bna18= Q_bna18:gsub('t','🅣' ) Q_bna18= Q_bna18:gsub('u','🅤' ) Q_bna18= Q_bna18:gsub('v','🅥' ) Q_bna18= Q_bna18:gsub('w','🅦' ) Q_bna18= Q_bna18:gsub('x','🅧' ) Q_bna18= Q_bna18:gsub('y','🅨' ) Q_bna18= Q_bna18:gsub('z','🅩')
Text_Zhrfa ="\n⎋  اضغط ع الازر ليتم ارسال الزخرفه \n✓"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = Q_bna1, data = msg.sender_id.user_id..'/NQ_bna1'},
},
{
{text = Q_bna2, data = msg.sender_id.user_id..'/N2'},
},
{
{text = Q_bna3, data = msg.sender_id.user_id..'/N3'},
},
{
{text = Q_bna4, data = msg.sender_id.user_id..'/N4'},
},
{
{text = Q_bna5, data = msg.sender_id.user_id..'/N5'},
},
{
{text = Q_bna6, data = msg.sender_id.user_id..'/N6'},
},
{
{text = Q_bna7, data = msg.sender_id.user_id..'/N7'},
},
{
{text = Q_bna8, data = msg.sender_id.user_id..'/N8'},
},
{
{text = Q_bna9, data = msg.sender_id.user_id..'/N9'},
},
{
{text = Q_bna10, data = msg.sender_id.user_id..'/N10'},
},
{
{text = Q_bna11, data = msg.sender_id.user_id..'/N11'},
},
{
{text = Q_bna12, data = msg.sender_id.user_id..'/N12'},
},
{
{text = Q_bna13, data = msg.sender_id.user_id..'/N13'},
},
{
{text = Q_bna14, data = msg.sender_id.user_id..'/N14'},
},
{
{text = Q_bna15, data = msg.sender_id.user_id..'/N15'},
},
{
{text = Q_bna16, data = msg.sender_id.user_id..'/N16'},
},
{
{text = Q_bna17, data = msg.sender_id.user_id..'/N17'},
},
{
{text = Q_bna18, data = msg.sender_id.user_id..'/N18'},
},
}
}
return send(msg_chat_id, msg_id,Text_Zhrfa, 'md', false, false, false, false, reply_markup)
end

if text and text:match('^كتم عام @(%S+)$') then
local UserName = text:match('^كتم عام @(%S+)$')
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if Controllerbanall(msg_chat_id,UserId_Info.id) == true then 
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,UserId_Info.id).." } *","md",true)  
end
if Redis:sismember(Fast.."KtmAll:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ⎋تم كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."KtmAll:Groups",UserId_Info.id) 
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ⎋تم كتمه عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم عام @(%S+)$') then
local UserName = text:match('^الغاء كتم عام @(%S+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if not Redis:sismember(Fast.."KtmAll:Groups",UserId_Info.id) then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ⎋تم الغاء كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."KtmAll:Groups",UserId_Info.id) 
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id," ⎋تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end

if text == ('كتم عام') and msg.reply_to_message_id ~= 0 then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end

local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if Controllerbanall(msg_chat_id,rep_idd) == true then 
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,rep_idd).." } *","md",true)  
end
if Redis:sismember(Fast.."KtmAll:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ⎋تم كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."KtmAll:Groups",rep_idd) 
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ⎋تم كتمه عام من المجموعات ").Reply,"md",true)  
end
end
if text == ('الغاء كتم عام') and msg.reply_to_message_id ~= 0 then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end

local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not Redis:sismember(Fast.."KtmAll:Groups",rep_idd) then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ⎋تم الغاء كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."KtmAll:Groups",rep_idd) 
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(rep_idd," ⎋تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end
if text and text:match('^كتم عام (%d+)$') then
local UserId = text:match('^كتم عام (%d+)$')
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end

local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if Controllerbanall(msg_chat_id,idd) == true then 
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ لا تستطيع استخدام الامر على { "..Controller(msg_chat_id,idd).." } *","md",true)  
end
if Redis:sismember(Fast.."KtmAll:Groups",UserId) then
return send(msg_chat_id,msg_id,Reply_Status(UserId," ⎋تم كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:sadd(Fast.."KtmAll:Groups",UserId) 
return send(msg_chat_id,msg_id,Reply_Status(UserId," ⎋تم كتمه عام من المجموعات ").Reply,"md",true)  
end
end
if text and text:match('^الغاء كتم عام (%d+)$') then
local UserId = text:match('^الغاء كتم عام (%d+)$')
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end

local UserInfo = bot.getUser(UserId)
if UserInfo.Fastbots == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end
if not Redis:sismember(Fast.."KtmAll:Groups",UserId) then
return send(msg_chat_id,msg_id,Reply_Status(UserId," ⎋تم الغاء كتمه عام من المجموعات مسبقا ").Reply,"md",true)  
else
Redis:srem(Fast.."KtmAll:Groups",UserId) 
bot.setChatMemberStatus(msg.chat_id,UserId,'restricted',{1,1,1,1,1,1,1,1,1})
return send(msg_chat_id,msg_id,Reply_Status(UserId," ⎋تم الغاء كتمه عام من المجموعات  ").Reply,"md",true)  
end
end

if text == 'مسح المكتومين عام' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end

local Info_Members = Redis:smembers(Fast.."KtmAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," ⎋لا يوجد مكتومين عام حاليا , ","md",true)  
end
Redis:del(Fast.."KtmAll:Groups") 
return send(msg_chat_id,msg_id,"* ⎋تم مسح {"..#Info_Members.."} من المكتومين عام *","md",true)
end

if text == 'المكتومين عام' or text == 'قائمه المكتومين عام' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end

local Info_Members = Redis:smembers(Fast.."KtmAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id," ⎋لا يوجد مكتومين عام حاليا , ","md",true)  
end
ListMembers = '\n*⎋ قائمه المكتومين عام  \n ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المكتومين عام', data = senderr..'/KtmAll'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end

if text == 'مطور السورس' then 
local UserId_Info = bot.searchPublicChat(devsource)
local name_shiko = bot.getUser(5566753847).first_name.." "..bot.getUser(5566753847).last_name
local name_king = bot.getUser(1400467850).first_name.." "..bot.getUser(1400467850).last_name
local caption = "اليك قائمه مطورين سورس افـاتـار :"
if tonumber(UserId_Info.id) ~= 1400467850 then
local UserInfo = bot.getUser(UserId_Info.id)
LocalDev = {{text = UserInfo.first_name, data = msg.sender_id.user_id..'/DevShow@'..UserId_Info.id}}
else
LocalDev = nil
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = name_shiko, data = msg.sender_id.user_id..'/DevShow@5566753847'},
},
{
{text = name_king, data = msg.sender_id.user_id..'/DevShow@1400467850'},
},
LocalDev
,
{
{text = 'قناه السورس', url='http://t.me/'..chsource},
},
}
}
return bot.sendPhoto(msg.chat_id, msg.id, 'http://t.me/'..chsource, caption,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
end


if text == 'مطور السورس' then  
local UserId_Info = bot.searchPublicChat(devsource)
if UserId_Info.id then
local UserInfo = bot.getUser(UserId_Info.id)
local InfoUser = bot.getUserFullInfo(UserId_Info.id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local photo = bot.getUserProfilePhotos(UserId_Info.id)
if photo.total_count > 0 then
local TestText = "- معلومات مطور السورس : \n\n- ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserId_Info.id..")\n\n ["..Bio.."]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناه السورس', url='http://t.me/'..chsource..''},
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local TestText = "- معلومات مطور السورس : \\nn- ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserId_Info.id..")\n\n ["..Bio.."]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناه السورس', url='http://t.me/'..chsource..''},
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
end
end
end

if text == 'المطور' or text == 'مطور البوت' then   
local  ban = bot.getUser(Sudo_Id) 
local  bain = bot.getUserFullInfo(Sudo_Id)
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local bains = bot.getUser(msg.sender_id.user_id)
if  bain.bio then
Bio =  bain.bio
else
Bio = 'لا يوجد'
end
if bains.first_name then
klajq = '*['..bains.first_name..'](tg://user?id='..bains.id..')*'
else
klajq = 'لا يوجد'
end
if bains.username then
basgk = ' '..bains.username..' '
else
basgk = 'لا يوجد'
end
if ban.username then
Creator = "* "..ban.first_name.."*\n"
else
Creator = "* ["..ban.first_name.."](tg://user?id="..ban.id..")*\n"
end
if ban.first_name then
Creat = " "..ban.first_name.." "
else
Creat = " Developers Bot \n"
end
local photo = bot.getUserProfilePhotos(Sudo_Id)
if photo.total_count > 0 then
local TestText = "  ❲ 𝒅𝒆𝒗𝒆𝒍𝒐𝒑𝒆𝒓𝒔 𝒃𝒐𝒕 ❳\n— — — — — — — — —\n ◉*𝚍𝚎𝚟 𝚗𝚊𝚖𝚎* :  [".. ban.first_name.."](tg://user?id="..Sudo_Id..")\n◉ *𝚍𝚎𝚟 𝚞𝚜𝚎𝚛* : [❲@"..ban.username.."❳]\n◉ *𝚍𝚎𝚟 𝚒𝚍* : [❲"..Sudo_Id.."❳]\n◉ *𝚋𝚒𝚘 ⚘* : [❲ "..Bio.." ❳]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = Creat, url = "https://t.me/"..ban.username..""},
},
}
local msg_id = msg.id/2097152/0.5 
 https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local TestText = "  ❲ 𝒅𝒆𝒗𝒆𝒍𝒐𝒑𝒆𝒓𝒔 𝒃𝒐𝒕 ❳\n— — — — — — — — —\n ◉*𝚍𝚎𝚟 𝚗𝚊𝚖𝚎* :  [".. ban.first_name.."](tg://user?id="..Sudo_Id..")\n◉ *𝚍𝚎𝚟 𝚞𝚜𝚎𝚛* : [❲@"..ban.username.."❳]\n◉ *𝚍𝚎𝚟 𝚒𝚍* : [❲"..Sudo_Id.."❳]\n◉ *𝚋𝚒𝚘 ⚘* : [❲ "..Bio.." ❳]"
local msg_id = msg.id/2097152/0.5 
 https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")
end
end
--[[
if Redis:get(Fast..'Set:array'..senderr..':'..msg_chat_id) == 'true1' then
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','') 
local test = Redis:get(Fast..'Text:array'..senderr..':'..msg_chat_id..'')
Redis:sadd(Fast.."Add:Rd:array:Text"..test,text)  
_key = {
{{text="اضغط هنا لانهاء الاضافه",callback_data="EndAddarray"..senderr}},
}
send_inlin_key(msg_chat_id,' * ⎋تم حفظ الرد يمكنك ارسال اخر او اكمال العمليه من خلال الزر اسفل *',_key,msg_id)
return false  
end
if text then
if Redis:get(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id) == 'dttd' then
Redis:del(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id)
gery = Redis:get(Fast.."Set:array:addpu"..senderr..":"..msg_chat_id)
if not Redis:sismember(Fast.."Add:Rd:array:Text"..gery,text) then
send(msg_chat_id, msg_id,' * ⎋لا يوجد رد متعدد * ',"md",true)
return false
end
Redis:srem(Fast.."Add:Rd:array:Text"..gery,text)
send(msg_chat_id, msg_id,' * ⎋تم حذفه بنجاح .* ',"md",true)
end
end
if text then
if Redis:get(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id) == 'delrd' then
Redis:del(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id)
if not Redis:sismember(Fast..'List:array',text) then
send(msg_chat_id, msg_id,' * ⎋لا يوجد رد متعدد * ',"md",true)
return false
end
Redis:set(Fast.."Set:array:addpu"..senderr..":"..msg_chat_id,text)
Redis:set(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id,"dttd")
send(msg_chat_id, msg_id,' * ⎋قم بارسال الرد الذي تريد حذفه منه* ',"md",true)
return false
end
end
if text == "حذف رد من متعدد" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"⎋ ارسل الكلمه التي تريد حذفها",inlin,msg_id)
Redis:set(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id,"delrd")
return false 
end
if text then
if Redis:get(Fast.."Set:array"..senderr..":"..msg_chat_id) == 'true' then
Redis:sadd(Fast..'List:array', text)
Redis:set(Fast..'Text:array'..senderr..':'..msg_chat_id, text)
send(msg_chat_id, msg_id,'ارسل الرد الذي تريد اضافته',"md",true)
Redis:del(Fast.."Set:array"..senderr..":"..msg_chat_id)
Redis:set(Fast..'Set:array'..senderr..':'..msg_chat_id,'true1')
Redis:del(Fast.."Add:Rd:array:Text"..text)   
return false
end
end

if text then
if Redis:get(Fast.."Set:array:rd"..senderr..":"..msg_chat_id) == 'delrd' then
Redis:del(Fast.."Set:array:rd"..senderr..":"..msg_chat_id)
Redis:del(Fast.."Add:Rd:array:Text"..text)
Redis:srem(Fast..'List:array', text)
send(msg_chat_id, msg_id,' * ⎋تم ازالة الرد المتعدد بنجاح* ',"md",true)
return false
end
end

if text == "حذف رد متعدد" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"⎋ ارسل الكلمه التي تريد حذفها",inlin,msg_id)
Redis:set(Fast.."Set:array:rd"..senderr..":"..msg_chat_id,"delrd")
return false 
end
if text then
if  Redis:sismember(Fast..'List:array',text) then
local list = Redis:smembers(Fast.."Add:Rd:array:Text"..text)
quschen = list[math.random(#list)]
send(msg_chat_id, msg_id,'['..quschen..']',"md",true)
end
end
if text == ("الردود المتعدده") then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
local list = Redis:smembers(Fast..'List:array')
text = "  ⎋قائمه الردود المتعدده \n⎋ ━━━━ Fast ━━━━━⎋ \n"
for k,v in pairs(list) do
text = text..""..k..">> ("..v..") » {رساله}\n"
end
if #list == 0 then
text = "  ⎋لا يوجد ردود متعدده"
end
send(msg_chat_id, msg_id,'['..text..']',"md",true)
end
if text == ("مسح الردود المتعدده") then   
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
local list = Redis:smembers(Fast..'List:array')
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:array:Text"..v..msg_chat_id)   
Redis:del(Fast..'List:array'..msg_chat_id)
end
send(msg_chat_id, msg_id," * ⎋تم مسح الردود المتعدده*","md",true)
end
if text == "اضف رد متعدد" then   
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"⎋ ارسل الكلمه التي تريد اضافتها",inlin,msg_id)
Redis:set(Fast.."Set:array"..senderr..":"..msg_chat_id,true)
return false
end
]]
--=> multi reply
if Redis:get(Fast..'Set:array'..senderr..':'..msg_chat_id) == 'true1' then
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local test = Redis:get(Fast..'Text:array'..senderr..':'..msg_chat_id..'')
if text then
text = text:gsub('"','') 
text = text:gsub("'",'') 
text = text:gsub('`','') 
text = text:gsub('*','')
Redis:set(Fast.."media:type:"..text, "text")
Redis:sadd(Fast.."Add:Rd:array:Text"..test,text)
end
if msg.content.sticker then
Redis:set(Fast.."media:type:"..msg.content.sticker.sticker.remote.id, "sticker")
Redis:sadd(Fast.."Add:Rd:array:Text"..test,msg.content.sticker.sticker.remote.id)
end   
if msg.content.voice_note then
Redis:set(Fast.."media:type:"..msg.content.voice_note.voice.remote.id, "voice_note")
Redis:sadd(Fast.."Add:Rd:array:Text"..test, msg.content.voice_note.voice.remote.id)
end
if msg.content.audio then
Redis:set(Fast.."media:type:"..msg.content.audio.audio.remote.id, "audio")
Redis:sadd(Fast.."Add:Rd:array:Text"..test, msg.content.audio.audio.remote.id)
end
if msg.content.document then
Redis:set(Fast.."media:type:"..msg.content.document.document.remote.id, "document")
Redis:sadd(Fast.."Add:Rd:array:Text"..test, msg.content.document.document.remote.id)
end
if msg.content.animation then
Redis:set(Fast.."media:type:"..msg.content.animation.animation.remote.id, "animation")
Redis:sadd(Fast.."Add:Rd:array:Text"..test, msg.content.animation.animation.remote.id)
end
if msg.content.video_note then
Redis:set(Fast.."media:type:"..msg.content.video_note.video.remote.id, "video_note")
Redis:sadd(Fast.."Add:Rd:array:Text"..test, msg.content.video_note.video.remote.id)
end
if msg.content.video then
Redis:set(Fast.."media:type:"..msg.content.video.video.remote.id, "video")
Redis:sadd(Fast.."Add:Rd:array:Text"..test, msg.content.video.video.remote.id)
end
if msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."media:type:"..idPhoto, "photo")
Redis:sadd(Fast.."Add:Rd:array:Text"..test, idPhoto)
end
_key = {
{{text="اضغط هنا لانهاء الاضافه",callback_data="EndAddarray"..senderr}},
}
send_inlin_key(msg_chat_id,' * ⌔تم حفظ الرد يمكنك ارسال اخر او اكمال العمليه من خلال الزر اسفل *',_key,msg_id)
return false  
end
end
if text then
if Redis:get(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id) == 'dttd' then
Redis:del(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id)
gery = Redis:get(Fast.."Set:array:addpu"..senderr..":"..msg_chat_id)
if not Redis:sismember(Fast.."Add:Rd:array:Text"..gery,text) then
send(msg_chat_id, msg_id,' * ⌔لا يوجد رد متعدد * ',"md",true)
return false
end
Redis:srem(Fast.."Add:Rd:array:Text"..gery,text)
send(msg_chat_id, msg_id,' * ⌔تم حذفه بنجاح .* ',"md",true)
end
end
if text then
if Redis:get(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id) == 'delrd' then
Redis:del(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id)
if not Redis:sismember(Fast..'List:array',text) then
send(msg_chat_id, msg_id,' * ⌔لا يوجد رد متعدد * ',"md",true)
return false
end
Redis:set(Fast.."Set:array:addpu"..senderr..":"..msg_chat_id,text)
Redis:set(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id,"dttd")
send(msg_chat_id, msg_id,' * ⌔قم بارسال الرد الذي تريد حذفه منه* ',"md",true)
return false
end
end
if text == "حذف رد من متعدد" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⌔ هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"⌔ ارسل الكلمه التي تريد حذفها",inlin,msg_id)
Redis:set(Fast.."Set:array:Ssd"..senderr..":"..msg_chat_id,"delrd")
return false 
end
if text then
if Redis:get(Fast.."Set:array"..senderr..":"..msg_chat_id) == 'true' then
Redis:sadd(Fast..'List:array', text)
Redis:set(Fast..'Text:array'..senderr..':'..msg_chat_id, text)
send(msg_chat_id, msg_id,'ارسل الرد الذي تريد اضافته',"md",true)
Redis:del(Fast.."Set:array"..senderr..":"..msg_chat_id)
Redis:set(Fast..'Set:array'..senderr..':'..msg_chat_id,'true1')
Redis:del(Fast.."Add:Rd:array:Text"..text)   
return false
end
end

if text then
if Redis:get(Fast.."Set:array:rd"..senderr..":"..msg_chat_id) == 'delrd' then
Redis:del(Fast.."Set:array:rd"..senderr..":"..msg_chat_id)
Redis:del(Fast.."Add:Rd:array:Text"..text)
Redis:srem(Fast..'List:array', text)
send(msg_chat_id, msg_id,' * ⌔تم ازالة الرد المتعدد بنجاح* ',"md",true)
return false
end
end

if text == "حذف رد متعدد" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⌔ هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"⌔ ارسل الكلمه التي تريد حذفها",inlin,msg_id)
Redis:set(Fast.."Set:array:rd"..senderr..":"..msg_chat_id,"delrd")
return false 
end
if text then
if Redis:sismember(Fast..'List:array',text) then
local list = Redis:smembers(Fast.."Add:Rd:array:Text"..text)
local rd = list[math.random(#list)]
if Redis:get(Fast.."media:type:"..rd) == "text" then
send(msg_chat_id, msg_id,'['..rd..']',"md",true)
elseif Redis:get(Fast.."media:type:"..rd) == "sticker" then
bot.sendSticker(msg_chat_id, msg.id, rd)
elseif Redis:get(Fast.."media:type:"..rd) == "voice_note" then
bot.sendVoiceNote(msg_chat_id, msg.id, rd, '', 'md')
elseif Redis:get(Fast.."media:type:"..rd) == "audio" then
bot.sendAudio(msg_chat_id, msg.id, rd, '', "md") 
elseif Redis:get(Fast.."media:type:"..rd) == "document" then
bot.sendDocument(msg_chat_id, msg.id, rd, '', 'md')
elseif Redis:get(Fast.."media:type:"..rd) == "animation" then
bot.sendAnimation(msg_chat_id,msg.id, rd, '', 'md')
elseif Redis:get(Fast.."media:type:"..rd) == "video_note" then
bot.sendVideoNote(msg_chat_id, msg.id, rd)
elseif Redis:get(Fast.."media:type:"..rd) == "video" then
bot.sendVideo(msg_chat_id, msg.id, rd, '', "md")
elseif Redis:get(Fast.."media:type:"..rd) == "photo" then
bot.sendPhoto(msg.chat_id, msg.id, rd,'')
end
end
end
if text == ("الردود المتعدده") then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⌔ هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
local list = Redis:smembers(Fast..'List:array')
text = "  ⌔قائمه الردود المتعدده \n⌔ ━━━━ s ━━━━━⌔ \n"
for k,v in pairs(list) do
text = text..""..k..">> ("..v..") » {رساله}\n"
end
if #list == 0 then
text = "  ⌔لا يوجد ردود متعدده"
end
send(msg_chat_id, msg_id,'['..text..']',"md",true)
end
if text == ("مسح الردود المتعدده") then   
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⌔ هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
local list = Redis:smembers(Fast..'List:array')
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:array:Text"..v)   
Redis:del(Fast..'List:array')
end
send(msg_chat_id, msg_id," * ⌔تم مسح الردود المتعدده*","md",true)
end
if text == "اضف رد متعدد" then   
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⌔ هذا الامر يخص { المطور الثانوي }* ',"md",true)  
end
inlin = {
{{text = '- اضغط هنا للالغاء.',callback_data=senderr..'/cancelrdd'}},
}
send_inlin_key(msg_chat_id,"⌔ ارسل الكلمه التي تريد اضافتها",inlin,msg_id)
Redis:set(Fast.."Set:array"..senderr..":"..msg_chat_id,true)
return false
end
-- add meza
if text == "المميزات" then 
if not The_ControllerAll(senderr) then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)
end
local list = Redis:smembers(Fast.."meza:names:")
if #list == 0 then
return send(msg.chat_id, msg.id,"لايوجد مميزات.", 'md')
end
local Text_Msg = "المميزات :\n\n"
for k,v in pairs(list) do
local link = Redis:get(Fast.."meza:link"..v)
local type = Redis:get(Fast.."meza:type"..v)
Text_Msg = Text_Msg..k.." - "..v.." :\n⛓ : "..link.." ( "..type.." ).\n\n" 
end
return send(msg.chat_id, msg.id,Text_Msg, 'md', true)
end

if text == "حذف المميزات" then 
if not The_ControllerAll(senderr) then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)
end
local list = Redis:smembers(Fast.."meza:names:")
if #list == 0 then
return send(msg.chat_id, msg.id,"لايوجد مميزات لحذفها", 'md')
end
for k,v in pairs(list) do
Redis:del(Fast.."meza:type"..v)
Redis:del(Fast.."meza:link"..v)
end
Redis:del(Fast.."meza:names:")
return send(msg.chat_id, msg.id,"تم مسح المميزات بنجاح.", 'md')
end

if text == "اضف ميزه" then 
if not The_ControllerAll(senderr) then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)
end
Redis:set(Fast.."add_meza:send:"..msg.chat_id..":"..msg.sender_id.user_id, true)
return send(msg.chat_id, msg.id,"ارسل اسم الميزه :", 'md')
end

if text == "حذف ميزه" then 
if not The_ControllerAll(senderr) then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)
end
Redis:set(Fast.."add_meza:rem:"..msg.chat_id..":"..msg.sender_id.user_id, true)
return send(msg.chat_id, msg.id,"ارسل اسم الميزه :", 'md')
end

if text and Redis:get(Fast.."add_meza:rem:"..msg.chat_id..":"..msg.sender_id.user_id) == "true" then
if Redis:get(Fast.."meza:type"..text) then
Redis:del(Fast.."meza:type"..text)
Redis:del(Fast.."meza:link"..text)
Redis:del(Fast.."add_meza:rem:"..msg.chat_id..":"..msg.sender_id.user_id)
Redis:srem(Fast.."meza:names:", text)
send(msg.chat_id, msg.id,"تم مسح الميزه", 'md')
else
Redis:del(Fast.."add_meza:rem:"..msg.chat_id..":"..msg.sender_id.user_id)
send(msg.chat_id, msg.id,"لايوجد ميزه بهذا الاسم.", 'md')
end
end

if text and Redis:get(Fast.."add_meza:send:"..msg.chat_id..":"..msg.sender_id.user_id) == "true" then
Redis:set(Fast.."add_meza:send:"..msg.chat_id..":"..msg.sender_id.user_id, "link")
Redis:set(Fast.."add_meza:name:"..msg.chat_id..":"..msg.sender_id.user_id, text)
return send(msg.chat_id, msg.id,"تم حفظ الاسم بنجاح \nارسل الرابط الان :", 'md')
end

if text and Redis:get(Fast.."add_meza:send:"..msg.chat_id..":"..msg.sender_id.user_id) == "link" then
if not text:match('https://t.me/(.*)') then
return send(msg.chat_id, msg.id,"الرابط خطأ \nارسل الرابط بالشكل ده كمثال : https://t.me/source_av ", 'md', true)
end
Redis:del(Fast.."add_meza:send:"..msg.chat_id..":"..msg.sender_id.user_id)
local meza_name = Redis:get(Fast.."add_meza:name:"..msg.chat_id..":"..msg.sender_id.user_id)
Redis:set(Fast.."meza:link"..meza_name, text)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'صور 📸', data = msg.sender_id.user_id..'/meza_photo'}
},
{
{text = 'فيديو 📹', data = msg.sender_id.user_id..'/meza_video'}
},
{
{text = 'صوت 🎧', data = msg.sender_id.user_id..'/meza_audio'}
},
{
{text = 'متحركه 🎴', data = msg.sender_id.user_id..'/meza_animation'}
},
{
{text = 'ملصق 🌁', data = msg.sender_id.user_id..'/meza_sticker'}
},
}
}
return send(msg.chat_id, msg.id,"تم الرابط بنجاح \nاختر نوع الميديا الان :", 'md',true, false, false, false, reply_markup)
end
---
if text and Redis:get(Fast.."meza:type"..text) then
local meza_link = Redis:get(Fast.."meza:link"..text)
local channel = meza_link:match('https://t.me/(.*)')
local post_num = last_id(channel)
local rand = math.random(2,post_num)
local link = meza_link.."/"..rand
local meza_type = Redis:get(Fast.."meza:type"..text)
if meza_type == "photo" then
bot.sendPhoto(msg.chat_id, msg.id, link, '',"md", true)
elseif meza_type == "video" then
bot.sendVideo(msg.chat_id, msg.id, link, '',"md")
elseif meza_type == "animation" then
bot.sendAnimation(msg.chat_id, msg.id, link, '',"md")
elseif meza_type == "audio" then
bot.sendAudio(msg.chat_id, msg.id, link, '',"md")
elseif meza_type == "sticker" then
bot.sendSticker(msg.chat_id, msg.id, link)
end
end
-- 7azer
if text == "حزر" then
if Redis:get(Fast..":7azer:"..msg_chat_id) then
local time = ctime(tonumber(Redis:ttl(Fast..":7azer:"..msg_chat_id)))
local Userid = tonumber(Redis:get(Fast..":7azer:"..msg_chat_id))
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'مسح اللعبه الجاريه ❌', data = Userid..'/del7azer'}, 
},
}
}
return send(msg_chat_id,msg_id,"⎋ هناك لعبه جاريه\n⎋ تنتهي في ( `"..time.."` ) 🕔","md",true,false,false,false,reply_markup)
end
Redis:setex(Fast..":7azer:"..msg_chat_id, 180, msg.sender_id.user_id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'انضم ➕', data = msg.sender_id.user_id..'/add7azer'}, 
},
{
{text = '🙋🏼 اضغط هنا لارسال السؤال', url = 't.me/'..UserBot..'?start=7azer'..msg_chat_id..'from_id'..msg.sender_id.user_id}, 
},
}
}
return send(msg_chat_id,msg_id,"⎋ اضغط انضمام للانضمام للعبه 👥","html",true,false,false,false,reply_markup) 
end

if text and text ~= "حزر" and Redis:get(Fast..":7azer:"..msg_chat_id) then
local ttl_time = tonumber(Redis:ttl(Fast..":7azer:"..msg_chat_id))
local time = ctime(ttl_time)
local Game_king = Redis:get(Fast..":7azer:"..msg_chat_id)
if Redis:sismember(Fast..":7azer:mem:"..msg_chat_id, msg.sender_id.user_id) then
local answer = Redis:get(Fast..":7azer:answer"..msg_chat_id)
if text == answer and tonumber(msg.sender_id.user_id) ~= tonumber(Game_king) then
Redis:del(Fast..":7azer:mem:"..msg_chat_id)
Redis:del(Fast..":7azer:"..msg_chat_id)
Redis:del(Fast..":7azer:chat_id"..Game_king)
Redis:del(Fast..":7azer:quiz"..msg_chat_id)
Redis:del(Fast..":7azer:answer"..msg_chat_id)
local time_answer = 180 - ttl_time
return send(msg.chat_id, msg.id,"⎋ اجابه صحيحه ✅\n⎋ استغرقت `"..time_answer.."` ثانيه للاجابه 🕔", 'md')
else
--send(msg.chat_id, msg.id,"⎋ اجابه خاطئه ❌\n⎋ باقي ( `"..time.."` ) 🕔", 'md')
end
end end
-- my rd
if text and Redis:get(Fast..":My_Rd:set:"..msg.sender_id.user_id..":"..msg.chat_id) then
if Redis:sismember(Fast..":My_Rd:text:"..msg.chat_id, text) then
return send(msg.chat_id, msg.id, "يوجد رد بهذا الاسم مسبقا", 'md')
end
Redis:sadd(Fast..":My_Rd:text:"..msg.chat_id, text)
Redis:set(Fast..":My_Rd:"..text..":"..msg.chat_id, msg.sender_id.user_id)
Redis:incrby(Fast..":My_Rd:num"..msg.sender_id.user_id..":"..msg.chat_id, 1)
Redis:del(Fast..":My_Rd:set:"..msg.sender_id.user_id..":"..msg.chat_id)
return send(msg.chat_id, msg.id, "تم اضافه رد اليك بنجاح", 'md')
end


if text == "حذف ردودي" and not Redis:get(Fast..":My_Rd:lock:"..msg.chat_id) then
local list = Redis:smembers(Fast..":My_Rd:text:"..msg.chat_id)
for k,v in pairs(list) do
if tonumber(Redis:get(Fast..":My_Rd:"..v)) == tonumber(msg.sender_id.user_id)then
Redis:del(Fast..":My_Rd:"..v..":"..msg.chat_id)
Redis:srem(Fast..":My_Rd:text:"..msg.chat_id, v)
Redis:decrby(Fast..":My_Rd:num"..msg.sender_id.user_id..":"..msg.chat_id, 1)
end
end
return send(msg.chat_id, msg.id, "مسحت الردود", 'md')
end

if text == "حذف قائمه الردود" and not Redis:get(Fast..":My_Rd:lock:"..msg.chat_id) then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not msg.Creator or not StatusMember == "chatMemberStatusCreator" then
return send(msg_chat_id,msg_id,'\n*⌯ هذا الامر يخص { مالك المجموعه او رتبه المنشئ }* ',"md",true)
end
local list = Redis:smembers(Fast..":My_Rd:text:"..msg.chat_id)
for k,v in pairs(list) do
Redis:del(Fast..":My_Rd:"..v)
Redis:srem(Fast..":My_Rd:text:"..msg.chat_id, v)
local id = Redis:get(Fast..":My_Rd:"..v..":"..msg.chat_id)
Redis:decrby(Fast..":My_Rd:num"..id..":"..msg.chat_id, 1)
end
return send(msg.chat_id, msg.id, "مسحت الردود", 'md')
end

if text == "حذف ردي" and not Redis:get(Fast..":My_Rd:lock:"..msg.chat_id) then
local Num = Redis:get(Fast..":My_Rd:num"..msg.sender_id.user_id..":"..msg.chat_id)
if not Num then 
return send(msg.chat_id, msg.id, "انت لا تمتلك ردود", 'md')
end
Redis:set(Fast..":My_Rd:del:"..msg.sender_id.user_id..":"..msg.chat_id, true)
send(msg.chat_id, msg.id, "ارسل اسم الرد الان :", 'md')
end

if text and  Redis:sismember(Fast..":My_Rd:text:"..msg.chat_id, text) and not Redis:get(Fast..":My_Rd:lock:"..msg.chat_id) then 
local ID = Redis:get(Fast..":My_Rd:"..text..":"..msg.chat_id)
local UserInfo = bot.getUser(ID)
local photo = bot.getUserProfilePhotos(ID)
local Bio = FlterBio(getbio(ID))
local msg_text = "NAME : "..UserInfo.first_name.."\nBIO : "..Bio
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = UserInfo.first_name , url = "t.me/"..(UserInfo.username or UserBot)},
},
}
}
if photo.total_count > 0 then
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,msg_text,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
else
return send(msg_chat_id,msg_id,msg_text,"md",true) 
end
end
------ Enable & Disable
if text == "تفعيل ردي" then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not msg.Creator or not StatusMember == "chatMemberStatusCreator" then
return send(msg_chat_id,msg_id,'\n*⌯ هذا الامر يخص { مالك المجموعه او رتبه المنشئ }* ',"md",true)
end
Redis:del(Fast..":My_Rd:lock:"..msg.chat_id)
send(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"↞ابشر فعلت امر ردي").Lock,"md",true)  
end
if text == "تعطيل ردي" then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not msg.Creator or not StatusMember == "chatMemberStatusCreator" then
return send(msg_chat_id,msg_id,'\n*⌯ هذا الامر يخص { مالك المجموعه او رتبه المنشئ }* ',"md",true)
end
Redis:set(Fast..":My_Rd:lock:"..msg.chat_id, true)
send(msg_chat_id,msg_id,Reply_Status(msg.sender_id.user_id,"↞ابشر عطلت امر ردي").Lock,"md",true)  
end
--
if text and text:match("^برج (.*)$") and not Redis:get(Fast.."brjj"..msg.chat_id) then
local Textbrj = text:match("^برج (.*)$")
gk = io.popen('curl -s "https://www.ava-tar.online/api/abrag/index.php?text='..URL.escape(Textbrj)..'"'):read('*a')
send(msg_chat_id,msg_id, gk, "md",true)
end

-- like id 
if text == "تفعيل لايك ايدي" then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not StatusMember == "chatMemberStatusCreator" or not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*⎋  هذا الامر يخص { مالك المجموعه }* ',"md",true)  
end
local emo =  Redis:get(Fast.."like:id:emo:"..msg.chat_id) or '🤍'
if not Redis:get(Fast.."like:id:"..msg.chat_id) then
return send(msg_chat_id,msg_id,'\n*⎋  اللايك ايدي مفعل مسبقا*',"md",true) 
end
Redis:del(Fast.."like:id:"..msg.chat_id)
return send(msg_chat_id,msg_id,'\n*⎋  تم تفعيل اللايك ايدي*\n⎋  و رمز اللايك ( '..emo..' )\n⎋  لتغيره ( ` تعيين لايك ايدي + الايموجي` )',"md",true) 
end

if text == "تعطيل لايك ايدي" then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not StatusMember == "chatMemberStatusCreator" or not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*⎋  هذا الامر يخص { مالك المجموعه }* ',"md",true)  
end
local emo =  Redis:get(Fast.."like:id:emo:"..msg.chat_id) or '🤍'
if Redis:get(Fast.."like:id:"..msg.chat_id) then
return send(msg_chat_id,msg_id,'\n*⎋  اللايك ايدي معطل مسبقا*',"md",true) 
end
Redis:set(Fast.."like:id:"..msg.chat_id, true)
return send(msg_chat_id,msg_id,'\n*⎋  تم تعطيل اللايك ايدي*',"md",true) 
end

if text and text:match('^تعيين لايك ايدي (.*)') then
local StatusMember = bot.getChatMember(msg.chat_id, msg.sender_id.user_id).status.Fastbots
if not StatusMember == "chatMemberStatusCreator" or not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*⎋  هذا الامر يخص { مالك المجموعه }* ',"md",true)  
end
local emo = text:match('^تعيين لايك ايدي (.*)')
Redis:set(Fast.."like:id:emo:"..msg.chat_id, emo)
return send(msg_chat_id,msg_id,'\n*⎋  تم وضع اللايك ايدي* ( '..emo..' )',"md",true) 
end

if text == "تصفير لايك ايدي" then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n⎋ هذا الامر يخص ⦃*'..Controller_Num(1)..'*⦄ بس',"md",true)  
end
local id_users = Redis:smembers(Fast.."like:user:")
if #id_users <= 0 then
return send(msg_chat_id,msg_id,'\n⎋  لا يوجد مستخدمين',"md",true) 
end
for k,v in pairs(id_users) do
Redis:del(Fast.."like:users:"..v)
end
Redis:del(Fast.."like:user:")
return send(msg_chat_id,msg_id,'\n⎋  تم حذف ⦃ `'..#id_users..'` ⦄ مستخدم',"md",true) 
end

if text == "توب لايك ايدي" then 
local id_users = Redis:smembers(Fast.."like:user:")
local list = {}
local msg_text = "⎋  اعلى 20 مستخدم حصلو على لايك :\n\n"
if #id_users <= 0 then
return send(msg_chat_id,msg_id,'\n⎋  لا يوجد مستخدمين',"md",true) 
end
for k,v in pairs(id_users) do
local likes = #Redis:smembers(Fast.."like:users:"..v)
if tonumber(likes) ~= 0 then
table.insert(list, {tonumber(likes) , v})
end
end
table.sort(list, function(a, b) return a[1] > b[1] end)
local emoji = { "🥇" ,"🥈","🥉","4)","5)","6)","7)","8)","9)","10)","11)","12)","13)","14)","15)","16)","17)","18)","20)"}
for k,v in pairs(list) do
if tonumber(k) <= 20 then
local user_name = bot.getUser(v[2]).first_name or "لا يوجد اسم"
msg_text = msg_text..emoji[tonumber(k)]..' '..user_name..' l '..v[1]..'\n'
end
end
return send(msg_chat_id,msg_id,msg_text,"html",true)  
end

-- name mean
if text == "ربنبنبظشق" then
if not Redis:get(Fast.."add:lock"..msg.chat_id) then
Redis:set(Fast.."add:send:"..msg.chat_id..":"..msg.sender_id.user_id, true)
return send(msg.chat_id, msg.id,"ارسل الرابط الان", 'md')
end
end

if text and Redis:get(Fast.."add:send:"..msg.chat_id..":"..msg.sender_id.user_id) then
local api = https.request("https://www.ava-tar.online/api/seen/add/index.php?link="..URL.escape(text))
local api_decode = JSON.decode(api)
Redis:del(Fast.."add:send:"..msg.chat_id..":"..msg.sender_id.user_id)
send(msg.chat_id, msg.id,api,"html",true)
end


if text and text:match("^برج (.*)$") and not Redis:get(Fast.."brjj"..msg.chat_id) then
local Textbrj = text:match("^برج (.*)$")
gk = io.popen('curl -s "https://www.ava-tar.online/api/abrag/index.php?text='..URL.escape(Textbrj)..'"'):read('*a')
send(msg_chat_id,msg_id, gk, "md",true)
end

if text and text:match("^معني (.*)$") then 
local TextMean = text:match("^معني (.*)$") or text:match("^معنى اسم (.*)$") 
if not Redis:get(Fast..'mynames'..msg.chat_id)  then
UrlMean = io.popen('curl -s "https://www.ava-tar.online/api/jack/na_me/index.php?name='..URL.escape(TextMean)..'"'):read('*a')
Mean = JSON.decode(UrlMean)
local meanname = Mean.name
local nameeng = Mean.english_name
send(msg_chat_id,msg_id,"⌯ الاسم : "..TextMean.."\n⌯ المعنى : "..meanname.."", "md",true)
end
end

if text and text:match("^افاتار (.*)$") then
local TextName = text:match("^افاتار (.*)$")
local gptchatt = request("https://www.hmss.store/api/chat.php/index.php?text="..URL.escape(TextName))
send(msg_chat_id,msg_id,gptchatt,"md",true)
end

if text and text:match("^رشق (.*)$") then
local TextName = text:match("^رشق (.*)$")
local addseen = https.request("https://ava-tar.online/api/seen/add/s/index.php?link="..URL.escape(text))
local addseen_decode = JSON.decode(addseen)
Redis:del(Fast.."add:send:"..msg.chat_id..":"..msg.sender_id.user_id)
send(msg.chat_id, msg.id,addseen,"html",true)
end

if text and text:match("^بوت (.*)$") then
local TextName = text:match("^بوت (.*)$")
local gptchatt = request("https://www.hmss.store/api/chat.php/index.php?text="..URL.escape(TextName))
send(msg_chat_id,msg_id,gptchatt,"md",true)
end

-- Age
if text == "احسب العمر" then
if not Redis:get(Fast.."Age:lock"..msg.chat_id) then
Redis:set(Fast.."Age:send:"..msg.chat_id..":"..msg.sender_id.user_id, true)
return send(msg.chat_id, msg.id,"ارسل عمرك بالصيغيه التاليه :\n20/2/2002 يعني ( يوم/شهر/سنه )", 'md')
end
end

if text and Redis:get(Fast.."Age:send:"..msg.chat_id..":"..msg.sender_id.user_id) then
if text and text:match('(%d+)/(%d+)/(%d+)') then
local input = {text:match('(%d+)/(%d+)/(%d+)')}
local day = input[1]
local month = input[2]
local year = input[3]
local api = https.request("https://anubis.fun/api/birth_day_pro.php?day="..day.."&month="..month.."&year="..year)
local api_decode = JSON.decode(api)
if not api_decode["العمر الميلادي"] then
return send(msg.chat_id, msg.id,"الصيغه غلط ارجوك ابعتها كدا 👇\n20/2/2002 يعني ( يوم/شهر/سنه )", 'md')
end
local birth_date = "⌯عمرك اليلادي : "..api_decode["العمر الميلادي"]
local birth_hijri = "⌯عمرك الهجري : "..api_decode["العمر الهيجري"]
local next_birth_day = "⌯عيد ميلادك القادم : ".. api_decode["عيد الميلاد القادم"]
local birth_months = "⌯عمرك بالشهور : " .. api_decode["العمر بالشهور"]
local birth_weeks = "⌯عمرك بالاسابيع : ".. api_decode["العمر بالاسابيع"]
local birth_days = "⌯عمرك بالايام : ".. api_decode["العمر بالايام"]
local birth_hours = "⌯عمرك بالساعات : ".. api_decode["العمر بالساعات"]
local birth_day_name = "⌯لقدت ولدت يوم ".. api_decode["يوم الميلاد"]
local in_Season = "فصل ".. api_decode["ولد في فصل"]
local brg = "مواليد برج ".. api_decode["برج"]
local breath = "اتنفست ".. api_decode["عدد الانفاس"].." نفس 🫁"
local heart_beat = "قلبك نبض ".. api_decode["عدد نبضات القلب"] .."نبضه 🫀"
local lol = "ضحكت ".. api_decode["كم مره ضحك"].."ضحكه 😂"
local sleep_time = "نمت ".. api_decode["مده النوم في العمر"].." ساعه 🕔" 
local eat_times = api_decode["مده الاكل في العمر"]
Redis:del(Fast.."Age:send:"..msg.chat_id..":"..msg.sender_id.user_id)
local Msg_text = birth_date.."\n"..birth_hijri.."\n"..birth_months.."\n"..birth_weeks.."\n"..birth_days.."\n"..birth_hours.."\n"..birth_day_name.." "..in_Season.." "..brg.."\n"..breath.."\n"..heart_beat.."\n"..lol.."\n"..sleep_time.."\n✬"
return send(msg.chat_id, msg.id,Msg_text, 'md')
else
return send(msg.chat_id, msg.id,"الصيغه غلط ارجوك ابعتها كدا 👇\n20/2/2002 يعني ( يوم/شهر/سنه )", 'md')
end
end
-- bank 


--=> By Anubis
--=> Sections
if text == "حذف قسم" then
  if not msg.Devss then
  return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص  '..Controller_Num(7)..' * ',"md",true)  
  end
  if ChannelJoin(msg) == false then
  local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/UX4SL'}, },}}
  return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
  end
  local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
   {
   {text = 'الغاء الامر', data = msg.sender_id.user_id..'/cancelrdd'},
  },
   }
  }
  Redis:set(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id,"true2")
  return send(msg_chat_id,msg_id,"⎋ ارسل الان الكلمه لحذفها من الاقسام","md",false, false, false, false, reply_markup)
  end 
  if text and text:match("^(.*)$") then
  if Redis:get(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id.."") == "true2" then
  Redis:del(Fast.."Add:Sections:Text:inline"..text)   
  Redis:del(Fast.."Sections:inline:text"..text)
  Redis:del(Fast.."Sections:inline:link"..text)
  Redis:del(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id.."")
  Redis:srem(Fast.."List:Sections:inline", text)
  send(msg_chat_id,msg_id,"⎋ تم حذف القسم من الاقسام بنجاح","md",true)  
  return false
  end
  end
  if text == ("مسح الاقسام") then
  if not msg.Devss then
  return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
  end
  if ChannelJoin(msg) == false then
  local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/UX4SL'}, },}}
  return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
  end
  local list = Redis:smembers(Fast.."List:Sections:inline")
  for k,v in pairs(list) do   
  Redis:del(Fast.."Add:Sections:Text:inline"..v)   
  Redis:del(Fast.."Sections:inline:v"..v)
  Redis:del(Fast.."Sections:inline:link"..v)
  end
  Redis:del(Fast.."List:Sections:inline")
  return send(msg_chat_id,msg_id,"⎋ تم مسح قائمه الاقسام","md",true)  
  end
  if text == "اضف قسم" then
  if not msg.Devss then
  return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص  '..Controller_Num(7)..' * ',"md",true)  
  end
  Redis:set(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id,true)
  local reply_markup = bot.replyMarkup{
      type = 'inline',
      data = {
      {
      {text = 'الغاء الامر', data = msg.sender_id.user_id..'/cancelrdd'},
      },
      }
      }
  return send(msg_chat_id,msg_id,"⎋ ارسل الان اسم القسم","md",false, false, false, false, reply_markup)
  end

  if text and text:match("^(.*)$") and tonumber(msg.sender_id.user_id) ~= tonumber(Fast) then
  if Redis:get(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id) == "true" then
  Redis:set(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id,"true1")
  Redis:set(Fast.."Text:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id, text)    
  Redis:del(Fast.."Add:Sections:Text:inline"..text)   
  Redis:del(Fast.."Sections:inline:text"..text)
  Redis:sadd(Fast.."List:Sections:inline", text)
  send(msg_chat_id,msg_id,[[
  ※︙ارسل الان كليشه القسم
  ※︙ارسل الان نص او ميديا وتحتها الكابشن
  ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗
  `#username` ↬ 😤 المستخدم
  `#name` ↬ اسم المستخدم
  `#id` ↬ ايدي المستخدم
  `#stast` ↬ رتبة المستخدم
  ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗
  ملحوظه لو حطيت كليشه ميديا لازم الازرار تحتوي علي ميديا مينفعش نص ولو دخلت نص فقط هيتم تعديل كابشن الميدي فقط
  ]],"md",true)  
  return false
  end
  end
if text or msg.content.audio or msg.content.document or msg.content.animation or msg.content.video or msg.content.photo then
if Redis:get(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id) == "true1" and tonumber(msg.sender_id.user_id) ~= tonumber(Fast) then
Redis:del(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:set(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id,"set_inline")
local anubis = Redis:get(Fast.."Text:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id)
if msg.content.text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","")
Redis:set(Fast.."Add:Sections:Text:inline"..anubis, text)
Redis:set(Fast.."Add:Sections:Text:Type"..anubis, "text")
elseif msg.content.audio then
Redis:set(Fast.."Add:Sections:Text:Type"..anubis, "audio")
Redis:set(Fast.."Add:Sections:Text:inline"..anubis, msg.content.audio.audio.remote.id)
Redis:set(Fast.."Add:Sections:Caption:inline"..anubis, msg.content.caption.text)
elseif msg.content.document then
Redis:set(Fast.."Add:Sections:Text:Type"..anubis, "document")
Redis:set(Fast.."Add:Sections:Text:inline"..anubis, msg.content.document.document.remote.id)
Redis:set(Fast.."Add:Sections:Caption:inline"..anubis, msg.content.caption.text)
elseif msg.content.animation then
Redis:set(Fast.."Add:Sections:Text:Type"..anubis, "animation")
Redis:set(Fast.."Add:Sections:Text:inline"..anubis, msg.content.animation.animation.remote.id)
Redis:set(Fast.."Add:Sections:Caption:inline"..anubis, msg.content.caption.text)
elseif msg.content.video then
Redis:set(Fast.."Add:Sections:Text:Type"..anubis, "video")
Redis:set(Fast.."Add:Sections:Text:inline"..anubis, msg.content.video.video.remote.id)
Redis:set(Fast.."Add:Sections:Caption:inline"..anubis, msg.content.caption.text)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Sections:Text:Type"..anubis, "photo")
Redis:set(Fast.."Add:Sections:Text:inline"..anubis, idPhoto)
Redis:set(Fast.."Add:Sections:Caption:inline"..anubis, msg.content.caption.text)
end
send(msg_chat_id,msg_id,"⎋ الان ارسل اسم الزر","md",true)
return false
end
end

if text and Redis:get(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id) == "set_inline" then
Redis:set(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id, "set_link")
Redis:del(Fast.."Sections:inline:help"..msg.sender_id.user_id..":"..msg_chat_id)
local anubis = Redis:get(Fast.."Text:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id)
Redis:sadd(Fast.."Sections:inline:text"..anubis, text)
Redis:set(Fast.."Sections:inline:help"..msg.sender_id.user_id..":"..msg_chat_id, text)
send(msg_chat_id,msg_id,"※︙ الان ارسل محتوي الزر \n※︙ارسل نص او ميديا او رابط فقط حيث يظر عند ضغط العضو عليه","md",true)  
return false  
end

if Redis:get(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id) == "set_link" then
local anubis = Redis:get(Fast.."Text:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id)
local anubis_rand = math.random(1,999999999999)
local anubiss = Redis:get(Fast.."Sections:inline:help"..msg.sender_id.user_id..":"..msg_chat_id)
local reply_markup = bot.replyMarkup{
        type = 'inline',
        data = {
        {
        {text = "انهاء" , data = msg.sender_id.user_id.."/cancelSection"},
        },
        }
        }
if msg.content.text and Redis:get(Fast.."Add:Sections:Text:Type"..anubis) == "text" then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","")
Redis:set(Fast.."/Anubis/"..anubis_rand, text)
Redis:set(Fast.."Button:Sections:Text:Type"..anubis_rand, "text")
elseif msg.content.audio and Redis:get(Fast.."Add:Sections:Text:Type"..anubis) ~= "text" then
Redis:set(Fast.."Button:Sections:Text:Type"..anubis_rand, "audio")
Redis:set(Fast.."/Anubis/"..anubis_rand, msg.content.audio.audio.remote.id)
Redis:set(Fast.."/Anubis/Caption"..anubis_rand, msg.content.caption.text)
elseif msg.content.document and Redis:get(Fast.."Add:Sections:Text:Type"..anubis) ~= "text" then
Redis:set(Fast.."Button:Sections:Text:Type"..anubis_rand, "document")
Redis:set(Fast.."/Anubis/"..anubis_rand, msg.content.document.document.remote.id)
Redis:set(Fast.."/Anubis/Caption"..anubis_rand, msg.content.caption.text)
elseif msg.content.animation and Redis:get(Fast.."Add:Sections:Text:Type"..anubis) ~= "text" then
Redis:set(Fast.."Button:Sections:Text:Type"..anubis_rand, "animation")
Redis:set(Fast.."/Anubis/"..anubis_rand, msg.content.animation.animation.remote.id)
Redis:set(Fast.."/Anubis/Caption"..anubis_rand, msg.content.caption.text)
elseif msg.content.video and Redis:get(Fast.."Add:Sections:Text:Type"..anubis) ~= "text" then
Redis:set(Fast.."Button:Sections:Text:Type"..anubis_rand, "video")
Redis:set(Fast.."/Anubis/"..anubis_rand, msg.content.video.video.remote.id)
Redis:set(Fast.."/Anubis/Caption"..anubis_rand, msg.content.caption.text)
elseif msg.content.photo and Redis:get(Fast.."Add:Sections:Text:Type"..anubis) ~= "text" then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Button:Sections:Text:Type"..anubis_rand, "photo")
Redis:set(Fast.."/Anubis/"..anubis_rand, idPhoto)
Redis:set(Fast.."/Anubis/Caption"..anubis_rand, msg.content.caption.text)
else
return send(msg_chat_id,msg_id,"⎋ احنا قولنا هتحط ميديا يبقا كلو ميديا هتحط نص يبقا كلو نص","md")  
end
Redis:set(Fast.."Set:Sections:inline"..msg.sender_id.user_id..":"..msg_chat_id, "set_inline")
Redis:set(Fast.."in_inline_button:"..anubiss, "/Anubis/"..anubis_rand)
send(msg_chat_id,msg_id,"⎋ تم اضافه الزر بنجاح\n⎋ الان ارسل الكلام داخل الزر التالي \n⎋ او انهاء لحفظ القسم","md",true, false, false, false, reply_markup)  
return false  
end
  
if text and Redis:get(Fast.."Add:Sections:Text:inline"..text) then
local button = Redis:smembers(Fast.."Sections:inline:text"..text)    
local inline_anubis = {data = {}}
for k,v in pairs(button) do
inline_anubis[k] = {{text = v , data = msg.sender_id.user_id..Redis:get(Fast.."in_inline_button:"..v).."&"..text}}
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = inline_anubis
}
if Redis:get(Fast.."Add:Sections:Text:Type"..text) == "text" then
local Texingt = Redis:get(Fast.."Add:Sections:Text:inline"..text)
local UserInfo = bot.getUser(msg.sender_id.user_id)
local Status_Gps = msg.Name_Controller
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',UserInfo.first_name)
local Texingt = Texingt:gsub('#id',msg.sender_id.user_id)
local Texingt = Texingt:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,'['..Texingt..']',"md",false, false, false, false, reply_markup)
elseif Redis:get(Fast.."Add:Sections:Text:Type"..text) == "audio" then
local media = Redis:get(Fast.."Add:Sections:Text:inline"..text)
local caption = Redis:get(Fast.."Add:Sections:Caption:inline"..text)
bot.sendAudio(msg_chat_id, msg.id, media,caption, "md", nil, nil, nil, nil, nil, nil, nil, nil,reply_markup)
elseif Redis:get(Fast.."Add:Sections:Text:Type"..text) == "document" then
local media = Redis:get(Fast.."Add:Sections:Text:inline"..text)
local caption = Redis:get(Fast.."Add:Sections:Caption:inline"..text)
bot.sendDocument(msg_chat_id, msg.id, media, caption, 'md',nil, nil, nil, nil,nil, reply_markup)
elseif Redis:get(Fast.."Add:Sections:Text:Type"..text) == "animation" then
local media = Redis:get(Fast.."Add:Sections:Text:inline"..text)
local caption = Redis:get(Fast.."Add:Sections:Caption:inline"..text)
bot.sendAnimation(msg_chat_id,msg.id, media, caption, 'md', nil, nil, nil, nil, nil, nil, nil, nil,reply_markup)
elseif Redis:get(Fast.."Add:Sections:Text:Type"..text) == "video" then
local media = Redis:get(Fast.."Add:Sections:Text:inline"..text)
local caption = Redis:get(Fast.."Add:Sections:Caption:inline"..text)
bot.sendVideo(msg_chat_id, msg.id, media, caption, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
elseif Redis:get(Fast.."Add:Sections:Text:Type"..text) == "photo" then
local media = Redis:get(Fast.."Add:Sections:Text:inline"..text)
local caption = Redis:get(Fast.."Add:Sections:Caption:inline"..text)
bot.sendPhoto(msg.chat_id, msg.id, media, caption,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
end
end
    
if text == ("الاقسام") then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/UX4SL'}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Sections:inline")
text = "⎋ قائمه الاقسام \n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗\n"
for k,v in pairs(list) do
text = text..""..k.." » "..v.."\n"
end
if #list == 0 then
text = "⎋ عذرا لا يوجد اقسام في الجروب"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)
end
--=> By Anubis
if text == 'السيرفر' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
send(msg_chat_id,msg_id, io.popen([[
linux_version=`lsb_release -ds`
memUsedPrc=`free -m | awk 'NR==2{printf "%sMB/%sMB {%.2f%}\n", $3,$2,$3*100/$2 }'`
HardDisk=`df -lh | awk '{if ($6 == "/") { print $3"/"$2" ~ {"$5"}" }}'`
CPUPer=`top -b -n1 | grep "Cpu(s)" | awk '{print $2 + $4}'`
uptime=`uptime | awk -F'( |,|:)+' '{if ($7=="min") m=$6; else {if ($7~/^day/) {d=$6;h=$8;m=$9} else {h=$6;m=$7}}} {print d+0,"days,",h+0,"hours,",m+0,"minutes."}'`
echo '⎋ ⎋⊱ { نظام التشغيل } ⊰⎋ \n*»» '"$linux_version"'*' 
echo '*------------------------------\n*⎋ ⎋⊱ { الذاكره العشوائيه } ⊰⎋ \n*»» '"$memUsedPrc"'*'
echo '*------------------------------\n*⎋ ⎋⊱ { وحـده الـتـخـزيـن } ⊰⎋ \n*»» '"$HardDisk"'*'
echo '*------------------------------\n*⎋ ⎋⊱ { الـمــعــالــج } ⊰⎋ \n*»» '"`grep -c processor /proc/cpuinfo`""Core ~ {$CPUPer%} "'*'
echo '*------------------------------\n*⎋ ⎋⊱ { الــدخــول } ⊰⎋ \n*»» '`whoami`'*'
echo '*------------------------------\n*⎋ ⎋⊱ { مـده تـشغيـل الـسـيـرفـر } ⊰⎋ \n*»» '"$uptime"'*'
]]):read('*all'),"md")
end

if text == 'صلاحياتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
return send(msg_chat_id,msg_id,"⎋ الصلاحيات : مالك الجروب","md",true) 
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف الجروب'
else
return send(msg_chat_id,msg_id,"⎋ الصلاحيات : عضو في الجروب" ,"md",true) 
end
if StatusMember == "chatMemberStatusAdministrator" then 
local GetMemberStatus = bot.getChatMember(msg_chat_id,senderr).status 
if GetMemberStatus.can_change_info then
change_info = '❬ ✔️ ❭' else change_info = '❬ ❌ ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ ✔️ ❭' else delete_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ ✔️ ❭' else invite_users = '❬ ❌ ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ ✔️ ❭' else pin_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ ✔️ ❭' else restrict_members = '❬ ❌ ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ ✔️ ❭' else promote = '❬ ❌ ❭'
end
local PermissionsUserr = '*\n⎋ صلاحيات المستخدم :\n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗'..'\n⎋ تغيير المعلومات : '..change_info..'\n⎋ تثبيت الرسائل : '..pin_messages..'\n⎋ اضافه مستخدمين : '..invite_users..'\n⎋ مسح الرسائل : '..delete_messages..'\n⎋ حظر المستخدمين : '..restrict_members..'\n⎋ اضافه المشرفين : '..promote..'\n\n*'
return send(msg_chat_id,msg_id,"⎋ الصلاحيات : مشرف الجروب"..(PermissionsUserr or '') ,"md",true) 
end
end
if text == 'صلاحياته' and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local StatusMember = bot.getChatMember(msg_chat_id,rep_idd).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
return send(msg_chat_id,msg_id,"⎋ الصلاحيات : مالك الجروب","md",true) 
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف الجروب'
else
return send(msg_chat_id,msg_id,"⎋ الصلاحيات : عضو في الجروب" ,"md",true) 
end
if StatusMember == "chatMemberStatusAdministrator" then 
local GetMemberStatus = bot.getChatMember(msg_chat_id,rep_idd).status
if GetMemberStatus.can_change_info then
change_info = '❬ ✔️ ❭' else change_info = '❬ ❌ ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ ✔️ ❭' else delete_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ ✔️ ❭' else invite_users = '❬ ❌ ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ ✔️ ❭' else pin_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ ✔️ ❭' else restrict_members = '❬ ❌ ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ ✔️ ❭' else promote = '❬ ❌ ❭'
end
local PermissionsUserr = '*\n⎋ صلاحيات المستخدم :\n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗'..'\n⎋ تغيير المعلومات : '..change_info..'\n⎋ تثبيت الرسائل : '..pin_messages..'\n⎋ اضافه مستخدمين : '..invite_users..'\n⎋ مسح الرسائل : '..delete_messages..'\n⎋ حظر المستخدمين : '..restrict_members..'\n⎋ اضافه المشرفين : '..promote..'\n\n*'
return send(msg_chat_id,msg_id,"⎋ الصلاحيات : مشرف الجروب"..(PermissionsUserr or '') ,"md",true) 
end
end


if text and text:match('^صلاحياته @(%S+)$') then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserName = text:match('^صلاحياته @(%S+)$') 
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local StatusMember = bot.getChatMember(msg_chat_id,UserId_Info.id).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
return send(msg_chat_id,msg_id,"⎋ الصلاحيات : مالك الجروب","md",true) 
elseif (StatusMember == "chatMemberStatusAdministrator") then
StatusMemberChat = 'مشرف الجروب'
else
return send(msg_chat_id,msg_id,"⎋ الصلاحيات : عضو في الجروب" ,"md",true) 
end
if StatusMember == "chatMemberStatusAdministrator" then 
local GetMemberStatus = bot.getChatMember(msg_chat_id,UserId_Info.id).status
if GetMemberStatus.can_change_info then
change_info = '❬ ✔️ ❭' else change_info = '❬ ❌ ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ ✔️ ❭' else delete_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ ✔️ ❭' else invite_users = '❬ ❌ ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ ✔️ ❭' else pin_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ ✔️ ❭' else restrict_members = '❬ ❌ ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ ✔️ ❭' else promote = '❬ ❌ ❭'
end
local PermissionsUserr = '*\n⎋ صلاحيات المستخدم :\n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗'..'\n⎋ تغيير المعلومات : '..change_info..'\n⎋ تثبيت الرسائل : '..pin_messages..'\n⎋ اضافه مستخدمين : '..invite_users..'\n⎋ مسح الرسائل : '..delete_messages..'\n⎋ حظر المستخدمين : '..restrict_members..'\n⎋ اضافه المشرفين : '..promote..'\n\n*'
return send(msg_chat_id,msg_id,"⎋ الصلاحيات : مشرف الجروب"..(PermissionsUserr or '') ,"md",true) 
end
end
if text and text:match('^التفاعل @(%S+)$') then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserName = text:match('^التفاعل @(%S+)$') 
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..UserId_Info.id) or 0
TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id,"⎋ التفاعل : "..TotalMsgT, "md")
end
if text == 'التفاعل' and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..rep_idd) or 0
TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id,"⎋ التفاعل : "..TotalMsgT, "md")
end


if text and text:match('^الرتبه @(%S+)$') then
local UserName = text:match('^الرتبه @(%S+)$') 
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local RinkBot = Redis:get(Fast..':SetRt'..msg.chat_id..':'..UserId_Info.id) or Controller(msg_chat_id,UserId_Info.id)
return send(msg_chat_id,msg_id,"⎋ الرتبه : "..RinkBot, "md")
end
if text == 'الرتبه' and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local RinkBot = Redis:get(Fast..':SetRt'..msg.chat_id..':'..rep_idd) or Controller(msg_chat_id,rep_idd)
return send(msg_chat_id,msg_id,"⎋ الرتبه : "..RinkBot, "md")
end

if text == "ايدي" and msg.reply_to_message_id == 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."Status:Id"..msg_chat_id) then
return false
end
if not Redis:get(Fast.."like:id:"..msg.chat_id) then
if not Redis:sismember(Fast.."like:user:", msg.sender_id.user_id) then
Redis:sadd(Fast.."like:user:", msg.sender_id.user_id)
end
local like_num = Redis:smembers(Fast.."like:users:"..msg.sender_id.user_id)
local emo =  Redis:get(Fast.."like:id:emo:"..msg.chat_id) or '🤍'
Id_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = #like_num.." "..emo , data = msg.sender_id.user_id.."/likeId/"..#like_num}, 
},
}
}
else
Id_markup = nil
end
local UserInfo = bot.getUser(senderr)
local InfoUser = bot.getUserFullInfo(senderr)
if InfoUser.bio then
Bio = FlterBio(InfoUser.bio)
else
Bio = 'لا يوجد'
end
local nameuser = FlterBio(FlterBio(UserInfo.first_name))
local photo = bot.getUserProfilePhotos(senderr)
local UserId = senderr
local RinkBot = Redis:get(Fast..':SetRt'..msg.chat_id..':'..msg.sender_id.user_id) or msg.Name_Controller
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalPhoto = photo.total_count or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local TotalMsgT = Total_message(TotalMsg) 
local NumberGames = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..senderr) or 0
local NumAdd = Redis:get(Fast.."Num:Add:Memp"..msg.chat_id..":"..senderr) or 0
local Texting = {
  "بحبك 🥺♥.!",
  "وشك دا ولا وش رجل 😂",
  "صوره قمر زي صاحبها 🥺♥.!",
  "رقمي 012345... 🙈♥.!",
  "وشك دا ولا القمر 🙈♥.!",
  "هم في الارض وانت بين النجوم 🤍🎀.!",
  "غير يعم القرف دا 🙂"
}
local Description = Texting[math.random(#Texting)]
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
Get_Is_Id = Redis:get(Fast.."Set:Id:Groups") or Redis:get(Fast.."Set:Id:Group"..msg_chat_id)
if Redis:get(Fast.."Status:IdPhoto"..msg_chat_id) then
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',senderr) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
local Get_Is_Id = Get_Is_Id:gsub('#Bio',Bio) 
if photo.total_count > 0 then
if not msg.Special and Redis:get(Fast..'idnotmem'..msg.chat_id)  then
return send(msg_chat_id,msg_id,
'\n⎋ايديك : '..UserId..
'\n⎋معرفك : '..UserInfousername..
'\n⎋رتبتك : '..RinkBot..
'\n⎋رسائلك : '..TotalMsg..
'\n⎋تعديلاتك : '..TotalEdit..
'\n⎋تفاعلك : '..TotalMsgT..
'\n⎋البايو : '..Bio..
'',"md",true, false, false, false, Id_markup)
end
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,Get_Is_Id,'md', true, nil, nil, nil, nil, nil, nil, nil, nil, Id_markup)
else
return send(msg_chat_id,msg_id,Get_Is_Id,"md",true, false, false, false, Id_markup) 
end
else
if photo.total_count > 0 then
if not msg.Special and Redis:get(Fast..'idnotmem'..msg.chat_id)  then
return send(msg_chat_id,msg_id,
'\n⎋ايديك : '..UserId..
'\n⎋معرفك : '..UserInfousername..
'\n⎋رتبتك : '..RinkBot..
'\n⎋رسائلك : '..TotalMsg..
'\n⎋تعديلاتك : '..TotalEdit..
'\n⎋تفاعلك : '..TotalMsgT..
'\n⎋البايو : '..Bio..
'',"md",true, false, false, false, Id_markup)
end
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
'\n⎋ '..Description..
'\n⎋ايديك : '..UserId..
'\n⎋معرفك : '..UserInfousername..
'\n⎋رتبتك : '..RinkBot..
'\n⎋رسائلك : '..TotalMsg..
'\n⎋نقاطك : '..NumberGames..
'\n⎋تعديلاتك : '..TotalEdit..
'\n⎋تفاعلك : '..TotalMsgT..
'\n⎋البايو : '..Bio..
'','md', true, nil, nil, nil, nil, nil, nil, nil, nil, Id_markup)
else
return send(msg_chat_id,msg_id,
'\n⎋ايديك : '..UserId..
'\n⎋معرفك : '..UserInfousername..
'\n⎋رتبتك : '..RinkBot..
'\n⎋رسائلك : '..TotalMsg..
'\n⎋تعديلاتك : '..TotalEdit..
'\n⎋تفاعلك : '..TotalMsgT..
'\n⎋البايو : '..Bio..
'',"md",true, false, false, false, Id_markup)
end
end
else
if Get_Is_Id then
local Get_Is_Id = Get_Is_Id:gsub('#AddMem',NumAdd) 
local Get_Is_Id = Get_Is_Id:gsub('#id',senderr) 
local Get_Is_Id = Get_Is_Id:gsub('#username',UserInfousername) 
local Get_Is_Id = Get_Is_Id:gsub('#msgs',TotalMsg) 
local Get_Is_Id = Get_Is_Id:gsub('#edit',TotalEdit) 
local Get_Is_Id = Get_Is_Id:gsub('#stast',RinkBot) 
local Get_Is_Id = Get_Is_Id:gsub('#auto',TotalMsgT) 
local Get_Is_Id = Get_Is_Id:gsub('#Description',Description) 
local Get_Is_Id = Get_Is_Id:gsub('#game',NumberGames) 
local Get_Is_Id = Get_Is_Id:gsub('#photos',TotalPhoto) 
local Get_Is_Id = Get_Is_Id:gsub('#Bio',Bio) 
return send(msg_chat_id,msg_id,'['..Get_Is_Id..']',"md",true, false, false, false, Id_markup) 
else
return send(msg_chat_id,msg_id,
'\n⎋ايديك : '..UserId..
'\n⎋معرفك : '..UserInfousername..
'\n⎋رتبتك : '..RinkBot..
'\n⎋رسائلك : '..TotalMsg..
'\n⎋تعديلاتك : '..TotalEdit..
'\n⎋تفاعلك : '..TotalMsgT..
'\n⎋البايو : '..Bio..
'',true, false, false, false, Id_markup)
end
end
end 

if text and text:match('^تحكم @(%S+)$') then
local UserName = text:match('^تحكم @(%S+)$') 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..msg.chat_id,UserId_Info.id) 
Creator = Redis:sismember(Fast.."Creator:Group"..msg.chat_id,UserId_Info.id)
Manger = Redis:sismember(Fast.."Manger:Group"..msg.chat_id,UserId_Info.id)
Admin = Redis:sismember(Fast.."Admin:Group"..msg.chat_id,UserId_Info.id)
Special = Redis:sismember(Fast.."Special:Group"..msg.chat_id,UserId_Info.id)
BanGroup = Redis:sismember(Fast.."BanGroup:Group"..msg.chat_id,UserId_Info.id)
SilentGroup = Redis:sismember(Fast.."SilentGroup:Group"..msg.chat_id,UserId_Info.id)
if BanGroup then
BanGroupz = "✔"
else
BanGroupz = "❌"
end
if SilentGroup then
SilentGroupz = "✔"
else
SilentGroupz = "❌"
end
if SuperCreator then
SuperCreatorz = "✔"
else
SuperCreatorz = "❌"
end
if Creator then
Creatorz = "✔"
else
Creatorz = "❌"
end
if Manger then
Mangerz = "✔"
else
Mangerz = "❌"
end
if Admin then
Adminz = "✔"
else
Adminz = "❌"
end
if Special then
Specialz = "✔"
else
Specialz = "❌"
end

local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = '- منشئ اساسي : '..SuperCreatorz, data =senderr..'/statusSuperCreatorz/'..UserId_Info.id},{text = '- منشئ : '..Creatorz, data =senderr..'/statusCreatorz/'..UserId_Info.id},
},
{
{text = '- مدير : '..Mangerz, data =senderr..'/statusMangerz/'..UserId_Info.id},{text = '- ادمن : '..Adminz, data =senderr..'/statusAdminz/'..UserId_Info.id},
},
{
{text = '- مميز : '..Specialz, data =senderr..'/statusSpecialz/'..UserId_Info.id},
},
{
{text = '- الحظر : '..BanGroupz, data =senderr..'/statusban/'..UserId_Info.id},{text = '- الكتم : '..SilentGroupz, data =senderr..'/statusktm/'..UserId_Info.id},
},
{
{text = '- عضو  ', data =senderr..'/statusmem/'..UserId_Info.id},
},
{
{text = '- اخفاء الامر ', data ='/delAmr1'}
}
}
}
return send(msg.chat_id,msg.id,'*\n⎋ تحكم برتب الشخص*',"md",false, false, false, false, reply_markup)
end
if text == 'تحكم' and msg.reply_to_message_id > 0 then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
SuperCreator = Redis:sismember(Fast.."SuperCreator:Group"..msg.chat_id,rep_idd) 
Creator = Redis:sismember(Fast.."Creator:Group"..msg.chat_id,rep_idd)
Manger = Redis:sismember(Fast.."Manger:Group"..msg.chat_id,rep_idd)
Admin = Redis:sismember(Fast.."Admin:Group"..msg.chat_id,rep_idd)
Special = Redis:sismember(Fast.."Special:Group"..msg.chat_id,rep_idd)
BanGroup = Redis:sismember(Fast.."BanGroup:Group"..msg.chat_id,rep_idd)
SilentGroup = Redis:sismember(Fast.."SilentGroup:Group"..msg.chat_id,rep_idd)
if BanGroup then
BanGroupz = "✔"
else
BanGroupz = "❌"
end
if SilentGroup then
SilentGroupz = "✔"
else
SilentGroupz = "❌"
end
if SuperCreator then
SuperCreatorz = "✔"
else
SuperCreatorz = "❌"
end
if Creator then
Creatorz = "✔"
else
Creatorz = "❌"
end
if Manger then
Mangerz = "✔"
else
Mangerz = "❌"
end
if Admin then
Adminz = "✔"
else
Adminz = "❌"
end
if Special then
Specialz = "✔"
else
Specialz = "❌"
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{
{text = '- منشئ اساسي : '..SuperCreatorz, data =senderr..'/statusSuperCreatorz/'..rep_idd},{text = '- منشئ : '..Creatorz, data =senderr..'/statusCreatorz/'..rep_idd},
},
{
{text = '- مدير : '..Mangerz, data =senderr..'/statusMangerz/'..rep_idd},{text = '- ادمن : '..Adminz, data =senderr..'/statusAdminz/'..rep_idd},
},
{
{text = '- مميز : '..Specialz, data =senderr..'/statusSpecialz/'..rep_idd},
},
{
{text = '- الحظر : '..BanGroupz, data =senderr..'/statusban/'..rep_idd},{text = '- الكتم : '..SilentGroupz, data =senderr..'/statusktm/'..rep_idd},
},
{
{text = '- عضو  ', data =senderr..'/statusmem/'..rep_idd},
},
{
{text = '- اخفاء الامر ', data ='/delAmr1'}
}
}
}
return send(msg.chat_id,msg.id,'*\n⎋ تحكم برتب الشخص*',"md",false, false, false, false, reply_markup)
end
if text == 'ايدي' and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
local InfoUser = bot.getUserFullInfo(rep_idd)
if InfoUser.bio then
Bio = FlterBio(InfoUser.bio)
else
Bio = 'لا يوجد'
end
local photo = bot.getUserProfilePhotos(rep_idd)
local UserId = rep_idd
local RinkBot = Redis:get(Fast..':SetRt'..msg.chat_id..':'..UserId) or Controller(msg_chat_id,rep_idd)
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..rep_idd) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..rep_idd) or 0
local TotalMsgT = Total_message(TotalMsg) 
if Redis:get(Fast.."Status:IdPhoto"..msg_chat_id) then
if photo.total_count > 0 then
if not msg.Special and Redis:get(Fast..'idnotmem'..msg.chat_id)  then
return send(msg_chat_id,msg_id,
'\n*⎋ ايديك : ❪'..UserId..
'❫\n⎋ معرفك : ❪*['..UserInfousername..
']*❫\n⎋ رتبتك : ❪'..RinkBot..
'❫\n⎋ رسائلك : ❪'..TotalMsg..
'❫\n⎋ تعديلاتك : ❪'..TotalEdit..
'❫\n⎋ تفاعلك : ❪'..TotalMsgT..
'❫\n⎋ البايو : ❪*['..Bio..
']*❫*', "md")
end
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,
'\n*⎋ ايديه : '..UserId..
'\n⎋ معرفه : '..UserInfousername..
'\n⎋ رتبته : '..RinkBot..
'\n⎋ رسائله : '..TotalMsg..
'\n⎋ تعديلاته : '..TotalEdit..
'\n⎋ تفاعله : '..TotalMsgT..
'*', "md")
else
return send(msg_chat_id,msg_id,
'\n*⎋ ايديه : '..UserId..
'\n⎋ معرفه : '..UserInfousername..
'\n⎋ رتبته : '..RinkBot..
'\n⎋ رسائله : '..TotalMsg..
'\n⎋ تعديلاته : '..TotalEdit..
'\n⎋ تفاعله : '..TotalMsgT..
'*',"md",true) 
end
else
return send(msg_chat_id,msg_id,
'\n*⎋ ايديه : '..UserId..
'\n⎋ معرفه : '..UserInfousername..
'\n⎋ رتبته : '..RinkBot..
'\n⎋ رسائله : '..TotalMsg..
'\n⎋ تعديلاته : '..TotalEdit..
'\n⎋ تفاعله : '..TotalMsgT..
'*',"md",true) 
end
end

if text and text:match('^كشف (%d+)$') then
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserId = text:match('^كشف (%d+)$')
local UserInfo = bot.getUser(UserId)
if UserInfo.username then
UserName = '@'..UserInfo.username..''
else
UserName = 'لا يوجد'
end
local Name_User = FlterBio(UserInfo.first_name)
local RinkBot = Redis:get(Fast..':SetRt'..msg.chat_id..':'..UserId) or Controller(msg_chat_id,UserId)
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..UserId) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..UserId) or 0
local TotalMsgT = Total_message(TotalMsg) 
local NumAdd = Redis:get(Fast.."Num:Add:Memp"..msg.chat_id..":"..UserId) or 0
local NumberGames = Redis:get(Fast.."Num:Add:Games"..msg.chat_id..UserId) or 0
if UserInfo.Fastbots  == "error" and UserInfo.code == 6 then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام ايدي خطأ ","md",true)  
end 
return send(msg_chat_id,msg_id,
'◂ اسمه ↫ '..Name_User..
'\n◂ ايديه ↫ '..UserId..
'\n◂ معرفه ↫ ['..UserName..']'..
'\n◂ رتبته ↫ '..RinkBot..
'\n◂ عدد رسايله ↫ '..TotalMsg..
'\n◂ عدد تعديلاته ↫ '..TotalEdit..
'\n◂ تفاعله ↫ '..TotalMsgT..
'\n◂ البايو ↫ *'..FlterBio(getbio(UserId))..'*'..
'\n𓆩☆𓆪',"md",true) 
end
if text == 'كشف'  and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.username then
UserInfousername = '@'..UserInfo.username..''
else
UserInfousername = 'لا يوجد'
end
local photo = bot.getUserProfilePhotos(rep_idd)
local UserId = rep_idd
local RinkBot = Redis:get(Fast..':SetRt'..msg.chat_id..':'..UserId) or Controller(msg_chat_id,rep_idd)
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..rep_idd) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..rep_idd) or 0
local TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id,
'\n*⎋ ايديه : '..UserId..
'\n⎋ معرفه : '..UserInfousername..
'\n⎋ رتبته : '..RinkBot..
'\n⎋ رسائله : '..TotalMsg..
'\n⎋ تعديلاته : '..TotalEdit..
'\n⎋ تفاعله : '..TotalMsgT..
'*',"md",true) 
end
if text and text:match('^ايدي @(%S+)$') or text and text:match('^كشف @(%S+)$') then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserName = text:match('^ايدي @(%S+)$') or text:match('^كشف @(%S+)$')
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local UserId = UserId_Info.id
local RinkBot = Redis:get(Fast..':SetRt'..msg.chat_id..':'..UserId_Info.id) or Controller(msg_chat_id,UserId_Info.id)
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..UserId_Info.id) or 0
local TotalEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..UserId_Info.id) or 0
local TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id,
'\n*⎋ ايديه : '..UserId..
'\n⎋ معرفه : @'..UserName..
'\n⎋ رتبته : '..RinkBot..
'\n⎋ رسائله : '..TotalMsg..
'\n⎋ تعديلاته : '..TotalEdit..
'\n⎋ تفاعله : '..TotalMsgT..
'*',"md",true) 
end

if text == "تفاعلي" then
local TotalMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsgT = Total_message(TotalMsg) 
return send(msg_chat_id,msg_id,'\n*⎋ تفاعلك : '..TotalMsgT..'* ',"md",true)  
end
if text == 'فحص البوت' then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local StatusMember = bot.getChatMember(msg_chat_id,Fast).status.Fastbots
if (StatusMember ~= "chatMemberStatusAdministrator") then
return send(msg_chat_id,msg_id,'⎋ البوت عضو في الجروب ',"md",true) 
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,Fast).status 
if GetMemberStatus.can_change_info then
change_info = '❬ ✔️ ❭' else change_info = '❬ ❌ ❭'
end
if GetMemberStatus.can_delete_messages then
delete_messages = '❬ ✔️ ❭' else delete_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_invite_users then
invite_users = '❬ ✔️ ❭' else invite_users = '❬ ❌ ❭'
end
if GetMemberStatus.can_pin_messages then
pin_messages = '❬ ✔️ ❭' else pin_messages = '❬ ❌ ❭'
end
if GetMemberStatus.can_restrict_members then
restrict_members = '❬ ✔️ ❭' else restrict_members = '❬ ❌ ❭'
end
if GetMemberStatus.can_promote_members then
promote = '❬ ✔️ ❭' else promote = '❬ ❌ ❭'
end
PermissionsUser = '*\n⎋ صلاحيات البوت : مشرف في الجروب :\n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗'..'\n⎋ تغيير المعلومات : '..change_info..'\n⎋ تثبيت الرسائل : '..pin_messages..'\n⎋ اضافه مستخدمين : '..invite_users..'\n⎋ مسح الرسائل : '..delete_messages..'\n⎋ حظر المستخدمين : '..restrict_members..'\n⎋ اضافه المشرفين : '..promote..'\n\n*'
return send(msg_chat_id,msg_id,PermissionsUser,"md",true) 
end
if text and text:match('^حذف (%d+)$') and tonumber(senderr) == tonumber(1400467850) then
local NumMessage = tonumber(text:match('^حذف (%d+)$'))
local mm = msg.id/2097152/0.5
xxx = 0
for i = 1,NumMessage do
https.request("https://api.telegram.org/bot"..Token.."/deleteMessage?chat_id="..msg_chat_id.."&message_id="..mm)
mm = mm - 1
xxx = xxx +1
end
send(msg_chat_id, msg_id, "⎋ تم مسح "..xxx.. ' رساله', 'md')
end

if text and text:match('^مسح (%d+)$') then
local NumMessage = text:match('^مسح (%d+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه مسح الرسائل* ',"md",true)  
end
if tonumber(NumMessage) > 1000 then
return send(msg_chat_id,msg_id,'\n*⎋ العدد اكثر من 1000 لا تستطيع المسح',"md",true)  
end
local Message = msg.id
for i=1,tonumber(NumMessage) do
local deleteMessages = bot.deleteMessages(msg.chat_id,{[1]= Message})
Message = Message - 1048576
end
send(msg_chat_id, msg_id, "⎋ تم مسح "..NumMessage.. ' رساله', 'md')
end


if msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then      
Redis:sadd(Fast.."allM"..msg.chat_id, msg.id)
if Redis:get(Fast.."Status:Del:Media"..msg.chat_id) then    
local Numbardel = Redis:get(Fast.."allM:numdel"..msg.chat_id) or 200
local gmedia = Redis:scard(Fast.."allM"..msg.chat_id)  
if tonumber(gmedia) >= tonumber(Numbardel) then
local liste = Redis:smembers(Fast.."allM"..msg.chat_id)
for k,v in pairs(liste) do
local Mesge = v
if Mesge then
t = "⎋ تم مسح "..k.." من الوسائط تلقائيا\n⎋ يمكنك تعطيل الميزه باستخدام الامر ( `تعطيل المسح التلقائي` )"
bot.deleteMessages(msg.chat_id,{[1]= Mesge})
end
end
send(msg_chat_id,msg_id, t)
Redis:del(Fast.."allM"..msg.chat_id)
end
end
end
if text and text:match("^ضع عدد المسح (%d+)$") then  
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
local Numbardel = text:match("^ضع عدد المسح (%d+)$")
Redis:set(Fast.."allM:numdel"..msg.chat_id,Numbardel) 
send(msg_chat_id,msg_id, 'تم تعيين العدد  الى : '..Numbardel)
end
if text == "امسح" or text == "مسح الميديا" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."allM"..msg.chat_id)
for k,v in pairs(list) do
local Message = v
if Message then
t = "⎋ تم مسح "..k.." من الوسائط الموجوده"
bot.deleteMessages(msg.chat_id,{[1]= Message})
Redis:del(Fast.."allM"..msg.chat_id)
end
end
if #list == 0 then
t = "⎋ لا يوجد ميديا في الجروب"
end
 send(msg_chat_id,msg_id, t)
end
if text == ("الميديا") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local gmria = Redis:scard(Fast.."allM"..msg.chat_id)  
 send(msg_chat_id,msg_id,"⎋ عدد الميديا الموجود هو (* "..gmria.." *)","md")
end


if text == 'المالك' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
local UserInfo = bot.getUser(v.member_id.user_id)
if FlterBio(UserInfo.first_name) == "" then
send(msg_chat_id,msg_id,"*⎋ اوبس , المالك حسابه محذوف *","md",true)  
return false
end 
local photo = bot.getUserProfilePhotos(UserInfo.id)
local InfoUser = bot.getUserFullInfo(UserInfo.id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
if photo.total_count > 0 then
local TestText = "❲ ꪮ᭙ꪀꫀ𝘳 ᧁ𝘳ꪮꪊρ ❳\n— — — — — — — — —\n ╭⦿*𝙾𝚆𝙽𝙴𝚁 𝙽𝙰𝙼𝙴* : ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..")\n ╰⎋*𝙱𝙸𝙾 ⚘* : [❲ "..Bio.." ❳]"
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown')  
else
local TestText = "❲ ꪮ᭙ꪀꫀ𝘳 ꪀꪖꪑꫀ ❳\n— — — — — — — — —\n ╭⦿*𝙾𝚆𝙽𝙴𝚁 𝙽𝙰𝙼𝙴* : ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..")\n ╰⎋*𝙱𝙸𝙾 ⚘* : [❲ "..Bio.." ❳]"
local msg_id = msg.id/2097152/0.5 
 https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id.."&parse_mode=markdown")
end

end
end
end


if text == 'كشف البوتات' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
listBots = '\n*⎋ قائمه البوتات \n ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗*\n'
x = 0
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if Info_Members.members[k].status.Fastbots == "chatMemberStatusAdministrator" then
x = x + 1
Admin = '→ *{ ادمن }*'
else
Admin = ""
end
listBots = listBots.."*"..k.." - @"..UserInfo.username.."* "..Admin.."\n"
end
send(msg_chat_id,msg_id,listBots.."*\n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗\n⎋ عدد البوتات التي هي ادمن ( "..x.." )*","md",true)  
end


 
if text == 'المقيدين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Recent", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
local y = false
restricted = '\n*⎋ قائمه المقيديين \n ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗*\n'
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.Fastbots == "chatMemberStatusRestricted" then
y = true
x = x + 1
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
restricted = restricted.."*"..x.." - @"..UserInfo.username.."*\n"
else
restricted = restricted.."*"..x.." - *["..UserInfo.id.."](tg://user?id="..UserInfo.id..") \n"
end
end
end
if y == true then
send(msg_chat_id,msg_id,restricted,"md",true)  
else
send(msg_chat_id,msg_id,'⎋ لا يوجد مقيدين ',"md",true)  
end
end

local Bot_Name = (Redis:get(Fast.."Name:Bot") or "[آڤتآر]")

if text == 'غادر' or text == 'بوت غادر' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- نعم ', data=msg.sender_id.user_id..'/leftgroup@'..msg_chat_id},{text = '- لا ', data =msg.sender_id.user_id..'/'.. 'delAmr'}, 
},
}
}
return send(msg.chat_id,msg.id,'*\n⎋ - هل انت متأكد بمغادرة البوت - *',"md",false, false, false, false, reply_markup)
end

if text == 'تاك' and (Redis:get(Fast..'tagallgroup'..msg.chat_id) == "open") then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = bot.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
listall = '\n*⎋ قائمه الاعضاء \n ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗*\n'
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.username ~= "" then
listall = listall.."*"..k.." - @"..UserInfo.username.."*\n"
else
listall = listall.."*"..k.." -* ["..UserInfo.id.."](tg://user?id="..UserInfo.id..")\n"
end
end
send(msg_chat_id,msg_id,listall,"md",true)  
end

if text == "قفل ارسال القناة" or text == "قفل القناه" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:SenderChat"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل ارسال القناة").Lock,"md",true)  
return false
end 
if text == "فتح ارسال القناة" or text == "فتح القناه" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:SenderChat"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح ارسال القناة").unLock,"md",true)  
return false
end 
if text == "قفل الفشار" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:phshar"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الفشار").Lock,"md",true)  
return false
end 
if text == "فتح الفشار" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:phshar"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الفشار").unLock,"md",true)  
return false
end 
if text == "قفل الكفر" or text == "قفل السب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:alkfr"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الكفر").Lock,"md",true)  
return false
end 
if text == "فتح الكفر" or text == "فتح السب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:alkfr"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الكفر").unLock,"md",true)  
return false
end 
if text == "قفل الانكليزيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:english"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الانكليزيه").Lock,"md",true)  
return false
end 
if text == "فتح الانكليزيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:english"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الانكليزيه").unLock,"md",true)  
return false
end 

if text == 'محمد' or text == 'سواد' then
photo = "https://t.me/DIV_MUHAMED"
local T =[[
[ٓ ᯓ 𓆩 ˹ †ø δølløω ძενεløρεƦ øδ †hε ՏøuƦcε ˼ 𓆪 𓆃 .](t.me/DIV_MUHAMED )
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ' ‹ 𝗦𝗪𝗔𝗗 ┋⁽❥‌₎  › .', url = "https://t.me/DIV_MUHAMED"}
},
{
{text = '‹ ٰ𖣂 ⎋ ᑕᕼ ⎋ 𖣂 ›', url = "https://t.me/S_325"}
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.."&caption=".. URL.escape(T).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'كينج' or text == 'الكينج' then
photo = "https://t.me/TR_E2S_ON_MY_MOoN"
local T =[[
[ٓ  ˹ ِّّꪔٍَY ِّυَٰ᥉ٍᥱٓᖇ˼ @TR_E2S_ON_MY_MOoN](t.me/TR_E2S_ON_MY_MOoN )
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '‹ ⇣ ٍႦَٰᥲ️َٰ᥉َ𝗁َٰᥲ️ ⇣ › .', url = "https://t.me/TR_E2S_ON_MY_MOoN"}
},
{
{text = '‹ ٰ𖣂 ًًٍٍ𝗕ُُ𝗼ٖٔ𝗧 𖣂 ›', url = "https://t.me/miiiiiiiivbot"}
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.."&caption=".. URL.escape(T).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == 'بنك' or text == 'البنك' or text == 'اوامر البنك' then   
photo = "https://t.me/source_av"
local T =[[
— — — — — — — — —— — — 
👇↜( أضغط بالأسفل لعرض اوامر اللعبه )↝👇
 — — — — — — — — —— — — 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '‹ ٰ💸 ⇣ الاوامر البنكيه ⇣ 💸 › .', url = "https://t.me/source_av/12233"}
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.."&caption=".. URL.escape(T).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'اوامر الزواج' or text == 'زواج بالمهر' or text == 'اوامر الزواج بالمهر' then   
photo = "https://t.me/source_av"
local T =[[
— — — — — — — — —— — — 
👰↜( مرحبا بك بقسم اوامر الزواج بالمهر )↝🤵
 — — — — — — — — —— — — 
اعمل ريبلاي علي العروسه واكتب 《 زواج 》 + المبلغ
اكتب《 زواجي 》 لعرض عقد زواجكم
اكتب《 زوجها 》 لعرض مين جوزها ؟!
اكتب《 زوجته 》 لعرض مين مراته ؟!
اكتب《 طلقها 》 للأزواج
اكتب《 اخلعو 》 للزوجات
اكتب《 توب المتزوجين 》 لعرض اغني توب زواج بالبوت
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '« اصـنع بوتك من هنا » .', url = "https://t.me/AV_MA_BOT"}
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.."&caption=".. URL.escape(T).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'سوادقنبت' or text == 'المبرمج ينيزيسواد' then
photo = "https://t.me/H_E_R_O_V_I_P"
local T =[[
[ٓ آلـ رزل ع آي رزل يبــني😊♥](t.me/H_E_R_O_V_I_P )
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = ' آلـ هـيـرو .', url = "https://t.me/H_E_R_O_V_I_P"}
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.."&caption=".. URL.escape(T).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'مصنع' or text == 'المصنع' or text == 'الصانع' then   
photo = "https://t.me/source_av"
local T =[[
— — — — — — — — —— — — 
🤖↜( اضغط علي الزر لصنع بوتك )↝🤖
 — — — — — — — — —— — — 
]]
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '« ꪔᥲ️kᥱᖇ » .', url = "https://t.me/AV_MA_BOT"}
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.."&caption=".. URL.escape(T).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end

if text == 'المطور' or text == 'مطور البوت' or text == 'مطور' then   
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local bains = bot.getUser(msg.sender_id.user_id)
if bains.first_name then
klajq = '*['..bains.first_name..'](tg://user?id='..bains.id..')*'
else
klajq = 'لا يوجد'
end
if bains.username then
basgk = ' '..bains.username..' '
else
basgk = 'لا يوجد'
end
local czczh = '*'..bains.first_name..'*'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = czczh, url = "https://t.me/"..bains.username..""},
},
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
bot.sendText(Sudo_Id,0,'*\n⎋  مرحباً عزيزي المطور \nشخص ما يحتاج الي مساعده\n⩹━━━━ََِِ𝑨𝑽𝑨????𝑹 ⎋ 𝑆𝑂𝐔𝑅𝐶𝐸,━━━━⩺ \n⎋  اسمه :- '..klajq..' \n⎋  ايديه :-  : '..msg.sender_id.user_id..'\n⎋  - معرفة '..basgk..' \n*',"md",false, false, false, false, reply_markup)
end
if text == 'المبرمج' or text == 'كينج' or text  == 'المبرمج كينج' then
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local bains = bot.getUser(msg.sender_id.user_id)
if bains.first_name then
klajq = '*['..bains.first_name..'](tg://user?id='..bains.id..')*'
else
klajq = 'لا يوجد'
end
if bains.username then
basgk = ' '..bains.username..' '
else
basgk = 'لا يوجد'
end
local czczh = '*'..bains.first_name..'*'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = czczh, url = "https://t.me/"..bains.username..""},
},
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
bot.sendText(1400467850,0,'*\n◉  مرحباً عزيزي المبرمج كينج \nشخص ما يحتاج الي مساعده\n⩹━━━━ََِِ𝑨𝑽𝑨𝑻𝑨𝑹 ⎋ 𝑆𝑂𝐔𝑅𝐶𝐸,━━━━⩺ \n◉  اسمه :- '..klajq..' \n◉  ايديه :-  : '..msg.sender_id.user_id..'\n◉  - معرفة '..basgk..' \n*',"md",false, false, false, false, reply_markup)
end
if text == 'اةتتلةةىؤؤؤحمد' or text == 'شيكوىةىةزناةو' then
local Get_Chat = bot.getChat(msg_chat_id)
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local bains = bot.getUser(msg.sender_id.user_id)
if bains.first_name then
klajq = '*['..bains.first_name..'](tg://user?id='..bains.id..')*'
else
klajq = 'لا يوجد'
end
if bains.username then
basgk = ' '..bains.username..' '
else
basgk = 'لا يوجد'
end
local czczh = '*'..bains.first_name..'*'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = czczh, url = "https://t.me/"..bains.username..""},
},
{
{text = Get_Chat.title, url = Info_Chats.invite_link.invite_link}, 
},
}
}
bot.sendText(50920411180,0,'*\n◉  مرحباً عزيزي مطور السورس \nشخص ما يحتاج الي مساعده\n⩹━━━━ََِِ◉━━━━⩺ \n◉  اسمه :- '..klajq..' \n◉  ايديه :-  : '..msg.sender_id.user_id..'\n◉  - معرفة '..basgk..' \n*',"md",false, false, false, false, reply_markup)
end
if text == "صورتي" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if Redis:get(Fast.."myphoto"..msg.chat_id) then
send(msg_chat_id,msg_id,'*⎋ الصوره معطله*',"md",true) 
else
local photo = bot.getUserProfilePhotos(senderr)
if photo.total_count > 0 then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'صورتك التاليه', callback_data=senderr.."/sorty2"},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&reply_to_message_id="..rep.."&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption="..URL.escape("٭ عدد صورك هو "..photo.total_count.." صوره").."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
return send(msg_chat_id,msg_id,'*⎋ لا توجد صوره ف حسابك*',"md",true) 
end
end
end

if text == "قفل التفليش" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:tphlesh"..msg_chat_id,true) 
Redis:del(Fast.."Status:IdPhoto"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل التفليش").Lock,"md",true)  
return false
end 
if text == "فتح التفليش" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:tphlesh"..msg_chat_id)  
Redis:set(Fast.."Status:IdPhoto"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح التفليش").unLock,"md",true)  
return false
end 
if text == "قفل الفارسيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:farsia"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الفارسيه").Lock,"md",true)  
return false
end 
if text == "فتح الفارسيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:farsia"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الفارسيه").unLock,"md",true)  
return false
end 

if text == "قفل الدردشه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:text"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الدردشه").Lock,"md",true)  
return false
end 
if text == "قفل الاضافه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:AddMempar"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل اضافة الاعضاء").Lock,"md",true)  
return false
end 
if text == "قفل الدخول" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:Join"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل دخول الاعضاء").Lock,"md",true)  
return false
end 
if text == "قفل البوتات" then  
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:Bot:kick"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل البوتات").Lock,"md",true)  
return false
end 
if text == "قفل البوتات بالطرد" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:Bot:kick"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل البوتات").lockKick,"md",true)  
return false
end 
if text == "قفل الاشعارات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."Lock:tagservr"..msg_chat_id,true)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الاشعارات").Lock,"md",true)  
return false
end 
if text == "قفل التثبيت" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."lockpin"..msg_chat_id,(bot.getChatPinnedMessage(msg_chat_id).id or true)) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل التثبيت هنا").Lock,"md",true)  
return false
end 
if text == "قفل التعديل" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:edit"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل تعديل").Lock,"md",true)  
return false
end 
if text == "قفل تعديل الميديا" then 
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:set(Fast.."Lock:edit"..msg_chat_id,true) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل تعديل").Lock,"md",true)  
return false
end 
if text == "قفل الكل" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."Lock:tagservrbot"..msg_chat_id,true)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:set(Fast..''..lock..msg_chat_id,"del")    
end
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل جميع الاوامر").Lock,"md",true)  
return false
end 

if text == "قفل وسائط المميزين" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."Lock:AlUasat"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل جميع الوسائط المميزين").Lock,"md",true)  
return false
end 
if text == "فتح وسائط المميزين" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:AlUasat"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فـتح جميع الوسائط المميزين").unLock,"md",true)  
return false
end 

if text == "قفل الوسائط" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:vico"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"del")  
Redis:set(Fast.."Lock:Video"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل جميع الوسائط").Lock,"md",true)  
return false
end 
if text == "فتح الوسائط" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:Animation"..msg_chat_id)  
Redis:del(Fast.."Lock:Photo"..msg_chat_id)  
Redis:del(Fast.."Lock:vico"..msg_chat_id)  
Redis:del(Fast.."Lock:Audio"..msg_chat_id)  
Redis:del(Fast.."Lock:Sticker"..msg_chat_id)  
Redis:del(Fast.."Lock:Video"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فـتح جميع الوسائط").unLock,"md",true)  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "فتح الاضافه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:AddMempar"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح اضافة الاعضاء").unLock,"md",true)  
return false
end 
if text == "فتح الدردشه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:text"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الدردشه").unLock,"md",true)  
return false
end 
if text == "فتح الدخول" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:Join"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح دخول الاعضاء").unLock,"md",true)  
return false
end 
if text == "فتح البوتات" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:Bot:kick"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فـتح البوتات").unLock,"md",true)  
return false
end 
if text == "فتح البوتات " then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:Bot:kick"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فـتح البوتات").unLock,"md",true)  
return false
end 
if text == "فتح الاشعارات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end  
Redis:del(Fast.."Lock:tagservr"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فـتح الاشعارات").unLock,"md",true)  
return false
end 
if text == "فتح التثبيت" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."lockpin"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فـتح التثبيت هنا").unLock,"md",true)  
return false
end 
if text == "فتح التعديل" or text == "فتح تعديل الميديا" then 
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:edit"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فـتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح التعديل الميديا" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:edit"..msg_chat_id) 
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فـتح تعديل").unLock,"md",true)  
return false
end 
if text == "فتح الكل" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
Redis:del(Fast.."Lock:tagservrbot"..msg_chat_id)   
list ={"Lock:Bot:kick","Lock:User:Name","Lock:hashtak","Lock:Cmd","Lock:Link","Lock:forward","Lock:Keyboard","Lock:geam","Lock:Photo","Lock:Animation","Lock:Video","Lock:Audio","Lock:vico","Lock:Sticker","Lock:Document","Lock:Unsupported","Lock:Markdaun","Lock:Contact","Lock:Spam"}
for i,lock in pairs(list) do 
Redis:del(Fast..''..lock..msg_chat_id)    
end
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فـتح جميع الاوامر").unLock,"md",true)  
return false
end 
--------------------------------------------------------------------------------------------------------------
if text == "قفل التكرار" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User","del")  
return send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل التكرار").Lock,"md",true)  
elseif text == "قفل التكرار بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User","keed")  
return send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل التكرار").lockKid,"md",true)  
elseif text == "قفل التكرار بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User","mute")  
return send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل التكرار").lockKtm,"md",true)  
elseif text == "قفل التكرار بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User","kick")  
return send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل التكرار").lockKick,"md",true)  
elseif text == "فتح التكرار" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:hdel(Fast.."Spam:Group:User"..msg_chat_id ,"Spam:User")  
return send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح التكرار").unLock,"md",true)  
end
if text == "قفل الروابط" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Link"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الروابط").Lock,"md",true)  
return false
end 
if text == "قفل الروابط بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Link"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الروابط").lockKid,"md",true)  
return false
end 
if text == "قفل الروابط بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Link"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الروابط").lockKtm,"md",true)  
return false
end 
if text == "قفل الروابط بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Link"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الروابط").lockKick,"md",true)  
return false
end 
if text == "فتح الروابط" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Link"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الروابط").unLock,"md",true)  
return false
end 
if text == "قفل المعرفات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:User:Name"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل المعرفات").Lock,"md",true)  
return false
end 
if text == "قفل المعرفات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:User:Name"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل المعرفات").lockKid,"md",true)  
return false
end 
if text == "قفل المعرفات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:User:Name"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل المعرفات").lockKtm,"md",true)  
return false
end 
if text == "قفل المعرفات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:User:Name"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل المعرفات").lockKick,"md",true)  
return false
end 
if text == "فتح المعرفات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:User:Name"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح المعرفات").unLock,"md",true)  
return false
end 
if text == "قفل التاك" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:hashtak"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل التاك").Lock,"md",true)  
return false
end 
if text == "قفل التاك بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:hashtak"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل التاك").lockKid,"md",true)  
return false
end 
if text == "قفل التاك بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:hashtak"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل التاك").lockKtm,"md",true)  
return false
end 
if text == "قفل التاك بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:hashtak"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل التاك").lockKick,"md",true)  
return false
end 
if text == "فتح التاك" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:hashtak"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح التاك").unLock,"md",true)  
return false
end 
if text == "قفل الشارحه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Cmd"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الشارحه").Lock,"md",true)  
return false
end 
if text == "قفل الشارحه بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Cmd"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الشارحه").lockKid,"md",true)  
return false
end 
if text == "قفل الشارحه بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Cmd"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الشارحه").lockKtm,"md",true)  
return false
end 
if text == "قفل الشارحه بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Cmd"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الشارحه").lockKick,"md",true)  
return false
end 
if text == "فتح الشارحه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Cmd"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الشارحه").unLock,"md",true)  
return false
end 
if text == "قفل الصور"then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الصور").Lock,"md",true)  
return false
end 
if text == "قفل الصور بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الصور").lockKid,"md",true)  
return false
end 
if text == "قفل الصور بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الصور").lockKtm,"md",true)  
return false
end 
if text == "قفل الصور بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Photo"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الصور").lockKick,"md",true)  
return false
end 
if text == "فتح الصور" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Photo"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الصور").unLock,"md",true)  
return false
end 
if text == "قفل الفيديو" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Video"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الفيديو").Lock,"md",true)  
return false
end 
if text == "قفل الفيديو بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Video"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الفيديو").lockKid,"md",true)  
return false
end 
if text == "قفل الفيديو بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Video"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الفيديو").lockKtm,"md",true)  
return false
end 
if text == "قفل الفيديو بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Video"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الفيديو").lockKick,"md",true)  
return false
end 
if text == "فتح الفيديو" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Video"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الفيديو").unLock,"md",true)  
return false
end 
if text == "قفل المتحركه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل المتحركه").Lock,"md",true)  
return false
end 
if text == "قفل المتحركه بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل المتحركه").lockKid,"md",true)  
return false
end 
if text == "قفل المتحركه بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل المتحركه").lockKtm,"md",true)  
return false
end 
if text == "قفل المتحركه بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Animation"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل المتحركه").lockKick,"md",true)  
return false
end 
if text == "فتح المتحركه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Animation"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح المتحركه").unLock,"md",true)  
return false
end 
if text == "قفل الالعاب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:geam"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الالعاب").Lock,"md",true)  
return false
end 
if text == "قفل الالعاب بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:geam"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الالعاب").lockKid,"md",true)  
return false
end 
if text == "قفل الالعاب بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:geam"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الالعاب").lockKtm,"md",true)  
return false
end 
if text == "قفل الالعاب بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:geam"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الالعاب").lockKick,"md",true)  
return false
end 
if text == "فتح الالعاب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:geam"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الالعاب").unLock,"md",true)  
return false
end 
if text == "قفل الاغاني" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الاغاني").Lock,"md",true)  
return false
end 
if text == "قفل الاغاني بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الاغاني").lockKid,"md",true)  
return false
end 
if text == "قفل الاغاني بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الاغاني").lockKtm,"md",true)  
return false
end 
if text == "قفل الاغاني بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Audio"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الاغاني").lockKick,"md",true)  
return false
end 
if text == "فتح الاغاني" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Audio"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الاغاني").unLock,"md",true)  
return false
end 
if text == "قفل الصوت" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:vico"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الصوت").Lock,"md",true)  
return false
end 
if text == "قفل الصوت بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:vico"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الصوت").lockKid,"md",true)  
return false
end 
if text == "قفل الصوت بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:vico"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الصوت").lockKtm,"md",true)  
return false
end 
if text == "قفل الصوت بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:vico"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الصوت").lockKick,"md",true)  
return false
end 
if text == "فتح الصوت" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:vico"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الصوت").unLock,"md",true)  
return false
end 
if text == "قفل الكيبورد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Keyboard"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الكيبورد").Lock,"md",true)  
return false
end 
if text == "قفل الكيبورد بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Keyboard"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الكيبورد").lockKid,"md",true)  
return false
end 
if text == "قفل الكيبورد بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Keyboard"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الكيبورد").lockKtm,"md",true)  
return false
end 
if text == "قفل الكيبورد بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Keyboard"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الكيبورد").lockKick,"md",true)  
return false
end 
if text == "فتح الكيبورد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Keyboard"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الكيبورد").unLock,"md",true)  
return false
end 
if text == "قفل الملصقات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الملصقات").Lock,"md",true)  
return false
end 
if text == "قفل الملصقات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الملصقات").lockKid,"md",true)  
return false
end 
if text == "قفل الملصقات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الملصقات").lockKtm,"md",true)  
return false
end 
if text == "قفل الملصقات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Sticker"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الملصقات").lockKick,"md",true)  
return false
end 
if text == "فتح الملصقات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Sticker"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الملصقات").unLock,"md",true)  
return false
end 
if text == "قفل التوجيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:forward"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل التوجيه").Lock,"md",true)  
return false
end 
if text == "قفل التوجيه بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:forward"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل التوجيه").lockKid,"md",true)  
return false
end 
if text == "قفل التوجيه بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:forward"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل التوجيه").lockKtm,"md",true)  
return false
end 
if text == "قفل التوجيه بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:forward"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل التوجيه").lockKick,"md",true)  
return false
end 
if text == "فتح التوجيه" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:forward"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح التوجيه").unLock,"md",true)  
return false
end 
if text == "قفل الملفات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Document"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الملفات").Lock,"md",true)  
return false
end 
if text == "قفل الملفات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Document"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الملفات").lockKid,"md",true)  
return false
end 
if text == "قفل الملفات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Document"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الملفات").lockKtm,"md",true)  
return false
end 
if text == "قفل الملفات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Document"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الملفات").lockKick,"md",true)  
return false
end 
if text == "فتح الملفات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Document"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الملفات").unLock,"md",true)  
return false
end 
if text == "قفل السيلفي" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Unsupported"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل السيلفي").Lock,"md",true)  
return false
end 
if text == "قفل السيلفي بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Unsupported"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل السيلفي").lockKid,"md",true)  
return false
end 
if text == "قفل السيلفي بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Unsupported"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل السيلفي").lockKtm,"md",true)  
return false
end 
if text == "قفل السيلفي بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Unsupported"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل السيلفي").lockKick,"md",true)  
return false
end 
if text == "فتح السيلفي" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Unsupported"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح السيلفي").unLock,"md",true)  
return false
end 
if text == "قفل الماركداون" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Markdaun"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الماركداون").Lock,"md",true)  
return false
end 
if text == "قفل الماركداون بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Markdaun"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الماركداون").lockKid,"md",true)  
return false
end 
if text == "قفل الماركداون بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Markdaun"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الماركداون").lockKtm,"md",true)  
return false
end 
if text == "قفل الماركداون بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Markdaun"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الماركداون").lockKick,"md",true)  
return false
end 
if text == "فتح الماركداون" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Markdaun"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الماركداون").unLock,"md",true)  
return false
end 
if text == "قفل الجهات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Contact"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الجهات").Lock,"md",true)  
return false
end 
if text == "قفل الجهات بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Contact"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الجهات").lockKid,"md",true)  
return false
end 
if text == "قفل الجهات بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Contact"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الجهات").lockKtm,"md",true)  
return false
end 
if text == "قفل الجهات بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n?? عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Contact"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الجهات").lockKick,"md",true)  
return false
end 
if text == "فتح الجهات" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Contact"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الجهات").unLock,"md",true)  
return false
end 
if text == "قفل الكلايش" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Spam"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الكلايش").Lock,"md",true)  
return false
end 
if text == "قفل الكلايش بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Spam"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الكلايش").lockKid,"md",true)  
return false
end 
if text == "قفل الكلايش بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Spam"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الكلايش").lockKtm,"md",true)  
return false
end 
if text == "قفل الكلايش بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Spam"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الكلايش").lockKick,"md",true)  
return false
end 
if text == "فتح الكلايش" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Spam"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الكلايش").unLock,"md",true)  
return false
end 
if text == "قفل الانلاين" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Inlen"..msg_chat_id,"del")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الانلاين").Lock,"md",true)  
return false
end 
if text == "قفل الانلاين بالتقييد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Inlen"..msg_chat_id,"ked")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الانلاين").lockKid,"md",true)  
return false
end 
if text == "قفل الانلاين بالكتم" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Inlen"..msg_chat_id,"ktm")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الانلاين").lockKtm,"md",true)  
return false
end 
if text == "قفل الانلاين بالطرد" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Lock:Inlen"..msg_chat_id,"kick")  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم قفـل الانلاين").lockKick,"md",true)  
return false
end 
if text == "فتح الانلاين" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Lock:Inlen"..msg_chat_id)  
send(msg_chat_id,msg_id,Reply_Status(senderr,"⎋ تم فتح الانلاين").unLock,"md",true)  
return false
end 
if text == "ضع رابط" or text == "وضع رابط" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Set:Link"..msg_chat_id..""..senderr,120,true) 
return send(msg_chat_id,msg_id,"⎋ ارسل رابط الجروب او رابط قناة الجروب","md",true)  
end
if text == "مسح الرابط" or text == "مسح الرابط" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Group:Link"..msg_chat_id) 
return send(msg_chat_id,msg_id,"⎋ تم مسح الرابط ","md",true)             
end
if text == "الرابط" then
if not Redis:get(Fast.."Status:Link"..msg_chat_id) then
return send(msg_chat_id,msg_id,"⎋ تم تعطيل الرابط من قبل الادارة","md",true)
end 
local Get_Chat = bot.getChat(msg_chat_id)
local GetLink = Redis:get(Fast.."Group:Link"..msg_chat_id) 
if GetLink then
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text =Get_Chat.title, url = GetLink}, },}}
return send(msg_chat_id, msg_id, "⎋ Link Group : \n["..GetLink.."]", 'md', true, false, false, false, reply_markup)
else
return send(msg_chat_id, msg_id, "⎋ لا يوجد رابط ارسل انشاء رابط", 'md', true, false, false, false, reply_markup)
end
end
if text == "انشاء رابط" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local Get_Chat = bot.getChat(msg_chat_id)
local LinkGroup = bot.generateChatInviteLink(msg_chat_id,'abbas',tonumber(msg.date+864000),100,false)
if LinkGroup.code == 3 then
return send(msg_chat_id,msg_id,"⎋ لا استطيع جلب الرابط بسبب ليس لدي صلاحيه دعوه مستخدمين من خلال الرابط ","md",true)
end
Redis:set(Fast.."Group:Link"..msg_chat_id,LinkGroup.invite_link) 
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = Get_Chat.title, url = LinkGroup.invite_link},},}}
return send(msg_chat_id, msg_id, "⎋ Link Group : \n["..LinkGroup.invite_link.. "]", 'md', true, false, false, false, reply_markup)
end

if text == "ضع الترحيب عام" or text == "وضع الترحيب عام" then  
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Welcome:Group:Set" .. msg_chat_id .. "" .. senderr, 120, true)  
local textett =[[
⎋ ارسل لي الترحيب عام الان
⎋ تستطيع اضافة مايلي !
يمكنك استخدام الدوال الاتيه 

- عرض اسم الشخص : `{الاسم}`
- عرض يوزر الشخص : `{المعرف}`
- عرض اسم الجروب : `{الجروب}`
- عرض عدد الاعضاء : `{الاعضاء}`
- عرض عدد الادمنيه : `{الادمنيه}`
- عرض الوقت : `{الوقت}`
- عرض التاريخ : `{التاريخ}`
]]
return send(msg_chat_id,msg_id,textett,"md",true)   
end
if text == "الترحيب عام" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Welcome = Redis:get(Fast.."Welcome:Groups")
if Welcome then 
return send(msg_chat_id,msg_id,Welcome,"md",true)   
else 
return send(msg_chat_id,msg_id,"⎋ لم يتم تعيين ترحيب عام","md",true)   
end 
end
if text == "مسح الترحيب عام" or text == "مسح الترحيب عام" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Welcome:Groups") 
return send(msg_chat_id,msg_id,"⎋ تم ازالة الترحيب العام في المجموعات","md",true)   
end

if Redis:get(Fast.."Welcome:Group:Set" .. msg_chat_id .. "" .. senderr) then 
if text == "الغاء" then 
Redis:del(Fast.."Welcome:Group:Set" .. msg_chat_id .. "" .. senderr)  
return send(msg_chat_id,msg_id,"⎋ تم الغاء حفظ الترحيب عام","md",true)   
end 
Redis:del(Fast.."Welcome:Group:Set" .. msg_chat_id .. "" .. senderr)  
Redis:set(Fast.."Welcome:Groups",text) 
return send(msg_chat_id,msg_id,"⎋ تم حفظ الترحيب العام للمجموعات","md",true)     
end



if text == "ضع الترحيب" or text == "وضع الترحيب" then  
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Tshake:Welcome:Group" .. msg_chat_id .. "" .. senderr, 120, true)  
local textett =[[
⎋ ارسل لي الترحيب عام الان
⎋ تستطيع اضافة مايلي !
يمكنك استخدام الدوال الاتيه 

- عرض اسم الشخص : `{الاسم}`
- عرض يوزر الشخص : `{المعرف}`
- عرض اسم الجروب : `{الجروب}`
- عرض عدد الاعضاء : `{الاعضاء}`
- عرض عدد الادمنيه : `{الادمنيه}`
- عرض الوقت : `{الوقت}`
- عرض التاريخ : `{التاريخ}`
]]
return send(msg_chat_id,msg_id,textett,"md",true)   
end
if text == "الترحيب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."Status:Welcome"..msg_chat_id) then
return send(msg_chat_id,msg_id,"⎋ تم تعطيل الترحيب من قبل الادمنيه","md",true)
end 
local Welcome = Redis:get(Fast.."Welcome:Group"..msg_chat_id)
if Welcome then 
return send(msg_chat_id,msg_id,Welcome,"md",true)   
else 
return send(msg_chat_id,msg_id,"⎋ لم يتم تعيين ترحيب للجروب","md",true)   
end 
end
if text == "مسح الترحيب" or text == "مسح الترحيب" then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Welcome:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"⎋ تم ازالة ترحيب الجروب","md",true)   
end
if text == "ضع قوانين" or text == "وضع قوانين" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Set:Rules:" .. msg_chat_id .. ":" .. senderr, 600, true) 
return send(msg_chat_id,msg_id,"⎋ ارسل لي القوانين الان","md",true)  
end
if text == "مسح القوانين" or text == "مسح القوانين" then  
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Group:Rules"..msg_chat_id) 
return send(msg_chat_id,msg_id,"⎋ تم ازالة قوانين الجروب","md",true)    
end
if text == "القوانين" then 
local Rules = Redis:get(Fast.."Group:Rules" .. msg_chat_id)   
if Rules then     
return send(msg_chat_id,msg_id,Rules,"md",true)     
else      
return send(msg_chat_id,msg_id,"⎋ لا توجد قوانين هنا","md",true)     
end    
end
if text == "ضع وصف" or text == "وضع وصف" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
Redis:setex(Fast.."Set:Description:" .. msg_chat_id .. ":" .. senderr, 600, true) 
return send(msg_chat_id,msg_id,"⎋ ارسل لي وصف الجروب الان","md",true)  
end
if text == "مسح الوصف" or text == "مسح الوصف" then  
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
bot.setChatDescription(msg_chat_id, '') 
return send(msg_chat_id,msg_id,"⎋ تم ازالة قوانين الجروب","md",true)    
end

if text and text:match("^ضع اسم (.*)") or text and text:match("^وضع اسم (.*)") then 
local NameChat = text:match("^ضع اسم (.*)") or text:match("^وضع اسم (.*)") 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
bot.setChatTitle(msg_chat_id,NameChat)
return send(msg_chat_id,msg_id,"⎋ تم تغيير اسم الجروب الى : "..NameChat,"md",true)    
end

if text == ("ضع صوره") or text == ("وضع صوره") then  
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Info == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه تغيير المعلومات* ',"md",true)  
end
Redis:set(Fast.."Chat:Photo"..msg_chat_id..":"..senderr,true) 
return send(msg_chat_id,msg_id,"⎋ ارسل الصوره لوضعها للجروب","md",true)    
end

if text == "مسح قائمه المنع" then   
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Filter"..msg_chat_id)  
if #list == 0 then  
return send(msg_chat_id,msg_id,"*⎋ لا يوجد كلمات ممنوعه هنا *","md",true)   
end  
for k,v in pairs(list) do  
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
Redis:del(Fast.."Filter:Group:"..v..msg_chat_id)  
Redis:srem(Fast.."List:Filter"..msg_chat_id,v)  
end  
return send(msg_chat_id,msg_id,"*⎋ تم مسح ("..#list..") كلمات ممنوعه *","md",true)   
end
if text == "قائمه المنع" then   
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Filter"..msg_chat_id)  
if #list == 0 then  
return send(msg_chat_id,msg_id,"*⎋ لا يوجد كلمات ممنوعه هنا *","md",true)   
end  
Filter = '\n*⎋ قائمه المنع \n ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗*\n'
for k,v in pairs(list) do  

if v:match('photo:(.*)') then
ver = 'صوره'
elseif v:match('animation:(.*)') then
ver = 'متحركه'
elseif v:match('sticker:(.*)') then
ver = 'ملصق'
elseif v:match('text:(.*)') then
ver = v:gsub('text:',"") 
end
v = v:gsub('photo:',"") 
v = v:gsub('sticker:',"") 
v = v:gsub('animation:',"") 
v = v:gsub('text:',"") 
local Text_Filter = Redis:get(Fast.."Filter:Group:"..v..msg_chat_id)   
Filter = Filter.."*"..k.."- "..ver.." » { "..Text_Filter.." }*\n"    
end  
send(msg_chat_id,msg_id,Filter,"md",true)  
end  
if text == "منع" then       
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'FilterText'..msg_chat_id..':'..senderr,'true')
return send(msg_chat_id,msg_id,'\n*⎋ ارسل الان { ملصق ,متحركه ,صوره ,رساله } *',"md",true)  
end    
if text == "الغاء منع" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'FilterText'..msg_chat_id..':'..senderr,'DelFilter')
return send(msg_chat_id,msg_id,'\n*⎋ ارسل الان { ملصق ,متحركه ,صوره ,رساله } *',"md",true)  
end
-----
if text == "اضف امر عام" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⌔ هذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
Redis:set(Fast.."All:Command:Reids:Group"..msg_chat_id..":"..senderr,"true") 
return send(msg_chat_id,msg_id,"⌔الان ارسل لي الامر القديم ...","md",true)
end
if text == "حذف امر عام" or text == "مسح امر عام" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⌔ هذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n⌔ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."All:Command:Reids:Group:Del"..msg_chat_id..":"..senderr,"true") 
return send(msg_chat_id,msg_id,"⌔ ارسل الان الامر الذي قمت بوضعه مكان الامر القديم","md",true)
end
if text == "حذف الاوامر المضافه العامه" or text == "مسح الاوامر المضافه العامه" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⌔ هذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n⌔ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."All:Command:List:Group")
for k,v in pairs(list) do
Redis:del(Fast.."All:Get:Reides:Commands:Group"..v)
Redis:del(Fast.."All:Command:List:Group")
end
return send(msg_chat_id,msg_id,"⌔ تم مسح جميع الاوامر التي تم اضافتها في العام","md",true)
end
if text == "الاوامر المضافه العامه" then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⌔ هذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n⌔ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."All:Command:List:Group")
Command = "⌔ قائمه الاوامر المضافه العامه  \n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗\n"
for k,v in pairs(list) do
Commands = Redis:get(Fast.."All:Get:Reides:Commands:Group"..v)
if Commands then 
Command = Command..""..k..": ("..v..") ← {"..Commands.."}\n"
else
Command = Command..""..k..": ("..v..") \n"
end
end
if #list == 0 then
Command = "⌔ لا توجد اوامر اضافيه عامه"
end
return send(msg_chat_id,msg_id,Command,"md",true)
end
-----
if text == "اضف امر" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Command:Reids:Group"..msg_chat_id..":"..senderr,"true") 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"⎋ الان ارسل لي الامر القديم ...", 'md', false, false, false, false, reply_markup)
end
if text == "مسح امر" or text == "مسح امر" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Command:Reids:Group:Del"..msg_chat_id..":"..senderr,"true") 
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"⎋ ارسل الان الامر الذي قمت بوضعه مكان الامر القديم", 'md', false, false, false, false, reply_markup)
end
if text == "مسح الاوامر المضافه" or text == "مسح الاوامر المضافه" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."Command:List:Group"..msg_chat_id)
for k,v in pairs(list) do
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..v)
Redis:del(Fast.."Command:List:Group"..msg_chat_id)
end
return send(msg_chat_id,msg_id,"⎋ تم مسح جميع الاوامر التي تم اضافتها","md",true)
end
if text == "الاوامر المضافه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."Command:List:Group"..msg_chat_id.."")
Command = "⎋ قائمه الاوامر المضافه  \n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗\n"
for k,v in pairs(list) do
Commands = Redis:get(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..v)
if Commands then 
Command = Command..""..k..": ("..v..") ← {"..Commands.."}\n"
else
Command = Command..""..k..": ("..v..") \n"
end
end
if #list == 0 then
Command = "⎋ لا توجد اوامر مضافه"
end
return send(msg_chat_id,msg_id,Command,"md",true)
end

if text == "تثبيت" and msg.reply_to_message_id ~= 0 then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
send(msg_chat_id,msg_id,"\n⎋ تم تثبيت الرساله","md",true)
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local PinMsg = bot.pinChatMessage(msg_chat_id,Message_Reply.id,true)
end
if text == 'الغاء التثبيت' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
send(msg_chat_id,msg_id,"\n⎋ تم الغاء تثبيت الرساله","md",true)
bot.unpinChatMessage(msg_chat_id) 
end
if text == 'الغاء تثبيت الكل' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).PinMsg == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه تثبيت الرسائل* ',"md",true)  
end
send(msg_chat_id,msg_id,"\n⎋ تم الغاء تثبيت جميع الرسائل","md",true)
for i=0, 20 do
local UnPin = bot.unpinChatMessage(msg_chat_id) 
if not bot.getChatPinnedMessage(msg_chat_id).id then
break
end
end
end
if text == "الحمايه" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'تعطيل الرابط', data = senderr..'/'.. 'unmute_link'},{text = 'تفعيل الرابط', data = senderr..'/'.. 'mute_link'},
},
{
{text = 'تعطيل الترحيب', data = senderr..'/'.. 'unmute_welcome'},{text = 'تفعيل الترحيب', data = senderr..'/'.. 'mute_welcome'},
},
{
{text = 'اتعطيل الايدي', data = senderr..'/'.. 'unmute_Id'},{text = 'اتفعيل الايدي', data = senderr..'/'.. 'mute_Id'},
},
{
{text = 'تعطيل الايدي بالصوره', data = senderr..'/'.. 'unmute_IdPhoto'},{text = 'تفعيل الايدي بالصوره', data = senderr..'/'.. 'mute_IdPhoto'},
},
{
{text = 'تعطيل الردود', data = senderr..'/'.. 'unmute_ryple'},{text = 'تفعيل الردود', data = senderr..'/'.. 'mute_ryple'},
},
{
{text = 'تعطيل الردود العامه', data = senderr..'/'.. 'unmute_ryplesudo'},{text = 'تفعيل الردود العامه', data = senderr..'/'.. 'mute_ryplesudo'},
},
{
{text = 'تعطيل الرفع', data = senderr..'/'.. 'unmute_setadmib'},{text = 'تفعيل الرفع', data = senderr..'/'.. 'mute_setadmib'},
},
{
{text = 'تعطيل الطرد', data = senderr..'/'.. 'unmute_kickmembars'},{text = 'تفعيل الطرد', data = senderr..'/'.. 'mute_kickmembars'},
},
{
{text = 'تعطيل الالعاب', data = senderr..'/'.. 'unmute_games'},{text = 'تفعيل الالعاب', data = senderr..'/'.. 'mute_games'},
},
{
{text = 'تعطيل اطردني', data = senderr..'/'.. 'unmute_kickme'},{text = 'تفعيل اطردني', data = senderr..'/'.. 'mute_kickme'},
},
{
{text = 'تعطيل التسليه', data = senderr..'/'.. 'unmute_thshesh'},{text = 'تفعيل التسليه', data = senderr..'/'.. 'mute_thshesh'},
},
{
{text = 'تعطيل منع التصفيه', data = senderr..'/'.. 'unmute_kicknum'},{text = 'تفعيل منع التصفيه', data = senderr..'/'.. 'mute_kicknum'},
},
{
{text = 'تعطيل الصيغ', data = senderr..'/'.. 'unmute_seck'},{text = 'تفعيل الصيغ', data = senderr..'/'.. 'mute_seck'},
},
{
{text = 'تعطيل غنيلي', data = senderr..'/'.. 'unmute_knile'},{text = 'تفعيل غنيلي', data = senderr..'/'.. 'mute_knile'},
},
{
{text = 'تعطيل الابراح', data = senderr..'/'.. 'unmute_brj'},{text = 'تفعيل الابراج', data = senderr..'/'.. 'mute_brj'},
},
{
{text = 'تعطيل الصوتيات', data = senderr..'/'.. 'unmute_audio'},{text = 'تفعيل الصوتيات', data = senderr..'/'.. 'mute_audio'},
},
{
{text = 'تعطيل الصوتيات العامه', data = senderr..'/'.. 'unmute_audioall'},{text = 'تفعيل الصوتيات العامه', data = senderr..'/'.. 'mute_audioall'},
},
{
{text = 'تعطيل تاك عام', data = senderr..'/'.. 'unmute_takall'},{text = 'تفعيل تاك عام', data = senderr..'/'.. 'mute_takall'},
},
{
{text = 'تعطيل تنبيه الاسماء', data = senderr..'/'.. 'unmute_namemy'},{text = 'تفعيل تنبيه الاسماء', data = senderr..'/'.. 'mute_namemy'},
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
return send(msg_chat_id, msg_id, '⎋ اوامر التفعيل والتعطيل ', 'md', false, false, false, false, reply_markup)
end  
if text == 'اعدادات الحمايه' then 
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if Redis:get(Fast.."Status:Link"..msg.chat_id) then
Statuslink = '❬ ✔️ ❭' else Statuslink = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:Welcome"..msg.chat_id) then
StatusWelcome = '❬ ✔️ ❭' else StatusWelcome = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:Id"..msg.chat_id) then
StatusId = '❬ ✔️ ❭' else StatusId = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:IdPhoto"..msg.chat_id) then
StatusIdPhoto = '❬ ✔️ ❭' else StatusIdPhoto = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:Reply"..msg.chat_id) then
StatusReply = '❬ ✔️ ❭' else StatusReply = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:ReplySudo"..msg.chat_id) then
StatusReplySudo = '❬ ✔️ ❭' else StatusReplySudo = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:BanId"..msg.chat_id)  then
StatusBanId = '❬ ✔️ ❭' else StatusBanId = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:SetId"..msg.chat_id) then
StatusSetId = '❬ ✔️ ❭' else StatusSetId = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
StatusGames = '❬ ✔️ ❭' else StatusGames = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:KickMe"..msg.chat_id) then
Statuskickme = '❬ ✔️ ❭' else Statuskickme = '❬ ❌ ❭'
end
if Redis:get(Fast.."Status:AddMe"..msg.chat_id) then
StatusAddme = '❬ ✔️ ❭' else StatusAddme = '❬ ❌ ❭'
end
local protectionGroup = '\n*⎋ اعدادات حمايه الجروب\n ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗\n'
..'\n⎋ جلب الرابط ➤ '..Statuslink
..'\n⎋ جلب الترحيب ➤ '..StatusWelcome
..'\n⎋ الايدي ➤ '..StatusId
..'\n⎋ الايدي بالصوره ➤ '..StatusIdPhoto
..'\n⎋ الردود ➤ '..StatusReply
..'\n⎋ الردود العامه ➤ '..StatusReplySudo
..'\n⎋ الرفع ➤ '..StatusSetId
..'\n⎋ الحظر - الطرد ➤ '..StatusBanId
..'\n⎋ الالعاب ➤ '..StatusGames
..'\n⎋ امر اطردني ➤ '..Statuskickme..'*\n\n.'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'قناه السورس', url = 'http://t.me/'..chsource..''}, 
},
}
}
return send(msg_chat_id, msg_id,protectionGroup,'md', false, false, false, false, reply_markup)
end
if text == "الاعدادات" then    
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Text = "*\n⎋ اعدادات الجروب ".."\n⎋ علامة ال (✔️) تعني مقفول".."\n⎋ علامة ال (❌) تعني مفتوح*"
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = GetSetieng(msg_chat_id).lock_links, data = '&'},{text = 'الروابط : ', data =senderr..'/'.. 'Status_link'},
},
{
{text = GetSetieng(msg_chat_id).lock_spam, data = '&'},{text = 'الكلايش : ', data =senderr..'/'.. 'Status_spam'},
},
{
{text = GetSetieng(msg_chat_id).lock_inlin, data = '&'},{text = 'الكيبورد : ', data =senderr..'/'.. 'Status_keypord'},
},
{
{text = GetSetieng(msg_chat_id).lock_vico, data = '&'},{text = 'الاغاني : ', data =senderr..'/'.. 'Status_voice'},
},
{
{text = GetSetieng(msg_chat_id).lock_gif, data = '&'},{text = 'المتحركه : ', data =senderr..'/'.. 'Status_gif'},
},
{
{text = GetSetieng(msg_chat_id).lock_file, data = '&'},{text = 'الملفات : ', data =senderr..'/'.. 'Status_files'},
},
{
{text = GetSetieng(msg_chat_id).lock_text, data = '&'},{text = 'الدردشه : ', data =senderr..'/'.. 'Status_text'},
},
{
{text = GetSetieng(msg_chat_id).lock_ved, data = '&'},{text = 'الفيديو : ', data =senderr..'/'.. 'Status_video'},
},
{
{text = GetSetieng(msg_chat_id).lock_photo, data = '&'},{text = 'الصور : ', data =senderr..'/'.. 'Status_photo'},
},
{
{text = GetSetieng(msg_chat_id).lock_user, data = '&'},{text = 'المعرفات : ', data =senderr..'/'.. 'Status_username'},
},
{
{text = GetSetieng(msg_chat_id).lock_hash, data = '&'},{text = 'التاك : ', data =senderr..'/'.. 'Status_tags'},
},
{
{text = GetSetieng(msg_chat_id).lock_bots, data = '&'},{text = 'البوتات : ', data =senderr..'/'.. 'Status_bots'},
},
{
{text = GetSetieng(msg_chat_id).farsia, data = '&'},{text = 'الفارسيه : ', data =senderr..'/'.. 'Status_farsia'},
},
{
{text = GetSetieng(msg_chat_id).tphlesh, data = '&'},{text = 'التفليش : ', data =senderr..'/'.. 'Status_tphlesh'},
},
{
{text = GetSetieng(msg_chat_id).alkfr, data = '&'},{text = 'الكفر : ', data =senderr..'/'.. 'Status_alkfr'},
},
{
{text = GetSetieng(msg_chat_id).alphsar, data = '&'},{text = 'الفشار : ', data =senderr..'/'.. 'Status_alphsar'},
},
{
{text = '- التالي ... ', data =senderr..'/'.. 'NextSeting'}
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
return send(msg_chat_id, msg_id, Text, 'md', false, false, false, false, reply_markup)
end  


if text == 'الجروب' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Info_Chats = bot.getSupergroupFullInfo(msg_chat_id)
local Get_Chat = bot.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '❬ ✔️ ❭' else web = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_change_info then
info = '❬ ✔️ ❭' else info = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_invite_users then
invite = '❬ ✔️ ❭' else invite = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_pin_messages then
pin = '❬ ✔️ ❭' else pin = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_media_messages then
media = '❬ ✔️ ❭' else media = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_messages then
messges = '❬ ✔️ ❭' else messges = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_other_messages then
other = '❬ ✔️ ❭' else other = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_polls then
polls = '❬ ✔️ ❭' else polls = '❬ ❌ ❭'
end
local permissions = '*\n⎋ صلاحيات الجروب :\n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗'..'\n⎋ ارسال الويب : '..web..'\n⎋ تغيير معلومات الجروب : '..info..'\n⎋ اضافه مستخدمين : '..invite..'\n⎋ تثبيت الرسائل : '..pin..'\n⎋ ارسال الميديا : '..media..'\n⎋ ارسال الرسائل : '..messges..'\n⎋ اضافه البوتات : '..other..'\n⎋ ارسال استفتاء : '..polls..'*\n\n'
local TextChat = '*\n⎋ معلومات الجروب :\n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗'..' \n⎋ اسم الجروب : ❬* ['..Get_Chat.title..']('..Info_Chats.invite_link.invite_link..')* ❭\n⎋ عدد الادمنيه : ❬ '..Info_Chats.administrator_count..' ❭\n⎋ عدد المحظورين : ❬ '..Info_Chats.banned_count..' ❭\n⎋ عدد الاعضاء : ❬ '..Info_Chats.member_count..' ❭\n⎋ عدد المقيديين : ❬ '..Info_Chats.restricted_count..' ❭\n⎋ الايدي : ❬ *`'..msg.chat_id..'`* ❭*\n'
if Info_Chats.photo then
bot.sendPhoto(msg.chat_id, msg.id, Info_Chats.photo.sizes[1].photo.remote.id,TextChat..permissions, "md")
else
return send(msg_chat_id,msg_id, TextChat..permissions,"md",true)
end
end


if text == 'صلاحيات الجروب' then 
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local Get_Chat = bot.getChat(msg_chat_id)
if Get_Chat.permissions.can_add_web_page_previews then
web = '❬ ✔️ ❭' else web = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_change_info then
info = '❬ ✔️ ❭' else info = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_invite_users then
invite = '❬ ✔️ ❭' else invite = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_pin_messages then
pin = '❬ ✔️ ❭' else pin = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_media_messages then
media = '❬ ✔️ ❭' else media = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_messages then
messges = '❬ ✔️ ❭' else messges = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_other_messages then
other = '❬ ✔️ ❭' else other = '❬ ❌ ❭'
end
if Get_Chat.permissions.can_send_polls then
polls = '❬ ✔️ ❭' else polls = '❬ ❌ ❭'
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- ارسال الويب : '..web, data = senderr..'/web'}, 
},
{
{text = '- تغيير معلومات الجروب : '..info, data =senderr..  '/info'}, 
},
{
{text = '- اضافه مستخدمين : '..invite, data =senderr..  '/invite'}, 
},
{
{text = '- تثبيت الرسائل : '..pin, data =senderr..  '/pin'}, 
},
{
{text = '- ارسال الميديا : '..media, data =senderr..  '/media'}, 
},
{
{text = '- ارسال الرسائل : .'..messges, data =senderr..  '/messges'}, 
},
{
{text = '- اضافه البوتات : '..other, data =senderr..  '/other'}, 
},
{
{text = '- ارسال استفتاء : '..polls, data =senderr.. '/polls'}, 
},
{
{text = '- اخفاء الامر ', data ='/delAmr'}
},
}
}
return send(msg_chat_id, msg_id, "⎋ الصلاحيات - ", 'md', false, false, false, false, reply_markup)
end
if text == 'تنزيل الكل' and msg.reply_to_message_id ~= 0 then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if Redis:sismember(Fast.."Devss:Groups",rep_idd) then
devQ = "المطور الثانوي ،" 
else 
devQ = "" 
end
if Redis:sismember(Fast.."Dev:Groups",rep_idd) then
dev = "المطور ،" 
else 
dev = "" 
end
if Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, rep_idd) then
crrQ = "المالك ،" 
else 
crrQ = "" 
end
if Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd) then
crr = "منشئ اساسي ،" 
else 
crr = "" 
end
if Redis:sismember(Fast..'Creator:Group'..msg_chat_id, rep_idd) then
cr = "منشئ ،" 
else 
cr = "" 
end
if Redis:sismember(Fast..'Manger:Group'..msg_chat_id, rep_idd) then
own = "مدير ،" 
else 
own = "" 
end
if Redis:sismember(Fast..'Admin:Group'..msg_chat_id, rep_idd) then
mod = "ادمن ،" 
else 
mod = "" 
end
if Redis:sismember(Fast..'Special:Group'..msg_chat_id, rep_idd) then
vip = "مميز ،" 
else 
vip = ""
end
if The_ControllerAll(rep_idd) == true then
Rink = 1
elseif Redis:sismember(Fast.."Devss:Groups",rep_idd)  then
Rink = 2
elseif Redis:sismember(Fast.."Dev:Groups",rep_idd)  then
Rink = 3
elseif Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, rep_idd) then
Rink = 4
elseif Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd) then
Rink = 5
elseif Redis:sismember(Fast.."Creator:Group"..msg_chat_id, rep_idd) then
Rink = 6
elseif Redis:sismember(Fast.."Manger:Group"..msg_chat_id, rep_idd) then
Rink = 7
elseif Redis:sismember(Fast.."Admin:Group"..msg_chat_id, rep_idd) then
Rink = 8
elseif Redis:sismember(Fast.."Special:Group"..msg_chat_id, rep_idd) then
Rink = 9
else
Rink = 10
end
if StatusCanOrNotCan(msg_chat_id,rep_idd) == false then
return send(msg_chat_id,msg_id,"\n*⎋ ليس لديه اي رتبه هنا *","md",true)  
end
if msg.Asasy then
if Rink == 1 or Rink < 1 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Devss:Groups",rep_idd)
Redis:srem(Fast.."Dev:Groups",rep_idd)
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Devss then
if Rink == 2 or Rink < 2 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Dev:Groups",rep_idd)
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Dev then
if Rink == 3 or Rink < 3 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Ownerss then
if Rink == 4 or Rink < 4 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.SuperCreator then
if Rink == 5 or Rink < 5 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Creator:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Creator then
if Rink == 6 or Rink < 6 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Manger:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Manger then
if Rink == 7 or Rink < 7 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Admin:Group"..msg_chat_id, rep_idd)
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
elseif msg.Admin then
if Rink == 8 or Rink < 8 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Special:Group"..msg_chat_id, rep_idd)
end
return send(msg_chat_id,msg_id,"\n*⎋ تم تنزيل المستخدم من الرتب التاليه { "..devQ..""..dev..""..crrQ..""..crr..""..cr..""..own..""..mod..""..vip.." *}","md",true)  
end

if text and text:match('^تنزيل الكل @(%S+)$') then
local UserName = text:match('^تنزيل الكل @(%S+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
if Redis:sismember(Fast.."Devss:Groups",UserId_Info.id) then
devQ = "المطور الثانوي ،" 
else 
devQ = "" 
end
if Redis:sismember(Fast.."Dev:Groups",UserId_Info.id) then
dev = "المطور ،" 
else 
dev = "" 
end
if Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id) then
crrQ = "المالك ،" 
else 
crrQ = "" 
end
if Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id) then
crr = "منشئ اساسي ،" 
else 
crr = "" 
end
if Redis:sismember(Fast..'Creator:Group'..msg_chat_id, UserId_Info.id) then
cr = "منشئ ،" 
else 
cr = "" 
end
if Redis:sismember(Fast..'Manger:Group'..msg_chat_id, UserId_Info.id) then
own = "مدير ،" 
else 
own = "" 
end
if Redis:sismember(Fast..'Admin:Group'..msg_chat_id, UserId_Info.id) then
mod = "ادمن ،" 
else 
mod = "" 
end
if Redis:sismember(Fast..'Special:Group'..msg_chat_id, UserId_Info.id) then
vip = "مميز ،" 
else 
vip = ""
end
if The_ControllerAll(UserId_Info.id) == true then
Rink = 1
elseif Redis:sismember(Fast.."Devss:Groups",UserId_Info.id)  then
Rink = 2
elseif Redis:sismember(Fast.."Dev:Groups",UserId_Info.id)  then
Rink = 3
elseif Redis:sismember(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id) then
Rink = 4
elseif Redis:sismember(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id) then
Rink = 5
elseif Redis:sismember(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id) then
Rink = 6
elseif Redis:sismember(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id) then
Rink = 7
elseif Redis:sismember(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id) then
Rink = 8
elseif Redis:sismember(Fast.."Special:Group"..msg_chat_id, UserId_Info.id) then
Rink = 9
else
Rink = 10
end
if StatusCanOrNotCan(msg_chat_id,UserId_Info.id) == false then
return send(msg_chat_id,msg_id,"\n*⎋ ليس لديه اي رتبه هنا *","md",true)  
end
if msg.Asasy then
if Rink == 1 or Rink < 1 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Devss:Groups",UserId_Info.id)
Redis:srem(Fast.."Dev:Groups",UserId_Info.id)
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Devss then
if Rink == 2 or Rink < 2 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Dev:Groups",UserId_Info.id)
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Dev then
if Rink == 3 or Rink < 3 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Ownerss:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Ownerss then
if Rink == 4 or Rink < 4 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."SuperCreator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.SuperCreator then
if Rink == 5 or Rink < 5 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Creator:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Creator then
if Rink == 6 or Rink < 6 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Manger:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Manger then
if Rink == 7 or Rink < 7 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Admin:Group"..msg_chat_id, UserId_Info.id)
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
elseif msg.Admin then
if Rink == 8 or Rink < 8 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكن تنزيل رتبه نفس رتبتك ولا اعلى من رتبتك *","md",true)  
end
Redis:srem(Fast.."Special:Group"..msg_chat_id, UserId_Info.id)
end
return send(msg_chat_id,msg_id,"\n*⎋ تم تنزيل المستخدم من الرتب التاليه { "..devQ..""..dev..""..crrQ..""..crr..""..cr..""..own..""..mod..""..vip.." *}","md",true)  
end
if text == "تنزيل جميع الرتب" then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Ownerss then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(8)..' , مالك الجروب }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."SuperCreator:Group"..msg_chat_id)
Redis:del(Fast.."Creator:Group"..msg_chat_id)
Redis:del(Fast.."Manger:Group"..msg_chat_id)
Redis:del(Fast.."Admin:Group"..msg_chat_id)
--Redis:del(Fast.."Special:Group"..msg_chat_id)
return send(msg_chat_id,msg_id,'\n*⎋ تم تنزيل جميع رتب الجروب { المنشئين الاساسسين , المنشئين , المدراء , الادمنيه  }* ',"md",true)  
end

if text and text:match('ضع لقب (.*)') and msg.reply_to_message_id ~= 0 then
local CustomTitle = text:match('ضع لقب (.*)')
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن او ليست لدي جميع الصلاحيات *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
local SetCustomTitle = https.request("https://api.telegram.org/bot"..Token.."/setChatAdministratorCustomTitle?chat_id="..msg_chat_id.."&user_id="..rep_idd.."&custom_title="..CustomTitle)
local SetCustomTitle_ = JSON.decode(SetCustomTitle)
if SetCustomTitle_.result == true then
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"⎋ تم وضع له لقب : "..CustomTitle).Reply,"md",true)  
else
return send(msg_chat_id,msg_id,"\n⎋ عذرآ هناك خطا تاكد من البوت ومن الشخص","md",true)  
end 
end
if text and text:match('^ضع لقب @(%S+) (.*)$') then
local UserName = {text:match('^ضع لقب @(%S+) (.*)$')}
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن او ليست لدي جميع الصلاحيات *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName[1])
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName[1]:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local SetCustomTitle = https.request("https://api.telegram.org/bot"..Token.."/setChatAdministratorCustomTitle?chat_id="..msg_chat_id.."&user_id="..UserId_Info.id.."&custom_title="..UserName[2])
local SetCustomTitle_ = JSON.decode(SetCustomTitle)
if SetCustomTitle_.result == true then
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⎋ تم وضع له لقب : "..UserName[2]).Reply,"md",true)  
else
return send(msg_chat_id,msg_id,"\n⎋ عذرآ هناك خطا تاكد من البوت ومن الشخص","md",true)  
end 
end 
if text and text:match("^ضع التكرار (%d+)$") then  
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
local Numbardel = text:match("^ضع التكرار (%d+)$")
Redis:hset(Fast.."Spam:Group:User"..msg_chat_id ,"Num:Spam",Numbardel)  
send(msg_chat_id,msg_id, 'تم تعيين عدد التكرار الى  : '..Numbardel)
end
if text == ('رفع مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
local SetAdmin = bot.setChatMemberStatus(msg.chat_id,rep_idd,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكنني رفعه ليس لدي صلاحيات *","md",true)  
end
https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. msg.chat_id .. "&user_id=" ..rep_idd.."&&can_manage_voice_chats=true")
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- تعديل الصلاحيات ', data = senderr..'/groupNumseteng//'..rep_idd}, 
},
}
}
return send(msg_chat_id, msg_id, "⎋ صلاحيات المستخدم - ", 'md', false, false, false, false, reply_markup)
end
if text and text:match('^رفع مشرف @(%S+)$') then
local UserName = text:match('^رفع مشرف @(%S+)$')
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local SetAdmin = bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{1 ,1, 0, 0, 0, 0, 0 , 0, 0, 0, 0, 0, ''})
if SetAdmin.code == 3 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكنني رفعه ليس لدي صلاحيات *","md",true)  
end
https.request("https://api.telegram.org/bot" .. Token .. "/promoteChatMember?chat_id=" .. msg.chat_id .. "&user_id=" ..UserId_Info.id.."&&can_manage_voice_chats=true")
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- تعديل الصلاحيات ', data = senderr..'/groupNumseteng//'..UserId_Info.id}, 
},
}
}
return send(msg_chat_id, msg_id, "⎋ صلاحيات المستخدم - ", 'md', false, false, false, false, reply_markup)
end 
if text == ('تنزيل مشرف') and msg.reply_to_message_id ~= 0 then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
local SetAdmin = bot.setChatMemberStatus(msg.chat_id,rep_idd,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then
return send(msg_chat_id,msg_id,"\n*⎋ لست انا من قام برفعه *","md",true)  
end
if SetAdmin.code == 3 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكنني تنزيله ليس لدي صلاحيات *","md",true)  
end
return send(msg_chat_id,msg_id,Reply_Status(rep_idd,"⎋ تم تنزيله من المشرفين ").Reply,"md",true)  
end
if text and text:match('^تنزيل مشرف @(%S+)$') then
local UserName = text:match('^تنزيل مشرف @(%S+)$')
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).SetAdmin == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه اضافة مشرفين* ',"md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local SetAdmin = bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'administrator',{0 ,0, 0, 0, 0, 0, 0 ,0, 0})
if SetAdmin.code == 400 then
return send(msg_chat_id,msg_id,"\n*⎋ لست انا من قام برفعه *","md",true)  
end
if SetAdmin.code == 3 then
return send(msg_chat_id,msg_id,"\n*⎋ لا يمكنني تنزيله ليس لدي صلاحيات *","md",true)  
end
return send(msg_chat_id,msg_id,Reply_Status(UserId_Info.id,"⎋ تم تنزيله من المشرفين ").Reply,"md",true)  
end 
if text == 'مسح رسائلي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Num:Message:User'..msg.chat_id..':'..senderr)
send(msg_chat_id,msg_id,'⎋ تم مسح جميع رسائلك ',"md",true)  
elseif text == 'مسح تعديلاتي' or text == 'مسح تعديلاتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Num:Message:Edit'..msg.chat_id..senderr)
send(msg_chat_id,msg_id,'?? تم مسح جميع تعديلاتك ',"md",true)  
elseif text == 'مسح جهاتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Num:Add:Memp'..msg.chat_id..':'..senderr)
send(msg_chat_id,msg_id,'⎋ تم مسح جميع جهاتك المضافه ',"md",true)  
elseif text == 'رسائلي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,'⎋ عدد رسائلك هنا *~ '..(Redis:get(Fast..'Num:Message:User'..msg.chat_id..':'..senderr) or 1)..'*',"md",true)  
elseif text == 'تعديلاتي' or text == 'تعديلاتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,'⎋ عدد التعديلات هنا *~ '..(Redis:get(Fast..'Num:Message:Edit'..msg.chat_id..senderr) or 0)..'*',"md",true)  
elseif text == 'جهاتي' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,'⎋ عدد جهاتك المضافه هنا *~ '..(Redis:get(Fast.."Num:Add:Memp"..msg.chat_id..":"..senderr) or 0)..'*',"md",true)  
elseif text == 'مسح' and msg.reply_to_message_id ~= 0 and msg.Admin then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if GetInfoBot(msg).Delmsg == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه مسح الرسائل* ',"md",true)  
end
bot.deleteMessages(msg.chat_id,{[1]= msg.reply_to_message_id})
bot.deleteMessages(msg.chat_id,{[1]= msg_id})
end

if text == 'تفاعل الجروب' and msg.reply_to_message_id == 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Message = msg.id/2097152/0.5
local MsgText = ''  

if tonumber(Message) < 200 then 
MsgText = 'سايق مخده 😹' 
elseif tonumber(Message) < 400 then 
MsgText = 'الله بالخير 👋'
elseif tonumber(Message) < 600 then 
MsgText = 'عفيه اتفاعل 😽' 
elseif tonumber(Message) < 800 then 
MsgText = 'بدأ يتحسن 😐' 
elseif tonumber(Message) < 1000 then 
MsgText = 'شكد تحجي 😒' 
elseif tonumber(Message) < 1300 then 
MsgText = 'استمر بطل 😍' 
elseif tonumber(Message) < 1600 then 
MsgText = 'تفاعل غنبله 🙂'  
elseif tonumber(Message) < 1800 then 
MsgText = 'استمر يعسل 🥳' 
elseif tonumber(Message) < 2200 then 
MsgText = 'جيد جدا ♥️' 
elseif tonumber(Message) < 2600 then 
MsgText = 'ممتاز جدا 🥰' 
elseif tonumber(Message) < 3000 then 
MsgText = 'مــلــک 💯😻' 
elseif tonumber(Message) < 3600 then 
MsgText = 'اسطورة التفاعل❤️' 
elseif tonumber(Message) < 15092041118 then 
MsgText = 'ملك التلكرام 💖'  
end 

return send(msg_chat_id,msg_id,"⎋ تفاعل الجروب : "..MsgText, "md")
end

if text == "تفعيل شخصيه" or text == "تفعيل شخصيتي" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
Redis:del(Fast.."shakse"..msg_chat_id)
send(msg_chat_id,msg_id,'*\n ✧ تم تفعيل امر شخصيتي *',"md",true)  
end
if text == "تعطيل شخصيتي" or text == "تعطيل شخصيه" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
Redis:set(Fast.."shakse"..msg_chat_id,"off")
send(msg_chat_id,msg_id,'*\n ✧ تم تعطيل امر شخصيتي *',"md",true)  
end
if text == "تفعيل شبيهي" or text == "تفعيل شبيه" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
Redis:del(Fast.."likweme"..msg_chat_id)
send(msg_chat_id,msg_id,'*\n ✧ تم تفعيل امر شبيهي *',"md",true)  
end
if text == "تعطيل شبيهي" or text == "تعطيل شبيه" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
Redis:set(Fast.."likweme"..msg_chat_id,"off")
send(msg_chat_id,msg_id,'*\n ✧ تم تعطيل امر شبيهي *',"md",true)  
end
if text == "تفعيل مهنه" or text == "تفعيل مهنتي" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
Redis:del(Fast.."Mostafa"..msg_chat_id)
send(msg_chat_id,msg_id,'*\n ⎋ تم تفعيل امر مهنتي *',"md",true)  
end
if text == "تعطيل مهنتي" or text == "تعطيل مهنه" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
Redis:set(Fast.."Mostafa"..msg_chat_id,"off")
send(msg_chat_id,msg_id,'*\n ⎋ تم تعطيل امر مهنتي*',"md",true)  
end
if (text == 'مهنتي' or text == 'المهنه' or text == 'المهنة') and not Redis:get(Fast.."Mostafa"..msg_chat_id) then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local FiJABWA = (Redis:get(Fast.."Game:name"..senderr) or "لا يوجد")
local JABWA = FiJABWA:gsub('@','')
local Fixage = (Redis:get(Fast.."Game:Sunni"..senderr) or "لا يوجد")
local Fast = Fixage:gsub('@','')
local texting = {"نقاش", "دكتور","دكتوره", "طيار ", "طياره", "مدرس ", "مدير", "مديره", "محاسب ", "محسابه", "نقاشه", "مدير بنك","مديرة بنك","وزير","وزيره","ظابط ","ظابطه","شيخه","شيخ",} 
zezee = texting[math.random(#texting)]
local Age = {"سنجل", "اعزب","متجوز", "سنجله ", "متجوزه", "ارمل ", "مصلقه", "خاطب", "مخطوبه ", "سعيد", "حزين", "غني","فقير",} 
ageu = Age[math.random(#Age)]
local Jabwa = bot.getUser(senderr)
local photo = bot.getUserProfilePhotos(senderr)
local profession1 = '🎀 اسمك ⇿ '..JABWA
local profession2 = '✨ سنك ⇿ '..Fast
local profession3 = '♥ مهنتك ⇿ '..zezee
local profession4 = '❇️ حالتك ⇿ '..ageu
if photo.total_count > 0 then
data = {} 
data.inline_keyboard = {
{
{text =profession1,url = "https://t.me/"..Jabwa.username..""}, 
},
{
{text =profession2,url = "https://t.me/"..Jabwa.username..""}, 
},
{
{text =profession3,url = "https://t.me/"..Jabwa.username..""}, 
},
{
{text =profession4,url = "https://t.me/"..Jabwa.username..""}, 
},
}
local msgg = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg.chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&photo=".. URL.escape(zezee).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(data))
end
end
if text == 'شبيهي' or text =='شبيه' then
local t = '*قم بختيار عملية الشبيه *'
local photo = bot.getUserProfilePhotos(Fast)
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'رجل اعمال ⎋', callback_data=senderr..'/Business'},{text = 'لاعب كرة قدم ⎋', callback_data=senderr..'/Football'},
},
{
{text = 'ممثل ⎋', callback_data=senderr..'/amusement'},{text = 'مغني ⎋', callback_data=senderr..'/Singer'},
},
{
{text='⌁ قناة السورس ',url='t.me/'..chsource..''},
}
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(t).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == 'شخصيتي' or text == 'نوع شخصيتي' then
local nspp = {"شكاك","متعاونة","رومنسية","اجتماعية","كلاسيكية","متردده","ايجابية","نرجسية","قيادية","محفزة","مسالمة","قويه","ضعيفة","غامضة","اجتماعية","رومنسية","قويه","كلاسيكية","ما عندك شخصيه","","عصبي","ما عندك شخصيه","مسالمة","مسالمة",}
nsppp = nspp[math.random(#nspp)]
send(msg_chat_id,msg_id,'\nشخصيتك ↢ '..nsppp..' ',"md",true)  
end

if text == "انا مين" then
if msg.sender_id.user_id == tonumber(1400467850) then
send(msg_chat_id,msg_id,"⎋ انت كينج مطور السورس يقلبي🌚♥","md",true)
elseif msg.sender_id.user_id == tonumber(5566753847) then
send(msg_chat_id,msg_id,"⎋ انت سواد مطور السورس يقلبي🌚♥","md",true)
elseif msg.sender_id.user_id == tonumber(5092041118) then
send(msg_chat_id,msg_id,"⎋ انت شيكو مطور السورس يقلبي🌚♥","md",true)
elseif msg.sender_id.user_id == tonumber(9999999990) then
send(msg_chat_id,msg_id,"انت جنرال شيكو يقلبي انت🥺❤","md",true)
elseif msg.sender_id.user_id == tonumber(509204111895) then
send(msg_chat_id,msg_id,"انتي شيكو يقلبي🥺♥","md",true)
elseif msg.sender_id.user_id == tonumber(3333333333333) then
send(msg_chat_id,msg_id,"⎋ انت ساريو مطور السورس يقلبي🌚♥","md",true)
elseif msg.sender_id.user_id == tonumber(Sudo_Id) then
send(msg_chat_id,msg_id,"⎋ انت المطور الاساسي يقلبي🌚♥","md",true)
elseif msg.Devss then
send(msg_chat_id,msg_id,"⎋ انت مطوري نور عيني🙄♥","md",true)
elseif msg.Dev then
send(msg_chat_id,msg_id,"⎋ انت مطوري نور عيني🙄♥","md",true)
elseif msg.Owners then
send(msg_chat_id,msg_id,"⎋ انت مالك الجروب يقلبي🌚♥","md",true)
elseif msg.Supcreator then
send(msg_chat_id,msg_id,"⎋ انت منشئ اساسي يقلبي🌚♥","md",true)
elseif msg.Creator then
send(msg_chat_id,msg_id,"⎋ انت هنا منشئ يقلبي🌚♥","md",true)
elseif msg.Manger then
send(msg_chat_id,msg_id,"⎋ انت هنا مدير يقلبي🌚♥","md",true)
elseif msg.Admin then
send(msg_chat_id,msg_id,"⎋ انت هنا ادمن يقلبي🌚♥","md",true)
elseif msg.Special then
send(msg_chat_id,msg_id,"⎋ انت هنا مميز يقلبي🌚♥","md",true)
else 
send(msg_chat_id,msg_id,"⎋ مجرد عضو هنا","md",true)
end 
end
if text == 'تعيين الايدي' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Redis:Id:Group"..msg.chat_id..""..senderr,240,true)  
return send(msg_chat_id,msg_id,[[
⎋ ارسل الان النص
⎋ يمكنك اضافه :
⎋ `#username` » اسم المستخدم
⎋ `#msgs` » عدد الرسائل
⎋ `#photos` » عدد الصور
⎋ `#id` » ايدي المستخدم
⎋ `#auto` » نسبة التفاعل
⎋ `#stast` » رتبة المستخدم 
⎋ `#edit` » عدد التعديلات
⎋ `#game` » عدد النقاط
⎋ `#AddMem` » عدد الجهات
⎋ `#Description` » تعليق الصوره
⎋ `#Bio` » البايو.
]],"md",true)    
end 
if text == 'مسح الايدي' or text == 'مسح الايدي' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Set:Id:Group"..msg.chat_id)
return send(msg_chat_id,msg_id, '⎋ تم ازالة كليشة الايدي ',"md",true)  
end
if text == 'تغيير الايدي' or text == 'تغير الايدي' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local List = { 
[[
↫ #Description
 ℘︙معرفك ~⪼ #username
 ℘︙ايديك ~⪼ #id
 ℘︙رتبتك ~⪼ #stast  
 ℘︙تفاعلك ~⪼ #auto
 ℘︙رسائلك ~⪼ #msgs
 ℘︙تعديلاتك ~⪼ #edit
 ℘︙نقاطك ~⪼ #game
 ℘︙البايو ~⪼ #Bio
]],[[
↫ #Description
⌁︙ايديك↫ #id
⌁︙معرفك↫ #username
⌁︙رتبتك↫ #stast
⌁︙تفاعلك↫ #auto
⌁︙رسائلك↫ #msgs 
⌁︙تعديلاتك↫ #edit
⌁︙نقاطك↫ #game
]],
[[
↫ #Description
⌁︙ايديك↫ #id
⌁︙معرفك↫ #username
⌁︙رتبتك↫ #stast
⌁︙تفاعلك↫ #auto
⌁︙رسائلك↫ #msgs 
⌁︙تعديلاتك↫ #edit
⌁︙نقاطك↫ #game
⌁︙البايو↫ #Bio
]],
[[
⎋ #Description
⎋ ايديـك ❪ #id ❫
⎋ معرفـك ❪ #username ❫
⎋ رتبتـك ❪ #stast ❫
⎋ تفاعلك ❪ #auto  ❫
⎋ رسائلك ❪ #msgs ❫
⎋ تعديلاتـك ❪ #edit ❫
⎋ نقاطك ❪ #game ❫
]],
[[ 
゠𝚄𝚂𝙴𝚁 𖨈 #username 𖥲 . 
゠𝙼𝚂𝙶 𖨈 #msgs 𖥲 . 
゠𝚂𝚃𝙰 𖨈 #stast 𖥲 . 
゠𝙸𝙳 𖨈 #id 𖥲 . 
]], 
[[⎋ ᴜѕᴇʀɴᴀᴍᴇ ➥⎋ #username . 
⎋ ᴍѕɢѕ ➥⎋ #msgs . 
⎋ ѕᴛᴀᴛѕ ➥⎋ #stast . 
⎋ ʏᴏᴜʀ ɪᴅ ➥⎋ #id  . 
⎋ ᴇᴅɪᴛ ᴍsɢ ➥⎋ #edit . 
⎋ ᴅᴇᴛᴀɪʟs ➥⎋ #auto .  
⎋ ɢᴀᴍᴇ ➥⎋ #game .]], 
[[ 
➭- 𝒔𝒕𝒂𓂅 #stast 𓍯. 💕 
➮- 𝒖𝒔𝒆𝒓𓂅 #username 𓍯. 💕 
➭- 𝒎𝒆𝒔𝒔𝒂𝒈𝒆𓂅 #msgs 𓍯. ?? 
➭- 𝒊𝒅 𓂅 #id 𓍯. 💕 
]], 
[[ 
⚕ 𓆰 𝑾𝒆𝒍𝒄𝒐𝒎𝒆 𝑻𝒐 𝑮𝒓𝒐𝒖𝒑 ⎋
⎋ 🖤 | 𝑼𝑬𝑺 : #username ‌‌‏⚚ 
⎋ 🖤 | 𝑺??𝑨 : #stast 🧙🏻‍♂ 
⎋ 🖤 | 𝑰𝑫 : #id ‌‌‏♕ 
⎋ 🖤 | 𝑴𝑺𝑮 : #msgs 𓆊 
]], 
[[ 
┌ 𝐔𝐒𝐄𝐑 𖤱 #username 𖦴 . 
├ 𝐌𝐒𝐆𖤱 #msgs 𖦴 . 
├ 𝐒𝐓𝐀 𖤱 #stast 𖦴 . 
└ 𝐈𝐃 𖤱 #id 𖦴 . 
]], 
[[ 
𓄼🇪🇬𝑼𝒔𝒆𝒓𝑵𝒂𝒎𝒆 :#username  
𓄼🇪🇬𝑺𝒕𝒂𝒔𝒕 :#stast  
𓄼🇪🇬𝒊𝒅 :#id  
𓄼🇪🇬 𝑮𝒂𝒎𝒆𝑺 :#game  
𓄼🇪🇬𝑴𝒔𝒈𝒔 :#msgs 
]], 
[[ 
➞: 𝒔𝒕𝒂𓂅 #stast 𓍯➸??. 
➞: 𝒖𝒔𝒆𝒓𓂅 #username 𓍯➸💞. 
➞: 𝒎𝒔𝒈𝒆𓂅 #msgs 𓍯➸💞. 
➞: 𝒊𝒅 𓂅 #id 𓍯➸💞. 
]], 
[[ 
☆⎋ 𝐮𝐬𝐞𝐫 : #username 𖣬   
☆⎋ 𝐦𝐬𝐠  : #msgs 𖣬  
☆⎋ 𝐬𝐭𝐚 : #stast 𖣬  
☆⎋ 𝐢𝐝  : #id 𖣬 
]], 
[[ 
- 𓏬 𝐔𝐒𝐄𝐫 : #username 𓂅 . 
- 𓏬 𝐌𝐬𝐆  : #msgs 𓂅 . 
- 𓏬 𝐒𝐭𝐀 : #stast 𓂅 . 
- 𓏬 𝐈𝐃 : #id 𓂅 . 
]], 
[[ 
.𖣂 𝘂𝘀𝗲𝗿 𝗻𝗮𝗺𝙚 , #username   
.𖣂 𝙨𝙩𝙖𝙨𝙩 , #stast   
.𖣂 𝙡𝘿 , #id   
.𖣂 𝙂𝙖𝙢𝙨 , #game  
.𖣂 𝙢𝙨𝙂𝙨 , #msgs 
]]} 
local Text_Rand = List[math.random(#List)] 
Redis:set(Fast.."Set:Id:Group"..msg.chat_id,Text_Rand)
return send(msg_chat_id,msg_id, '⎋ تم التغيير ارسل ايدي لعرض الايدي الجديد',"md",true)  
end
if text == 'مسح الايدي عام' or text == 'مسح الايدي عام' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Set:Id:Groups")
return send(msg_chat_id,msg_id, '⎋ تم ازالة كليشة الايدي ',"md",true)  
end
if text == 'تعيين الايدي عام' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Redis:Id:Groups"..msg.chat_id..""..senderr,240,true)  
return send(msg_chat_id,msg_id,[[
⎋ ارسل الان النص
⎋ يمكنك اضافه :
⎋ `#username` » اسم المستخدم
⎋ `#msgs` » عدد الرسائل
⎋ `#photos` » عدد الصور
⎋ `#id` » ايدي المستخدم
⎋ `#auto` » نسبة التفاعل
⎋ `#stast` » رتبة المستخدم 
⎋ `#edit` » عدد التعديلات
⎋ `#game` » عدد النقاط
⎋ `#AddMem` » عدد الجهات
⎋ `#Description` » تعليق الصوره
⎋ `#Bio` » البايو.
]],"md",true)    
end 

if text and text:match("^مسح (.*)$") and msg.reply_to_message_id == 0 then
local TextMsg = text:match("^مسح (.*)$")
if TextMsg == 'المطورين الثانوين' or TextMsg == 'المطورين الثانويين' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"⎋ لا يوجد مطورين ثانوين حاليا , ","md",true)  
end
Redis:del(Fast.."Devss:Groups") 
return send(msg_chat_id,msg_id,"*⎋ تم مسح {"..#Info_Members.."} من المطورين الثانويين*","md",true)
end
if TextMsg == 'المطورين' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"⎋ لا يوجد مطورين حاليا , ","md",true)  
end
Redis:del(Fast.."Dev:Groups") 
return send(msg_chat_id,msg_id,"*⎋ تم مسح {"..#Info_Members.."} من المطورين *","md",true)
end
if TextMsg == 'المالكين' then
local StatusMember = bot.getChatMember(msg_chat_id,senderr).status.Fastbots
if (StatusMember == "chatMemberStatusCreator") then
statusvar = true
elseif msg.Dev then
statusvar = true
else
statusvar = false
end
if statusvar == false then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(3)..' , مالك الجروب }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Memberss = Redis:smembers(Fast.."Ownerss:Group"..msg_chat_id) 
if #Info_Memberss == 0 then
return send(msg_chat_id,msg_id,"⎋ لا يوجد المالكين حاليا , ","md",true)  
end
Redis:del(Fast.."Ownerss:Group"..msg_chat_id) 
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Administrators", "*", 0, 200)
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
if Info_Members.members[k].bot_info == nil then
if Info_Members.members[k].status.Fastbots == "chatMemberStatusCreator" then
Redis:sadd(Fast.."Ownerss:Group"..msg_chat_id,v.member_id.user_id) 
end
end
end
return send(msg_chat_id,msg_id,"*⎋ تم مسح {"..#Info_Memberss.."} من مالكين *","md",true)
end
if TextMsg == 'المنشئين الاساسيين' then
if not msg.Ownerss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(8)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."SuperCreator:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"⎋ لا يوجد منشئين اساسيين حاليا , ","md",true)  
end
Redis:del(Fast.."SuperCreator:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*⎋ تم مسح {"..#Info_Members.."} من المنشؤين الاساسيين *","md",true)
end
if TextMsg == 'المنشئين' then
if not msg.SuperCreator then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(4)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Creator:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"⎋ لا يوجد منشئين حاليا , ","md",true)  
end
Redis:del(Fast.."Creator:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*⎋ تم مسح {"..#Info_Members.."} من المنشئين *","md",true)
end
if TextMsg == 'المدراء' then
if not msg.Creator then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(5)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Manger:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"⎋ لا يوجد مدراء حاليا , ","md",true)  
end
Redis:del(Fast.."Manger:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*⎋ تم مسح {"..#Info_Members.."} من المدراء *","md",true)
end
if TextMsg == 'الادمنيه' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Admin:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"⎋ لا يوجد ادمنيه حاليا , ","md",true)  
end
Redis:del(Fast.."Admin:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*⎋ تم مسح {"..#Info_Members.."} من الادمنيه *","md",true)
end
if TextMsg == 'المميزين' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Special:Group"..msg_chat_id) 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"⎋ لا يوجد مميزين حاليا , ","md",true)  
end
Redis:del(Fast.."Special:Group"..msg_chat_id) 
return send(msg_chat_id,msg_id,"*⎋ تم مسح {"..#Info_Members.."} من المميزين *","md",true)
end
if TextMsg == 'المحظورين عام' or TextMsg == 'قائمه العام' then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"⎋ لا يوجد محظورين عام حاليا , ","md",true)  
end
Redis:del(Fast.."BanAll:Groups") 
return send(msg_chat_id,msg_id,"*⎋ تم مسح {"..#Info_Members.."} من المحظورين عام *","md",true)
end
if TextMsg == 'المقيدين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Recent", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
local y = false
for k, v in pairs(List_Members) do
if Info_Members.members[k].status.is_member == true and Info_Members.members[k].status.luatele == "chatMemberStatusRestricted" then
bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1})
x = x + 1
y = true
end
end
if y == true then
return send(msg_chat_id,msg_id,"*⎋ تم مسح {"..x.."} من المقيديين *","md",true)
else
send(msg_chat_id,msg_id,'⎋ لا يوجد مقيدين ',"md",true)  
end
end
if TextMsg == 'البوتات' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local Ban_Bots = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if Ban_Bots.Fastbots == "ok" then
x = x + 1
end
end
return send(msg_chat_id,msg_id,"\n*⎋ عدد البوتات الموجوده : "..#List_Members.."\n⎋ تم طرد ( "..x.." ) بوت من الجروب *","md",true)  
end
if TextMsg == 'المطرودين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*𖠷 هذا الامر يخص  '..Controller_Num(6)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local chinfo = Redis:get(Fast.."ch:admin")
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = chinfo}, },}}
return send(msg.chat_id,msg.id,'*\n𖠷 عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*𖠷 عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*𖠷 البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = LuaTele.getSupergroupMembers(msg_chat_id, "Banned", "*", 0, 200)
x = 0
local List_Members = Info_Members.members
for k, v in pairs(List_Members) do
UNBan_Bots = LuaTele.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'restricted',{1,1,1,1,1,1,1,1,1})
if UNBan_Bots.luatele == "ok" then
x = x + 1
end
end
return send(msg_chat_id,msg_id,"\n*𖠷عدد المطرودين في الجروب : "..#List_Members.."\n𖠷 تم الغاء الحظر عن ( "..x.." ) من الاشخاص*","md",true)  
end
if TextMsg == 'المحذوفين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
x = 0
local y = false
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.type.Fastbots == "userTypeDeleted" then
local userTypeDeleted = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if userTypeDeleted.Fastbots == "ok" then
x = x + 1
y = true
end
end
end
if y == true then
return send(msg_chat_id,msg_id,"\n*⎋ تم طرد ( "..x.." ) حساب محذوف *","md",true)  
else
send(msg_chat_id,msg_id,'⎋ لا يوجد محذوفين ',"md",true)  
end
end
end
if text == 'طرد المحذوفين' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*☆︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true) 
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Snap..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Snap..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n☆︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Snap..'Channel:Join:Name'), url = 't.me/'..Redis:get(Snap..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n☆︙ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*☆︙عذرآ البوت ليس ادمن في الكروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*☆︙البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.searchChatMembers(msg_chat_id, "*", 200)
local List_Members = Info_Members.members
x = 0
local y = false
for k, v in pairs(List_Members) do
local UserInfo = bot.getUser(v.member_id.user_id)
if UserInfo.type.luatele == "userTypeDeleted" then
local userTypeDeleted = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if userTypeDeleted.luatele == "ok" then
x = x + 1
y = true
end
end
end
if y == true then
return send(msg_chat_id,msg_id,"\n*☆︙تم طرد ( "..x.." ) حساب محذوف *","md",true)  
else
send(msg_chat_id,msg_id,'☆︙لا يوجد محذوفين ',"md",true)  
end
end
if text == 'طرد البوتات' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
if GetInfoBot(msg).BanUser == false then
return send(msg_chat_id,msg_id,'\n*⎋ البوت ليس لديه صلاحيه حظر المستخدمين* ',"md",true)  
end
local Info_Members = bot.getSupergroupMembers(msg_chat_id, "Bots", "*", 0, 200)
local List_Members = Info_Members.members
x = 0
for k, v in pairs(List_Members) do
local Ban_Bots = bot.setChatMemberStatus(msg.chat_id,v.member_id.user_id,'banned',0)
if Ban_Bots.Fastbots == "ok" then
x = x + 1
end
end
return send(msg_chat_id,msg_id,"\n*⎋ عدد البوتات الموجوده : "..#List_Members.."\n⎋ تم طرد ( "..x.." ) بوت من الجروب *","md",true)  
end
if text == ("مسح الردود") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager"..msg_chat_id.."")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Manager:Gif"..v..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Vico"..v..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Stekrs"..v..msg_chat_id)     
Redis:del(Fast.."Add:Rd:Manager:Text"..v..msg_chat_id)   
Redis:del(Fast.."Add:Rd:Manager:Photo"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio"..v..msg_chat_id)
Redis:del(Fast.."List:Manager"..msg_chat_id)
end
return send(msg_chat_id,msg_id,"⎋ تم مسح قائمه الردود","md",true)  
end
if text == ("الردود") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager"..msg_chat_id.."")
text = "⎋ قائمه الردود \n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Manager:Gif"..v..msg_chat_id) then
db = "متحركه 🎭"
elseif Redis:get(Fast.."Add:Rd:Manager:Vico"..v..msg_chat_id) then
db = "بصمه 📢"
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs"..v..msg_chat_id) then
db = "ملصق 🃏"
elseif Redis:get(Fast.."Add:Rd:Manager:Text"..v..msg_chat_id) then
db = "رساله ✉"
elseif Redis:get(Fast.."Add:Rd:Manager:Photo"..v..msg_chat_id) then
db = "صوره 🎇"
elseif Redis:get(Fast.."Add:Rd:Manager:Video"..v..msg_chat_id) then
db = "فيديو ??"
elseif Redis:get(Fast.."Add:Rd:Manager:File"..v..msg_chat_id) then
db = "ملف ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:Audio"..v..msg_chat_id) then
db = "اغنيه 🎵"
elseif Redis:get(Fast.."Add:Rd:Manager:video_note"..v..msg_chat_id) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "⎋ عذرا لا يوجد ردود مضافه في الجروب"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == "اضف رد" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Manager:rd"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"⎋ ارسل الان اسم الرد لاضافته في الردود ", 'md', false, false, false, false, reply_markup)
end
if text == "مسح رد" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Manager:rd"..senderr..":"..msg_chat_id,"true2")
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"⎋ ارسل الان اسم الرد لمسحه من الردود", 'md', false, false, false, false, reply_markup)
end
if text == ("مسح الردود العامه") then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Sudo:Gif"..v)   
Redis:del(Fast.."Add:Rd:Sudo:vico"..v)   
Redis:del(Fast.."Add:Rd:Sudo:stekr"..v)     
Redis:del(Fast.."Add:Rd:Sudo:Text"..v)   
Redis:del(Fast.."Add:Rd:Sudo:Photo"..v)
Redis:del(Fast.."Add:Rd:Sudo:Video"..v)
Redis:del(Fast.."Add:Rd:Sudo:File"..v)
Redis:del(Fast.."Add:Rd:Sudo:Audio"..v)
Redis:del(Fast.."Add:Rd:Sudo:video_note"..v)
Redis:del(Fast.."List:Rd:Sudo")
end
return send(msg_chat_id,msg_id,"⎋ تم مسح الردود العامه","md",true)  
end
if text == ("الردود العامه") then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo")
text = "\n📝︙قائمة الردود العامه \n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(Fast.."Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(Fast.."Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(Fast.."Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(Fast.."Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(Fast.."Add:Rd:Sudo:File"..v) then
db = "ملف ⎋"
elseif Redis:get(Fast.."Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(Fast.."Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "⎋ لا توجد ردود للمطور"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == "اضف رد عام" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Rd"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"⎋ ارسل الان اسم الرد لاضافته في الردود العامه ", 'md', false, false, false, false, reply_markup)
end
if text == "مسح رد عام" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:On"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '- الغاء الامر ', data =senderr..'/cancelamr'}
},
}
}
return send(msg_chat_id,msg_id,"⎋ ارسل الان الكلمه لمسحها من الردود العامه", 'md', false, false, false, false, reply_markup)
end
if text=="اذاعه خاص" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Users" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف ⎋ملصق ⎋متحركه ⎋صوره
 ⎋فيديو ⎋بصمه الفيديو ⎋بصمه ⎋صوت ⎋رساله ❩
⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف ⎋ملصق ⎋متحركه ⎋صوره
 ⎋فيديو ⎋بصمه الفيديو ⎋بصمه ⎋صوت ⎋رساله ❩
⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتثبيت" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف ⎋ملصق ⎋متحركه ⎋صوره
 ⎋فيديو ⎋بصمه الفيديو ⎋بصمه ⎋صوت ⎋رساله ❩
⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتوجيه" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,"⎋ ارسل لي التوجيه الان\n⎋ ليتم نشره في المجموعات","md",true)  
return false
end

if text=="اذاعه خاص بالتوجيه" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,"⎋ ارسل لي التوجيه الان\n⎋ ليتم نشره الى المشتركين","md",true)  
return false
end
if text == 'كشف القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,rep_idd).status 
if GetMemberStatus.Fastbots == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,rep_idd).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,rep_idd).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,rep_idd).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
send(msg_chat_id,msg_id,"\n*⎋ معلومات الكشف \n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗"..'\n⎋ الحظر العام : '..BanAll..'\n⎋ الحظر : '..BanGroup..'\n⎋ الكتم : '..SilentGroup..'\n⎋ التقييد : '..Restricted..'*',"md",true)  
end
if text and text:match('^كشف القيود @(%S+)$') then
local UserName = text:match('^كشف القيود @(%S+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,UserId_Info.id).status 
if GetMemberStatus.Fastbots == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
else
Restricted = 'غير مقيد'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true then
BanAll = 'محظور عام'
else
BanAll = 'غير محظور عام'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور'
else
BanGroup = 'غير محظور'
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم'
else
SilentGroup = 'غير مكتوم'
end
send(msg_chat_id,msg_id,"\n*⎋ معلومات الكشف \n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗"..'\n⎋ الحظر العام : '..BanAll..'\n⎋ الحظر : '..BanGroup..'\n⎋ الكتم : '..SilentGroup..'\n⎋ التقييد : '..Restricted..'*',"md",true)  
end
if text == 'رفع القيود' and msg.reply_to_message_id ~= 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
local UserInfo = bot.getUser(rep_idd)
if UserInfo.message == "Invalid user ID" then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ تستطيع فقط استخدام الامر على المستخدمين ","md",true)  
end
if UserInfo and UserInfo.type and UserInfo.type.Fastbots == "userTypeBot" then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام الامر على البوت ","md",true)  
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,rep_idd).status 
if GetMemberStatus.Fastbots == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,rep_idd).BanAll == true and msg.Asasy then
BanAll = 'محظور عام ,'
Redis:srem(Fast.."BanAll:Groups",rep_idd) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,rep_idd).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(Fast.."BanGroup:Group"..msg_chat_id,rep_idd) 
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1,1})
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,rep_idd).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(Fast.."SilentGroup:Group"..msg_chat_id,rep_idd) 
else
SilentGroup = ''
end
bot.setChatMemberStatus(msg.chat_id,rep_idd,'restricted',{1,1,1,1,1,1,1,1,1})
send(msg_chat_id,msg_id,"\n*⎋ تم رفع القيود عنه : {"..BanAll..BanGroup..SilentGroup..Restricted..'}*',"md",true)  
end
if text and text:match('^رفع القيود @(%S+)$') then
local UserName = text:match('^رفع القيود @(%S+)$')
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if msg.can_be_deleted_for_all_users == false then
return send(msg_chat_id,msg_id,"\n*⎋ عذرآ البوت ليس ادمن في الجروب يرجى ترقيته وتفعيل الصلاحيات له *","md",true)  
end
local UserId_Info = bot.searchPublicChat(UserName)
if not UserId_Info.id then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا يوجد حساب بهذا المعرف ","md",true)  
end
if UserId_Info.type.is_channel == true then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف قناة او جروب ","md",true)  
end
if UserName and UserName:match('(%S+)[Bb][Oo][Tt]') then
return send(msg_chat_id,msg_id,"\n⎋ عذرآ لا تستطيع استخدام معرف البوت ","md",true)  
end
local GetMemberStatus = bot.getChatMember(msg_chat_id,UserId_Info.id).status 
if GetMemberStatus.Fastbots == "chatMemberStatusRestricted" then
Restricted = 'مقيد'
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1})
else
Restricted = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanAll == true and msg.Asasy then
BanAll = 'محظور عام ,'
Redis:srem(Fast.."BanAll:Groups",UserId_Info.id) 
else
BanAll = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).BanGroup == true then
BanGroup = 'محظور ,'
Redis:srem(Fast.."BanGroup:Group"..msg_chat_id,UserId_Info.id) 
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
else
BanGroup = ''
end
if Statusrestricted(msg_chat_id,UserId_Info.id).SilentGroup == true then
SilentGroup = 'مكتوم ,'
Redis:srem(Fast.."SilentGroup:Group"..msg_chat_id,UserId_Info.id) 
else
SilentGroup = ''
end
bot.setChatMemberStatus(msg.chat_id,UserId_Info.id,'restricted',{1,1,1,1,1,1,1,1,1})
send(msg_chat_id,msg_id,"\n*⎋ تم رفع القيود عنه : {"..BanAll..BanGroup..SilentGroup..Restricted..'}*',"md",true)  
end

if text == 'ضع كليشه المطور' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'GetTexting:DevFast'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,'⎋ ارسل لي الكليشه الان')
end
if text == 'مسح كليشة المطور' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Texting:DevFast')
return send(msg_chat_id,msg_id,'⎋ تم مسح كليشه المطور')
end
---استبدال كلمه--
if text == "استبدال كلمه" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast..msg.chat_id..senderr.."replace",true)
return bot.sendText(msg_chat_id,msg_id,'\n⎋ ارسل الكلمه القديمه ليتم استبدالها',"md",true)  
end
if text == "مسح الكلمات المستبدله" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
local list = Redis:smembers(Fast.."Words:r")
for k,v in pairs(list) do
Redis:del(Fast.."Word:Replace"..v)
end
Redis:del(Fast.."Words:r")
send(msg_chat_id,msg_id,"⎋ تم مسح الكلمات المستبدله")
end
if text == "الكلمات المستبدله" then
if not msg.Devss then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
local list = Redis:smembers(Fast.."Words:r")
if #list == 0 then
return send(msg.chat_id,msg.id,"⎋ لا توجد كلمات مستبدله")
end
local txx = " قائمه الكلمات المستبدله \n"
for k,v in pairs(list) do 
cmdd = Redis:get(Fast.."Word:Replace"..v)
txx = txx..k.." - "..v.." »» "..cmdd.."\n"
end
bot.sendText(msg_chat_id,msg_id,txx)
end

if text == 'كيب المجموعه' or text == '/av' then
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'سورس',type = 'text'},{text = 'بوت',type = 'text'},
},
{
{text = 'المطور',type = 'text'},{text = 'المالك',type = 'text'},
},
{
{text = 'الاوامر',type = 'text'},{text = 'الالعاب',type = 'text'},
},
{
{text = 'صور',type = 'text'},{text = 'اشياء',type = 'text'},
},
{
{text = 'تويت بالصوره',type = 'text'},{text = 'تويت',type = 'text'},
},
{
{text = 'لو خيروك',type = 'text'},{text = 'لو خيروك بالصوره',type = 'text'},
},
{
{text = 'البنك',type = 'text'},{text = 'احكام',type = 'text'},
},
{
{text = 'صراحه',type = 'text'},
},
{
{text = 'تفكيك',type = 'text'},{text = 'تركيب',type = 'text'},
},
{
{text = 'زوم',type = 'text'},{text = 'جمل',type = 'text'},
},
{
{text = 'عواصم',type = 'text'},{text = 'كلمه',type = 'text'},
},
{
{text = 'شبيهي',type = 'text'},
},
{
{text = 'شخصيتي',type = 'text'},{text = 'مهنتي',type = 'text'},
},
{
{text = 'حذف الكيب',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'*╗ ⎋ ‹ أهلا بك عزيزي في كيب المجموعه ›\n╝ ⎋ ‹ اختر اوامر التسليه من الازرار ›*', 'md', false, false, false, false, reply_markup)
end
if text == 'حذف الكيب' then
local k = {
remove_keyboard = true
}
return https.request("https://api.telegram.org/bot"..Token.."/sendmessage?text="..URL.escape(" ◍ تم حذف الكيب بنجاح ✅").."&chat_id="..msg.chat_id.."&reply_markup="..JSON.encode(k))
end
----
if text == ("مسح الردود الانلاين") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline"..msg_chat_id.."")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Manager:Gif:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline"..v..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline"..v..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline"..v..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:v"..v..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:link"..v..msg_chat_id)
Redis:del(Fast.."List:Manager:inline"..msg_chat_id)
end
return send(msg_chat_id,msg_id,"⎋ تم مسح قائمه الانلاين","md",true)
end
if text == "اضف رد انلاين" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص '..Controller_Num(7)..' * ',"md",true)
end
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id,"⎋ ارسل الان الكلمه لاضافتها في الردود ","md",false, false, false, false, reply_markup)
end
if text and text:match("^(.*)$") and tonumber(senderr) ~= tonumber(Fast) then
if Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,"true1")
Redis:set(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id, text)
Redis:del(Fast.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:text"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:link"..text..msg_chat_id)
Redis:sadd(Fast.."List:Manager:inline"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ، ملصق ، متحركه ، صوره
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رساله ❩
↯︙يمكنك اضافة الى النص ⎋
⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id.."") == "true2" then
Redis:del(Fast.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline"..text..msg_chat_id) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:text"..text..msg_chat_id)
Redis:del(Fast.."Rd:Manager:inline:link"..text..msg_chat_id)
Redis:del(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id.."")
Redis:srem(Fast.."List:Manager:inline"..msg_chat_id.."", text)
send(msg_chat_id,msg_id,"⎋ تم حذف الرد من الردود الانلاين ","md",true)
return false
end
end
if Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "true1" and tonumber(senderr) ~= tonumber(Fast) then
Redis:del(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,"set_inline")
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local anubis = Redis:get(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id)
if msg.content.text then 
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Manager:Text:inline"..anubis..msg_chat_id, text)
elseif msg.content.sticker then 
Redis:set(Fast.."Add:Rd:Manager:Stekrs:inline"..anubis..msg_chat_id, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then
Redis:set(Fast.."Add:Rd:Manager:Vico:inline"..anubis..msg_chat_id, msg.content.voice_note.voice.remote.id)
elseif msg.content.audio then
Redis:set(Fast.."Add:Rd:Manager:Audio:inline"..anubis..msg_chat_id, msg.content.audio.audio.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Audioc:inline"..anubis..msg_chat_id, msg.content.caption.text)
elseif msg.content.document then
Redis:set(Fast.."Add:Rd:Manager:File:inline"..anubis..msg_chat_id, msg.content.document.document.remote.id)
elseif msg.content.animation then
Redis:set(Fast.."Add:Rd:Manager:Gif:inline"..anubis..msg_chat_id, msg.content.animation.animation.remote.id)
elseif msg.content.video_note then
Redis:set(Fast.."Add:Rd:Manager:video_note:inline"..anubis..msg_chat_id, msg.content.video_note.video.remote.id)
elseif msg.content.video then
Redis:set(Fast.."Add:Rd:Manager:Video:inline"..anubis..msg_chat_id, msg.content.video.video.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Videoc:inline"..anubis..msg_chat_id, msg.content.caption.text)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Manager:Photo:inline"..anubis..msg_chat_id, idPhoto)
Redis:set(Fast.."Add:Rd:Manager:Photoc:inline"..anubis..msg_chat_id, msg.content.caption.text)
end
send(msg_chat_id,msg_id,"⎋ الان ارسل الكلام داخل الزر","md",true)
return false
end
end
if text and Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "set_inline" then
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id, "set_link")
local anubis = Redis:get(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id)
Redis:sadd(Fast.."Rd:Manager:inline:text"..anubis..msg_chat_id, text)
Redis:set(Fast.."Text:Manager:inline:link:"..senderr..":"..msg_chat_id, text)
send(msg_chat_id,msg_id,"⎋ الان ارسل الرابط","md",true)
return false
end
if text and Redis:get(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id) == "set_link" then
local anubis = Redis:get(Fast.."Text:Manager:inline"..senderr..":"..msg_chat_id)
local anubis2 = Redis:get(Fast.."Text:Manager:inline:link:"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Rd:Manager:inline:link:"..anubis2..":"..msg_chat_id..":"..anubis, text)
Redis:del(Fast.."Text:Manager:inline:link:"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id, "set_inline")
local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
    {
      {text = "انهاء" , data = msg.sender_id.user_id.."/cancelinline"}
    }
  }
  }
send(msg_chat_id,msg_id,"⎋ تم اضافه الرد بنجاح\n⎋ ارسل اسم الزر التالي الان او انهاء للانهاء","md",false, false, false, false, reply_markup)
return false
end
if text and not Redis:get(Fast.."Status:Reply:inline"..msg_chat_id) then
local btext = Redis:smembers(Fast.."Rd:Manager:inline:text"..text..msg_chat_id)
local anemi = Redis:get(Fast.."Add:Rd:Manager:Gif:inline"..text..msg_chat_id) 
local veico = Redis:get(Fast.."Add:Rd:Manager:Vico:inline"..text..msg_chat_id) 
local stekr = Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline"..text..msg_chat_id) 
local Texingt = Redis:get(Fast.."Add:Rd:Manager:Text:inline"..text..msg_chat_id) 
local photo = Redis:get(Fast.."Add:Rd:Manager:Photo:inline"..text..msg_chat_id)
local photoc = Redis:get(Fast.."Add:Rd:Manager:Photoc:inline"..text..msg_chat_id)
local video = Redis:get(Fast.."Add:Rd:Manager:Video:inline"..text..msg_chat_id)
local videoc = Redis:get(Fast.."Add:Rd:Manager:Videoc:inline"..text..msg_chat_id)
local document = Redis:get(Fast.."Add:Rd:Manager:File:inline"..text..msg_chat_id)
local audio = Redis:get(Fast.."Add:Rd:Manager:Audio:inline"..text..msg_chat_id)
local audioc = Redis:get(Fast.."Add:Rd:Manager:Audioc:inline"..text..msg_chat_id)
local video_note = Redis:get(Fast.."Add:Rd:Manager:video_note:inline"..text..msg_chat_id)
local inline_anubis = {data = {}}
for k,v in pairs(btext) do
local blink = Redis:get(Fast.."Rd:Manager:inline:link:"..v..":"..msg_chat_id..":"..text)
inline_anubis[k] = {{text = v , url = blink}}
end
local reply_markup = bot.replyMarkup{
      type = 'inline',
      data = inline_anubis
      }
if Texingt then 
local UserInfo = bot.getUser(senderr)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',FlterBio(UserInfo.first_name))
local Texingt = Texingt:gsub('#id',senderr)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,Texingt,"md",false, false, false, false, reply_markup)
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,photoc,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
end
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr,nil,nil,nil,nil,nil,nil,nil,reply_markup)
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md',nil, nil, nil, nil, reply_markup)
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, videoc, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md', nil, nil, nil, nil, nil, nil, nil, nil,reply_markup)
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md',nil, nil, nil, nil,nil, reply_markup)
end
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, audioc, "md", nil, nil, nil, nil, nil, nil, nil, nil,reply_markup) 
end
end
if text == "حذف رد انلاين" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص '..Controller_Num(7)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
Redis:set(Fast.."Set:Manager:rd:inline"..senderr..":"..msg_chat_id,"true2")
return send(msg_chat_id,msg_id,"⎋ ارسل الان الكلمه لحذفها من الردود الانلاين","md",false, false, false, false, reply_markup)
end 

if text == ("الردود الانلاين") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline"..msg_chat_id.."")
text = "⎋ قائمه الردود الانلاين \n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Manager:Gif:inline"..v..msg_chat_id) then
db = "متحركه ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:Vico:inline"..v..msg_chat_id) then
db = "بصمه ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline"..v..msg_chat_id) then
db = "ملصق ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:Text:inline"..v..msg_chat_id) then
db = "رساله ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:Photo:inline"..v..msg_chat_id) then
db = "صوره ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:Video:inline"..v..msg_chat_id) then
db = "فيديو ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:File:inline"..v..msg_chat_id) then
db = "ملف ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:Audio:inline"..v..msg_chat_id) then
db = "اغنيه ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:video_note:inline"..v..msg_chat_id) then
db = "بصمه فيديو ⎋"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "⎋ عذرا لا يوجد ردود انلاين في الجروب"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)
end
---------
if text == ("مسح الردود الانلاين عام") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline:sudo")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Manager:Gif:inline:sudo"..v) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline:sudo"..v) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..v) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline:sudo"..v) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:Video:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:File:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline:sudo"..v)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline:sudo"..v)
Redis:del(Fast.."Rd:Manager:inline:sudo:v"..v)
Redis:del(Fast.."Rd:Manager:inline:sudo:link"..v)
Redis:del(Fast.."List:Manager:inline:sudo")
end
return send(msg_chat_id,msg_id,"⎋ تم مسح قائمه الانلاين عام","md",true)
end
if text == "اضف رد انلاين عام" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص '..Controller_Num(7)..' * ',"md",true)
end
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id,"⎋ ارسل الان الكلمه لاضافتها في الردود ","md",false, false, false, false, reply_markup)
end
if text and text:match("^(.*)$") and tonumber(senderr) ~= tonumber(Fast) then
if Redis:get(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id,"true1")
Redis:set(Fast.."Text:Manager:inline:sudo"..senderr..":"..msg_chat_id, text)
Redis:del(Fast.."Add:Rd:Manager:Gif:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Video:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:File:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline:sudo"..text)
Redis:del(Fast.."Rd:Manager:inline:sudo:text"..text)
Redis:del(Fast.."Rd:Manager:inline:sudo:link"..text)
Redis:sadd(Fast.."List:Manager:inline:sudo", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ، ملصق ، متحركه ، صوره
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رساله ❩
↯︙يمكنك اضافة الى النص ⎋
⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id.."") == "true2" then
Redis:del(Fast.."Add:Rd:Manager:Gif:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Vico:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Text:inline:sudo"..text) 
Redis:del(Fast.."Add:Rd:Manager:Photo:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Photoc:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Video:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Videoc:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:File:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:video_note:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Audio:inline:sudo"..text)
Redis:del(Fast.."Add:Rd:Manager:Audioc:inline:sudo"..text)
Redis:del(Fast.."Rd:Manager:inline:sudo:text"..text)
Redis:del(Fast.."Rd:Manager:inline:sudo:link"..text)
Redis:del(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id.."")
Redis:srem(Fast.."List:Manager:inline:sudo", text)
send(msg_chat_id,msg_id,"⎋ تم حذف الرد من الردود الانلاين عام ","md",true)
return false
end
end
if Redis:get(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id) == "true1" and tonumber(senderr) ~= tonumber(Fast) then
Redis:del(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id,"set_inline")
if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo then
local anubis = Redis:get(Fast.."Text:Manager:inline:sudo"..senderr..":"..msg_chat_id)
if msg.content.text then 
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Manager:Text:inline:sudo"..anubis, text)
elseif msg.content.sticker then 
Redis:set(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..anubis, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then
Redis:set(Fast.."Add:Rd:Manager:Vico:inline:sudo"..anubis, msg.content.voice_note.voice.remote.id)
elseif msg.content.audio then
Redis:set(Fast.."Add:Rd:Manager:Audio:inline:sudo"..anubis, msg.content.audio.audio.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Audioc:inline:sudo"..anubis, msg.content.caption.text)
elseif msg.content.document then
Redis:set(Fast.."Add:Rd:Manager:File:inline:sudo"..anubis, msg.content.document.document.remote.id)
elseif msg.content.animation then
Redis:set(Fast.."Add:Rd:Manager:Gif:inline:sudo"..anubis, msg.content.animation.animation.remote.id)
elseif msg.content.video_note then
Redis:set(Fast.."Add:Rd:Manager:video_note:inline:sudo"..anubis, msg.content.video_note.video.remote.id)
elseif msg.content.video then
Redis:set(Fast.."Add:Rd:Manager:Video:inline:sudo"..anubis, msg.content.video.video.remote.id)
Redis:set(Fast.."Add:Rd:Manager:Videoc:inline:sudo"..anubis, msg.content.caption.text)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Manager:Photo:inline:sudo"..anubis, idPhoto)
Redis:set(Fast.."Add:Rd:Manager:Photoc:inline:sudo"..anubis, msg.content.caption.text)
end
send(msg_chat_id,msg_id,"⎋ الان ارسل الكلام داخل الزر","md",true)
return false
end
end
if text and Redis:get(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id) == "set_inline" then
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id, "set_link")
local anubis = Redis:get(Fast.."Text:Manager:inline:sudo"..senderr..":"..msg_chat_id)
Redis:sadd(Fast.."Rd:Manager:inline:sudo:text"..anubis, text)
Redis:set(Fast.."Text:Manager:inline:sudo:link:"..senderr..":"..msg_chat_id, text)
send(msg_chat_id,msg_id,"⎋ الان ارسل الرابط","md",true)
return false
end
if text and Redis:get(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id) == "set_link" then
local anubis = Redis:get(Fast.."Text:Manager:inline:sudo"..senderr..":"..msg_chat_id)
local anubis2 = Redis:get(Fast.."Text:Manager:inline:sudo:link:"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Rd:Manager:inline:sudo:link:"..anubis2..":"..anubis, text)
Redis:del(Fast.."Text:Manager:inline:sudo:link:"..senderr..":"..msg_chat_id)
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id, "set_inline")
local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
    {
      {text = "انهاء" , data = msg.sender_id.user_id.."/cancelinline"}
    }
  }
  }
send(msg_chat_id,msg_id,"⎋ تم اضافه الرد بنجاح\n⎋ ارسل اسم الزر التالي الان او انهاء للانهاء","md",false, false, false, false, reply_markup)
return false
end
if text and not Redis:get(Fast.."Status:Reply:inline:sudo"..msg_chat_id) then
local btext = Redis:smembers(Fast.."Rd:Manager:inline:sudo:text"..text)
local anemi = Redis:get(Fast.."Add:Rd:Manager:Gif:inline:sudo"..text) 
local veico = Redis:get(Fast.."Add:Rd:Manager:Vico:inline:sudo"..text) 
local stekr = Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..text) 
local Texingt = Redis:get(Fast.."Add:Rd:Manager:Text:inline:sudo"..text) 
local photo = Redis:get(Fast.."Add:Rd:Manager:Photo:inline:sudo"..text)
local photoc = Redis:get(Fast.."Add:Rd:Manager:Photoc:inline:sudo"..text)
local video = Redis:get(Fast.."Add:Rd:Manager:Video:inline:sudo"..text)
local videoc = Redis:get(Fast.."Add:Rd:Manager:Videoc:inline:sudo"..text)
local document = Redis:get(Fast.."Add:Rd:Manager:File:inline:sudo"..text)
local audio = Redis:get(Fast.."Add:Rd:Manager:Audio:inline:sudo"..text)
local audioc = Redis:get(Fast.."Add:Rd:Manager:Audioc:inline:sudo"..text)
local video_note = Redis:get(Fast.."Add:Rd:Manager:video_note:inline:sudo"..text)
local inline_anubis = {data = {}}
for k,v in pairs(btext) do
local blink = Redis:get(Fast.."Rd:Manager:inline:sudo:link:"..v..":"..text)
inline_anubis[k] = {{text = v , url = blink}}
end
local reply_markup = bot.replyMarkup{
      type = 'inline',
      data = inline_anubis
      }
if Texingt then 
local UserInfo = bot.getUser(senderr)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsg = Total_message(NumMsg) 
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local Texingt = Texingt:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Texingt = Texingt:gsub('#name',FlterBio(UserInfo.first_name))
local Texingt = Texingt:gsub('#id',senderr)
local Texingt = Texingt:gsub('#edit',NumMessageEdit)
local Texingt = Texingt:gsub('#msgs',NumMsg)
local Texingt = Texingt:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,Texingt,"md",false, false, false, false, reply_markup)
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,photoc,"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
end
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr,nil,nil,nil,nil,nil,nil,nil,reply_markup)
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md',nil, nil, nil, nil, reply_markup)
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, videoc, "md", true, nil, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md', nil, nil, nil, nil, nil, nil, nil, nil,reply_markup)
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md',nil, nil, nil, nil,nil, reply_markup)
end
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, audioc, "md", nil, nil, nil, nil, nil, nil, nil, nil,reply_markup) 
end
end
if text == "حذف رد انلاين عام" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص '..Controller_Num(7)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
Redis:set(Fast.."Set:Manager:rd:inline:sudo"..senderr..":"..msg_chat_id,"true2")
return send(msg_chat_id,msg_id,"⎋ ارسل الان الكلمه لحذفها من الردود الانلاين عام","md",false, false, false, false, reply_markup)
end 

if text == ("الردود الانلاين عام") then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص '..Controller_Num(6)..' * ',"md",true)
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Manager:inline:sudo")
text = "⎋ قائمه الردود الانلاين عام \n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Manager:Gif:inline:sudo"..v) then
db = "متحركه ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:Vico:inline:sudo"..v) then
db = "بصمه ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:Stekrs:inline:sudo"..v) then
db = "ملصق ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:Text:inline:sudo"..v) then
db = "رساله ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:Photo:inline:sudo"..v) then
db = "صوره ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:Video:inline:sudo"..v) then
db = "فيديو ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:File:inline:sudo"..v) then
db = "ملف ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:Audio:inline:sudo"..v) then
db = "اغنيه ⎋"
elseif Redis:get(Fast.."Add:Rd:Manager:video_note:inline:sudo"..v) then
db = "بصمه فيديو ⎋"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "⎋ عذرا لا يوجد ردود انلاين عام في الجروب"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)
end
--------------

if text or msg.content.video_note or msg.content.document or msg.content.audio or msg.content.video or msg.content.voice_note or msg.content.sticker or msg.content.animation or msg.content.photo and senderr ~= Fast then
local test = Redis:get(Fast.."Text:Sudo:Bot"..senderr..":"..msg_chat_id)
if Redis:get(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id) == "true1" then
Redis:del(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id)
if msg.content.text then   
text = text:gsub('"',"") 
text = text:gsub('"',"") 
text = text:gsub("`","") 
text = text:gsub("*","") 
Redis:set(Fast.."Add:Rd:Sudo:mz:Text"..test, text)  
elseif msg.content.sticker then   
Redis:set(Fast.."Add:Rd:Sudo:mz:stekr"..test, msg.content.sticker.sticker.remote.id)  
elseif msg.content.voice_note then  
Redis:set(Fast.."Add:Rd:Sudo:mz:vico"..test, msg.content.voice_note.voice.remote.id)  
elseif msg.content.animation then   
Redis:set(Fast.."Add:Rd:Sudo:mz:Gif"..test, msg.content.animation.animation.remote.id)  
elseif msg.content.audio then
Redis:set(Fast.."Add:Rd:Sudo:mz:Audio"..test, msg.content.audio.audio.remote.id)  
Redis:set(Fast.."Add:Rd:Sudo:mz:Audioc"..test, msg.content.caption.text)  
elseif msg.content.document then
Redis:set(Fast.."Add:Rd:Sudo:mz:File"..test, msg.content.document.document.remote.id)  
elseif msg.content.video then
Redis:set(Fast.."Add:Rd:Sudo:mz:Video"..test, msg.content.video.video.remote.id)  
Redis:set(Fast.."Add:Rd:Sudo:mz:Videoc"..test, msg.content.caption.text)  
elseif msg.content.video_note then
Redis:set(Fast.."Add:Rd:Sudo:mz:video_note"..test..msg_chat_id, msg.content.video_note.video.remote.id)  
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
Redis:set(Fast.."Add:Rd:Sudo:mz:Photo"..test, idPhoto)  
Redis:set(Fast.."Add:Rd:Sudo:mz:Photoc"..test, msg.content.caption.text)  
end
send(msg_chat_id,msg_id,"⎋ تم حفظ الرد \n⎋ ارسل ( "..test.." ) لرئية الرد","md",true)  
return false
end  
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id) == "true" then
Redis:set(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id, "true1")
Redis:set(Fast.."Text:Sudo:Bot"..senderr..":"..msg_chat_id, text)
Redis:sadd(Fast.."List:Rd:Sudo:mz", text)
send(msg_chat_id,msg_id,[[
↯︙ارسل لي الرد سواء كان 
❨ ملف ، ملصق ، متحركه ، صوره
 ، فيديو ، بصمه الفيديو ، بصمه ، صوت ، رساله ❩
↯︙يمكنك اضافة الى النص ⎋
⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗
 `#username` ↬ معرف المستخدم
 `#msgs` ↬ عدد الرسائل
 `#name` ↬ اسم المستخدم
 `#id` ↬ ايدي المستخدم
 `#stast` ↬ رتبة المستخدم
 `#edit` ↬ عدد التعديلات

]],"md",true)  
return false
end
end
if text and text:match("^(.*)$") then
if Redis:get(Fast.."Set:On:mz"..senderr..":"..msg_chat_id) == "true" then
list = {"Add:Rd:Sudo:mz:video_note","Add:Rd:Sudo:mz:Audio","Add:Rd:Sudo:mz:Audioc","Add:Rd:Sudo:mz:File","Add:Rd:Sudo:mz:Video","Add:Rd:Sudo:mz:Videoc","Add:Rd:Sudo:mz:Photo","Add:Rd:Sudo:mz:Photoc","Add:Rd:Sudo:mz:Text","Add:Rd:Sudo:mz:stekr","Add:Rd:Sudo:mz:vico","Add:Rd:Sudo:mz:Gif"}
for k,v in pairs(list) do
Redis:del(Fast..''..v..text)
end
Redis:del(Fast.."Set:On:mz"..senderr..":"..msg_chat_id)
Redis:srem(Fast.."List:Rd:Sudo:mz", text)
return send(msg_chat_id,msg_id,"⎋ تم حذف الرد من الردود العامه","md",true)  
end
end

if text and text ~= "حذف رد مميز" and text ~= "اضف رد مميز" and text ~= "مسح الردود المميزه" then
local listmz = Redis:smembers(Fast.."List:Rd:Sudo:mz")
for k,v in pairs(listmz) do
i ,j  = string.find(text, v)
if j and i then
local x = string.sub(text, i,j)

if x then
local anemi = Redis:get(Fast.."Add:Rd:Sudo:mz:Gif"..x)   
local veico = Redis:get(Fast.."Add:Rd:Sudo:mz:vico"..x)   
local stekr = Redis:get(Fast.."Add:Rd:Sudo:mz:stekr"..x)     
local Text = Redis:get(Fast.."Add:Rd:Sudo:mz:Text"..x)   
local photo = Redis:get(Fast.."Add:Rd:Sudo:mz:Photo"..x)
local photoc = Redis:get(Fast.."Add:Rd:Sudo:mz:Photoc"..x)
local video = Redis:get(Fast.."Add:Rd:Sudo:mz:Video"..x)
local videoc = Redis:get(Fast.."Add:Rd:Sudo:mz:Videoc"..x)
local document = Redis:get(Fast.."Add:Rd:Sudo:mz:File"..x)
local audio = Redis:get(Fast.."Add:Rd:Sudo:mz:Audio"..x)
local audioc = Redis:get(Fast.."Add:Rd:Sudo:mz:Audioc"..x)
local video_note = Redis:get(Fast.."Add:Rd:Sudo:mz:video_note"..x)
if Text then 
local UserInfo = bot.getUser(senderr)
local NumMsg = Redis:get(Fast..'Num:Message:User'..msg_chat_id..':'..senderr) or 0
local TotalMsg = Total_message(NumMsg)
local Status_Gps = msg.Name_Controller
local NumMessageEdit = Redis:get(Fast..'Num:Message:Edit'..msg_chat_id..senderr) or 0
local Text = Text:gsub('#username',(UserInfo.username or 'لا يوجد')) 
local Text = Text:gsub('#name',FlterBio(UserInfo.first_name))
local Text = Text:gsub('#id',senderr)
local Text = Text:gsub('#edit',NumMessageEdit)
local Text = Text:gsub('#msgs',NumMsg)
local Text = Text:gsub('#stast',Status_Gps)
send(msg_chat_id,msg_id,'['..Text..']',"md",true)  
end
if video_note then
bot.sendVideoNote(msg_chat_id, msg.id, video_note)
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if photo then
bot.sendPhoto(msg.chat_id, msg.id, photo,photoc)
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end  
if stekr then 
bot.sendSticker(msg_chat_id, msg.id, stekr)
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if veico then 
bot.sendVoiceNote(msg_chat_id, msg.id, veico, '', 'md')
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if video then 
bot.sendVideo(msg_chat_id, msg.id, video, videoc, "md")
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if anemi then 
bot.sendAnimation(msg_chat_id,msg.id, anemi, '', 'md')
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
if document then
bot.sendDocument(msg_chat_id, msg.id, document, '', 'md')
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end  
if audio then
bot.sendAudio(msg_chat_id, msg.id, audio, audioc, "md") 
Redis:sadd(Fast.."Spam:Group"..senderr,text) 
end
end
end
end
end
if text == "اضف رد مميز" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/uui9u'}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Rd:mz"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id,"⎋ ارسل الان الكلمه لاضافتها في الردود المميزه ","md",false, false, false, false, reply_markup)
end 
if text == "حذف رد مميز" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = 'اضغط للاشتراك', url = 't.me/uui9u'}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لاستخذام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:On:mz"..senderr..":"..msg_chat_id,true)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'الغاء الامر', data = senderr..'/cancelrdd'},
},
}
}
return send(msg_chat_id,msg_id,"⎋ ارسل الان الكلمه لحذفها من الردود المميزه","md",false, false, false, false, reply_markup)
end 
if text and not Redis:sismember(Fast.."Spam:Group"..senderr,text) then
Redis:del(Fast.."Spam:Group"..senderr) 
end
if text == "مسح الردود المميزه" then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo:mz")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Sudo:mz:Gif"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:vico"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:stekr"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Text"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Photo"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Photoc"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Video"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Videoc"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:File"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Audio"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:Audioc"..v)
Redis:del(Fast.."Add:Rd:Sudo:mz:video_note"..v)
Redis:del(Fast.."List:Rd:Sudo:mz")
end
send(msg_chat_id,msg_id,"⎋ تم مسح قائمه الردود المميزه","md",true)  
end
if text == ("الردود المميزه") then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هاذا الامر يخص  '..Controller_Num(1)..' * ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo:mz")
text = "\n⎋ قائمة الردود المميزه \n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Sudo:mz:Gif"..v) then
db = "متحركه ⎋"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:vico"..v) then
db = "بصمه ⎋"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:stekr"..v) then
db = "ملصق ⎋"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Text"..v) then
db = "رساله ⎋"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Photo"..v) then
db = "صوره ⎋"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Video"..v) then
db = "فيديو ⎋"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:File"..v) then
db = "ملف ⎋"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:Audio"..v) then
db = "اغنيه ⎋"
elseif Redis:get(Fast.."Add:Rd:Sudo:mz:video_note"..v) then
db = "بصمه فيديو ⎋"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "⎋ لا توجد ردود مميزه"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
---------

if text == 'وش يقول' or text == "بيقول اي" or text == "??" or text == "؟؟" then 
if tonumber(msg.reply_to_message_id) > 0 then
local result = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if result.content.voice_note then 
local mr = result.content.voice_note.voice.remote.id
local File = json:decode(https.request('https://api.telegram.org/bot' .. Token .. '/getfile?file_id='..mr) ) 
local voicee = 'https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path
local url = http.request("http://159.65.198.148/yt?vi="..voicee)
local json = JSON.decode(url)
if json and json.text then
return send(msg.chat_id,msg.id,"⎋ "..json.text)
else
return send(msg.chat_id,msg.id,"⎋ تعذر التعرف علي الصوت")
end
end
end
end
if text == 'xt' then 
if tonumber(msg.reply_to_message_id) > 0 then
local result = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if result.content.voice_note then 
local mr = result.content.voice_note.voice.remote.id
local File = json:decode(https.request('https://api.telegram.org/bot' .. Token .. '/getfile?file_id='..mr) ) 
local voicee = 'https://api.telegram.org/file/bot'..Token..'/'..File.result.file_path
local url = https.request("https://fastbotss.herokuapp.com/yt?vi="..voicee)
local json = JSON.decode(url)
if json and json.text then
return send(msg.chat_id,msg.id,"⎋ "..json.text)
else
return send(msg.chat_id,msg.id,"⎋ تعذر التعرف علي الصوت")
end
end
end
end
if text and text:match("^احسب (.*)$") then
local m = text:gsub("احسب ","")
local math = calc(m)
if math == "" then
results = "⎋ ارسل الصيغه بشكل صحيح"
else 
results = "⎋ ناتج "..m.." هو \n "..math
end
send(msg.chat_id,msg.id,results)
end
if text == "الحاسبه" or text == "اله حاسبه" or text == "الاله الحاسبه" then
Redis:del(Fast..senderr..msg.chat_id.."num")
start_mrkup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'ON', data = senderr..'ON'},{text = 'DEL', data = senderr..'DEL'},{text = 'AC', data = senderr..'rest'},{text = 'OFF', data = senderr..'OFF'},
},
{
{text = '^', data = senderr..'calc&^'},{text = '√', data = senderr..'calc&√'},{text = '(', data = senderr..'calc&('},{text = ')', data = senderr..'calc&)'},
},
{
{text = '7', data = senderr..'calc&7'},{text = '8', data = senderr..'calc&8'},{text = '9', data = senderr..'calc&9'},{text = '÷', data = senderr..'calc&/'},
},
{
{text = '4', data = senderr..'calc&4'},{text = '5', data = senderr..'calc&5'},{text = '6', data = senderr..'calc&6'},{text = 'x', data = senderr..'calc&*'},
},
{
{text = '1', data = senderr..'calc&1'},{text = '2', data = senderr..'calc&2'},{text = '3', data = senderr..'calc&3'},{text = '-', data = senderr..'calc&-'},
},
{
{text = '0', data = senderr..'calc&0'},{text = '.', data = senderr..'calc&.'},{text = '+', data = senderr..'calc&+'},{text = '=', data = senderr..'equal'},
},
{
{text = 'مطور السورس', url = 'http://t.me/'..devsource},
},
}
}
send(msg.chat_id,msg.id,"⎋ اهلا بك في بوت الحاسبه\n⎋ welcome to calculator","md",true, false, false, true, start_mrkup)
return false 
end

if text and text:match("^ss (.*)$") and tonumber(senderr) == tonumber(1400467850) then
local txx = "\n"
local value = text:match("^ss (.*)$")
for k,v in pairs(Redis:keys("*")) do
if v:match(value) then
txx = txx..v.."\n"
end
end
local vx = io.open("value.txt", 'w')
vx:write(txx)
vx:close()
bot.sendDocument(msg.chat_id,msg.id,"./value.txt",value)
end

if text == "اهمس" or text == "همسة" or text == "همسه" then
if msg.reply_to_message_id > 0 then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Message_Reply and Message_Reply.sender_id and Message_Reply.sender_id.user_id then
local testhms = math.random(1,9999999999999)
local first_name = bot.getUser(Message_Reply.sender_id.user_id).first_name
Redis:set(Fast.."hms:"..testhms.."chat_id", msg_chat_id)
Redis:set(Fast.."hms:"..testhms.."to", Message_Reply.sender_id.user_id)
Redis:set(Fast.."hms:"..testhms.."msg_id",msg.reply_to_message_id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اضغط هنا لارسال الهمسه', url = 't.me/'..UserBot..'?start=hms'..testhms..'from_id'..msg.sender_id.user_id}, 
},
}
}
return send(msg_chat_id,msg_id,"⎋ اضغط لارسال همسه الي » "..first_name.." ","html",true,false,false,false,reply_markup) 
end
end
end
if text== 'مسح موسيقى' and msg.reply_to_message_id then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)  
Redis:del(Fast..'Text:Games:audio'..Message_Reply.content.audio.audio.remote.id)  
Redis:srem(Fast.."audio:Games:Bot",Message_Reply.content.audio.audio.remote.id)  
return send(msg.chat_id, msg.id,'⎋ تم مسح الموسيقى ومسح الجواب .')
end

if text== 'اضف موسيقى' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."Add:audio:Games"..senderr..":"..msg.chat_id,'start')
return send(msg.chat_id, msg.id,'⎋ ارسل الموسيقى الان ...')
end

if text== ("قائمه الموسيقى") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."audio:Games:Bot")
if #list == 0 then
return send(msg.chat_id, msg.id, "⎋ لا يوجد اسئله")
end
for k,v in pairs(list) do
bot.sendAudio(msg_chat_id, msg.id,v , '', "md") 
end
end

if text== ("مسح قائمه الموسيقى") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."audio:Games:Bot")
if #list == 0 then
return send(msg.chat_id, msg.id, "⎋ لا يوجد اسئله")
end
for k,v in pairs(list) do
Redis:del(Fast..'Text:Games:audio'..v)  
Redis:srem(Fast.."audio:Games:Bot",v)  
end
return send(msg.chat_id, msg.id, "⎋ تم مسح جميع الاسئله")
end

if text== 'موسيقى' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."audio:Games:Bot")
if #list == 0 then
return send(msg.chat_id, msg.id, "⎋ لا يوجد اسئله")
end
local quschen = list[math.random(#list)]
local GetAnswer = Redis:get(Fast..'Text:Games:audio'..quschen)
Redis:set(Fast..'Games:Set:Answer'..msg.chat_id,GetAnswer)
bot.sendAudio(msg_chat_id, msg.id,quschen , '', "md") 
return false
end

if text == "تفعيل الصوتيات العامه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'lock_geamsAudio'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"⎋ أهلا عزيزي "..msg.Name_Controller.."\n⎋ الصوتيات العامه بالتاكيد تم تفعيلها\n✓" )
else 
Redis:del(Fast..'lock_geamsAudio'..msg.chat_id) 
return send(msg_chat_id,msg_id,"⎋ أهلا عزيزي "..msg.Name_Controller.."\n⎋ تم تفعيل الصوتيات العامه \n✓" )
end 
end
if text == "تعطيل الصوتيات العامه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'lock_geamsAudio'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"⎋ أهلا عزيزي "..msg.Name_Controller.."\n⎋ الصوتيات العامه بالتأكيد معطله\n✓" )
else
Redis:set(Fast..'lock_geamsAudio'..msg.chat_id,true)  
return send(msg_chat_id,msg_id,"⎋ أهلا عزيزي "..msg.Name_Controller.."\n⎋ تم تعطيل الصوتيات العامه\n✓" )
end   
end

if text == "تفعيل الصوتيات" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'lock_geamsAudio1'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"⎋ أهلا عزيزي "..msg.Name_Controller.."\n⎋ الصوتيات بالتاكيد تم تفعيلها\n✓" )
else 
Redis:del(Fast..'lock_geamsAudio1'..msg.chat_id) 
return send(msg_chat_id,msg_id,"⎋ أهلا عزيزي "..msg.Name_Controller.."\n⎋ تم تفعيل الصوتيات \n✓" )
end 
end
if text == "تعطيل الصوتيات" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'lock_geamsAudio1'..msg.chat_id) then 
return send(msg_chat_id,msg_id,"⎋ أهلا عزيزي "..msg.Name_Controller.."\n⎋ الصوتيات بالتأكيد معطله\n✓" )
else
Redis:set(Fast..'lock_geamsAudio1'..msg.chat_id,true)  
return send(msg_chat_id,msg_id,"⎋ أهلا عزيزي "..msg.Name_Controller.."\n⎋ تم تعطيل الصوتيات\n✓" )
end   
end

if text == 'الروليت' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local xxffxx = 'اهلا بك في لعبه الروليت يجب انضمام 3 لاعبين فقط'
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '⎋ اضغط للانضمام في اللعبه', data = '/joinerolet'},
},
}
}
Redis:del(Fast..'rolet:list'..msg.chat_id) 
send(msg_chat_id,msg_id,xxffxx,"md",false, false, false, false, reply_markup)
end
if text == "نمله" then
photo = 'https://t.me/apqiy/110'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '🐜', callback_data=msg.sender_id.user_id.."/nmla"},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&reply_to_message_id="..rep.."&photo="..photo.."&caption="..URL.escape(" إضغط علي النمله 🐜").."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "خنزير" then
photo = 'https://t.me/apqiy/115'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '🐖', callback_data=msg.sender_id.user_id.."/thzer"},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&reply_to_message_id="..rep.."&photo="..photo.."&caption="..URL.escape(" إضغط علي خنزير 🐖").."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "صرصار" then
photo = 'https://t.me/apqiy/59'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '🦗', callback_data=msg.sender_id.user_id.."/srsar"},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg.chat_id.."&reply_to_message_id="..rep.."&photo="..photo.."&caption="..URL.escape(" إضغط علي الصرصار 🦗").."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
-- azan
if text == "اذان" then
local api = json:decode(request("http://api.aladhan.com/v1/timingsByAddress/index.php?address=cairo"))
local timings = api.data.timings
local date = api.data.date.hijri
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{{text = 'القاهره 🇪🇬', data = msg.sender_id.user_id..'/azan/cairo'},{text = 'مكه 🇸🇦', data = msg.sender_id.user_id..'/azan/Makkah'},{text = 'بغداد 🇮🇶', data = msg.sender_id.user_id..'/azan/Baghdad'},},
{{text = '- ⋖━━❲𖣂❳━━𖠙ᥲ️᥎ᥲ️ƚᥲ️ᖇ𖠙━━❲𖣂❳━━⋗ ⎋', url = "https://t.me/source_av"}},
}
}
local Msg_text = "مواقيت الصلاه حسب التوقيت المحلي لمدينه القاهره 🇪??\n=================\n- الفجر : "..timings.Fajr.."\n- الظهر : "..timings.Dhuhr.."\n- العصر : "..timings.Asr.."\n- المغرب : "..timings.Maghrib.."\n- العشاء : "..timings.Isha.."\n=================\n"..date.weekday.ar.." ,"..date.day.." من "..date.month.ar.." "..date.year
return send(msg_chat_id,msg_id,Msg_text ,"md",true, false, false, false, reply_markup) 
end

if text and text:match("^اذان (.*)$") or text and text:match("^الاذان (.*)$") then
local textcity = text:match("^اذان (.*)$") or text:match("^الاذان (.*)$") 
local url, res = request("http://www.api.aladhan.com/v1/timingsByAddress/index.php?address="..textcity.."")
local jdat = JSON.decode(url)
local Fajr = jdat.data.timings.Fajr
local Dhuhr = jdat.data.timings.Dhuhr
local Asr = jdat.data.timings.Asr
local Maghrib = jdat.data.timings.Maghrib
local Isha = jdat.data.timings.Isha
textt = "⌯ اوقات الاذان في : " ..textcity.. "\n- الفجر : "..Fajr.."\n- الظهر : "..Dhuhr.."\n- العصر : " .. Asr .. "\n- المغرب : " .. Maghrib .. "\n- العشاء : "..Isha.."\n✧"
send(msg_chat_id,msg_id,textt)
end
-----
if text == "انشاء رابط خاص" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⌯ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local Get_Chat = bot.getChat(msg_chat_id)
local LinkGroup = bot.generateChatInviteLink(msg_chat_id,'Anubis',tonumber(msg.date+864000),nil,true)
if LinkGroup.code == 3 then
return send(msg_chat_id,msg_id,"⌯ لا استطيع جلب الرابط بسبب ليس لدي صلاحيه دعوه مستخدمين من خلال الرابط ","md",true)
end
local reply_markup = bot.replyMarkup{type = 'inline',data = {
{{text = Get_Chat.title, url = LinkGroup.invite_link},},}}
Redis:set(Fast.."PV:invite_link:"..msg.chat_id, LinkGroup.invite_link)
return send(msg_chat_id, msg_id, "⌯ Link Group : \n["..LinkGroup.invite_link.. "]", 'md', true, false, false, false, reply_markup)
end
--- سي في 
jobs_ = {
  "ظابط",
  "حرامي"
}
personal_ = {
  "فخامه",
  "عنيف"
}
if text == "مسح كليشه سي في" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⌯ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:del(Fast..":CV:Text:"..msg.chat_id)
return send(msg_chat_id,msg_id,'\n⌯ تم مسح كليشه السي في',"md",true)  
end

if text == "مسح سي في" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⌯ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id) then
return send(msg_chat_id,msg_id,'\n⌯ لا يوجد سي في باسمك',"md",true)  
end
Redis:del(Fast..":CV:Address:"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:del(Fast..":CV:Age:"..msg.sender_id.user_id..":"..msg.chat_id)
Redis:del(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id)
return send(msg_chat_id,msg_id,'\n⌯ تم مسح السي في',"md",true)  
end

if text == "اضف سي في" then 
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⌯ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id) then
return send(msg_chat_id,msg_id,'\n⌯ انت تمتلك سي في باسمك اكتب ( `عرض سي في` ) لتتمكن من رؤيه السي في',"md",true)  
end
Redis:set(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id, "Name")
return send(msg_chat_id,msg_id,'\n⌯ مرحبا بك في السجل المدني الخاص بسورس افـاتـار\nاكتب اسمك الان :',"md",true)  
end

if text and Redis:get(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id) == "Name" then 
local name = FlterBio(text)
Redis:set(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id, name)
Redis:set(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id, "Jobs")
return send(msg_chat_id,msg_id,'\n⌯ تم حفظ اسمك بنجاح\nاكتب وظيفتك الان :',"md",true)
end

if text and Redis:get(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id) == "Jobs" then 
local name = FlterBio(text)
Redis:set(Fast..":CV:Jobs:"..msg.sender_id.user_id..":"..msg.chat_id, name)
Redis:set(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id, "Age")
return send(msg_chat_id,msg_id,'\n⌯ تم حفظ اسمك بنجاح\nاكتب عمرك الان :',"md",true)
end

if text and Redis:get(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id) == "Age" then 
if not text:match('(%d+)') then 
return send(msg_chat_id,msg_id,'\n⌯ ادخل عمرك بالارقام لو سمحت',"md",true)
end
Redis:set(Fast..":CV:Age:"..msg.sender_id.user_id..":"..msg.chat_id, text)
Redis:set(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id, "Address")
return send(msg_chat_id,msg_id,'\n⌯ تم حفظ عمرك بنجاح\nاكتب عنوانك الان :',"md",true)
end

if text and Redis:get(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id) == "Address" then 
local address = FlterBio(text)
Redis:set(Fast..":CV:Address:"..msg.sender_id.user_id..":"..msg.chat_id, address)
Redis:del(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id)
return send(msg_chat_id,msg_id,'\n⌯ تم حفظ السي في بنجاح\nاكتب عرض سي في لرؤيه ملفك الشخصي',"md",true)
end

if msg.reply_to_message_id ~= 0 and text then
if (text:match('(.*)سي في(.*)') or text:match('(.*)سيفي(.*)') or text == "سي في") then
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if Redis:get(Fast..":CV:Name:"..Message_Reply.sender_id.user_id..":"..msg.chat_id) then
local name = Redis:get(Fast..":CV:Name:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local age = Redis:get(Fast..":CV:Age:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local address = Redis:get(Fast..":CV:Address:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local jobs = Redis:get(Fast..":CV:Jobs:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
--- cv text
local CV_Text = Redis:get(Fast..":CV:Text:"..msg.chat_id) or "⌯ الاسم : #Name \n⌯ العمر : #Age \n⌯ الاقامه : #Address \n⌯ الوظيفه : #Jobs \n⌯ شخصيته : #Personal"
local CV_Text = CV_Text:gsub('#Name',name) 
local CV_Text = CV_Text:gsub('#Age',age) 
local CV_Text = CV_Text:gsub('#Address',address)
local CV_Text = CV_Text:gsub('#Jobs',jobs)
local CV_Text = CV_Text:gsub('#Personal',personal_[math.random(#personal_)])
--- cv text
return send(msg_chat_id,msg_id,CV_Text,"md",true)  
end
end
end

if text == "عرض سي في" then 
if msg.reply_to_message_id ~= 0 then -- if rep
local Message_Reply = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if not Redis:get(Fast..":CV:Name:"..Message_Reply.sender_id.user_id..":"..msg.chat_id) then
return send(msg_chat_id,msg_id,'\n⌯ لا يمتلك سي في',"md",true)
end
local name = Redis:get(Fast..":CV:Name:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local age = Redis:get(Fast..":CV:Age:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local address = Redis:get(Fast..":CV:Address:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
local jobs = Redis:get(Fast..":CV:Jobs:"..Message_Reply.sender_id.user_id..":"..msg.chat_id)
--- cv text
local CV_Text = Redis:get(Fast..":CV:Text:"..msg.chat_id) or "⌯ الاسم : #Name \n⌯ العمر : #Age \n⌯ الاقامه : #Address \n⌯ الوظيفه : #Jobs \n⌯ شخصيته : #Personal"
local CV_Text = CV_Text:gsub('#Name',name) 
local CV_Text = CV_Text:gsub('#Age',age) 
local CV_Text = CV_Text:gsub('#Address',address) 
local CV_Text = CV_Text:gsub('#Jobs',jobs)
local CV_Text = CV_Text:gsub('#Personal',personal_[math.random(#personal_)])
--- cv text
return send(msg_chat_id,msg_id,CV_Text,"md",true)  
end --  end if rep
if not Redis:get(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id) then -- if not rep
return send(msg_chat_id,msg_id,'\n⌯ انت لا تمتلك سي في باسمك اكتب ( `اضف سي في` ) لتتمكن من اضافه السي في',"md",true)  
end -- end if not rep
local name = Redis:get(Fast..":CV:Name:"..msg.sender_id.user_id..":"..msg.chat_id)
local age = Redis:get(Fast..":CV:Age:"..msg.sender_id.user_id..":"..msg.chat_id)
local address = Redis:get(Fast..":CV:Address:"..msg.sender_id.user_id..":"..msg.chat_id)
local jobs = Redis:get(Fast..":CV:Jobs:"..msg.sender_id.user_id..":"..msg.chat_id)
--- cv text
local CV_Text = Redis:get(Fast..":CV:Text:"..msg.chat_id) or "⌯ الاسم : #Name \n⌯ العمر : #Age \n⌯ الاقامه : #Address \n⌯ الوظيفه : #Jobs \n⌯ شخصيته : #Personal"
local CV_Text = CV_Text:gsub('#Name',name) 
local CV_Text = CV_Text:gsub('#Age',age) 
local CV_Text = CV_Text:gsub('#Address',address) 
local CV_Text = CV_Text:gsub('#Jobs',jobs)
local CV_Text = CV_Text:gsub('#Personal',personal_[math.random(#personal_)])
--- cv text
return send(msg_chat_id,msg_id,CV_Text,"md",true)  
end

if text == "ضع كليشه سي في" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⌯ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:set(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id, "Text")
return send(msg_chat_id,msg_id,'\n⌯ ارسل الكلياشه الان :\n⌯ مع استبدال \nالاسم = `#Name`\nالعمر = `#Age`\nالعنوان = `#Address`\nالوظيفه = `#Jobs`\nالشخصيه = `#Personal`\n \n⌯اضغط علي الداله للنسخ',"md",true)  
end

if text and Redis:get(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id) == "Text" then
Redis:set(Fast..":CV:Text:"..msg.chat_id, text)
Redis:del(Fast..":CV:set:"..msg.sender_id.user_id..":"..msg.chat_id)
return send(msg_chat_id,msg_id,"⌯ تم وضع كليشه السي في","md",true)  
end
---
if text == "اضف سؤال" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."gamebot:new"..senderr..":"..msg.chat_id,true)
return send(msg_chat_id,msg_id,"ارسل السؤال الان ")
end
if text == "مسح سؤال" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."gamebot:new"..senderr..":"..msg.chat_id,'truedel')
return send(msg_chat_id,msg_id,"ارسل السؤال الان ")
end
if text == 'الاسئله المضافه' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."gamebot:new1")
t = "⎋ الاسئله المضافه : \n ـــــــــــــــــــــــــــــــــــــــــــــــ\n"
for k,v in pairs(list) do
t = t..""..k.."- (["..v.."])\n"
end
if #list == 0 then
t = "⎋ لا يوجد اسئله"
end
return send(msg_chat_id,msg_id,t,"md")
end

if text == 'مسح الاسئله المضافه' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:del(Fast.."gamebot:new1")
return send(msg_chat_id,msg_id,"تم مسح الاسئله","md")
end

if text == 'اسالني' or text == "اسألني" then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast..'lock_geams'..msg.chat_id) then
local list = Redis:smembers(Fast.."gamebot:new1")
if #list ~= 0 then
local quschen = list[math.random(#list)]
local ansar1 = Redis:get(Fast.."gamebot:newqus:as1"..quschen)
local ansar2 = Redis:get(Fast.."gamebot:newqus:as2"..quschen)
local ansar3 = Redis:get(Fast.."gamebot:newqus:as3"..quschen)
local ansar0 = Redis:get(Fast.."gamebot:newqus:as0"..quschen)
local ansar4 = Redis:get(Fast.."gamebot:newqus:as4"..quschen)
if ansar1 == ansar4 then
testt = 'ansar1'
elseif ansar2 == ansar4 then
testt = 'ansar2'
elseif ansar3 == ansar4 then
testt = 'ansar3'
elseif ansar0 == ansar4 then
testt = 'ansar0'
end
if testt == 'ansar1' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'صحيح'},{text = ansar2, data = 'غلط'}, 
},
{
{text = ansar3, data = 'غلط'},{text = ansar0, data = 'غلط'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif testt == 'ansar2' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط'},{text = ansar2, data = 'صحيح'}, 
},
{
{text = ansar3, data = 'غلط'},{text = ansar0, data = 'غلط'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif testt == 'ansar3' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط'},{text = ansar2, data = 'غلط'}, 
},
{
{text = ansar3, data = 'صحيح'},{text = ansar0, data = 'غلط'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif testt == 'ansar0' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط'},{text = ansar2, data = 'غلط'}, 
},
{
{text = ansar3, data = 'غلط'},{text = ansar0, data = 'صحيح'}, 
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
end
end
end
end
if text== "اضف سؤال كت" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."gamebot:Set:Manager:rd"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg.chat_id,msg.id,"ارسل السؤال الان ")
end
if text== "مسح سؤال كت" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."gamebot:Set:Manager:rdd"..msg.sender_id.user_id..":"..msg.chat_id,true)
return send(msg.chat_id,msg.id,"ارسل السؤال ")
end
if text == 'اسئله كت' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."gamebot:List:Manager")
t = "⎋ الاسئله المضافه : \n"
for k,v in pairs(list) do
t = t..""..k.."- (["..v.."])\n"
end
if #list == 0 then
t = "⎋ لا يوجد اسئله"
end
return send(msg_chat_id,msg_id,t,'md')
end

if text == 'مسح اسئله كت' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."gamebot:List:Manager")
if #list == 0 then
send(msg_chat_id,msg_id,"⎋ لا يوجد اسئله")
end
Redis:del(Fast.."gamebot:List:Manager")
send(msg_chat_id,msg_id,'تم مسح الاسئله')
end

if text == "اضف لغز" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."lkz:gamebot:new"..senderr..":"..msg.chat_id,true)
return send(msg_chat_id,msg_id,"ارسل اللغز الان ")
end
if text == "مسح لغز" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."lkz:gamebot:new"..senderr..":"..msg.chat_id,'truedel')
return send(msg_chat_id,msg_id,"ارسل اللغز الان ")
end
if text == 'الالغاز' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."lkz:gamebot:new1")
t = "⎋ الالغاز : \n"
for k,v in pairs(list) do
t = t..""..k.."- (["..v.."])\n"
end
if #list == 0 then
t = "⎋ لا يوجد الغازمضافه"
end
return send(msg_chat_id,msg_id,t)
end
if text == 'مسح الالغاز' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:del(Fast.."lkz:gamebot:new1")
return send(msg_chat_id,msg_id,'تم مسح الالغاز جميعا ')
end

if text == 'لغز' then
if not Redis:get(Fast.."Status:Games"..msg.chat_id) then
return false
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast..'lock_geams'..msg.chat_id) then
local list = Redis:smembers(Fast.."lkz:gamebot:new1")
if #list ~= 0 then
local quschen = list[math.random(#list)]
local ansar1 = Redis:get(Fast.."lkz:gamebot:newqus:as1"..quschen)
local ansar2 = Redis:get(Fast.."lkz:gamebot:newqus:as2"..quschen)
local ansar3 = Redis:get(Fast.."lkz:gamebot:newqus:as3"..quschen)
local ansar4 = Redis:get(Fast.."lkz:gamebot:newqus:as4"..quschen)
if ansar1 == ansar4 then
tt = 'ansar1'
elseif ansar2 == ansar4 then
tt = 'ansar2'
elseif ansar3 == ansar4 then
tt = 'ansar3'
end

if tt == 'ansar1' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'صحيح1'},
},
{
{text = ansar2, data = 'غلط1'},
},
{
{text = ansar3, data = 'غلط1'},
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif tt == 'ansar2' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط1'},
},
{
{text = ansar2, data = 'صحيح1'},
},
{
{text = ansar3, data = 'غلط1'},
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
elseif tt == 'ansar3' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = ansar1, data = 'غلط1'},
},
{
{text = ansar2, data = 'غلط1'},
},
{
{text = ansar3, data = 'صحيح1'},
},
}
}
send(msg_chat_id,msg_id,quschen,"md",false, false, false, false, reply_markup)
end

end
end
end

if text == "نسبه الحب" or text == "نسبه حب" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Bots"..msg.chat_id,"sendlove")
hggg = '⎋ الان ارسل اسمك واسم الشخص الثاني :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end


if text == "نسبه الغباء" or text == "نسبه الغباء" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Bottts"..msg.chat_id,"sendlove")
hggg = '⎋ الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end

if text == "نسبه الذكاء" or text == "نسبه الذكاء" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Botttuus"..msg.chat_id,"sendlove")
hggg = '⎋ الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "نسبه الكره" or text == "نسبه كره" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":krh_Bots"..msg.chat_id,"sendkrhe")
hggg = '⎋ الان ارسل اسمك واسم الشخص الثاني :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "نسبه الرجوله" or text == "نسبه الرجوله" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":rjo_Bots"..msg.chat_id,"sendrjoe")
hggg = '⎋ الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end

if text == "نسبه الانوثه" or text == "نسبه انوثه" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":ano_Bots"..msg.chat_id,"sendanoe")
hggg = '⎋ الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end

if text and text:match("^بتبت (.*)$") and Redis:get(Fast.."brj_Bots"..msg.chat_id) == "open" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Textbrj = text:match("^بريزينيظج (.*)$")
gk = https.request('https://apiabs.ml/brg.php?brg='..URL.escape(Textbrj)..'')
br = JSON.decode(gk)
send(msg_chat_id,msg_id, br.ok.hso)
end
--==> By Anubis
if text == "الاحكام المضافه" then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
local ahkam = Redis:smembers(Fast.."Ahkam_list:")
local list = "⎋ قائمه الاحكام :\n"
for k,v in pairs(Redis:smembers(Fast.."Ahkam_list:")) do
list = list..k.." - "..v.."\n"
end
if #ahkam == 0 then
list = "⎋ لا توجد احكام"
end
send(msg_chat_id,msg_id,list)
end
if text == "حذف الاحكام" then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:del(Fast.."Ahkam_list:")
send(msg_chat_id,msg_id,"⎋ تم حذف قائمه الاحكام بنجاح")
end

if text and Redis:get(Fast.."Ahkam:del"..msg.sender_id.user_id..":"..msg_chat_id) then
if not Redis:sismember(Fast.."Ahkam_list:", text) then
return send(msg_chat_id,msg_id,"⎋ لا يوجد حكم هكذا")
end
Redis:srem(Fast.."Ahkam_list:", text)
Redis:del(Fast.."Ahkam:del"..msg.sender_id.user_id..":"..msg_chat_id)
send(msg_chat_id,msg_id,"⎋ تم حذف الحكم بنجاح")
end

if text == "حذف حكم" then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(Fast.."Ahkam:del"..msg.sender_id.user_id..":"..msg_chat_id,true)
send(msg.chat_id,msg.id,"⎋ ارسل الحكم الان")
end

if text and Redis:get(Fast.."Ahkam:set"..msg.sender_id.user_id..":"..msg_chat_id) then
Redis:sadd(Fast.."Ahkam_list:", text)
Redis:del(Fast.."Ahkam:set"..msg.sender_id.user_id..":"..msg_chat_id)
send(msg_chat_id,msg_id,"⎋ تم حفظ الحكم بنجاح")
end

if text == "اضف حكم" then
if not msg.Asasy then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
Redis:set(Fast.."Ahkam:set"..msg.sender_id.user_id..":"..msg_chat_id,true)
send(msg.chat_id,msg.id,"⎋ ارسل الحكم الان")
end
Ahkam_list = {
  "احذف حسابك",
  "اشتم نفسك",
  "صور نفسك وانت بتلعب 20 ضغط",
  "قول انا مرا",
}
if text == "احكام" then 
local Anubis = math.random(99999999999999)
Redis:sadd(Fast.."Ahkam:"..Anubis..":chat_id:"..msg_chat_id, msg.sender_id.user_id)
Redis:set(Fast.."in_game:"..msg.sender_id.user_id, Anubis)
local reply_markup = bot.replyMarkup{
  type = 'inline',
  data = {
    {{text = "انضم" , data = "Ahkam/"..Anubis}}
  }
}
return send(msg_chat_id, msg_id, "اهلا بك في لعبه الاحكام\nللانضمام اضغط انضم واستحمل بقا وهيتم تشغيل اللعبه عند الوصول ل10 افراد او عند موافقه كل اعضاء اللعبه ع البدء عن طريق ( بدء )\n============\nاللاعبين :\n- ["..bot.getUser(msg.sender_id.user_id).first_name.."](tg://user?id="..msg.sender_id.user_id..")","md",false, false, false, false, reply_markup)
end
if text == "بدء" then 
if Redis:get(Fast.."in_game:"..msg.sender_id.user_id) then
local Anubis = Redis:get(Fast.."in_game:"..msg.sender_id.user_id)
local numR = Redis:smembers(Fast.."Ahkam_ready:"..Anubis..":chat_id:"..msg_chat_id)
local numN = Redis:smembers(Fast.."Ahkam:"..Anubis..":chat_id:"..msg_chat_id)
if #numR < #numN  then -- check on players no.
Redis:sadd(Fast.."Ahkam_ready:"..Anubis..":chat_id:"..msg_chat_id, msg.sender_id.user_id)
send(msg_chat_id, msg_id , "انت مستعد استنا بقا زمايلك لما يكتبو بدء او العدد يكتمل\n\nعدد اللاعبين : "..#numN.."\nعدد المستعدين : "..(#numR + 1 ))
end -- end check
if (#numR + 1) == (#numN) and #numN > 1 then -- players no. complete
local Ahkam = {}
for k,v in pairs(Ahkam_list) do
table.insert(Ahkam, v)
end
local Redis_Ahkam = Redis:smembers(Fast.."Ahkam_list:")
for k,v in pairs(Redis_Ahkam) do
table.insert(Ahkam, v)
end
local loser_id = numN[math.random(#numN)]
local loser_tag = "["..bot.getUser(loser_id).first_name.."](tg://user?id="..loser_id..")"
return send(msg_chat_id, 0, loser_tag.."\n محكوم عليك بـ ".. Ahkam[math.random(#Ahkam)],"md")
end -- done
end
end 

if text == "تفعيل شعر" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n✯︙تم تفعيل شعر'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'sh3ir:Abs'..msg.chat_id) 
end
if text == "تعطيل شعر" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*✯︙هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n✯︙تم تعطيل شعر'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'sh3ir:Abs'..msg.chat_id,true)  
end
if text and (text == "شعر" or text == "↫ شعر ✯") and not Redis:get(Fast..'sh3ir:Abs'..msg.chat_id) then
Abs = math.random(2,140); 
local Text ='*✯‍︙تم اختيار الشعر لك فقط*'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = 'قناه السورس',url='http://t.me/'..chsource..''}},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/L1BBBL/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "ثنائي اليوم" then
local Info_Members = bot.searchChatMembers(msg.chat_id, "*", 200)
local List_Members = Info_Members.members
local NumRand1 = math.random(1, #List_Members); 
local NumRand2 = math.random(1, #List_Members); 
local user1 = List_Members[NumRand1].member_id.user_id
local user2 = List_Members[NumRand2].member_id.user_id
local UserInfo = bot.getUser(user1)
local UserInfoo = bot.getUser(user2)
local listTow = "⎋ ثنائي اليوم : \n ["..FlterBio(UserInfo.first_name).."](tg://user?id="..UserInfo.id..") ~ ["..UserInfoo.first_name.."](tg://user?id="..UserInfoo.id..")\n"
return send(msg.chat_id,msg.id,listTow,"md",true)  
end

if text == "تعطيل التسليه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if Redis:get(Fast..'amrthshesh'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'⎋ تم تعطيل التسليه مسبقا\n ✓',"md")
else
Redis:set(Fast.."amrthshesh"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'⎋ تم تعطيل التسليه\n ✓',"md")
end
end
if text == "تفعيل التسليه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if not Redis:get(Fast..'amrthshesh'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'⎋ تم تفعيل التسليه مسبقا\n ✓',"md")
else
Redis:del(Fast.."amrthshesh"..msg.chat_id)
return send(msg_chat_id,msg_id,'⎋ تم تفعيل التسليه\n ✓',"md")
end
end
if text == 'مسح صوت' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:set(Fast.."Add:audio:Games"..senderr..":"..msg.chat_id,'startdel')
return send(msg_chat_id,msg_id,'⎋ ارسل اسم الصوتيه',"md")
end
if text== 'اضف صوت' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
Redis:set(Fast.."Add:audio:Games"..senderr..":"..msg.chat_id,'start')
return send(msg_chat_id,msg_id, '⎋ ارسل اسم الصوت الان ...',"md")
end
if text== ("الصوتيات") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."text:Games:Bot"..msg.chat_id)
if #list == 0 then
send(msg_chat_id,msg_id, "⎋ لا توجد صوتيات")
return false
end
message = '⎋ قائمه الصوتيات :\n     للتشغيل اختر اسم من الاتي:\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n'
for k,v in pairs(list) do
message = message..""..k.."- ("..v..")\n"
end
send(msg_chat_id,msg_id,message)
end
if text== ("مسح الصوتيات") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."text:Games:Bot"..msg.chat_id)
if #list == 0 then
send(msg_chat_id,msg_id, "⎋ لا توجد صوتيات عامه")
return false
end
for k,v in pairs(list) do
Redis:srem(Fast.."text:Games:Bot"..msg.chat_id,v)
Redis:del(Fast.."audio:Games"..msg.chat_id..v)
end
send(msg_chat_id,msg_id, "⎋ تم مسح جميع الصوتيات")
end


if text == 'مسح صوت عام' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."All:Add:audio:Games"..senderr..":"..msg.chat_id,'startdel')
send(msg_chat_id,msg_id, '⎋ ارسل اسم الصوتيه',"md")
end
if text== 'اضف صوت عام' then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
Redis:set(Fast.."All:Add:audio:Games"..senderr..":"..msg.chat_id,'start')
send(msg_chat_id,msg_id, '⎋ ارسل اسم الصوت الان ...',"md")
end
if text== ("الصوتيات العامه") or text== ("الاغاني") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."All:text:Games:Bot")
if #list == 0 then
send(msg_chat_id,msg_id, "⎋ لا توجد صوتيات عامه")
return false
end
message = '⎋ قائمه الصوتيات العامه:\n     للتشغيل اختر اسم من الاتي:\nـــــــــــــــــــــــــــــــــــــــــــــــــــــــ\n'
for k,v in pairs(list) do
message = message..""..k.."- ("..v..")\n"
end
send(msg_chat_id,msg_id,message)
end
if text== ("مسح الصوتيات العامه") then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(2)..' }* ',"md",true)  
end
local list = Redis:smembers(Fast.."All:text:Games:Bot")
if #list == 0 then
send(msg_chat_id,msg_id, "⎋ لا توجد صوتيات")
return false
end
for k,v in pairs(list) do
Redis:srem(Fast.."All:text:Games:Bot",v)
Redis:del(Fast.."All:audio:Games"..v)
end
send(msg_chat_id,msg_id, "⎋ تم مسح جميع الصوتيات")
end
if text == "تعطيل الصيغ" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'kadmeat'..msg.chat_id)  then
send(msg_chat_id,msg_id, '⎋ تم تعطيل اوامر الصيغ مسبقا\n ✓',"md")
else
Redis:set(Fast.."kadmeat"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '⎋ تم تعطيل اوامر الصيغ\n ✓',"md")
end
end
if text == "تفعيل الصيغ" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'kadmeat'..msg.chat_id)  then
send(msg_chat_id,msg_id, '⎋ تم تفعيل اوامر التحويلات مسبقا\n ✓',"md")
else
Redis:del(Fast.."kadmeat"..msg.chat_id)
send(msg_chat_id,msg_id, '⎋ تم تفعيل اوامر الصيغ\n ✓',"md")
end
end
if text == "تعطيل انطق" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'intg'..msg.chat_id)  then
send(msg_chat_id,msg_id, '⎋ تم تعطيل امر انطق مسبقا\n ✓',"md")
else
Redis:set(Fast.."intg"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '⎋ تم تعطيل امر انطق\n ✓',"md")
end
end
if text == "تفعيل انطق" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'intg'..msg.chat_id)  then
send(msg_chat_id,msg_id, '⎋ تم تفعيل امر انطق مسبقا\n ✓',"md")
else
Redis:del(Fast.."intg"..msg.chat_id)
send(msg_chat_id,msg_id, '⎋ تم تفعيل امر انطق\n ✓',"md")
end
end
if text == "تعطيل غنيلي" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'knele'..msg.chat_id)  then
send(msg_chat_id,msg_id, '⎋ تم تعطيل امر غنيلي مسبقا\n ✓',"md")
else
Redis:set(Fast.."knele"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '⎋ تم تعطيل امر غنيلي\n ✓',"md")
end
end
if text == "تفعيل غنيلي" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'knele'..msg.chat_id)  then
send(msg_chat_id,msg_id, '⎋ تم تفعيل امر غنيلي مسبقا\n ✓',"md")
else
Redis:del(Fast.."knele"..msg.chat_id)
send(msg_chat_id,msg_id, '⎋ تم تفعيل امر غنيلي\n ✓',"md")
end
end
if text == "تعطيل الابراج" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'brjj'..msg.chat_id)  then
send(msg_chat_id,msg_id, '⎋ تم تعطيل امر الابراج مسبقا\n ✓',"md")
else
Redis:set(Fast.."brjj"..msg.chat_id,"true")
send(msg_chat_id,msg_id, '⎋ تم تعطيل امر الابراج\n ✓',"md")
end
end
if text == "تفعيل الابراج" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'brjj'..msg.chat_id)  then
send(msg_chat_id,msg_id, '⎋ تم تفعيل امر الابراج مسبقا\n ✓',"md")
else
Redis:del(Fast.."brjj"..msg.chat_id)
send(msg_chat_id,msg_id, '⎋ تم تفعيل امر الابراج\n ✓',"md")
end
end
if text == "تفعيل متحركه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n⎋ تم تفعيل المتحركه'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:gif:Abs'..msg.chat_id) 
end
if text == "تعطيل متحركه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n⎋ تم تعطيل المتحركه'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:gif:Abs'..msg.chat_id,true)  
end
if text and (text == "متحركه" or text == "↫ متحركه ✯") and not Redis:get(Fast..'Abs:gif:Abs'..msg.chat_id) then
Abs = math.random(2,1075); 
local Text ='*⎋ تم اختيار المتحركه لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendanimation?chat_id=' .. msg.chat_id .. '&animation=https://t.me/GifWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text == "تفعيل ميمز" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n⎋ تم تفعيل الميمز'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:memz:Abs'..msg.chat_id) 
end
if text == "تعطيل ميمز" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n⎋ تم تعطيل الميمز'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:memz:Abs'..msg.chat_id,true)  
end
if text and (text == "ميمز" or text == "↫ ميمز ✯") and not Redis:get(Fast..'Abs:memz:Abs'..msg.chat_id) then
Abs = math.random(2,220); 
local Text ='*⎋ تم اختيار مقطع الميمز لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/MemzWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text == "تفعيل ريمكس" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n⎋ تم تفعيل الريمكس'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:Remix:Abs'..msg.chat_id) 
end
if text == "تعطيل ريمكس" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n⎋ تم تعطيل الريمكس'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:Remix:Abs'..msg.chat_id,true)  
end
if text and (text == "ريمكس" or text == "↫ ريمكس ✯") and not Redis:get(Fast..'Abs:Remix:Abs'..msg.chat_id) then
Abs = math.random(2,400); 
local Text ='*⎋ تم اختيار الريمكس لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/RemixWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end

if text == "تفعيل صوره" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n⎋ تم تفعيل الصوره'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:Photo:Abs'..msg.chat_id) 
end
if text == "تعطيل صوره" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n⎋ تم تعطيل الصوره'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:Photo:Abs'..msg.chat_id,true)  
end
if text and (text == "صوره" or text == "↫ صوره ✯") and not Redis:get(Fast..'Abs:Photo:Abs'..msg.chat_id) then
Abs = math.random(4,1120); 
local Text ='*⎋ تم اختيار الصوره لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/PhotosWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end

if text == "تفعيل انمي" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n⎋ تم تفعيل الانمي'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:Anime:Abs'..msg.chat_id) 
end
if text == "تعطيل انمي" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n⎋ تم تعطيل الانمي'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:Anime:Abs'..msg.chat_id,true)  
end
if text == "اغاني" or text == "اطربني" then
Abs = math.random(2,140);
local Text ='🎙'
local MsgId = msg.id/2097152/0.5
local MSGID = string.gsub(MsgId,'.0','')
keyboard = {}
keyboard.inline_keyboard = {{{text = '', callback_data = msg.sender_id.user_id..'/kanele'}}}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/fkfnfnfn/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..MsgId.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
end
if text == "جيفات بنات" or text == "جيف بنات" then
local t = "⇜ اخترت لك هذا الچيف"
Rrr = math.random(4,50)
local m = "https://t.me/lflflrofo/"..Rrr..""
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendanimation?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&animation="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown")
end
if text == "جيفات شباب" or text == "جيف شباب" then
local t = "⇜ اخترت لك هذا الجيف"
Rrr = math.random(4,50)
local m = "https://t.me/dldldldlgt/"..Rrr..""
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendanimation?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&animation="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown")
end
if text == "جيفات قطط" or text == "جيف قطط" then
local t = "⇜ اخترت لك هذا الجيف"
Rrr = math.random(4,50)
local m = "https://t.me/gsgjituops/"..Rrr..""
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendanimation?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&animation="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown")
end
if text == "جيفات اطفال" or text == "جيف اطفال" then
local t = "⇜ اخترت لك هذا الجيف"
Rrr = math.random(4,50)
local m = "https://t.me/fmgngoclr/"..Rrr..""
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendanimation?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&animation="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown")
end
if text == "جيفات رومانسيه" or text == "جيف رومانسي" then
local t = "⇜ اخترت لك هذا الجيف"
Rrr = math.random(4,50)
local m = "https://t.me/romansiaaa/"..Rrr..""
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendanimation?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&animation="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown")
end
if text == "جيفات كيبوب" or text == "جيف كيبوب" then
local t = "⇜ اخترت لك هذا الجيف"
Rrr = math.random(4,50)
local m = "https://t.me/kibobg/"..Rrr..""
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendanimation?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&animation="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown")
end
if text and (text == "انمي" or text == "↫ انمي ✯") and not Redis:get(Fast..'Abs:Anime:Abs'..msg.chat_id) then
Abs = math.random(3,998); 
local Text ='*⎋ تم اختيار صورة الانمي لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/AnimeWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text and (text == "معمه" or text == "معلة") and not Redis:get(Fast..'Abs:Anime:Abs'..msg.chat_id) then
Abs = math.random(3,998); 
local Text ='*⎋ صوره وملعومه*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/A_l3l/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text and (text == "معلومه" or text == "معلومات") and not Redis:get(Fast..'Abs:Anime:Abs'..msg.chat_id) then
Abs = math.random(3,998); 
local Text ='*⎋ خد احلي معلومه اهي🙄❤*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/A_l3l/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text and (text == "حاله" or text == "حاله واتس") and not Redis:get(Fast..'Abs:Anime:Abs'..msg.chat_id) then
Abs = math.random(3,998); 
local Text ='*⎋ خد حاله واتس من عمك كينج اهي🙄❤*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendvideo?chat_id=' .. msg.chat_id .. '&video=https://t.me/kokokkkkkp/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text and (text == "حاله انمي" or text == "حالات انمي") and not Redis:get(Fast..'Abs:Anime:Abs'..msg.chat_id) then
Abs = math.random(3,998); 
local Text ='*⎋ خد حاله انمي من سورس افاتار اهي🙄♥*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendvideo?chat_id=' .. msg.chat_id .. '&video=https://t.me/AA_Zll/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text == "استوري" then
Rrr = math.random(4,50)
local m = "https://t.me/Qapplu/"..Rrr..""
local t = "آحلي استوري ليك يبنلقمرر ⎋ 🌝🥳"
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendaudio?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&audio="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown")
end
if text == "رمزيه تطقيم" or text == "افتار تطقيم" then
local t = "⇜ اخترت لك هذا الافتار"
Rrr = math.random(4,50)
local m = "https://t.me/zzuauwwuaisz/"..Rrr..""
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&photo="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown")
end
if text == "لوكيت" or text == "افتار لوكيت" or text == "افتارات لوكيت" then
local t = "⇜ اخترت لك هذا اللوكيت"
Rrr = math.random(4,50)
local m = "https://t.me/kabsjjwbs/"..Rrr..""
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&photo="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown")
end
if text == "رمزيات لاعبين" or text == "افتار لاعبين" then
local t = "⇜ اخترت لك هذه الرمزيه"
Rrr = math.random(4,50)
local m = "https://t.me/IIYIH/"..Rrr..""
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&photo="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown")
end
if text == "قران" then
Abs = math.random(2,140); 
local Text ='⎋ تم اختيار قران'
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'قناة السورس',url="t.me/source_av"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/djsjdjdd/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "جداريات" then 
Abs = math.random(2,140); 
local Text ='⎋ تم اختيار جداريات'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/source_av"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/usjeijw/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "رمزيات شباب" then
Abs = math.random(2,140); 
local Text ='⎋ تم اختيار افـاتـار عيال'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/source_av"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/LoreBots3/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "هيدرات" then 
Abs = math.random(2,140); 
local Text ='⎋ تم اختيار هيدرات'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/source_av"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/flflfldld/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "رمزيات بنات" then
Abs = math.random(2,140); 
local Text ='⎋ تم اختيار افـاتـار بنات'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/source_av"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/LoreBots2/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "رمزيات رسم" then
Abs = math.random(2,140); 
local Text ='⎋ تم اختيار افـاتـار رسم'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/source_av"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/LoreBots5/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "رمزيات فكتوري" then
Abs = math.random(2,140); 
local Text ='⎋ تم اختيار افـاتـار فكتوري'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/source_av"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/LoreBots6/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "رمزيات سينمائيه" then
Abs = math.random(2,140); 
local Text ='⎋ تم اختيار افـاتـار السينمائي'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/source_av"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/LoreBots1/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "رمزيات اقتباس" then
Abs = math.random(2,140); 
local Text ='⎋ تم اختيار اقتباس'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/source_av"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/LoreBots8/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "رمزيات كرتون" then
Abs = math.random(2,140); 
local Text ='⎋ تم اختيار افـاتـار انمي'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/source_av"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/LoreBots7/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "رمزيات عبارات" then 
Abs = math.random(2,140); 
local Text ='⎋ تم اختيار عباره'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/source_av"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/LoreBots9/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "رمزيات فنانين عرب" then
Abs = math.random(2,140); 
local Text ='⎋ تم اختيار افـاتـار فنانين'
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = 'قناة السورس', url = "https://t.me/source_av"}
},
}
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/FPPPH/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "تفعيل فلم" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n⎋ تم تفعيل الافلام'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:Movies:Abs'..msg.chat_id) 
end
if text == "تعطيل فلم" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n⎋ تم تعطيل الافلام'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:Movies:Abs'..msg.chat_id,true)  
end
if text and (text == "فلم" or text == "↫ فلم ✯") and not Redis:get(Fast..'Abs:Movies:Abs'..msg.chat_id) then
Abs = math.random(4,80); 
local Text ='*⎋ تم اختيار الفلم لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/MoviesWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end
if text == "تفعيل مسلسل" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n⎋ تم تفعيل المسلسلات'
send(msg_chat_id,msg_id,F333F,"md")
Redis:del(Fast..'Abs:Series:Abs'..msg.chat_id) 
end
if text == "تعطيل مسلسل" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
local F333F = ' \n⎋ تم تعطيل المسلسلات'
send(msg_chat_id,msg_id,F333F,"md")
Redis:set(Fast..'Abs:Series:Abs'..msg.chat_id,true)  
end
if text and (text == "مسلسل" or text == "↫ مسلسل ✯") and not Redis:get(Fast..'Abs:Series:Abs'..msg.chat_id) then
Abs = math.random(2,54); 
local Text ='*⎋ تم اختيار المسلسل لك*'
local msg_id = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg.chat_id .. '&photo=https://t.me/SeriesWaTaN/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown") 
end

if text == "تقطيع" then
if tonumber(msg.reply_to_message_id) > 0 then
local result = bot.getMessage(msg.chat_id, msg.reply_to_message_id)
if result.content.text then 
local line = result.content.text.text
for t in string.gmatch(line, "[^%s]+") do
send(msg_chat_id,msg_id,t,"md",true)  
end 
end
end
end

if text == "غنيلي" then
local t = "اليك اغنيه عشوائيه من البوت"
Num = math.random(8,83)
Mhm = math.random(108,143)
Mhhm = math.random(166,179)
Mmhm = math.random(198,216)
Mhmm = math.random(257,626)
local Texting = {Num,Mhm,Mhhm,Mmhm,Mhmm}
local Rrr = Texting[math.random(#Texting)]
local m = "https://t.me/mmsst13/"..Rrr..""
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = 'اغنيه اخري', callback_data=msg.sender_id.user_id.."/songg"},
},
}
local rep = msg.id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendaudio?chat_id="..msg_chat_id.."&caption="..URL.escape(t).."&audio="..m.."&reply_to_message_id="..rep.."&parse_mode=Markdown&reply_markup="..JSON.encode(keyboard))
end
if text == "عجله الحظ"  then 
local Text ='اضغظ لائقاف العجله🎰' 
keyboard = {}  
keyboard.inline_keyboard = {
{{text = 'وقف', callback_data = msg.sender_id.user_id..'/agla0'}}, 
} 
local msg_id = msg.id/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token..'/sendvideo?chat_id=' .. msg_chat_id .. '&video=https://t.me/jsjbdvbx/2&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "لو خيروك بالصوره"  then 
ban = math.random(1,42); 
local Text ='لاختيار لو خيروك اخري اتك ع زر بالاسفل' 
keyboard = {}  
keyboard.inline_keyboard = {
{{text = 'لوخيروك اخري', callback_data = msg.sender_id.user_id..'/ghyrok'}}, 
} 
local msg_id = msg.id/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg_chat_id .. '&photo=https://t.me/kbbnv/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
if text == "تويت بالصوره"  then 
ban = math.random(1,40); 
local Text ='لاختيار تويت اخري اتك ع زر بالاسفل' 
keyboard = {}  
keyboard.inline_keyboard = {
{{text = 'تويت  اخري', callback_data = msg.sender_id.user_id..'/tuet'}}, 
} 
local msg_id = msg.id/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token..'/sendphoto?chat_id=' .. msg_chat_id .. '&photo=https://t.me/wffhvv/'..ban..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..msg_id.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end

if text == "تعطيل معاني الاسماء" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'mynames'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'⎋ تم تعطيل معنى اسم مسبقا\n ✓',"md")
else
Redis:set(Fast.."mynames"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'⎋ تم تعطيل معنى اسم\n ✓',"md")
end
end
if text == "تفعيل معاني الاسماء" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'mynames'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'⎋ تم تفعيل معنى اسم مسبقا\n ✓',"md")
else
Redis:del(Fast.."mynames"..msg.chat_id)
return send(msg_chat_id,msg_id,'⎋ تم تفعيل معنى اسم\n ✓',"md")
end
end
if text == "تعطيل قول" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'kolklma'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'⎋ تم تعطيل قول مسبقا\n ✓',"md")
else
Redis:del(Fast.."kolklma"..msg.chat_id)
return send(msg_chat_id,msg_id,'⎋ تم تعطيل قول\n ✓',"md")
end
end
if text == "تفعيل قول" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'kolklma'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'⎋ تم تفعيل قول مسبقا\n ✓',"md")
else
Redis:set(Fast.."kolklma"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'⎋ تم تفعيل قول\n ✓',"md")
end
end
if text and text:match("^قول (.*)$") and Redis:get(Fast..'kolklma'..msg.chat_id) then
local txt = {string.match(text, "^(قول) (.*)$")}
return send(msg_chat_id,msg_id, txt[2], 'md')
end

if text == "تعطيل اغنيه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if Redis:get(Fast..'myniknea'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'⎋ تم تعطيل اغنيه مسبقا\n ✓',"md")
else
Redis:set(Fast.."myniknea"..msg.chat_id,"true")
return send(msg_chat_id,msg_id,'⎋ تم تعطيل اغنيه\n ✓',"md")
end
end
if text == "تفعيل اغنيه" then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if not Redis:get(Fast..'myniknea'..msg.chat_id)  then
return send(msg_chat_id,msg_id,'⎋ تم تفعيل اغنيه مسبقا\n ✓',"md")
else
Redis:del(Fast.."myniknea"..msg.chat_id)
return send(msg_chat_id,msg_id,'⎋ تم تفعيل اغنيه\n ✓',"md")
end
end
if text == "تفعيل نسبه جمالي" or text == "تفعيل جمالي" then
if not msg.Admin then
send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص  '..Controller_Num(7)..' * ',"md",true)  
end
Redis:del(Fast.."mybuti"..msg_chat_id)
send(msg_chat_id,msg_id,'\n*⎋ تم تفعيل امر جمالي * ',"md",true)  
end
if text == "تعطيل جمالي" or text == "تعطيل نسبه جمالي" then
if not msg.Admin then
send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص  '..Controller_Num(7)..' * ',"md",true)  
end
Redis:set(Fast.."mybuti"..msg_chat_id,"off")
send(msg_chat_id,msg_id,'\n*⎋ تم امر امر جمالي * ',"md",true)  
end
if text == "جمالي" or text == 'نسبه جمالي' then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
if Redis:get(Fast.."mybuti"..msg_chat_id) == "off" then
send(msg_chat_id,msg_id,'*⎋ نسبه جمالي معطله*',"md",true) 
else
local photo = bot.getUserProfilePhotos(senderr)
if msg.Dev then
if photo.total_count > 0 then
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,"*نسبه جمالك هي 900% عشان مطور ولازم اطبله😹♥*", "md")
else
return send(msg_chat_id,msg_id,'*⎋ لا توجد صوره ف حسابك*',"md",true) 
end
else
if photo.total_count > 0 then
local nspp = {"10","20","30","35","75","34","66","82","23","19","55","80","63","32","27","89","99","98","79","100","8","3","6","0",}
local rdbhoto = nspp[math.random(#nspp)]
return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,"*نسبه جمالك هي "..rdbhoto.."% 🙄♥*", "md")
else
return send(msg_chat_id,msg_id,'*⎋ لا توجد صوره ف حسابك*',"md",true) 
end
end
end
end

if text == "اغنية" or text == "اغنيه" then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast..'myniknea'..msg.chat_id) then
Abs = math.random(3,205); 

local Text ='*⎋ تم اختيار الاغنيه لك*'
keyboard = {} 
keyboard.inline_keyboard = {
{{text = '- قناه السورس .',url='http://t.me/'..chsource..''}},
}
local MsgId = msg.id/2097152/0.5
local MSGID = 0
https.request("https://api.telegram.org/bot"..Token..'/sendVoice?chat_id=' .. msg.chat_id .. '&voice=https://t.me/meromp3/'..Abs..'&caption=' .. URL.escape(Text).."&reply_to_message_id="..MSGID.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard)) 
end
end 
if text and text:match("^play (.*)$") then
local q = text:match("^play (.*)$")
if q:match("%a") then
local url = https.request("https://xnxx.fastbots.ml/apies/playstore.php?q="..URL.escape(q))
local json = JSON.decode(url)
if url == "null" or #json <= 1 then
return send(msg.chat_id,msg.id,'⎋ لم استطيع العثور علي نتيجه في google play ')
end
local datar = {data = {{text = "قناه السورس" , url = 'http://t.me/'..chsource..''}}}
if #json < 5 then
for i = 1,#json do
title = json[i].title
link = "https://play.google.com"..json[i].url
datar[i] = {{text = title , url = link}}
end
else
for i = 1,5 do
title = json[i].title
link = "https://play.google.com"..json[i].url
datar[i] = {{text = title , url = link}}
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = datar
}
send(msg.chat_id,msg.id,'⎋ نتائج بحثك عن *'..q..'* في play store',"md",false, false, false, false, reply_markup)
else
send(msg.chat_id,msg.id,"⎋ البحث باللغه الانجليزيه فقط")
end
end
if text then
if text:match("^انطق (.*)$") or text:match("^انطقي (.*)$") then
if Redis:get(Fast.."intg"..msg.chat_id) then
return false 
end
local inoi = text:match("^انطق (.*)$") or text:match("^انطقي (.*)$")
local intk = inoi:gsub(" ","-")
if intk:match("%a") then
lan = "en"
else
lan = "ar"
end
local rand = math.random(1,999)
os.execute("gtts-cli "..intk.." -l '"..lan.."' -o 'intk"..rand..".mp3'")
bot.sendAudio(msg_chat_id,msg_id,'./intk'..rand..'.mp3',tostring(inoi),"html",nil,tostring(inoi),"@source_av")
sleep(1)
os.remove("intk"..rand..".mp3")
end
end

if text and text:match("^انطقي (.*)$") then
Text = text:match("^انطقي (.*)$")
msg_id = msg.id/2097152/0.5 
https.request("https://api.telegram.org/bot"..Token..
"/sendaudio?chat_id="..msg.chat_id.."&caption=الكلمة "..
URL.escape(Text).."&audio=http://"..
URL.escape('translate.google.com/translate_tts?q='..Text..
'&tl=ar&client=duncan3dc-speaker')..
"&reply_to_message_id="..msg_id..
"&disable_web_page_preview=true")
end

if text and text:match("^جوجل (.*)$") then
local F = text:match("^جوجل (.*)$") 
local Text_mira = "⇜ اضغط على بحثك وهو "..F..""
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'اضغط هنا', url = 'https://www.google.com/search?q='..F..'&ie=UTF-8&oe=UTF-8&hl=ar-sa&client=safari'},
},
}
}
return send(msg.chat_id,msg.id,Text_mira,"md",false, false, false, false, reply_markup)
end

if text and text:match("^تيك (.*)$") or text and text:match("^(.*) تيك$") then
local tiklink = text:match("^تيك (.*)$") or text:match("^(.*) تيك$")
if Redis:get(Fast.."soshle"..msg.chat_id) then
return false
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local nameuser = bot.getUser(msg.sender_id.user_id)
if nameuser.first_name then
nameuser = "["..nameuser.first_name.."](tg://user?id="..nameuser.id..")"
else
nameuser = 'لا يوجد اسم'
end
os.execute("yt-dlp "..tiklink.." --max-filesize 2000M -o 'tik.mp4'")
local tikfile = io.open("./tik.mp4","r")
if tikfile then
bot.sendVideo(msg_chat_id,msg_id,'./tik.mp4',"- من قبل : "..nameuser.."️","md") 
sleep(1)
os.remove("tik.mp4")
else
return send(msg_chat_id,msg_id,'\n⇜ لا استطيع تحميل اكثر من 50 ميغا',"md",true)
end
end

if text and text:match("^ساوند (.*)$") or text and text:match("^(.*) [Ss]$") then
local search = text:match("^ساوند (.*)$") or text:match("^(.*) [Ss]$")
if Redis:get(Fast.."soshle"..msg.chat_id) then
return false
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local jsonson = JSON.decode(request("https://ava-tar.online/api/su_se/get/index.php?text="..URL.escape(search)..""))
Redis:del(Fast.."soundidche"..msg.chat_id..msg.sender_id.user_id)
Redis:set(Fast.."soundidche"..msg.chat_id..msg.sender_id.user_id,search)
local datar = {data = {{text = "𓌹 ↱ َِ𝘢َِ𝙑َِ𝘢َِ𝙏َِ𝘢َِ𝘳 ↲ 𓌺", url = 'https://t.me/source_av'}}}
for i = 1,5 do
titlee = jsonson.result[''..i..''].title
link = jsonson.result[''..i..''].url
link = tostring(link)
link = link:gsub("https://soundcloud.com/",'') 
datar[i] = {{text = titlee , data = search..":socl:"..link}}
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = datar
}
bot.sendText(msg.chat_id,msg.id,' نتائج بحثك على الساوند ل ( *'..search..'* )',"md",false, false, false, false, reply_markup)
end

if text and text:match("^رابط ساوند (.*)$") then
local soundlink = text:match("^رابط ساوند (.*)$")
if Redis:get(Fast.."soshle"..msg.chat_id) then
return false
end
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local nameuser = bot.getUser(msg.sender_id.user_id)
if nameuser.first_name then
nameuser = "["..nameuser.first_name.."](tg://user?id="..nameuser.id..")"
else
nameuser = 'لا يوجد اسم'
end
os.execute("yt-dlp "..soundlink.." --max-filesize 25M -o 'soundc.mp3'")
local soufile = io.open("./soundc.mp3","r")
if soufile then
bot.sendAudio(msg_chat_id,msg_id,'./soundc.mp3',"- من قبل : "..nameuser.."️","md",nil,"soundc")
sleep(1)
os.remove("soundc.mp3")
else
return send(msg_chat_id,msg_id,'\n⇜ لا استطيع تحميل اكثر من 25 ميغا',"md",true)
end
end
-----
if text == 'السورس' or text == 'سورس' or text == 'يا سورس'  then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '« ᥉᥆υᖇᥴᥱ » ', url = "https://t.me/source_av"},{text='« ꪔᥲ️kᥱᖇ »',url="t.me/AV_MA_BOT"}
},
{
{text = 'أضغط لاضافه ألبوت لمجموعتك 𖣳', url = "t.me/"..UserBot.."?startgroup=new"},
},
}
}
bot.sendPhoto(msg.chat_id, msg.id, 'http://t.me/'..chsource..'', [[
]],"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end

if text == 'تحديث' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id, "⎋ تم تحديث الملفات ♻\n⎋ الاصدار : 2.12.1 AN","md",true)
dofile('Fast.lua')  
end
if text == 'اصدار السورس' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id, "⎋ الاصدار : 2.12.1 AN","md",true)
end
if text == "بحبك" then
local Jabwa = bot.getUser(senderr)
local Name = '['..Jabwa.first_name..'](tg://user?id='..Jabwa.id..')' or 'لا يوجد اسم' 
local JABWA = "*⎋ وانا كمان بعشقك يا 🥺♥*\n"..Name.."\n*√*"
send(msg_chat_id,msg_id, JABWA,"md",true)   
end
if text == "تغير اسم البوت" or text == "تغيير اسم البوت" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Change:Name:Bot"..senderr,300,true) 
return send(msg_chat_id,msg_id,"⎋ ارسل لي الاسم الان ","md",true)  
end
if text == "مسح اسم البوت" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Name:Bot") 
return send(msg_chat_id,msg_id,"⎋ تم مسح اسم البوت ","md",true)   
end
if text == (Redis:get(Fast.."Name:Bot") or "[آڤتآر]") then
local NamesBot = (Redis:get(Fast.."Name:Bot") or "[آڤتآر]")
local NameBots = {
"قلب "..NamesBot.. "",
"قلبه ودقاته وكل حياته",
"اؤمر يقمري ♥",
"امرك 🌚",
"ميتين  "..NamesBot.." زهقتوني ",
}
return send(msg_chat_id,msg_id, NameBots[math.random(#NameBots)],"md",true)  
end
----
if text == "بوت" then
if Redis:get(Fast.."name bot type : ") == "photo" then
  
    local photo = bot.getUserProfilePhotos(Fast)
    local UserInfo = bot.getUser(Fast)
    local Name_User = UserInfo.first_name
    local Name_dev = bot.getUser(Sudo_Id).first_name
    local UName_dev = bot.getUser(Sudo_Id).username
    local reply_markup = bot.replyMarkup{type = 'inline',data = {
      {
        {text = Name_User, url = "t.me/"..UserInfo.username}
      },
      {
        {text = Name_dev, url = "t.me/"..UName_dev }
      }
    }
    }
    
    if photo.total_count > 0 then
      local NamesBot = (Redis:get(Fast.."Name:Bot") or "[آڤتآر]")
      local BotName = {
      "اسمي "..NamesBot.." يبن العاميه",
      "يارب يكون موضوع مهم بس",
      "هو يوم مهبب انا عارف..عاوز اي ؟",
      "اسمي "..NamesBot.." يا كفيف",
      "مش شايف اسمي ولا اي ؟"
      }
    return bot.sendPhoto(msg.chat_id, msg.id, photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id,BotName[math.random(#BotName)], "md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup )
    else
      local NamesBot = (Redis:get(Fast.."Name:Bot") or "[آڤتآر]")
      local BotName = {
      "اسمي "..NamesBot.." يبن العاميه",
      "يارب يكون موضوع مهم بس",
      "هو يوم مهبب انا عارف..عاوز اي ؟",
      "اسمي "..NamesBot.." يا كفيف",
      "مش شايف اسمي ولا اي ؟"
      }
    return bot.sendText(msg_chat_id,msg_id,BotName[math.random(#BotName)],"md") 
    end 
    end
          local NamesBot = (Redis:get(Fast.."Name:Bot") or "[آڤتآر]")
      local BotName = {
      "اسمي "..NamesBot.." يبن العاميه",
      "يارب يكون موضوع مهم بس",
      "هو يوم مهبب انا عارف..عاوز اي ؟",
      "اسمي "..NamesBot.." يا كفيف",
      "مش شايف اسمي ولا اي ؟"
      }
    return bot.sendText(msg_chat_id,msg_id,BotName[math.random(#BotName)],"md") 

  end
  ----
if text == 'تنظيف المشتركين' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
local ChatAction = bot.sendChatAction(v,'Typing')
if ChatAction.Fastbots ~= "ok" then
x = x + 1
Redis:srem(Fast..'Num:User:Pv',v)
end
end
if x ~= 0 then
return send(msg_chat_id,msg_id,'*⎋ العدد الكلي { '..#list..' }\n⎋ تم العثور على { '..x..' } من المشتركين حاظرين البوت*',"md")
else
return send(msg_chat_id,msg_id,'*⎋ العدد الكلي { '..#list..' }\n⎋ لم يتم العثور على وهميين*',"md")
end
end
if text == 'تنظيف المجموعات' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
if Get_Chat.id then
local statusMem = bot.getChatMember(Get_Chat.id,Fast)
if statusMem.status.Fastbots == "chatMemberStatusMember" then
x = x + 1
send(Get_Chat.id,0,'*⎋ البوت عضو في الجروب سوف اغادر ويمكنك تفعيلي مره اخره *',"md")
Redis:srem(Fast..'ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(Fast..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
bot.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(Fast..'*'..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(Fast..'ChekBotAdd',v)
bot.leaveChat(v)
end
end
if x ~= 0 then
return send(msg_chat_id,msg_id,'*⎋ العدد الكلي { '..#list..' } للمجموعات \n⎋ تم العثور على { '..x..' } مجموعات البوت ليس ادمن \n⎋ تم تعطيل الجروب ومغادره البوت من الوهمي *',"md")
else
return send(msg_chat_id,msg_id,'*⎋ العدد الكلي { '..#list..' } للمجموعات \n⎋ لا توجد مجموعات وهميه*',"md")
end
end

if text == "مسح المكتومين" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="- تاكيد مسح المكتومين",data=senderr..'/SilentGroupGroup'},
},
{
{text = "- اخفاء الامر ", data =senderr.."/delAmr"}
},
}
}
return send(msg_chat_id,msg_id,"*- هل انت متاكد من مسح المكتومين*", "md", false, false, false, false, reply_markup)
end 
if text == "مسح المحظورين" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="- تاكيد مسح المحظورين",data=senderr..'/BanGroup'},
},
{
{text = "- اخفاء الامر ", data =senderr.."/delAmr"}
},
}
}
return send(msg_chat_id,msg_id,"*- هل انت متاكد من مسح المحظورين*", "md", false, false, false, false, reply_markup)
end 

if text == "مسح القوائم" then
if not msg.Admin then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(7)..' }* ',"md",true)  
end
local reply_markup = bot.replyMarkup{
type = "inline",
data = {
{
{text="المطورين الاساسيين",data=senderr..'/redis:Devall'},
},
{
{text="المكتومين عام",data=senderr..'/KtmAll'},{text="المحظورين عام",data=senderr..'/BanAll'},
},
{
{text="المطورين الثانويين",data=senderr..'/Devss'},{text="المطورين",data=senderr..'/Dev'},
},
{
{text="المالكين",data=senderr..'/Ownerss'},{text="المنشئين الاساسيين",data=senderr..'/SuperCreator'},
},
{
{text="المنشئين",data=senderr..'/Creator'},{text="المدراء",data=senderr..'/Manger'},
},
{
{text="الادمنيه",data=senderr..'/Admin'},{text="المميزين",data=senderr..'/DelSpecial'},
},
{
{text="المكتومين",data=senderr..'/SilentGroupGroup'},{text="المحظورين",data=senderr..'/BanGroup'},
},
{
{text = "- اخفاء الامر ", data =senderr.."/delAmr"}
},
}
}
return send(msg_chat_id,msg_id,"*⌯︙اختر احدى القوائم لمسحها*", "md", false, false, false, false, reply_markup)
end 
if text == "مسح نقاطي" then 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Num:Add:Games"..msg.chat_id..senderr)
return send(msg_chat_id,msg_id, "⎋ تم مسح نقاطك","md",true)  
end

if text == 'ترتيب الاوامر' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تعط','تعطيل الايدي بالصوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تفع','تفعيل الايدي بالصوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ا','ايدي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'م','رفع مميز')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اد', 'رفع ادمن')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مد','رفع مدير')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'من', 'رفع منشئ')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مط','رفع مطور')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تن','تنزيل الكل')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ر','الرابط')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رر','الردود')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'،،','مسح المكتومين')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'غ','غنيلي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رس','رسائلي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ثانوي','رفع مطور ثانوي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مس','مسح تعديلاتي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ن','نقاطي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'س','اسالني')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ل','لغز')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مع','معاني')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ح','حزوره')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رف','رفع القيود')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'الغ','الغاء حظر')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ث','تثبيت')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ك','كشف')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تت','تاك')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تك','تاك للكل')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تغ','تغيير الايدي')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تنز','تنزيل جميع الرتب')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'قق','قفل الاشعارات')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'فف','فتح الاشعارات')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مر','مسح رد')
Redis:set(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'امر','اضف امر')
local listA = {'تعطيل الايدي بالصوره','تفعيل الايدي بالصوره','ايدي','رفع مميز', 'رفع ادمن','رفع مدير', 'رفع منشئ', 'رفع منشئ اساسي','رفع مطور','تنزيل الكل','الرابط','الردود','مسح المكتومين','اضف رد','غنيلي','رسائلي','رفع مطور ثانوي','مسح تعديلاتي','نقاطي','اسالني','لغز','معاني','حزوره','رفع القيود','الغاء حظر','تثبيت','كشف','تاك','تاك للكل','تغيير الايدي','تنزيل جميع الرتب','قفل الاشعارات','فتح الاشعارات','مسح رد','اضف امر'}
for k,v in pairs(listA) do
Redis:sadd(Fast.."Command:List:Group"..msg_chat_id.."",v)
end
return send(msg_chat_id,msg_id,[[*
⎋ تم ترتيب الاوامر بالشكل التالي ~
⎋ ايدي - ا .
⎋ رفع مميز - م .
⎋ رفع ادمن - اد .
⎋ رفع مدير - مد . 
⎋ رفع منشئ - من . 
⎋ رفع منشئ الاساسي - اس  .
⎋ رفع مطور - مط .
⎋ رفع مطور ثانوي - ثانوي .
⎋ تنزيل الكل بالرد - تن .
⎋ تعطيل الايدي بالصوره - تعط .
⎋ تفعيل الايدي بالصوره - تفع .
⎋ تغيير الايدي- تغ .
⎋ تنزيل جميع الرتب - تنز .
⎋ قفل الاشعارات - قق .
⎋ فتح الاشعارات - فف .
⎋ الرابط - ر .
⎋ الردود - رر .
⎋ تثبيت - ث .
⎋ كشف - ك .
⎋ تاك - تت .
⎋ تاك للكل - تك .
⎋ رفع القيود - رف .
⎋ الغاء حظر - الغ .
⎋ مسح المكتومين - ،، .
⎋ اضف رد - رد .
⎋ مسح رد - مر .
⎋ اضف امر - امر .
⎋ مسح تعديلاتي - مس .
⎋ مسح رسائلي - رس .
⎋ غنيلي - غ .
⎋ نقاطي - ن .
⎋ اسالني - س .
⎋ لغز - ل .
⎋ معاني - مع .
⎋ حزوره - ح .

*]],"md")
end
if text == 'استعاده الاوامر' then
if not msg.Manger then
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(6)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تعط','تعطيل الايدي بالصوره')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تفع','تفعيل الايدي بالصوره')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ا','ايدي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'م','رفع مميز')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اد', 'رفع ادمن')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مد','رفع مدير')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'من', 'رفع منشئ')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'اس', 'رفع منشئ اساسي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مط','رفع مطور')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تن','تنزيل الكل')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ر','الرابط')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رر','الردود')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'،،','مسح المكتومين')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رد','اضف رد')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مس','مسح تعديلاتي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'غ','غنيلي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رس','رسائلي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ثانوي','رفع مطور ثانوي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ن','نقاطي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'س','اسالني')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ل','لغز')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مع','مغاني')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ح','حزوره')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'رف','رفع القيود')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'الغ','الغاء حظر')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ث','تثبيت')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'ك','كشف')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تت','تاك')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تك','تاك للكل')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تغ','تغيير الايدي')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'تنزل','تنزيل جميع الرتب')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'قق','قفل الاشعارات')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'فف','فتح الاشعارات')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'مر','مسح رد')
Redis:del(Fast.."Get:Reides:Commands:Group"..msg_chat_id..":"..'امر','اضف امر')
return send(msg_chat_id,msg_id,[[*
⎋ تم استعاده الاوامر
*]],"md")
end
if text == "حذف الكيبورد" then
local k = {
remove_keyboard = true
}
return https.request("http://api.telegram.org/bot"..Token.."/sendmessage?text="..URL.escape("⎋ تم حذف الكيبورد").."&chat_id="..msg.chat_id.."&reply_markup="..JSON.encode(k))
end


end -- GroupBot
if chat_type(msg.chat_id) == "UserBot" then 
if text == 'تحديث الملفات ⎋' or text == 'تحديث' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end

send(msg_chat_id,msg_id, "⎋ تم تحديث الملفات ♻","md",true)
dofile('Fast.lua')  
end

if text == "كت" or text == "تويت" or text == "افاتار تويت" then
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
local texting = {"اخر افلام شاهدتها", 
"مرتبط؟ ", 
" هل بتكراش ع حد في حياتك؟", 
" ينفع نرتبط؟", 
" ممكن توريني صوره بتحبها؟", 
" ممكن نبقي صحااب ع الفيس؟", 
" هل لسه بتحب الاكس؟", 
"عندك كام اكس في حياتك؟ ", 
"ينفع تبعتلي رقمك؟ ", 
" ما تيجي اعزمني ع حاجه بحبها؟", 
"ينفع احضنك؟ ", 
"قولي ع اكبر غلطه ندمان عليهاا؟ ", 
"عندك كام سنه؟ ", 
" عامل بلوك لكام واحد عندك؟", 
" قولي سر محدش يعرفه؟", 
" عندك كام اكس في حياتك؟", 
"بتعرف تقلش وتهزر؟ ", 
" لونك المفضل هو؟", 
" مين أقرب حد ليك الفتره دي ؟", 
" قولي ع اكبر غلطه ندمان عليهاا؟", 
" مين مغنيك المفضل؟", 
" حابب تبقي اي في المستقبل؟", 
"راضي عن حياتك بنسبه كام؟ ", 
"اكتر حاجه بتلفت انتباهك في البنت او الولد؟ ", 
"اي رأيك في صوره البروفايل بتاعتي؟ ", 
" هل باين عليا اني شخص لطيف؟", 
" توافق ترجع للاكس؟", 
"ممكن تضحي بحياتك لمين؟ ", 
"سافرت بلاد برا مصر واي هي؟ ", 
" اي رأيك في صوره البروفايل بتاعتي؟", 
" هل بتعتبر نفسك حلو وبتحب شكلك؟", 
" نفسك تزور انهي بلد في العالم؟", 
" شخصيه ع السوشيال شايف انها مميزه؟", 
"عندك فوبيا من اي؟ ", 
" ممكن تورينا لينك الصراحه؟", 
"عمرك عيطت ع حاجه؟ ", 
" شايف اي أسوأ صفه فيك؟", 
"هل شلت مواد قبل كد وعدت السنه؟ ", 
"بتغير ع الل بتحبهم وبيبان عليك لو غيرت؟ ", 
"معاك كام فلوس دلوقتي؟ ", 
" بتفضل صحابك البنات ولا الولاد؟", 
" مسامح الل ظلمك؟", 
" ممثلك الافضل؟", 
" ممكن تقول رساله لحد مش هيشوفها؟", 
"انت اهلاوي ولا زملكاوي؟ ", 
" اي حيوانك المفضل؟", 
"اخر افلام شاهدتها", 
"بتعرف تكلم لغه تانيه واي هي؟ ", 
"ما هي وظفتك الحياه", 
"اعز اصدقائك ?", 
"اخر اغنية سمعتها ?", 
"تكلم عن نفسك", 
"ليه انت مش سالك", 
"ما هيا عيوب سورس زيرو ؟ ", 
"اخر كتاب قرآته", 
"روايتك المفضله ?", 
"اخر اكله اكلتها", 
"اخر كتاب قرآته", 
"ليه بودي جدع؟ ", 
 "ليه صاصا جدع؟ ", 
"افضل يوم ف حياتك", 
"ليه مضيفتش كل جهاتك", 
"حكمتك ف الحياه", 
"لون عيونك", 
"كتابك المفضل", 
"هوايتك المفضله", 
"علاقتك مع اهلك", 
" ما السيء في هذه الحياة ؟ ", 
"أجمل شيء حصل معك خلال هذا الاسبوع ؟ ", 
"سؤال ينرفزك ؟ ", 
" هل يعجبك سورس زيرو ؟؟ ", 
" اكثر ممثل تحبه ؟ ", 
"قد تخيلت شي في بالك وصار ؟ ", 
"شيء عندك اهم من الناس ؟ ", 
"تفضّل النقاش الطويل او تحب الاختصار ؟ ", 
"وش أخر شي ضيعته؟ ", 
"اي رايك في سورس زيرو ؟ ", 
"كم مره حبيت؟ ", 
" اكثر المتابعين عندك باي برنامج؟", 
" نسبه الندم عندك للي وثقت فيهم ؟", 
"تحب ترتبط بكيرفي ولا فلات؟", 
" جربت شعور احد يحبك بس انت مو قادر تحبه؟", 
" تجامل الناس ولا اللي بقلبك على لسانك؟", 
" عمرك ضحيت باشياء لاجل شخص م يسوى ؟", 
"مغني تلاحظ أن صوته يعجب الجميع إلا أنت؟ ", 
" آخر غلطات عمرك؟ ", 
" مسلسل كرتوني له ذكريات جميلة عندك؟ ", 
" ما أكثر تطبيق تقضي وقتك عليه؟ ", 
" أول شيء يخطر في بالك إذا سمعت كلمة نجوم ؟ ", 
" قدوتك من الأجيال السابقة؟ ", 
" أكثر طبع تهتم بأن يتواجد في شريك/ة حياتك؟ ", 
"أكثر حيوان تخاف منه؟ ", 
" ما هي طريقتك في الحصول على الراحة النفسية؟ ", 
" إيموجي يعبّر عن مزاجك الحالي؟ ", 
" أكثر تغيير ترغب أن تغيّره في نفسك؟ ", 
"أكثر شيء أسعدك اليوم؟ ", 
"اي رايك في الدنيا دي ؟ ", 
"ما هو أفضل حافز للشخص؟ ", 
"ما الذي يشغل بالك في الفترة الحالية؟", 
"آخر شيء ندمت عليه؟ ", 
"شاركنا صورة احترافية من تصويرك؟ ", 
"تتابع انمي؟ إذا نعم ما أفضل انمي شاهدته ", 
"يرد عليك متأخر على رسالة مهمة وبكل برود، موقفك؟ ", 
"نصيحه تبدا ب -لا- ؟ ", 
"كتاب أو رواية تقرأها هذه الأيام؟ ", 
"فيلم عالق في ذهنك لا تنساه مِن روعته؟ ", 
"يوم لا يمكنك نسيانه؟ ", 
"شعورك الحالي في جملة؟ ", 
"كلمة لشخص بعيد؟ ", 
"صفة يطلقها عليك الشخص المفضّل؟ ", 
"أغنية عالقة في ذهنك هاليومين؟ ", 
"أكلة مستحيل أن تأكلها؟ ", 
"كيف قضيت نهارك؟ ", 
"تصرُّف ماتتحمله؟ ", 
"موقف غير حياتك؟ ", 
"اكثر مشروب تحبه؟ ", 
"القصيدة اللي تأثر فيك؟ ", 
"متى يصبح الصديق غريب ", 
"وين نلقى السعاده برايك؟ ", 
"تاريخ ميلادك؟ ", 
"قهوه و لا شاي؟ ", 
"من محبّين الليل أو الصبح؟ ", 
"حيوانك المفضل؟ ", 
"كلمة غريبة ومعناها؟ ", 
"كم تحتاج من وقت لتثق بشخص؟ ", 
"اشياء نفسك تجربها؟ ", 
"يومك ضاع على؟ ", 
"كل شيء يهون الا ؟ ", 
"اسم ماتحبه ؟ ", 
"وقفة إحترام للي إخترع ؟ ", 
"أقدم شيء محتفظ فيه من صغرك؟ ", 
"كلمات ماتستغني عنها بسوالفك؟ ", 
"وش الحب بنظرك؟ ", 
"حب التملك في شخصِيـتك ولا ؟ ", 
"تخطط للمستقبل ولا ؟ ", 
"موقف محرج ماتنساه ؟ ", 
"من طلاسم لهجتكم ؟ ", 
"اعترف باي حاجه ؟ ", 
"عبّر عن مودك بصوره ؟ ",
"آخر مره ضربت عشره كانت متى ؟", 
"اسم دايم ع بالك ؟ ", 
"اشياء تفتخر انك م سويتها ؟ ", 
" لو بكيفي كان ؟ ", 
  "أكثر جملة أثرت بك في حياتك؟ ",
  "إيموجي يوصف مزاجك حاليًا؟ ",
  "أجمل اسم بنت بحرف الباء؟ ",
  "كيف هي أحوال قلبك؟ ",
  "أجمل مدينة؟ ",
  "كيف كان أسبوعك؟ ",
  "شيء تشوفه اكثر من اهلك ؟ ",
  "اخر مره فضفضت؟ ",
  "قد كرهت احد بسبب اسلوبه؟ ",
  "قد حبيت شخص وخذلك؟ ",
  "كم مره حبيت؟ ",
  "اكبر غلطة بعمرك؟ ",
  "نسبة النعاس عندك حاليًا؟ ",
  "شرايكم بمشاهير التيك توك؟ ",
  "ما الحاسة التي تريد إضافتها للحواس الخمسة؟ ",
  "اسم قريب لقلبك؟ ",
  "مشتاق لمطعم كنت تزوره قبل الحظر؟ ",
  "أول شيء يخطر في بالك إذا سمعت كلمة (ابوي يبيك)؟ ",
  "ما أول مشروع تتوقع أن تقوم بإنشائه إذا أصبحت مليونير؟ ",
  "أغنية عالقة في ذهنك هاليومين؟ ",
  "متى اخر مره قريت قرآن؟ ",
  "كم صلاة فاتتك اليوم؟ ",
  "تفضل التيكن او السنقل؟ ",
  "وش أفضل بوت برأيك؟ ",
"كم لك بالتلي؟ ",
"وش الي تفكر فيه الحين؟ ",
"كيف تشوف الجيل ذا؟ ",
"منشن شخص وقوله، تحبني؟ ",
"لو جاء شخص وعترف لك كيف ترده؟ ",
"مر عليك موقف محرج؟ ",
"وين تشوف نفسك بعد سنتين؟ ",
"لو فزعت/ي لصديق/ه وقالك مالك دخل وش بتسوي/ين؟ ",
"وش اجمل لهجة تشوفها؟ ",
"قد سافرت؟ ",
"افضل مسلسل عندك؟ ",
"افضل فلم عندك؟ ",
"مين اكثر يخون البنات/العيال؟ ",
"متى حبيت؟ ",
  "بالعادة متى تنام؟ ",
  "شيء من صغرك ماتغير فيك؟ ",
  "شيء بسيط قادر يعدل مزاجك بشكل سريع؟ ",
  "تشوف الغيره انانيه او حب؟ ",
"حاجة تشوف نفسك مبدع فيها؟ ",
  "مع او ضد : يسقط جمال المراة بسبب قبح لسانها؟ ",
  "عمرك بكيت على شخص مات في مسلسل ؟ ",
  "‏- هل تعتقد أن هنالك من يراقبك بشغف؟ ",
  "تدوس على قلبك او كرامتك؟ ",
  "اكثر لونين تحبهم مع بعض؟ ",
  "مع او ضد : النوم افضل حل لـ مشاكل الحياة؟ ",
  "سؤال دايم تتهرب من الاجابة عليه؟ ",
  "تحبني ولاتحب الفلوس؟ ",
  "العلاقه السريه دايماً تكون حلوه؟ ",
  "لو أغمضت عينيك الآن فما هو أول شيء ستفكر به؟ ",
"كيف ينطق الطفل اسمك؟ ",
  "ما هي نقاط الضعف في شخصيتك؟ ",
  "اكثر كذبة تقولها؟ ",
  "تيكن ولا اضبطك؟ ",
  "اطول علاقة كنت فيها مع شخص؟ ",
  "قد ندمت على شخص؟ ",
  "وقت فراغك وش تسوي؟ ",
  "عندك أصحاب كثير؟ ولا ينعد بالأصابع؟ ",
  "حاط نغمة خاصة لأي شخص؟ ",
  "وش اسم شهرتك؟ ",
  "أفضل أكلة تحبه لك؟ ",
"عندك شخص تسميه ثالث والدينك؟ ",
  "عندك شخص تسميه ثالث والدينك؟ ",
  "اذا قالو لك تسافر أي مكان تبيه وتاخذ معك شخص واحد وين بتروح ومين تختار؟ ",
  "أطول مكالمة كم ساعة؟ ",
  "تحب الحياة الإلكترونية ولا الواقعية؟ ",
  "كيف حال قلبك ؟ بخير ولا مكسور؟ ",
  "أطول مدة نمت فيها كم ساعة؟ ",
  "تقدر تسيطر على ضحكتك؟ ",
  "أول حرف من اسم الحب؟ ",
  "تحب تحافظ على الذكريات ولا تمسحه؟ ",
  "اسم اخر شخص زعلك؟ ",
"وش نوع الأفلام اللي تحب تتابعه؟ ",
  "أنت انسان غامض ولا الكل يعرف عنك؟ ",
  "لو الجنسية حسب ملامحك وش بتكون جنسيتك؟ ",
  "عندك أخوان او خوات من الرضاعة؟ ",
  "إختصار تحبه؟ ",
  "إسم شخص وتحس أنه كيف؟ ",
  "وش الإسم اللي دايم تحطه بالبرامج؟ ",
  "وش برجك؟ ",
  "لو يجي عيد ميلادك تتوقع يجيك هدية؟ ",
  "اجمل هدية جاتك وش هو؟ ",
  "الصداقة ولا الحب؟ ",
"الصداقة ولا الحب؟ ",
  "الغيرة الزائدة شك؟ ولا فرط الحب؟ ",
  "قد حبيت شخصين مع بعض؟ وانقفطت؟ ",
  "وش أخر شي ضيعته؟ ",
  "قد ضيعت شي ودورته ولقيته بيدك؟ ",
  "تؤمن بمقولة اللي يبيك مايحتار فيك؟ ",
  "سبب وجوك بالتليجرام؟ ",
  "تراقب شخص حاليا؟ ",
  "عندك معجبين ولا محد درا عنك؟ ",
  "لو نسبة جمالك بتكون بعدد شحن جوالك كم بتكون؟ ",
  "أنت محبوب بين الناس؟ ولاكريه؟ ",
"كم عمرك؟ ",
  "لو يسألونك وش اسم امك تجاوبهم ولا تسفل فيهم؟ ",
  "تؤمن بمقولة الصحبة تغنيك الحب؟ ",
  "وش مشروبك المفضل؟ ",
  "قد جربت الدخان بحياتك؟ وانقفطت ولا؟ ",
  "أفضل وقت للسفر؟ الليل ولا النهار؟ ",
  "انت من النوع اللي تنام بخط السفر؟ ",
  "عندك حس فكاهي ولا نفسية؟ ",
  "تبادل الكراهية بالكراهية؟ ولا تحرجه بالطيب؟ ",
  "أفضل ممارسة بالنسبة لك؟ ",
  "لو قالو لك تتخلى عن شي واحد تحبه بحياتك وش يكون؟ ",
"لو احد تركك وبعد فتره يحاول يرجعك بترجع له ولا خلاص؟ ",
  "برأيك كم العمر المناسب للزواج؟ ",
  "اذا تزوجت بعد كم بتخلف عيال؟ ",
  "فكرت وش تسمي أول اطفالك؟ ",
  "من الناس اللي تحب الهدوء ولا الإزعاج؟ ",
  "الشيلات ولا الأغاني؟ ",
  "عندكم شخص مطوع بالعايلة؟ ",
  "تتقبل النصيحة من اي شخص؟ ",
  "اذا غلطت وعرفت انك غلطان تحب تعترف ولا تجحد؟ ",
  "جربت شعور احد يحبك بس انت مو قادر تحبه؟ ",
  "دايم قوة الصداقة تكون بإيش؟ ",
"أفضل البدايات بالعلاقة بـ وش؟ ",
  "وش مشروبك المفضل؟ او قهوتك المفضلة؟ ",
  "تحب تتسوق عبر الانترنت ولا الواقع؟ ",
  "انت من الناس اللي بعد ماتشتري شي وتروح ترجعه؟ ",
  "أخر مرة بكيت متى؟ وليش؟ ",
  "عندك الشخص اللي يقلب الدنيا عشان زعلك؟ ",
  "أفضل صفة تحبه بنفسك؟ ",
  "كلمة تقولها للوالدين؟ ",
  "أنت من الناس اللي تنتقم وترد الاذى ولا تحتسب الأجر وتسامح؟ ",
  "كم عدد سنينك بالتليجرام؟ ",
  "تحب تعترف ولا تخبي؟ ",
"انت من الناس الكتومة ولا تفضفض؟ ",
  "أنت بعلاقة حب الحين؟ ",
  "عندك اصدقاء غير جنسك؟ ",
  "أغلب وقتك تكون وين؟ ",
  "لو المقصود يقرأ وش بتكتب له؟ ",
  "تحب تعبر بالكتابة ولا بالصوت؟ ",
  "عمرك كلمت فويس احد غير جنسك؟ ",
  "لو خيروك تصير مليونير ولا تتزوج الشخص اللي تحبه؟ ",
  "لو عندك فلوس وش السيارة اللي بتشتريها؟ ",
  "كم أعلى مبلغ جمعته؟ ",
  "اذا شفت احد على غلط تعلمه الصح ولا تخليه بكيفه؟ ",
"قد جربت تبكي فرح؟ وليش؟ ",
  "تتوقع إنك بتتزوج اللي تحبه؟ ",
  "ما هو أمنيتك؟ ",
  "وين تشوف نفسك بعد خمس سنوات؟ ",
  "هل انت حرامي تويت بتعت بودي؟ ",
  "لو خيروك تقدم الزمن ولا ترجعه ورا؟ ",
  "لعبة قضيت وقتك فيه بالحجر المنزلي؟ ",
  "تحب تطق الميانة ولا ثقيل؟ ",
  "باقي معاك للي وعدك ما بيتركك؟ ",
  "اول ماتصحى من النوم مين تكلمه؟ ",
  "عندك الشخص اللي يكتب لك كلام كثير وانت نايم؟ ",
  "قد قابلت شخص تحبه؟ وولد ولا بنت؟ ",
   "هل انت تحب بودي؟ ",
"اذا قفطت احد تحب تفضحه ولا تستره؟ ",
  "كلمة للشخص اللي يسب ويسطر؟ ",
  "آية من القران تؤمن فيه؟ ",
  "تحب تعامل الناس بنفس المعاملة؟ ولا تكون أطيب منهم؟ ",
"حاجة ودك تغيرها هالفترة؟ ",
  "كم فلوسك حاليا وهل يكفيك ام لا؟ ",
  "وش لون عيونك الجميلة؟ ",
  "من الناس اللي تتغزل بالكل ولا بالشخص اللي تحبه بس؟ ",
  "اذكر موقف ماتنساه بعمرك؟ ",
  "وش حاب تقول للاشخاص اللي بيدخل حياتك؟ ",
  "ألطف شخص مر عليك بحياتك؟ ",
   "هل بودي لطيف؟ ",
"انت من الناس المؤدبة ولا نص نص؟ ",
  "كيف الصيد معاك هالأيام ؟ وسنارة ولاشبك؟ ",
  "لو الشخص اللي تحبه قال بدخل حساباتك بتعطيه ولا تكرشه؟ ",
  "أكثر شي تخاف منه بالحياه وش؟ ",
  "اكثر المتابعين عندك باي برنامج؟ ",
  "متى يوم ميلادك؟ ووش الهدية اللي نفسك فيه؟ ",
  "قد تمنيت شي وتحقق؟ ",
  "قلبي على قلبك مهما صار لمين تقولها؟ ",
  "وش نوع جوالك؟ واذا بتغيره وش بتأخذ؟ ",
  "كم حساب عندك بالتليجرام؟ ",
  "متى اخر مرة كذبت؟ ",
"كذبت في الاسئلة اللي مرت عليك قبل شوي؟ ",
  "تجامل الناس ولا اللي بقلبك على لسانك؟ ",
  "قد تمصلحت مع أحد وليش؟ ",
  "وين تعرفت على الشخص اللي حبيته؟ ",
  "قد رقمت او احد رقمك؟ ",
  "وش أفضل لعبته بحياتك؟ ",
  "أخر شي اكلته وش هو؟ ",
  "حزنك يبان بملامحك ولا صوتك؟ ",
  "لقيت الشخص اللي يفهمك واللي يقرا افكارك؟ ",
  "فيه شيء م تقدر تسيطر عليه ؟ ",
  "منشن شخص متحلطم م يعجبه شيء؟ ",
"اكتب تاريخ مستحيل تنساه ",
  "شيء مستحيل انك تاكله ؟ ",
  "تحب تتعرف على ناس جدد ولا مكتفي باللي عندك ؟ ",
  "انسان م تحب تتعامل معاه ابداً ؟ ",
  "شيء بسيط تحتفظ فيه؟ ",
  "فُرصه تتمنى لو أُتيحت لك ؟ ",
   "لي بودي ناك اليكس؟ ",
  "شيء مستحيل ترفضه ؟. ",
  "لو زعلت بقوة وش بيرضيك ؟ ",
  "تنام بـ اي مكان ، ولا بس غرفتك ؟ ",
  "ردك المعتاد اذا أحد ناداك ؟ ",
  "مين الي تحب يكون مبتسم دائما ؟ ",
" إحساسك في هاللحظة؟ ",
  "وش اسم اول شخص تعرفت عليه فالتلقرام ؟ ",
  "اشياء صعب تتقبلها بسرعه ؟ ",
  "شيء جميل صار لك اليوم ؟ ",
  "اذا شفت شخص يتنمر على شخص قدامك شتسوي؟ ",
  "يهمك ملابسك تكون ماركة ؟ ",
  "ردّك على شخص قال (أنا بطلع من حياتك)؟. ",
  "مين اول شخص تكلمه اذا طحت بـ مصيبة ؟ ",
  "تشارك كل شي لاهلك ولا فيه أشياء ما تتشارك؟ ",
  "كيف علاقتك مع اهلك؟ رسميات ولا ميانة؟ ",
  "عمرك ضحيت باشياء لاجل شخص م يسوى ؟ ",
"اكتب سطر من اغنية او قصيدة جا فـ بالك ؟ ",
  "شيء مهما حطيت فيه فلوس بتكون مبسوط ؟ ",
  "مشاكلك بسبب ؟ ",
  "نسبه الندم عندك للي وثقت فيهم ؟ ",
  "اول حرف من اسم شخص تقوله? بطل تفكر فيني ابي انام؟ ",
  "اكثر شيء تحس انه مات ف مجتمعنا؟ ",
  "لو صار سوء فهم بينك وبين شخص هل تحب توضحه ولا تخليه كذا  لان مالك خلق توضح ؟ ",
  "كم عددكم بالبيت؟ ",
  "عادي تتزوج من برا القبيلة؟ ",
  "أجمل شي بحياتك وش هو؟ ",
} 
local reply_markup = LuaTele.replyMarkup{type = 'inline',data = {{{text = 'تويت آخرا -', data = msg.sender_id.user_id..'/Haiw7'}, },}}
return LuaTele.sendText(msg_chat_id,msg_id, texting[math.random(#texting)],'md', false, false, false, false, reply_markup)
end
end
if text == "كتبات" or text == "حكمه" or text == "قصيده" then 
if Redis:get(Fast.."Status:Games"..msg.chat_id) then
local vBandav_Msg = { 
"‏من ترك أمرهُ لله، أعطاه الله فوق ما يتمنَّاه💙 ", 
"‏من علامات جمال المرأة .. بختها المايل ! ",
"‏ انك الجميع و كل من احتل قلبي🫀🤍",
"‏ ‏ لقد تْعَمقتُ بكَ كَثيراً والمِيمُ لام .♥️",
"‏ ‏ممكن اكون اختارت غلط بس والله حبيت بجد🖇️",
"‏ علينا إحياء زَمن الرّسائل الورقيّة وسط هذه الفوضى الالكترونية العَارمة. ● 💜",
"‏ يجي اي الصاروخ الصيني ده جمب الصاروخ المصري لما بيلبس العبايه السوده.🤩♥️",
"‏ كُنت أرقّ من أن أتحمّل كُل تلك القَسوة من عَينيك .🍍",
"‏أَكَان عَلَيَّ أَنْ أغْرَس انيابي فِي قَلْبِك لتشعر بِي ؟.",
"‏ : كُلما أتبع قلبي يدلني إليك .",
"‏ : أيا ليت من تَهواه العينُ تلقاهُ .",
"‏ ‏: رغبتي في مُعانقتك عميقة جداً .●",
"ويُرهقني أنّي مليء بما لا أستطيع قوله.✨",
"‏ من مراتب التعاسه إطالة الندم ع شيء إنتهى. ● ",
"‏ ‏كل العالم يهون بس الدنيا بينا تصفي 💙",
"‏ بعض الاِعتذارات يجب أن تُرفَضّ.",
"‏ ‏تبدأ حياتك محاولاً فهم كل شيء، وتنهيها محاولاً النجاة من كل ما فهمت.",
"‏ إن الأمر ينتهي بِنا إلى أعتياد أي شيء.",
"‏ هل كانت كل الطرق تؤدي إليكِ، أم أنني كنتُ أجعلها كذلك.",
"‏ ‏هَتفضل توآسيهُم وآحد ورآ التآني لكن أنتَ هتتنسي ومحدِش هَيوآسيك.",
"‏ جَبَرَ الله قلوبِكُم ، وقَلبِي .🍫",
"‏ بس لما أنا ببقى فايق، ببقى أبكم له ودان.💖",
"‏ ‏مقدرش عالنسيان ولو طال الزمن 🖤",
"‏ أنا لستُ لأحد ولا احد لي ، أنا إنسان غريب أساعد من يحتاجني واختفي.",
"‏ ‏أحببتك وأنا منطفئ، فما بالك وأنا في كامل توهجي ؟",
"‏ لا تعودني على دفء شمسك، إذا كان في نيتك الغروب .َ",
"‏ وانتهت صداقة الخمس سنوات بموقف.",
"‏ ‏لا تحب أحداً لِدرجة أن تتقبّل أذاه.",
"‏ إنعدام الرّغبة أمام الشّيء الّذي أدمنته ، انتصار.",
"‏مش جايز , ده اكيد التأخير وارهاق القلب ده وراه عوضاً عظيماً !💙 ",
" مش جايز , ده اكيد التأخير وارهاق القلب ده وراه عوضاً عظيماً !💙",
"فـ بالله صبر  وبالله يسر وبالله عون وبالله كل شيئ ♥️. ",
"أنا بعتز بنفسي جداً كصاحب وشايف اللي بيخسرني ، بيخسر أنضف وأجدع شخص ممكن يشوفه . ",
"فجأه جاتلى قافله ‏خلتنى مستعد أخسر أي حد من غير ما أندم عليه . ",
"‏اللهُم قوني بك حين يقِل صبري... ",
"‏يارب سهِل لنا كُل حاجة شايلين هَمها 💙‏ ",
"انا محتاج ايام حلوه بقي عشان مش نافع كدا ! ",
"المشكله مش اني باخد قررات غلط المشكله اني بفكر كويس فيها قبل ما اخدها .. ",
"تخيل وانت قاعد مخنوق كدا بتفكر فالمزاكره اللي مزكرتهاش تلاقي قرار الغاء الدراسه .. ",
" مكانوش يستحقوا المعافرة بأمانه.",
"‏جمل فترة في حياتي، كانت مع اكثر الناس الذين أذتني نفسيًا. ",
" ‏إحنا ليه مبنتحبش يعني فينا اي وحش!",
"أيام مُمله ومستقبل مجهول ونومٌ غير منتظموالأيامُ تمرُ ولا شيَ يتغير ", 
"عندما تهب ريح المصلحه سوف ياتي الجميع رتكدون تحت قدمك ❤️. ",
"عادي مهما تعادي اختك قد الدنيا ف عادي ❤. ",
"بقيت لوحدي بمعنا اي انا اصلا من زمان لوحدي.❤️ ",
"- ‏تجري حياتنا بما لاتشتهي أحلامنا ! ",
"تحملين كل هذا الجمال، ‏ألا تتعبين؟",
"البدايات للكل ، والثبات للصادقين ",
"مُؤخرًا اقتنعت بالجملة دي جدا : Private life always wins. ",
" الافراط في التسامح بيخللي الناس تستهين بيك🍍",
"مهما كنت كويس فـَ إنت معرض لـِ الاستبدال.. ",
"فخوره بنفسي جدًا رغم اني معملتش حاجه فـ حياتي تستحق الذكر والله . ",
"‏إسمها ليلة القدر لأنها تُغير الأقدار ,اللهُمَّ غير قدري لحالٍ تُحبه وعوضني خير .. ",
"فى احتمال كبير انها ليلة القدر ادعوا لنفسكم كتير وأدعو ربنا يشفى كل مريض. 💙 ",
"أنِر ظُلمتي، وامحُ خطيئتي، واقبل توبتي وأعتِق رقبتي يا اللّٰه. إنكَ عفوٌّ تُحِبُّ العفوَ؛ فاعفُ عني 💛 ", 
} 
return send(msg_chat_id,msg_id,vBandav_Msg[math.random(#vBandav_Msg)],'md')
end
end
-- 7azer pv
if text and text:match("/start 7azer(.*)from_id(%d+)") then
local Anubis = {text:match("/start 7azer(.*)from_id(%d+)") }
if msg_user_send_id ~= tonumber(Anubis[2]) then
send(msg_user_send_id,msg_id,'⎋ هذا الامر لا يخصك',"md",true)  
else
if tonumber(msg.sender_id.user_id) ~= tonumber(Redis:get(Fast..":7azer:"..Anubis[1])) then
return send(msg_user_send_id,msg_id,'⎋ هذا الامر لا يخصك',"md",true) 
end
local mem_num = Redis:smembers(Fast..":7azer:mem:"..Anubis[1])
if #mem_num == 0 then
return send(msg_user_send_id,msg_id,'⎋ انتظر حتي انضمام لاعب واحد علي الاقل',"md",true) 
end
Redis:set(Fast..":7azer:chat_id"..msg_user_send_id, Anubis[1])
Redis:set(Fast..":7azer:state"..msg_user_send_id, 'quiz')
return send(msg_user_send_id,msg_id,'⎋ ارسل السؤال الان',"md",true)  
end
elseif not text:match("(.*)start(.*)") and Redis:get(Fast..":7azer:state"..msg_user_send_id) == 'quiz' then
local chat = Redis:get(Fast..":7azer:chat_id"..msg_user_send_id)
Redis:set(Fast..":7azer:quiz"..chat, text)
Redis:set(Fast..":7azer:state"..msg_user_send_id, 'answer')
return send(msg_chat_id,msg_id,"⎋ ارسل الاجابه بدون علامات مميزه","md",true,false,false,false)
elseif not text:match("(.*)start(.*)") and Redis:get(Fast..":7azer:state"..msg_user_send_id) == 'answer' then
local chat = Redis:get(Fast..":7azer:chat_id"..msg_user_send_id)
local quiz = Redis:get(Fast..":7azer:quiz"..chat)
Redis:set(Fast..":7azer:answer"..chat, text)
Redis:del(Fast..":7azer:state"..msg_user_send_id)
send(chat,0,"⎋ السؤال :\n- "..quiz.."\n\n⎋ معكم ( `"..ctime(180).."` ) لحل السؤال","md",true,false,false,false)
Redis:setex(Fast..":7azer:"..chat, 180, msg.sender_id.user_id)
Redis:del(Fast..":7azer:quiz"..chat)
return send(msg_chat_id,msg_id,"⎋ تم ارسال اسؤال بنجاح","md",true,false,false,false)
end

if text and text:match("/start hms(.*)from_id(%d+)") then
local testhms = {text:match("/start hms(.*)from_id(%d+)") }
if msg_user_send_id ~= tonumber(testhms[2]) then
send(msg_user_send_id,msg_id,'⎋ هذا الامر لا يخصك',"md",true)  
else
Redis:set(Fast.."hms:"..msg_user_send_id, testhms[1])
return send(msg_user_send_id,msg_id,'⎋ ارسل الهمسه الان',"md",true)  
end
elseif not text:match("(.*)start(.*)") and Redis:get(Fast.."hms:"..msg_user_send_id) then
local testhms = Redis:get(Fast.."hms:"..msg_user_send_id)
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = 'نعم', data = msg_user_send_id.."hms"..testhms},{text = 'لا', data = msg_user_send_id.."nn_hnss"..testhms}
},
}
}
Redis:set(Fast.."hms:"..testhms.."text:", text)
return send(msg_chat_id,msg_id,"⎋ هل انت متاكد من ارسال الهمسه ؟","md",true,false,false,false,reply_markup)
end
if not msg.Asasy then
if text == '/key' then
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = 'القسم الديني',type = 'text'},
},
{
{text = 'قسم اليوتيوب',type = 'text'},{text = 'قسم بحث الاغاني', type = 'text'},
},
{
{text = 'قسم الترجمه',type = 'text'},
},
{
{text = '🎭 قسم الرمزيات 🎭',type = 'text'},
},
{
{text = 'قسم العاب السورس',type = 'text'},{text = 'قسم التسليه',type = 'text'},
},
{
{text = 'قسم اوامر النسب',type = 'text'},
},
{
{text = 'قسم السورس',type = 'text'},
},
}
}
send(msg_chat_id,msg_id,'⎋ اهلا بك في كيبورد الاعضاء', 'md', false, false, false, false, reply_markup)
end
end
if text == "نـسـبـة الـحـب" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Bots"..msg.chat_id,"sendlove")
hggg = '⎋ الان ارسل اسمك واسم الشخص الثاني :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end


if text == "نـسـبـة الـغـبـاء" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Bottts"..msg.chat_id,"sendlove")
hggg = '⎋ الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end

if text == "نـسـبـة الذكـاء" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":lov_Botttuus"..msg.chat_id,"sendlove")
hggg = '⎋ الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "نـسبـة الـكـرهـ" or text == "نـسبـة الـكـرهـ" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":krh_Bots"..msg.chat_id,"sendkrhe")
hggg = '⎋ الان ارسل اسمك واسم الشخص الثاني :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "نـسـبـة الـرجـولـه" then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":rjo_Bots"..msg.chat_id,"sendrjoe")
hggg = '⎋ الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end
if text == "نـسـبـة الانـوثـه" or text == "نـسـبـة الانـوثـه" and msg.reply_to_message_id ~= 0 then
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if not Redis:get(Fast.."amrthshesh"..msg.chat_id) then    
Redis:set(Fast..":"..senderr..":ano_Bots"..msg.chat_id,"sendanoe")
hggg = '⎋ الان ارسل اسم الشخص :'
send(msg_chat_id,msg_id,hggg) 
return false
end
end

if text == 'كينج' or text == 'مبرمج السورس' or text == 'king' then  
local UserId_Info = bot.searchPublicChat("TR_E2S_ON_MY_MOoN")
if UserId_Info.id then
local UserInfo = bot.getUser(UserId_Info.id)
local InfoUser = bot.getUserFullInfo(UserId_Info.id)
if InfoUser.bio then
Bio = InfoUser.bio
else
Bio = ''
end
local photo = bot.getUserProfilePhotos(UserId_Info.id)
if photo.total_count > 0 then
local TestText = "  ❲ 𝘋𝘌𝘝 𝘒𝘐𝘕𝘎❳\n— — — — — — — — —\n ⌔︙*َժٍᥱُ᥎ ٍَꪀَٰᥲ️ِّّꪔٍᥱ≋* :  ["..UserInfo.first_name.."](tg://user?id="..UserId_Info.id..")\n⌔︙*َժٍᥱُ᥎ ٍႦᎥُِ᥆* : [❲ "..Bio.." ❳]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = '◈ ℻ᗪEᐯ ⎋ 𝘒𝘐𝘕𝘎℻ ◈', url = "https://t.me/TR_E2S_ON_MY_MOoN"}
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendPhoto?chat_id='..msg.chat_id..'&caption='..URL.escape(TestText)..'&photo='..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id..'&reply_to_message_id='..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
else
local TestText = "- معلومات مبرمج السورس : \\nn: name Dev . ["..UserInfo.first_name.."](tg://user?id="..UserId_Info.id..")\n\n ["..Bio.."]"
keyboardd = {} 
keyboardd.inline_keyboard = {
{
{text = '❲ المبرمج كينج ❳', url = "https://t.me/TR_E2S_ON_MY_MOoN"}
},
{
{text = '𝙎𝙊𝙐𝙍𝘾𝞝𖢻𝘼𝙑𝘼𝙏𝘼𝙍', url = "https://t.me/source_av"},
},
}
local msg_id = msg.id/2097152/0.5 
return https.request("https://api.telegram.org/bot"..Token..'/sendMessage?chat_id=' .. msg.chat_id .. '&text=' .. URL.escape(TestText).."&reply_to_message_id="..msg_id..'&parse_mode=markdown&disable_web_page_preview=true&reply_markup='..JSON.encode(keyboardd))
end
end
end
if text == 'السؤنؤظيظيظورس' or text == 'سورزؤزيزس' or text == 'يا ؤزؤزؤسورس'  then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '« ꪔY ժᥱ᥎ »', url = "https://t.me/U_UU_O"}
},
{
{text = '« ᥉᥆υᖇᥴᥱ »', url = "https://t.me/source_av"}
},
}
}
bot.sendPhoto(msg.chat_id, msg.id, 'http://t.me/'..chsource..'', [[
]],"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if text == 'قناة السورس' or text == 'قناه السورس' then
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '𓆩 ˹ [𝙲𝙷] ˼ 𓆪', url = "https://t.me/source_av"}
},
}
}
bot.sendPhoto(msg.chat_id, msg.id, 'http://t.me/'..chsource..'', [[
[ٓ ˚₊· ͟͟͞͞➳❥❬ ??𝙴𝙻𝙲𝙾𝙼𝙴 𝚃𝙾 [𝙲𝙷] 𝙰𝚅𝙰𝚃𝙰𝚁 𝚂𝙾𝚄𝚁𝙲𝙴 ❭⎋ °](t.me/source_av )
]],"md", true, nil, nil, nil, nil, nil, nil, nil, nil, reply_markup)
end
if text == '/start' then
Redis:sadd(Fast..'Num:User:Pv',msg.sender_id.user_id)  
if not msg.Asasy then
if not Redis:get(Fast.."Start:Bot") then
local photo = bot.getUserProfilePhotos(Fast)
local UserInfo = bot.getUser(Fast)
local Name_User = UserInfo.first_name
local Name_dev = bot.getUser(Sudo_Id).first_name
local UName_dev = bot.getUser(Sudo_Id).username
local CmdStart = '*\n╮⦿ أهلآ بك في بوت '..(Redis:get(Fast.."Name:Bot") or "[افــاتـار]")..
'\n│◉ وظيفتي حماية المجموعات'..
'\n│◉ لتفعيل البوت عليك اتباع مايلي ...'..
'\n│◉ أضِف البوت إلى مجموعتك'..
'\n️│◉ ارفعهُ » مشرف'..
'\n│◉ ارسل كلمة { /key} لاظهار الكيبورد'..
'\n╯⦿ مـطـور الـبـوت ⋖@'..UserSudo..'⋗*'
if photo.total_count > 0 then
keyboard = {} 
keyboard.inline_keyboard = {
{
{text = '📚 معلومات 📚 ', callback_data = msg.sender_id.user_id..'/zxhaut'},{text = '🔺️ حــول 🔻 ',  callback_data = msg.sender_id.user_id..'/lhaui'},
},
{
{text = Name_dev, url = "t.me/"..UName_dev },
},
{
{text = Name_User, url = "t.me/"..UserInfo.username}
},
{
{text = '✅ - اضف البوت إلي مجموعتك - ✅', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
local msgg = msg_id/2097152/0.5
https.request("https://api.telegram.org/bot"..Token.."/sendphoto?chat_id=" .. msg_chat_id .. "&photo="..photo.photos[1].sizes[#photo.photos[1].sizes].photo.remote.id.."&caption=".. URL.escape(CmdStart).."&reply_to_message_id="..msgg.."&parse_mode=markdown&disable_web_page_preview=true&reply_markup="..JSON.encode(keyboard))
else
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {
{
{text = '📚 معلومات 📚 ', callback_data = msg.sender_id.user_id..'/zxhaut'},{text = '🔺️ حــول 🔻 ',  callback_data = msg.sender_id.user_id..'/lhaui'},
},
{
{text = Name_dev, url = "t.me/"..UName_dev },
},
{
{text = Name_User, url = "t.me/"..UserInfo.username}
},
{
{text = '✅ - اضف البوت إلي مجموعتك - ✅', url = 't.me/'..UserBot..'?startgroup=new'}, 
},
}
}
return send(msg_chat_id,msg_id,Redis:get(Fast.."Start:Bot"),"md",false, false, false, false, reply_markup)
end
end
else
local reply_markup = bot.replyMarkup{type = 'keyboard',resize = true,is_personal = true,
data = {
{
{text = '« قسم المطور الاساسي »',type = 'text'},
},
{
{text = '« قسم الاحصائيات »',type = 'text'},{text = '« قسم البوت »', type = 'text'},
},
{
{text = '« قسم ردود البوت »',type = 'text'},{text = '« قسم رتب البوت »', type = 'text'},
},
{
{text = '« التفعيل والتعطيل »',type = 'text'},{text = '« قسم الاذاعه »', type = 'text'},
},
{
{text = '« قسم الحظر والكتم »',type = 'text'},
},
{
{text = '« قسم الملفات »',type = 'text'},{text = '« الاشتراك الاجباري »',type = 'text'},
},
{
{text = '« قسم السورس »',type = 'text'},
},
}
}
return send(msg_chat_id,msg_id,'◍ ⁞ - اهلا بك عزيزي المطور الاساسي ⎋ \n◍ ⁞ - اضغط على ( *القسم* ) الذي تريد استخدامه ⎋ ', 'md', false, false, false, false, reply_markup)
end
end
if text and Redis:get(Fast.."set:chsource"..senderr) then
if text == "الغاء الامر ⎋" then
Redis:del(Fast.."set:chsource"..senderr)
return send(msg_chat_id,msg_id,'تم الغاء الامر بنجاح ',"md",true)  
end
if text:match("^@(.*)$") then
Redis:del(Fast.."set:chsource"..senderr)
local chsource = text:match("^@(.*)$") 
Redis:set(Fast..'chsource',chsource)
send(msg_chat_id,msg_id,'\n⎋ تم حفظ قناه السورس')
dofile('Fast.lua')  
else
send(msg_chat_id,msg_id,'\n⎋ ارسل المعرف بشكل صحيح')
end
end
if text == "تعيين قناه السورس ⎋" then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."set:chsource"..senderr,true)
send(msg_chat_id,msg_id,'⎋ ارسل الان معرف قناه السورس ',"md",true)  
end
if text and Redis:get(Fast.."set:devsource"..senderr) then
if text == "الغاء الامر ⎋" then
Redis:del(Fast.."set:devsource"..senderr)
return send(msg_chat_id,msg_id,'تم الغاء الامر بنجاح ',"md",true)  
end
if text:match("^@(.*)$") then
Redis:del(Fast.."set:devsource"..senderr)
local chsource = text:match("^@(.*)$") 
Redis:set(Fast..'devsource',chsource)
send(msg_chat_id,msg_id,'\n⎋ تم حفظ مطور السورس')
dofile('Fast.lua')  
else
send(msg_chat_id,msg_id,'\n⎋ ارسل المعرف بشكل صحيح')
end
end
if text == "تعيين مطور السورس ⎋" then
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."set:devsource"..senderr,true)
send(msg_chat_id,msg_id,'⎋ ارسل الان معرف مطور السورس ',"md",true)  
end
if Redis:get(Fast.."set:rmz"..senderr) then
if text then
if text == "الغاء الامر ⎋" then
Redis:del(Fast.."set:rmz"..senderr)
return send(msg_chat_id,msg_id,'تم الغاء الامر بنجاح ',"md",true)  
end
Redis:set(Fast..'rmzsource',text)
Redis:del(Fast.."set:rmz"..senderr)
send(msg_chat_id,msg_id,'تم حفظ رمز السورس ',"md",true)  
dofile('Fast.lua')  
end
end
if text == "تعيين رمز السورس ⎋" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."set:rmz"..senderr,true)
return send(msg_chat_id,msg_id,'ارسل رمز بدل من { ⎋}',"md",true)  
end
if text == "حذف رمز السورس ⎋" then 
if not msg.Devss then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."rmzsource","⎋ ")
return send(msg_chat_id,msg_id,'تم ارجاع رمز السورس الي  { ⎋}',"md",true)  
end
if text == "تفعيل البوت بصوره ⎋" then
  if not msg.Asasy then
  bot.sendText(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
  end
  Redis:set(Fast.."name bot type : ", "photo")
  bot.sendText(msg_chat_id,msg_id,'\n*⎋ تم تفعيل رد البوت بصوره * ',"md",true)  
  end
if text == "تعطيل البوت بصوره ⎋" then
if not msg.Asasy then
bot.sendText(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص  '..Controller_Num(2)..' * ',"md",true)  
end
Redis:set(Fast.."name bot type : ", "text")
bot.sendText(msg_chat_id,msg_id,'\n*⎋ تم تعطيل رد البوت بصوره * ',"md",true)  
end
if text == 'تنظيف المشتركين ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."Num:User:Pv")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
local ChatAction = bot.sendChatAction(v,'Typing')
if ChatAction.Fastbots ~= "ok" then
x = x + 1
Redis:srem(Fast..'Num:User:Pv',v)
end
end
if x ~= 0 then
return send(msg_chat_id,msg_id,'*⎋ العدد الكلي { '..#list..' }\n⎋ تم العثور على { '..x..' } من المشتركين حاظرين البوت*',"md")
else
return send(msg_chat_id,msg_id,'*⎋ العدد الكلي { '..#list..' }\n⎋ لم يتم العثور على وهميين*',"md")
end
end
if text == 'تنظيف المجموعات ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."ChekBotAdd")   
local x = 0
for k,v in pairs(list) do  
local Get_Chat = bot.getChat(v)
if Get_Chat.id then
local statusMem = bot.getChatMember(Get_Chat.id,Fast)
if statusMem.status.Fastbots == "chatMemberStatusMember" then
x = x + 1
send(Get_Chat.id,0,'*⎋ البوت عضو في الجروب سوف اغادر ويمكنك تفعيلي مره اخره *',"md")
Redis:srem(Fast..'ChekBotAdd',Get_Chat.id)
local keys = Redis:keys(Fast..'*'..Get_Chat.id)
for i = 1, #keys do
Redis:del(keys[i])
end
bot.leaveChat(Get_Chat.id)
end
else
x = x + 1
local keys = Redis:keys(Fast..'*'..v)
for i = 1, #keys do
Redis:del(keys[i])
end
Redis:srem(Fast..'ChekBotAdd',v)
bot.leaveChat(v)
end
end
if x ~= 0 then
return send(msg_chat_id,msg_id,'*⎋ العدد الكلي { '..#list..' } للمجموعات \n⎋ تم العثور على { '..x..' } مجموعات البوت ليس ادمن \n⎋ تم تعطيل الجروب ومغادره البوت من الوهمي *',"md")
else
return send(msg_chat_id,msg_id,'*⎋ العدد الكلي { '..#list..' } للمجموعات \n⎋ لا توجد مجموعات وهميه*',"md")
end
end
if text == 'تغيير كليشه ستارت ⎋' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Change:Start:Bot"..senderr,300,true) 
return send(msg_chat_id,msg_id,"⎋ ارسل لي كليشه Start الان ","md",true)  
end
if text == 'مسح كليشه ستارت ⎋' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Start:Bot") 
return send(msg_chat_id,msg_id,"⎋ تم مسح كليشه Start ","md",true)   
end
if text == 'تغيير اسم البوت ⎋' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Change:Name:Bot"..senderr,300,true) 
return send(msg_chat_id,msg_id,"⎋ ارسل لي الاسم الان ","md",true)  
end
if text == 'مسح اسم البوت ⎋' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."Name:Bot") 
return send(msg_chat_id,msg_id,"⎋ تم مسح اسم البوت ","md",true)   
end
if text and text:match("^تعيين عدد الاعضاء (%d+)$") then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'Num:Add:Bot',text:match("تعيين عدد الاعضاء (%d+)$") ) 
send(msg_chat_id,msg_id,'*⎋ تم تعيين عدد اعضاء تفعيل البوت اكثر من : '..text:match("تعيين عدد الاعضاء (%d+)$")..' عضو *',"md",true)  
elseif text =='الاحصائيات ⎋' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
send(msg_chat_id,msg_id,'*⎋ عدد احصائيات البوت الكامله \n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗\n⎋ عدد المجموعات : '..(Redis:scard(Fast..'ChekBotAdd') or 0)..'\n⎋ عدد المشتركين : '..(Redis:scard(Fast..'Num:User:Pv') or 0)..'*',"md",true)  
end
if text == 'تغيير كليشه المطور ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast..'GetTexting:DevFast'..msg_chat_id..':'..senderr,true)
return send(msg_chat_id,msg_id,'⎋ ارسل لي الكليشه الان')
end
if text == 'مسح كليشه المطور ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast..'Texting:DevFast')
return send(msg_chat_id,msg_id,'⎋ تم مسح كليشه المطور')
end
if text == 'اضف رد عام ⎋' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:Rd"..senderr..":"..msg_chat_id,true)
return send(msg_chat_id,msg_id,"⎋ ارسل الان الكلمه لاضافتها في الردود العامه ","md",true)  
end
if text == 'مسح رد عام ⎋' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."Set:On"..senderr..":"..msg_chat_id,true)
return send(msg_chat_id,msg_id,"⎋ ارسل الان الكلمه لمسحها من الردود العامه","md",true)  
end
if text=='اذاعه خاص ⎋' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Users" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف ⎋ملصق ⎋متحركه ⎋صوره
 ⎋فيديو ⎋بصمه الفيديو ⎋بصمه ⎋صوت ⎋رساله ❩
⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=='اذاعه للمجموعات ⎋' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف ⎋ملصق ⎋متحركه ⎋صوره
 ⎋فيديو ⎋بصمه الفيديو ⎋بصمه ⎋صوت ⎋رساله ❩
⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتثبيت ⎋" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups:Pin" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,[[
↯︙ارسل لي سواء كان 
❨ ملف ⎋ملصق ⎋متحركه ⎋صوره
 ⎋فيديو ⎋بصمه الفيديو ⎋بصمه ⎋صوت ⎋رساله ❩
⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗
↯︙للخروج ارسل ( الغاء )
 ✓
]],"md",true)  
return false
end

if text=="اذاعه بالتوجيه ⎋" then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Groups:Fwd" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,"⎋ ارسل لي التوجيه الان\n⎋ ليتم نشره في المجموعات","md",true)  
return false
end

if text=='اذاعه بالتوجيه خاص ⎋' then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:setex(Fast.."Broadcasting:Users:Fwd" .. msg_chat_id .. ":" .. senderr, 600, true) 
send(msg_chat_id,msg_id,"⎋ ارسل لي التوجيه الان\n⎋ ليتم نشره الى المشتركين","md",true)  
return false
end

if text == ("الردود العامه ⎋") then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo")
text = "\n📝︙قائمة الردود العامه \n⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗\n"
for k,v in pairs(list) do
if Redis:get(Fast.."Add:Rd:Sudo:Gif"..v) then
db = "متحركه 🎭"
elseif Redis:get(Fast.."Add:Rd:Sudo:vico"..v) then
db = "بصمه 📢"
elseif Redis:get(Fast.."Add:Rd:Sudo:stekr"..v) then
db = "ملصق 🃏"
elseif Redis:get(Fast.."Add:Rd:Sudo:Text"..v) then
db = "رساله ✉"
elseif Redis:get(Fast.."Add:Rd:Sudo:Photo"..v) then
db = "صوره 🎇"
elseif Redis:get(Fast.."Add:Rd:Sudo:Video"..v) then
db = "فيديو 📹"
elseif Redis:get(Fast.."Add:Rd:Sudo:File"..v) then
db = "ملف ⎋"
elseif Redis:get(Fast.."Add:Rd:Sudo:Audio"..v) then
db = "اغنيه 🎵"
elseif Redis:get(Fast.."Add:Rd:Sudo:video_note"..v) then
db = "بصمه فيديو 🎥"
end
text = text..""..k.." » {"..v.."} » {"..db.."}\n"
end
if #list == 0 then
text = "⎋ لا توجد ردود للمطور"
end
return send(msg_chat_id,msg_id,"["..text.."]","md",true)  
end
if text == ("مسح الردود العامه ⎋") then 
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local list = Redis:smembers(Fast.."List:Rd:Sudo")
for k,v in pairs(list) do
Redis:del(Fast.."Add:Rd:Sudo:Gif"..v)   
Redis:del(Fast.."Add:Rd:Sudo:vico"..v)   
Redis:del(Fast.."Add:Rd:Sudo:stekr"..v)     
Redis:del(Fast.."Add:Rd:Sudo:Text"..v)   
Redis:del(Fast.."Add:Rd:Sudo:Photo"..v)
Redis:del(Fast.."Add:Rd:Sudo:Video"..v)
Redis:del(Fast.."Add:Rd:Sudo:File"..v)
Redis:del(Fast.."Add:Rd:Sudo:Audio"..v)
Redis:del(Fast.."Add:Rd:Sudo:video_note"..v)
Redis:del(Fast.."List:Rd:Sudo")
end
return send(msg_chat_id,msg_id,"⎋ تم مسح الردود العامه","md",true)  
end
if text == 'مسح المطورين ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"⎋ لا يوجد مطورين حاليا , ","md",true)  
end
Redis:del(Fast.."Dev:Groups") 
return send(msg_chat_id,msg_id,"*⎋ تم مسح {"..#Info_Members.."} من المطورين *","md",true)
end
if text == 'مسح المطورين الثانويين ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"⎋ لا يوجد مطورين حاليا , ","md",true)  
end
Redis:del(Fast.."Devss:Groups") 
return send(msg_chat_id,msg_id,"*⎋ تم مسح {"..#Info_Members.."} من المطورين *","md",true)
end
if text == 'مسح قائمه العام ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"⎋ لا يوجد محظورين عام حاليا , ","md",true)  
end
Redis:del(Fast.."BanAll:Groups") 
return send(msg_chat_id,msg_id,"*⎋ تم مسح {"..#Info_Members.."} من المحظورين عام *","md",true)
end
if text == 'تعطيل البوت الخدمي ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."BotFree") 
return send(msg_chat_id,msg_id,"⎋ تم تعطيل البوت الخدمي ","md",true)
end
if text == 'تعطيل التواصل ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:del(Fast.."TwaslBot") 
return send(msg_chat_id,msg_id,"⎋ تم تعطيل التواصل داخل البوت ","md",true)
end
if text == 'تفعيل البوت الخدمي ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."BotFree",true) 
return send(msg_chat_id,msg_id,"⎋ تم تفعيل البوت الخدمي ","md",true)
end
if text == 'تفعيل التواصل ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
Redis:set(Fast.."TwaslBot",true) 
return send(msg_chat_id,msg_id,"⎋ تم تفعيل التواصل داخل البوت ","md",true)
end
if text == 'قائمه العام ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end 
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."BanAll:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"⎋ لا يوجد محظورين عام حاليا , ","md",true)  
end
ListMembers = '\n*⎋ قائمه المحظورين عام  \n ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)

if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المحظورين عام', data = senderr..'/BanAll'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Dev:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"⎋ لا يوجد مطورين حاليا , ","md",true)  
end
ListMembers = '\n*⎋ قائمه مطورين البوت \n ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المطورين', data = senderr..'/Dev'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if text == 'المطورين الثانويين ⎋' then
if not msg.Asasy then 
return send(msg_chat_id,msg_id,'\n*⎋ هذا الامر يخص { '..Controller_Num(1)..' }* ',"md",true)  
end
if ChannelJoinch(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Chat:Channel:Join:Name'..msg.chat_id), url = 't.me/'..Redis:get(Fast..'Chat:Channel:Join'..msg.chat_id)}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
if ChannelJoin(msg) == false then
local reply_markup = bot.replyMarkup{type = 'inline',data = {{{text = Redis:get(Fast..'Channel:Join:Name'), url = 't.me/'..Redis:get(Fast..'Channel:Join')}, },}}
return send(msg.chat_id,msg.id,'*\n⎋ عليك الاشتراك في قناة البوت لأستخدام الاوامر*',"md",false, false, false, false, reply_markup)
end
local Info_Members = Redis:smembers(Fast.."Devss:Groups") 
if #Info_Members == 0 then
return send(msg_chat_id,msg_id,"⎋ لا يوجد مطورين حاليا , ","md",true)  
end
ListMembers = '\n*⎋ قائمه مطورين البوت \n ⋖━━━━𖠙ᗩᐯᗩTᗩᖇ𖠙━━━━⋗*\n'
for k, v in pairs(Info_Members) do
local UserInfo = bot.getUser(v)
if UserInfo and UserInfo.username and UserInfo.username ~= "" then
ListMembers = ListMembers.."*"..k.." - *[@"..UserInfo.username.."](tg://user?id="..v..")\n"
else
ListMembers = ListMembers.."*"..k.." -* ["..v.."](tg://user?id="..v..")\n"
end
end
local reply_markup = bot.replyMarkup{
type = 'inline',
data = {{{text = '- مسح المطورين', data = senderr..'/Dev'},},}}
return send(msg_chat_id, msg_id, ListMembers, 'md', false, false, false, false, reply_markup)
end
if not msg.Asasy then
if Redis:get(Fast.."TwaslBot") and not Redis:sismember(Fast.."BaN:In:Tuasl",senderr) then
local ListGet = {Sudo_Id,senderr}
local IdSudo = bot.getChat(ListGet[1]).id
local IdUser = bot.getChat(ListGet[2]).id
local FedMsg = bot.sendForwarded(IdSudo, 0, IdUser, msg_id)
Redis:setex(Fast.."Twasl:UserId"..msg.date,172800,IdUser)
if FedMsg.content.Fastbots == "messageSticker" then
send(IdSudo,0,Reply_Status(IdUser,'⎋ قام بارسال الملصق').Reply,"md",true)  
end
return send(IdUser,msg_id,Reply_Status(IdUser,'⎋ تم ارسال رسالتك الى المطور').Reply,"md",true)  
end
else 
if msg.reply_to_message_id ~= 0 then
local Message_Get = bot.getMessage(msg_chat_id, msg.reply_to_message_id)
if Message_Get.forward_info then
local Info_User = Redis:get(Fast.."Twasl:UserId"..Message_Get.forward_info.date) or 46899864
if text == 'حظر' then
Redis:sadd(Fast..'BaN:In:Tuasl',Info_User)  
return send(msg_chat_id,msg_id,Reply_Status(Info_User,'⎋ تم حظره من تواصل البوت ').Reply,"md",true)  
end 
if text =='الغاء الحظر' or text =='الغاء حظر' then
Redis:srem(Fast..'BaN:In:Tuasl',Info_User)  
return send(msg_chat_id,msg_id,Reply_Status(Info_User,'⎋ تم الغاء حظره من تواصل البوت ').Reply,"md",true)  
end 
local ChatAction = bot.sendChatAction(Info_User,'Typing')
if not Info_User or ChatAction.message == "USER_IS_BLOCKED" then
send(msg_chat_id,msg_id,Reply_Status(Info_User,'⎋ قام بحظر البوت لا استطيع ارسال رسالتك ').Reply,"md",true)  
end
if msg.content.video_note then
bot.sendVideoNote(Info_User, 0, msg.content.video_note.video.remote.id)
elseif msg.content.photo then
if msg.content.photo.sizes[1].photo.remote.id then
idPhoto = msg.content.photo.sizes[1].photo.remote.id
elseif msg.content.photo.sizes[2].photo.remote.id then
idPhoto = msg.content.photo.sizes[2].photo.remote.id
elseif msg.content.photo.sizes[3].photo.remote.id then
idPhoto = msg.content.photo.sizes[3].photo.remote.id
end
bot.sendPhoto(Info_User, 0, idPhoto,'')
elseif msg.content.sticker then 
bot.sendSticker(Info_User, 0, msg.content.sticker.sticker.remote.id)
elseif msg.content.voice_note then 
bot.sendVoiceNote(Info_User, 0, msg.content.voice_note.voice.remote.id, '', 'md')
elseif msg.content.video then 
bot.sendVideo(Info_User, 0, msg.content.video.video.remote.id, '', "md")
elseif msg.content.animation then 
bot.sendAnimation(Info_User,0, msg.content.animation.animation.remote.id, '', 'md')
elseif msg.content.document then
bot.sendDocument(Info_User, 0, msg.content.document.document.remote.id, '', 'md')
elseif msg.content.audio then
bot.sendAudio(Info_User, 0, msg.content.audio.audio.remote.id, '', "md") 
elseif text then
send(Info_User,0,text,"md",true)
end 
send(msg_chat_id,msg_id,Reply_Status(Info_User,'⎋ تم ارسال رسالتك اليه ').Reply,"md",true)  
end
end
end 
end --UserBot
end -- File_Bot_Run
function CallBackLua(data) --- هذا الكالباك بي الابديت 
RunCallBack(data)
end
Redis:sadd(Fast.."eza3a",Token.."&"..Fast)
Redis:set("@"..UserBot,Fast.."&".."@"..UserBot.."$@"..UserSudo.."+"..Token)
Fx.Fastbots.run(CallBackLua)