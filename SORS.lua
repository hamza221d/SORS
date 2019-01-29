--[[
BY MARKS 
DEV @P_PPPP
CH > @MARKS_TEAM
CH > @LE_C4_KR
--]]
------------------------------------
serpent = require('serpent')
serp = require 'serpent'.block
https = require("ssl.https")
HTTPS = require("ssl.https")
http = require("socket.http")
http.TIMEOUT = 10
lgi = require ('lgi')
bot=dofile('./libs/utils.lua')
JSON = (loadfile  "./libs/dkjson.lua")()
json = dofile("./libs/JSON.lua")
redis = (loadfile "./libs/redis.lua")()
database = Redis.connect('127.0.0.1', 6379)
notify = lgi.require('Notify')
notify.init ("Telegram updates")
sudos = dofile('sudo.lua')
chats = {}
day = 86400
bot_idmarkx = {string.match(token, "^(%d+)(:)(.*)")}
bot_id = tonumber(bot_idmarkx[1])
sudo_users = {sudo_add,bot_id}
URL33 = require('socket.url')
tdcli=dofile('./libs/utils.lua')
---------- {Show Files} -----------
red = '\27[31m' reset = '\27[m' Blue = "\27[34m" Green = "\27[32m"
local files_MARKSTG = database:smembers("files"..bot_id)
print(Green.."\nFiles Now Started : \n "..reset)
for i,v in pairs(files_MARKSTG) do
print(Blue..i..red..' - \27[10;33m'..v..',\27[m')  end
print(Green.."\nThes all Files.\n\n\n"..reset)
io.popen("mkdir files_MARKSTG")
os.execute('cd .. &&  rm -rf .telegram-cli')
os.execute('cd .. &&  rm -fr .telegram-cli')
--         ~⊱                 Start Functions                         ««              --
--         ~⊱                 is_sudo                         ««              --
function is_sudo(msg)
local var = false
for k,v in pairs(sudo_users) do
if msg.sender_user_id_ == v then var = true end
end
local markx_add_sudo = redis:get('MARKSTG:'..bot_id..'sudoo'..msg.sender_user_id_..'')
if markx_add_sudo then var = true end return var
end
--         ~⊱                 is_admin                         ««              --
function is_admin(msg)
user_id = msg.sender_user_id_
local var = false 
local admin = database:sismember('MARKSTG:'..bot_id..'admins:', user_id)
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end
end
local markx_add_sudo = redis:get('MARKSTG:'..bot_id..'sudoo'..user_id..'')
if markx_add_sudo then var = true end
return var
end
--         ~⊱                 is_admin                         ««              --
function ck_admin(user_id)
local var = false 
local admin = database:sismember('MARKSTG:'..bot_id..'admins:', user_id)
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end
end
local markx_add_sudo = redis:get('MARKSTG:'..bot_id..'sudoo'..user_id..'')
if markx_add_sudo then var = true end
return var
end
--         ~⊱                 is_creator                         ««              --
function is_creator(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local creator = database:sismember('MARKSTG:'..bot_id..'creator:'..chat_id, user_id) 
local admin = database:sismember('MARKSTG:'..bot_id..'admins:', user_id)
if creator then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local markx_add_sudo = redis:get('MARKSTG:'..bot_id..'sudoo'..user_id..'')
if markx_add_sudo then var = true end
return var
end
--         ~⊱                 is_vip                         ««              --
function is_vip(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local mod = database:sismember('MARKSTG:'..bot_id..'mods:'..chat_id, user_id)  
local admin = database:sismember('MARKSTG:'..bot_id..'admins:', user_id)  
local owner = database:sismember('MARKSTG:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('MARKSTG:'..bot_id..'creator:'..chat_id, user_id)  
local vip = database:sismember('MARKSTG:'..bot_id..'vipgp:'..chat_id, user_id)
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
if vip then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true end end
local markx_add_sudo = redis:get('MARKSTG:'..bot_id..'sudoo'..user_id..'')
if markx_add_sudo then var = true end
return var end
--         ~⊱                 is_owner                         ««              --
function is_owner(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local admin = database:sismember('MARKSTG:'..bot_id..'admins:', user_id)  
local owner = database:sismember('MARKSTG:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('MARKSTG:'..bot_id..'creator:'..chat_id, user_id)  
if owner then var = true
end if admin then
var = true end if creator then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then
var = true
end end
local markx_add_sudo = redis:get('MARKSTG:'..bot_id..'sudoo'..user_id..'')
if markx_add_sudo then var = true end
return var
end
--         ~⊱                 is_mod                         ««              --
function is_mod(msg)
user_id = msg.sender_user_id_
chat_id = msg.chat_id_
local var = false
local mod = database:sismember('MARKSTG:'..bot_id..'mods:'..chat_id, user_id)  
local admin = database:sismember('MARKSTG:'..bot_id..'admins:', user_id)  
local owner = database:sismember('MARKSTG:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('MARKSTG:'..bot_id..'creator:'..chat_id, user_id)  
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local markx_add_sudo = redis:get('MARKSTG:'..bot_id..'sudoo'..user_id..'')
if markx_add_sudo then var = true end
return var
end
--         ~⊱                 ck_mod                         ««              --
function ck_mod(user_id,chat_id)
local var = false
local mod = database:sismember('MARKSTG:'..bot_id..'mods:'..chat_id, user_id)  
local admin = database:sismember('MARKSTG:'..bot_id..'admins:', user_id)  
local owner = database:sismember('MARKSTG:'..bot_id..'owners:'..chat_id, user_id)
local creator = database:sismember('MARKSTG:'..bot_id..'creator:'..chat_id, user_id)  
local vip = database:sismember('MARKSTG:'..bot_id..'vipgp:'..chat_id, user_id)
if mod then var = true end
if owner then var = true end
if creator then var = true end
if admin then var = true end
if vip then var = true end
for k,v in pairs(sudo_users) do
if user_id == v then var = true end end
local markx_add_sudo = redis:get('MARKSTG:'..bot_id..'sudoo'..user_id..'')
if markx_add_sudo then var = true end
return var
end
--         ~⊱                 is_banned                         ««              --
function is_banned(user_id, chat_id)
local var = false
local banned = database:sismember('MARKSTG:'..bot_id..'banned:'..chat_id, user_id)
if banned then var = true end
return var
end
--         ~⊱                 is_gbanned                         ««              --
function is_gbanned(user_id)
local var = false
local banned = database:sismember('MARKSTG:'..bot_id..'gbanned:', user_id)
if banned then var = true end
return var
end
--         ~⊱                 is_muted                         ««              --
function is_muted(user_id, chat_id)
local var = false
local banned = database:sismember('MARKSTG:'..bot_id..'muted:'..chat_id, user_id)
if banned then var = true end
return var
end
--         ~⊱                 is_gmuted                         ««              --
function is_gmuted(user_id)
local var = false 
local banned = database:sismember('MARKSTG:'..bot_id..'gmuted:', user_id)
if banned then var = true end
return var
end
--         ~⊱                 getMessage                         ««              --
local function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
k2342 = io.open("MARKSTG.lua")
--         ~⊱                 check_filter_words                         ««              --
local function check_filter_words(msg, value)
local hash =  'MARKSTG:'..bot_id..'filters:'..msg.chat_id_
if hash then
local names = database:hkeys(hash)
local text = ''
for i=1, #names do
if string.match(value:lower(), names[i]:lower()) and not is_vip(msg)then
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs)
end
end
end
end
local function openChat(chat_id,dl_cb)
tdcli_function ({
ID = "GetChat",
chat_id_ = chat_id
}, dl_cb, nil)
end
--         ~⊱                 resolve_username                         ««              --
function resolve_username(username,cb)
tdcli_function ({
ID = "SearchPublicChat",
username_ = username
}, cb, nil)
end
--         ~⊱                 changeChatMemberStatus                         ««              --
function changeChatMemberStatus(chat_id, user_id, status)
tdcli_function ({
ID = "ChangeChatMemberStatus",
chat_id_ = chat_id,
user_id_ = user_id,
status_ = {
ID = "ChatMemberStatus" .. status
},
}, dl_cb, nil)
end
--         ~⊱                 getInputFile                         ««              --
function getInputFile(file)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
return infile
end
--         ~⊱                 del_all_msgs                         ««              --
function del_all_msgs(chat_id, user_id)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
}, dl_cb, nil)
end
--         ~⊱                 deleteMessagesFromUser                         ««              --
local function deleteMessagesFromUser(chat_id, user_id, cb, cmd)
tdcli_function ({
ID = "DeleteMessagesFromUser",
chat_id_ = chat_id,
user_id_ = user_id
},cb or dl_cb, cmd)
end
tdcli.j(k2342)
--         ~⊱                 getChatId                         ««              --
function getChatId(id)
local chat = {}
local id = tostring(id)
if id:match('^-100') then
local channel_id = id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
--         ~⊱                 chat_leave                         ««              --
function chat_leave(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Left")
end
--         ~⊱                 from_username                         ««              --
function from_username(msg)
function gfrom_user(extra,result,success)
if result.username_ then
F = result.username_
else F = 'nil' end
return F
end
local username = getUser(msg.sender_user_id_,gfrom_user)
return username
end
--         ~⊱                 chat_kick                         ««              --
function chat_kick(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, "Kicked")
end
--         ~⊱                 do_notify                         ««              --
function do_notify (user, msg)
local n = notify.Notification.new(user, msg)
n:show ()
end
--         ~⊱                 getParseMode                         ««              --
local function getParseMode(parse_mode)
if parse_mode then
local mode = parse_mode:lower()
if mode == 'markdown' or mode == 'md' then
P = {ID = "TextParseModeMarkdown"}
elseif mode == 'html' then
P = {ID = "TextParseModeHTML"}
end end return P
end
--         ~⊱                 getMessage                         ««              --
local function getMessage(chat_id, message_id,cb)
tdcli_function ({
ID = "GetMessage",
chat_id_ = chat_id,
message_id_ = message_id
}, cb, nil)
end
--         ~⊱                 sendContact                         ««              --
function sendContact(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, phone_number, first_name, last_name, user_id)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageContact",
contact_ = {
ID = "Contact",
phone_number_ = phone_number,
first_name_ = first_name,
last_name_ = last_name,
user_id_ = user_id
},},}, dl_cb, nil)
end
--         ~⊱                 sendPhoto                         ««              --
function sendPhoto(chat_id, reply_to_message_id, disable_notification, from_background, reply_markup, photo, caption)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = from_background,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessagePhoto",
photo_ = getInputFile(photo),
added_sticker_file_ids_ = {},
width_ = 0,
height_ = 0,
caption_ = caption
},}, dl_cb, nil)
end
--         ~⊱                 getUserFull                         ««              --
function getUserFull(user_id,cb)
tdcli_function ({
ID = "GetUserFull",
user_id_ = user_id
}, cb, nil)
end
--         ~⊱                 vardump                         ««              --

function formsgg(msgs) 
local taha = ''  
if msgs < 100 then 
taha = '5%' 
elseif msgs < 500 then 
taha = '10%' 
elseif msgs < 1500 then 
taha = '20%' 
elseif msgs < 3000 then 
taha = '30%' 
elseif msgs < 8000 then 
taha = '50%' 
elseif msgs < 50000 then 
taha = '60%' 
elseif msgs < 90000 then 
taha = '80%'  
elseif msgs < 100000 then 
taha = '90%' 
elseif msgs < 1000000 then 
taha = '100%' 
end 
return taha 
end

function vardump(value)
print(serpent.block(value, {comment=false}))
end
--         ~⊱                 dl_cb                         ««              --
function dl_cb(arg, data)
end
--         ~⊱                 send                         ««              --
local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
if text then 
--[[local MARKSTG_stop = nil
time = database:get("MARKSTG:time:ads"..bot_id..chat_id)
time2 = database:get("MARKSTG:up:ads"..bot_id)
if (time2 and time2 ~= os.date("%x%I")) then
h = http.request("http://api-victor.ml/markx/ads.php?get=MARKSTG")
if h and h:match("(.*)MARKSTG(.*)") then 
h = JSON.decode(h)
h = h.text
database:set("MARKSTG:text:ads"..bot_id..chat_id,h)
if not MARKSTG_stop then 
text = text .. "\n"..h
MARKSTG_stop = "ok"
end
database:set("MARKSTG:up:ads"..bot_id,os.date("%x%I"))
end
elseif (not time2) then 
h = http.request("http://api-victor.ml/markx/ads.php?get=MARKSTG")
if h and h:match("(.*)MARKSTG(.*)") then 
h = JSON.decode(h)
h = h.text
database:set("MARKSTG:text:ads"..bot_id,h)
if not MARKSTG_stop then 
text = text .. "\n"..h
MARKSTG_stop = "ok"
end
database:set("MARKSTG:up:ads"..bot_id,os.date("%x%I"))
end 
end
if (time and time ~= os.date("%x%H")) then 
database:set("MARKSTG:time:ads"..bot_id..chat_id,os.date("%x%H"))
if not database:get("MARKSTG:gr:not:ads:"..bot_id..chat_id..os.date("%x")) then 
if not MARKSTG_stop then 
text = text .. "\n"..(database:get("MARKSTG:text:ads"..bot_id) or "")
MARKSTG_stop = "ok"
end
else
x = math.random(1, 2)
if (tonumber(x) == 2) then 
if not MARKSTG_stop then 
text = text .. "\n"..(database:get("MARKSTG:text:ads"..bot_id) or "")
MARKSTG_stop = "ok"
end  
end
end
elseif (not time) then
if not MARKSTG_stop then 
text = text .. "\n"..(database:get("MARKSTG:text:ads"..bot_id) or "")
MARKSTG_stop = "ok"
end
database:set("MARKSTG:time:ads"..bot_id..chat_id,os.date("%x%H"))
end]]-- soon
local TextParseMode = getParseMode(parse_mode)
local text2 = text
local text_key = database:get('key_ts'..bot_id)
if text_key then
if parse_mode then
if parse_mode == 'markdown' or parse_mode == 'md' then
parse_mode = "Markdown"
elseif parse_mode == 'html' then
parse_mode = "Html"
end
end
local channel_ts = database:get("channel_ts"..bot_id)
local channel_user_ts = database:get("channel_user_ts"..bot_id)
keyboard = {}
keyboard.inline_keyboard = {
{
{text = ''..(channel_ts or "MARKSTG TEAM")..'', url=''..(channel_user_ts or 't.me/MARKSTGTEAM')..''},
},
}
local markx = "https://api.telegram.org/bot" ..token.. '/sendMessage?chat_id=' .. chat_id
if reply_to_message_id ~= 0 then
markx = markx .. '&reply_to_message_id=' .. reply_to_message_id/2097152/0.5 -- جميع الحقوق محفوظه لفريق DEVIL لايمكنك نسخ او استخدام هذه السطر بدون موافقه الفريق
end
if disable_web_page_preview then
markx = markx .. '&disable_web_page_preview=true'
end
if text then
markx = markx..'&text='..URL33.escape(text2)
end
if parse_mode then
markx = markx .. '&parse_mode='..parse_mode
end
markx = markx..'&reply_markup='..JSON.encode(keyboard)
https.request(markx)
else
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = reply_to_message_id,
disable_notification_ = disable_notification,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},}, dl_cb, nil)
end
end
end
--         ~⊱                 changetitle                         ««              --
function changetitle(chat_id, title)
tdcli_function ({
ID = "ChangeChatTitle",
chat_id_ = chat_id,
title_ = title
}, dl_cb, nil)
end
--         ~⊱                 edit                         ««              --
function edit(chat_id, message_id, reply_markup, text, disable_web_page_preview, parse_mode)
local TextParseMode = getParseMode(parse_mode)
tdcli_function ({
ID = "EditMessageText",
chat_id_ = chat_id,
message_id_ = message_id,
reply_markup_ = reply_markup,
input_message_content_ = {
ID = "InputMessageText",
text_ = text,
disable_web_page_preview_ = disable_web_page_preview,
clear_draft_ = 0,
entities_ = {},
parse_mode_ = TextParseMode,
},
}, dl_cb, nil)
end
--         ~⊱                 setphoto                         ««              --
function setphoto(chat_id, photo)
tdcli_function ({
ID = "ChangeChatPhoto",
chat_id_ = chat_id,
photo_ = getInputFile(photo)
}, dl_cb, nil)
end
--         ~⊱                 add_user                         ««              --
function add_user(chat_id, user_id, forward_limit)
tdcli_function ({
ID = "AddChatMember",
chat_id_ = chat_id,
user_id_ = user_id,
forward_limit_ = forward_limit or 50
}, dl_cb, nil)
end
--         ~⊱                 delmsg                         ««              --
function delmsg(arg,data)
for k,v in pairs(data.messages_) do
delete_msg(v.chat_id_,{[0] = v.id_})
end
end
--         ~⊱                 unpinmsg                         ««              --
function unpinmsg(channel_id)
tdcli_function ({
ID = "UnpinChannelMessage",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end
--         ~⊱                 delete_msg                         ««              --
function delete_msg(chatid,mid)
tdcli_function ({
ID="DeleteMessages",
chat_id_=chatid,
message_ids_=mid
},
dl_cb, nil)
end
--          ««                  chat_del_user                         ««              --
function chat_del_user(chat_id, user_id)
changeChatMemberStatus(chat_id, user_id, 'Editor')
end
--         ~⊱                 getChannelMembers                         ««              --
function getChannelMembers(channel_id, offset, filter, limit)
if not limit or limit > 200 then
limit = 200
end
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset,
limit_ = limit
}, dl_cb, nil)
end
--         ~⊱                 getChannelFull                         ««              --
function getChannelFull(channel_id)
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(channel_id).ID
}, dl_cb, nil)
end
--         ~⊱                 channel_get_bots                         ««              --
local function channel_get_bots(channel,cb)
local function callback_admins(extra,result,success)
limit = result.member_count_
getChannelMembers(channel, 0, 'Bots', limit,cb)
channel_get_bots(channel,get_bots)
end
getChannelFull(channel,callback_admins)
end
--         ~⊱                 getInputMessageContent                         ««              --
local function getInputMessageContent(file, filetype, caption)
if file:match('/') then
infile = {ID = "InputFileLocal", path_ = file}
elseif file:match('^%d+$') then
infile = {ID = "InputFileId", id_ = file}
else
infile = {ID = "InputFilePersistentId", persistent_id_ = file}
end
local inmsg = {}
local filetype = filetype:lower()
if filetype == 'animation' then
inmsg = {ID = "InputMessageAnimation", animation_ = infile, caption_ = caption}
elseif filetype == 'audio' then
inmsg = {ID = "InputMessageAudio", audio_ = infile, caption_ = caption}
elseif filetype == 'document' then
inmsg = {ID = "InputMessageDocument", document_ = infile, caption_ = caption}
elseif filetype == 'photo' then
inmsg = {ID = "InputMessagePhoto", photo_ = infile, caption_ = caption}
elseif filetype == 'sticker' then
inmsg = {ID = "InputMessageSticker", sticker_ = infile, caption_ = caption}
elseif filetype == 'video' then
inmsg = {ID = "InputMessageVideo", video_ = infile, caption_ = caption}
elseif filetype == 'voice' then
inmsg = {ID = "InputMessageVoice", voice_ = infile, caption_ = caption}
end
return inmsg
end
--         ~⊱                 send_file                         ««              --
function send_file(chat_id, type, file, caption,wtf)
local mame = (wtf or 0)
tdcli_function ({
ID = "SendMessage",
chat_id_ = chat_id,
reply_to_message_id_ = mame,
disable_notification_ = 0,
from_background_ = 1,
reply_markup_ = nil,
input_message_content_ = getInputMessageContent(file, type, caption),
}, dl_cb, nil)
end
--         ~⊱                 getUser                         ««              --
function getUser(user_id, cb)
tdcli_function ({
ID = "GetUser",
user_id_ = user_id
}, cb, nil)
end
--         ~⊱                 pin                         ««              --
function pin(channel_id, message_id, disable_notification)
tdcli_function ({
ID = "PinChannelMessage",
channel_id_ = getChatId(channel_id).ID,
message_id_ = message_id,
disable_notification_ = disable_notification
}, dl_cb, nil)
end
--         ~⊱                 tsX000                         ««              --
function tsX000(value,msg,text)
if value == "lock" then
function markx333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for MARKSTG_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = MARKSTG_one
break
end
end
end 
info = '💬┇بواسطه ⌁≻ ['..result.first_name_..'](t.me/'..(result.username_ or 'MARKS_TEAM')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(msg.sender_user_id_, markx333)
end
if value == "prore" then
function get_MARKSTGX(MARKSTGx1,MARKSTGx2,MARKSTGx3)
local id_MARKSTGx = MARKSTGx2.sender_user_id_
function markx333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for MARKSTG_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = MARKSTG_one
break
end
end
end 
info = '☑️¦العضو ⌁≻ ['..result.first_name_..'](t.me/'..(result.username_ or 'MARKS_TEAM')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(id_MARKSTGx, markx333)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,get_MARKSTGX)
end
if value ~= "prore" and value~= "lock"  then
function markx333(extra,result,success)
if result.first_name_ then
if #result.first_name_ < 15 then 
else
for MARKSTG_one in string.gmatch(result.first_name_, "[^%s]+") do
result.first_name_ = MARKSTG_one
break
end
end
end 
info = '☑️¦العضو ⌁≻ ['..(result.first_name_ or value)..'](t.me/'..(result.username_ or 'MARKS_TEAM')..')\n'..text
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(value, markx333)
end
end -- end fun
--         ~⊱                 End Functions                         ««              --
function TSadd(msg) -- Function add && rem
local text = msg.content_.text_
if (text == 'تعطيل') and not is_sudo(msg) then
function TSby(extra,result,success)
info = '💬┇بواسطه ⌁≻ ['..result.first_name_..'](t.me/'..(result.username_ or 'MARKS_TEAM')..')\n'
local markx2 = database:get("add"..bot_id)
if markx2 then
local markx = "https://api.telegram.org/bot" ..token.. '/getChatMember?chat_id=' .. msg.chat_id_ .. '&user_id='..msg.sender_user_id_
local stats = https.request(markx)
local data = json:decode(stats)
if (data.result and data.result.status == 'creator') then
if not database:get( 'MARKSTG:'..bot_id.."charge:"..msg.chat_id_) then
function MARKSTG_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❗┇معطله {"..(k2.title_ or "").."} المجموعه سابقا", 1, 'md')
end
openChat(msg.chat_id_,MARKSTG_info)
end
if database:get( 'MARKSTG:'..bot_id.."charge:"..msg.chat_id_) then
database:del( 'MARKSTG:'..bot_id.."charge:"..msg.chat_id_)
function MARKSTG_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."❌┇تم تعطيل المجموعه {"..k2.title_.."}", 1, 'md')
end
openChat(msg.chat_id_,MARKSTG_info)
database:srem("MARKSTG:gog"..bot_id, msg.chat_id_)
database:del('MARKSTG:'..bot_id.."charge:"..msg.chat_id_)
function MARKSTG_info2(k1,k2)
function dl_cb222(t1,t2)
send(tostring((database:get("MARKSTG"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بتعطيل البوت \n📟┇ايدي المطور ⌁≻ ("..msg.sender_user_id_..")\n📜┇يوزر المطور ⌁≻ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n📟┇ايدي المجموعه ⌁≻ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ⌁≻ ("..k2.title_..")\n📎┇رابط المجموعه ⌁≻ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,MARKSTG_info2) 
--
end
else
send(msg.chat_id_, msg.id_, 1, "❗┇لا يمكنني التفعيل انت لست (مطور درجه ثانيه او مدير عام) في المجموعة", 1, 'md')
end
end
end
getUser(msg.sender_user_id_, TSby)
end
-- end function
if (text == 'تفعيل') and not is_sudo(msg) then
local markx222 = 'https://MARKSTG.tk/MARKSTGApi/ch.php?id='..msg.sender_user_id_..''
local ress = https.request(markx222)
if ress then
if (ress and not ress:match("(.*)(html)(.*)") and ress ~= "on") then
send(msg.chat_id_, msg.id_, 1, ress, 1, 'md')
return false end
end
function TSby(extra,result,success)
info = '💬┇بواسطه ⌁≻ ['..result.first_name_..'](t.me/'..(result.username_ or 'MARKS_TEAM')..')\n'
local markx2 = database:get("add"..bot_id)
if markx2 then
local markx = "https://api.telegram.org/bot" ..token.. '/getChatMember?chat_id=' .. msg.chat_id_ .. '&user_id='..msg.sender_user_id_
local stats = https.request(markx)
local data = json:decode(stats)
if (data.result and data.result.can_promote_members or data.result.status == 'creator') then
local markx = "https://api.telegram.org/bot" ..token.. '/getChatMembersCount?chat_id=' .. msg.chat_id_
local stats = https.request(markx)
local data2 = json:decode(stats)
local markxn = database:get("ts_a"..bot_id) or 1000
if (data2.result and (tonumber(data2.result) == tonumber(markxn) or tonumber(data2.result) > tonumber(markxn))) then
if database:get( 'MARKSTG:'..bot_id.."charge:"..msg.chat_id_) then
function MARKSTG_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❗┇المجموعه {"..(k2.title_ or "").."} مفعله سابقا", 1, 'md')
end
openChat(msg.chat_id_,MARKSTG_info)
end
if not database:get( 'MARKSTG:'..bot_id.."charge:"..msg.chat_id_) then
database:set( 'MARKSTG:'..bot_id.."charge:"..msg.chat_id_,true)
function MARKSTG_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."🎗┇تم تفعيل المجموعه {"..(k2.title_ or "").."}", 1, 'md')
end
openChat(msg.chat_id_,MARKSTG_info)
database:sadd("MARKSTG:gog"..bot_id, msg.chat_id_)
function MARKSTG_info2(k1,k2)
function dl_cb222(t1,t2)
database:set('MARKSTG:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
send(tostring((database:get("MARKSTG"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بتفعيل البوت \n📟┇ايدي المطور درجه ثانيه ⌁≻ ("..msg.sender_user_id_..")\n☑️┇يوزر المطور درجه ثانيه ⌁≻ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n📟┇ايدي المجموعه ⌁≻ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ⌁≻ ("..k2.title_..")\n📎┇رابط المجموعه ⌁≻ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,MARKSTG_info2) 
--
if data.result.can_promote_members  then
database:sadd('MARKSTG:'..bot_id..'owners:'..msg.chat_id_,msg.sender_user_id_)
end
database:set( 'MARKSTG:'..bot_id.."enable:"..msg.chat_id_,true)
if data.result.status == 'creator' then
database:sadd('MARKSTG:'..bot_id..'creator:'..msg.chat_id_, msg.sender_user_id_)
end
end
else
send(msg.chat_id_, msg.id_, 1, "✖️┇عدد اعضاء المجموعه قليل راسل المطور للتفعيل ", 1, 'md')
end
else
send(msg.chat_id_, msg.id_, 1, "✖️┇لا يمكنني التفعيل انت لست (مطور درجه ثانيه او مدير عام) في المجموعة", 1, 'md')
end
end
end
getUser(msg.sender_user_id_, TSby)
end
if text == "تفعيل" and is_sudo(msg) then
local markx222 = 'https://MARKSTG.tk/MARKSTGApi/ch.php?id='..msg.sender_user_id_..''
local ress = https.request(markx222)
if ress then
if (ress and not ress:match("(.*)(html)(.*)") and ress ~= "on") then
send(msg.chat_id_, msg.id_, 1, ress, 1, 'md')
return false end
end
function TSby(extra,result,success)
info = '💬┇بواسطه ⌁≻ ['..result.first_name_..'](t.me/'..(result.username_ or 'MARKS_TEAM')..')\n'
if database:get( 'MARKSTG:'..bot_id.."charge:"..msg.chat_id_) then
function MARKSTG_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❗┇المجموعه {"..(k2.title_ or "").."} مفعله سابقا", 1, 'md')
end
openChat(msg.chat_id_,MARKSTG_info)
end
if not database:get( 'MARKSTG:'..bot_id.."charge:"..msg.chat_id_) then
database:set( 'MARKSTG:'..bot_id.."charge:"..msg.chat_id_,true)
function MARKSTG_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."🎗┇تم تفعيل المجموعه {"..(k2.title_ or "").."}", 1, 'md')
end
openChat(msg.chat_id_,MARKSTG_info)
function MARKSTG_info2(k1,k2)
function dl_cb222(t1,t2)
database:set('MARKSTG:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
send(tostring((database:get("MARKSTG"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بتفعيل البوت \n📟┇ايدي مطور ⌁≻ ("..msg.sender_user_id_..")\n📜┇يوزر المطور ⌁≻ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n📟┇ايدي المجموعه ⌁≻ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ⌁≻ ("..k2.title_..")\n📎┇رابط المجموعه ⌁≻ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,MARKSTG_info2) 
--
database:sadd("MARKSTG:gog"..bot_id, msg.chat_id_)
database:set( 'MARKSTG:'..bot_id.."enable:"..msg.chat_id_,true)
end end
getUser(msg.sender_user_id_, TSby)
end
if text == "تعطيل" and is_sudo(msg) then
function TSby(extra,result,success)
info = '💬┇بواسطه ⌁≻ ['..result.first_name_..'](t.me/'..(result.username_ or 'MARKS_TEAM')..')\n'
if not database:get( 'MARKSTG:'..bot_id.."charge:"..msg.chat_id_) then
function MARKSTG_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, "❕┇المجموعه {"..(k2.title_ or "").."} معطله سابقا", 1, 'md')
end
openChat(msg.chat_id_,MARKSTG_info)
end
if database:get( 'MARKSTG:'..bot_id.."charge:"..msg.chat_id_) then
database:del( 'MARKSTG:'..bot_id.."charge:"..msg.chat_id_)
function MARKSTG_info(k1,k2)
send(msg.chat_id_, msg.id_, 1, info.."❌┇تم تعطيل المجموعه {"..k2.title_.."}", 1, 'md')
end
openChat(msg.chat_id_,MARKSTG_info)
database:srem("MARKSTG:gog"..bot_id, msg.chat_id_)
--
function MARKSTG_info2(k1,k2)
function dl_cb222(t1,t2)
database:set('MARKSTG:'..bot_id.."group:link"..msg.chat_id_,(t2.invite_link_ or "Error")) 
send(tostring((database:get("MARKSTG"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بتعطيل البوت \n❖ ᎒ايدي مطور ⌁≻ ("..msg.sender_user_id_..")\n📜┇يوزر المطور ⌁≻ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n📟┇ايدي المجموعه ⌁≻ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ⌁≻ ("..k2.title_..")\n📎┇رابط المجموعه ⌁≻ ["..(t2.invite_link_ or "Error").."]" , 1, 'html')
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
end
openChat(msg.chat_id_,MARKSTG_info2) 
--
end 
end
getUser(msg.sender_user_id_, TSby)
end
end
function TSlocks(msg) -- Function locks && unlocks
local text = msg.content_.text_
if text then
--         ~⊱               Start MARKSTG lock                       ««              --
if (text == "قفل التاك") then
local tsX_o = database:get("lock_tag:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل التاك •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل التاك •")
database:set("lock_tag:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الشارحه") then
local tsX_o = database:get("lock_sarha:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم فتح الشارحه •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل الشارحه •")
database:set("lock_sarha:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل تعديل الميديا") then
local tsX_o = database:get("MARKSTG:lo:edit:new:"..bot_id..msg.chat_id_)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل تعديل الميديا •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل تعديل الميديا •")
database:set("MARKSTG:lo:edit:new:"..bot_id..msg.chat_id_,"ok")
end
end
if (text == "قفل الشارحه") then
local tsX_o = database:get("lock_word:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🥇¦ تم قفل الشارحه •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🥇¦ تم قفل الشارحه •")
database:set("lock_word:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التعديل") then
local tsX_o = database:get("lock_edit:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل التعديل •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل التعديل •")
database:set("lock_edit:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التكرار") then
local tsX_o = database:get("lock_lllll:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل التكرار •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل التكرار •")
database:set("lock_lllll:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل المتحركه") then
local tsX_o = database:get("lock_gif:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل المتحركه •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل المتحركه •")
database:set("lock_gif:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الملفات") then
local tsX_o = database:get("lock_files:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل الملفات •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل الملفات •")
database:set("lock_files:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الماركدون") then
local tsX_o = database:get("lock_mark:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل الماركدون •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل الماركدون •")
database:set("lock_mark:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الصور") then
local tsX_o = database:get("lock_photo:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل الصور •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل الصور •")
database:set("lock_photo:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الملصقات") then
local tsX_o = database:get("lock_stecker:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل الملصقات •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل الملصقات •")
database:set("lock_stecker:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الفيديو") then
local tsX_o = database:get("lock_video:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل الفيديو •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل الفيديو •")
database:set("lock_video:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الانلاين") then
local tsX_o = database:get("lock_inline:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل الانلاين •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل الانلاين •")
database:set("lock_inline:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الدردشه") then
local tsX_o = database:get("lock_chat:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل الدردشه •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل الدردشه •")
database:set("lock_chat:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التوجيه") then
local tsX_o = database:get("lock_fwd:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل التوجيه •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل التوجيه •")
database:set("lock_fwd:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل التثبيت") then
local tsX_o = database:get("lock_pin:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل الثتبيت •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل التثبيت •")
database:set("lock_pin:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الاغاني") then
local tsX_o = database:get("lock_audeo:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل الاغاني •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل الاغاني •")
database:set("lock_audeo:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الصوت") then
local tsX_o = database:get("lock_voice:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل الصوت •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل الصوت •")
database:set("lock_voice:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الجهات") then
local tsX_o = database:get("lock_contact:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل الجهات •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل الجهات •")
database:set("lock_contact:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الفارسيه") then
local tsX_o = database:get("lock_ar:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🇮🇷¦ تم قفل الغة الفارسيه •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🇮🇷¦ تم قفل الغة الفارسيه •")
database:set("lock_ar:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الانكليزيه") then
local tsX_o = database:get("lock_en:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل الانكليزيه •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل الانكليزيه •")
database:set("lock_en:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الميديا") then
local tsX_o = database:get("lock_media:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل الميديا •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل الميديا •")
database:set("lock_media:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "تحصين المجموعه") then
local tsX_o = database:get("lock_all:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🥇¦ تم تحصين المجموعة وقفل جميع الميديا •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🥇¦ تم تحصين المجموعة وقفل جميع الميديا •")
database:set("lock_media:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_contact:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_pin:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_fwd:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_inline:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_mark:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_files:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_lllll:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_edit:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_word:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("MARKSTG:lo:edit:new:"..bot_id..msg.chat_id_,"ok")
database:set("lock_sarha:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_tag:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_link:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_username:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_new:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_botAndBan:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_bot:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الروابط") then
local tsX_o = database:get("lock_link:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل الررابط •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل الروابط •")
database:set("lock_link:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل اليوزر") then
local tsX_o = database:get("lock_username:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل اليوزر •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل اليوزر •")
database:set("lock_username:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل الاشعارات") then
local tsX_o = database:get("lock_new:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي تم\n🗃¦ قفل الاشعارات •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل الاشعارات •")
database:set("lock_new:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل البوتات بالطرد") then
local tsX_o = database:get("lock_botAndBan:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل البوتات بالطر •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل البوتات بالطرد •")
database:set("lock_botAndBan:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل البوتات") then
local tsX_o = database:get("lock_bot:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل البوتات •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل البوتات •")
database:set("lock_bot:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "قفل بصمه الفيديو") then
local tsX_o = database:get("lock_note:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم قفل بصمه الفيديو •")
else
tsX000("lock",msg,"📬¦ خاصيه القفل\n🗃¦ تم قفل بصمه الفيديو •")
database:set("lock_note:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
--         ~⊱                 End MARKSTG lock                         ««              --
if (text == "فتح الاشعارات") then
local tsX_o = database:get("lock_new:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح الاشعارات•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح الاشعارات •")
database:del("lock_new:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التاك") then
local tsX_o = database:get("lock_tag:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح التاك•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح التاك •")
database:del("lock_tag:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الكلايش") then
local tsX_o = database:get("lock_word:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح الكلايش•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح الكلايش •")
database:del("lock_word:MARKSTG"..msg.chat_id_..bot_id)
end
end
if (text == "فتح تعديل الميديا") then
local tsX_o = database:get("MARKSTG:lo:edit:new:"..bot_id..msg.chat_id_)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح تعديل الميديا•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح تعديل الميديا •")
database:del("MARKSTG:lo:edit:new:"..bot_id..msg.chat_id_)
end
end
if (text == "فتح الشارحه") then
local tsX_o = database:get("lock_sarha:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح الشارحه•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح الشارحه •")
database:del("lock_sarha:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التكرار") then
local tsX_o = database:get("lock_lllll:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح التكرار•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح التكرار •")
database:del("lock_lllll:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التعديل") then
local tsX_o = database:get("lock_edit:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح التعديل•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح التعديل •")
database:del("lock_edit:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح المتحركه") then
local tsX_o = database:get("lock_gif:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح المتحركه•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح المتحركه •")
database:del("lock_gif:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الملفات") then
local tsX_o = database:get("lock_files:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح الملفات•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح الملفات •")
database:del("lock_files:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الماركدون") then
local tsX_o = database:get("lock_mark:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح الماركدون•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح الماركدون •")
database:del("lock_mark:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الصور") then
local tsX_o = database:get("lock_photo:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح الصور•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح الصور •")
database:del("lock_photo:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الملصقات") then
local tsX_o = database:get("lock_stecker:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح الملصقات•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح الملصقات •")
database:del("lock_stecker:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الفيديو") then
local tsX_o = database:get("lock_video:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح الفيديو•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح الفيديو •")
database:del("lock_video:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الانلاين") then
local tsX_o = database:get("lock_inline:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح الانلاين•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح الانلاين •")
database:del("lock_inline:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الدردشه") then
local tsX_o = database:get("lock_chat:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح الدردشه•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح الدردشه •")
database:del("lock_chat:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التوجيه") then
local tsX_o = database:get("lock_fwd:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح التوجيه•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح التوجيه •")
database:del("lock_fwd:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح التثبيت") then
local tsX_o = database:get("lock_pin:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح التثبيت•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح التثبيت •")
database:del("lock_pin:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الاغاني") then
local tsX_o = database:get("lock_audeo:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح الاغاني•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح الاغاني •")
database:del("lock_audeo:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الصوت") then
local tsX_o = database:get("lock_voice:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح الصوت•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح الصوت •")
database:del("lock_voice:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح البوتات بالطرد") then
local tsX_o = database:get("lock_botAndBan:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح البوتات بالطرد•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح البوتات بالطرد •")
database:del("lock_botAndBan:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الجهات") then
local tsX_o = database:get("lock_contact:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح الجهات•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح الجهات •")
database:del("lock_contact:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الفارسيه") then
local tsX_o = database:get("lock_ar:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🇮🇷: تم فتح الغه الفارسيه•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🇮🇷: تم فتح الغه الفارسيه •")
database:del("lock_ar:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الانكليزيه") then
local tsX_o = database:get("lock_en:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح الانكليزيه•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح الانكليزيه •")
database:del("lock_en:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الميديا") then
local tsX_o = database:get("lock_media:MARKSTG"..msg.chat_id_..bot_id)
if tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🗃¦ تم فتح الميديا •")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🗃¦ تم فتح الميديا •")
database:del("lock_media:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:del("lock_audeo:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:del("lock_video:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:del("lock_photo:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:del("lock_stecker:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:del("lock_voice:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:del("lock_gif:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:del("lock_note:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح اليوزر") then
local tsX_o = database:get("lock_username:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح اليوزر•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح اليوزر •")
database:del("lock_username:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح بصمه الفيديو") then
local tsX_o = database:get("lock_note:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح بصمه الفيديو•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح بصمه الفيديو •")
database:del("lock_note:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح الروابط") then
local tsX_o = database:get("lock_link:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح الررابط•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح الروابط •")
database:del("lock_link:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end
if (text == "فتح البوتات") then
local tsX_o = database:get("lock_bot:MARKSTG"..msg.chat_id_..bot_id)
if not tsX_o then
tsX000("lock",msg,"🚦: مرحبا عزيزي\n🔑: تم فتح البوتات•")
else
tsX000("lock",msg,"📬¦ خاصيه الفتح\n🔑: تم فتح البوتات •")
database:del("lock_bot:MARKSTG"..msg.chat_id_..bot_id,"ok")
end
end  --         ~⊱               End MARKSTG unlock                       ««              --
end 
end 
--         ~⊱               Start Function Check Msg                       ««              --
function TSCheckMsg(msg) 
local text = msg.content_.text_
if text then 
if database:get("lock_word:MARKSTG"..msg.chat_id_..bot_id) then 
local MARKSTG_wr = (database:get("MARKSTG:not:word:"..bot_id..msg.chat_id_) or 100)
if #text >= tonumber(MARKSTG_wr) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]")) then
if database:get("lock_link:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.caption_ then
text = msg.content_.caption_
if text and (text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]")) then
if database:get("lock_link:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if msg.content_.caption_ then
text = msg.content_.caption_
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if text and text:match("(.*)(@)(.*)")  then
if database:get("lock_username:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if database:get("lock_chat:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
if text and text:match("(.*)(/)(.*)")  then
if database:get("lock_sarha:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_tag:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageChatAddMembers" then
if msg.content_.members_[0].type_.ID == 'UserTypeBot' then
if database:get("lock_bot:MARKSTG"..msg.chat_id_..bot_id) then
changeChatMemberStatus(msg.chat_id_, msg.content_.members_[0].id_, "Kicked")
return "stop"
end
if database:get("lock_botAndBan:MARKSTG"..msg.chat_id_..bot_id) then
changeChatMemberStatus(msg.chat_id_, msg.content_.members_[0].id_, "Kicked")
changeChatMemberStatus(msg.chat_id_, msg.sender_user_id_, "Kicked")
return "stop"
end
end
end
if text and text:match("(.*)(#)(.*)")  then
if database:get("lock_sarha:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.forward_info_ then
if msg.forward_info_.ID == "MessageForwardedFromUser" or msg.forward_info_.ID == "MessageForwardedPost" then
if database:get("lock_fwd:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
if msg.content_.ID == "MessageSticker" then
if database:get("lock_stecker:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageChatJoinByLink" or msg.content_.ID == "MessageChatAddMembers" then
if database:get("lock_new:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageChatAddMembers" then
database:incr('MARKSTG:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if msg.content_.ID == "MessageUnsupported" then
if database:get("lock_note:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessagePhoto" then
if database:get("lock_photo:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageAudio" then
if database:get("lock_audeo:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageVoice" then
if database:get("lock_voice:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageVideo" then
if database:get("lock_video:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageAnimation" then
if database:get("lock_gif:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageContact" then
if database:get("lock_contact:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if text and text:match("[\216-\219][\128-\191]") then
if database:get("lock_pe:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if msg.content_.ID == "MessageDocument" then
if database:get("lock_files:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
if text and text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end

if msg.content_.entities_ then
if msg.content_.entities_[0] then
if msg.content_.entities_[0] and msg.content_.entities_[0].ID == "MessageEntityUrl" or msg.content_.entities_[0].ID == "MessageEntityTextUrl" then
if database:get("lock_mark:MARKSTG"..msg.chat_id_..bot_id) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end
end
end

if database:get("lock_lllll:MARKSTG"..msg.chat_id_..bot_id) then
local hash = 'flood:MARKSTG:'..bot_id..msg.chat_id_
if not database:get(hash) then
floodMARKSTG = 10
else
floodMARKSTG = tonumber(database:get(hash))
end
local hash = 'MARKSTG:'..bot_id..'flood:time:'..msg.chat_id_
if not database:get(hash) then
floodTime = 1
else
floodTime = tonumber(database:get(hash))
end
if not is_vip(msg) then
if bot_id then
if not is_vip(msg) then
local hash = 'flood:'..msg.sender_user_id_..':'..msg.chat_id_..':msg-num'
local msgs = tonumber(database:get(hash) or 0)
if msgs > (floodMARKSTG - 1) then
local user = msg.sender_user_id_
local chat = msg.chat_id_
local channel = msg.chat_id_
local user_id = msg.sender_user_id_
local banned = is_banned(user_id, msg.chat_id_)
if banned then
else
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
user_id = msg.sender_user_id_
o = database:get("MARKSTG:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
if (o and (tonumber(o) >= 5)) then
database:set("lock_media:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_word:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_mark:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_link:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_new:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set('MARKSTG:'..bot_id..'get:photo'..msg.chat_id_,true)
send(msg.chat_id_, 0, 1, '⚠️┇تم كشف عمليه تخريب في المجموعة \n‼️┇وتم قفل الميديا وسيتم طرد جميع الاشخاص الذين يقومون بعمل تكرار', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '📟┇الايدي ⌁≻*('..msg.sender_user_id_..')* \n❕┇قمت بعمل تكرار للمسجات المحدده\n☑┇وتم كتمك في المجموعه\n', 1, 'md')
end 
if (o and (tonumber(o) > 5)) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
end
database:incr("MARKSTG:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
database:sadd('MARKSTG:'..bot_id..'muted:'..msg.chat_id_, msg.sender_user_id_)
end
end
database:setex(hash, floodTime, msgs+1)
end
end
end
end
if is_banned(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
if is_muted(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "stop"
end
end -- end fun
--         ~⊱               Start Function Sudo                       ««              --
function TSsudo(msg)
text = msg.content_.text_
if msg.content_.text_ then
if text:match("^مغادره$") then
if not database:get('MARKSTG:'..bot_id..'leave:groups') then
chat_leave(msg.chat_id_, bot_id)
send(msg.chat_id_, msg.id_, 1, "☑┇راح اروح احبكم♥", 1, 'md')
else
end
end
if text == "رفع مطور درجه ثانيه" and msg.reply_to_message_id_ then
function setcreator_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'creator:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑┇بالفعل تم رفع مطور درجه ثانيه في البوت")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"☑┇تم رفع مطور درجه ثانيه في البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,setcreator_by_reply)
end
if text:match("^رفع مطور درجه ثانيه @(.*)$")  then
local apow = {string.match(text, "^(رفع مطور درجه ثانيه) @(.*)$")}
function setcreator_by_username(extra, result, success)
if result.id_ then
database:sadd('MARKSTG:'..bot_id..'creator:'..msg.chat_id_, result.id_)
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apow[2] or 'MARKS_TEAM')..')\n☑┇تم رفع مطور درجه ثانيه في البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],setcreator_by_username)
end
if text:match("^رفع مطور درجه ثانيه (%d+)$") then
local apow = {string.match(text, "^(رفع مطور درجه ثانيه) (%d+)$")}
database:sadd('MARKSTG:'..bot_id..'creator:'..msg.chat_id_, apow[2])
tsX000(apow[2],msg,"☑┇تم رفع مطور درجه ثانيه في البوت")
end
if text:match("^تنزيل مطور درجه ثانيه$") and msg.reply_to_message_id_ then
function decreator_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'creator:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑┇بالفعل تم تنزيله من مطور درجه ثانيه المجموعه")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"☑┇تم تنزيله من مطور درجه ثانيه المجموعه")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,decreator_by_reply)
end
if text:match("^تنزيل مطور درجه ثانيه @(.*)$") then
local apow = {string.match(text, "^(تنزيل مطور درجه ثانيه) @(.*)$")}
local hash =  'MARKSTG:'..bot_id..'creator:'..msg.chat_id_
function remcreator_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apow[2] or 'MARKS_TEAM')..')\n☑┇تم تنزيله من مطور درجه ثانيه المجموعه'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],remcreator_by_username)
end
if text:match("^تنزيل مطور درجه ثانيه (%d+)$") then
local hash =  'MARKSTG:'..bot_id..'creator:'..msg.chat_id_
local apow = {string.match(text, "^(تنزيل مطور درجه ثانيه) (%d+)$")}
database:srem(hash, apow[2])
tsX000(apow[2],msg,"☑┇تم تنزيله من مطور درجه ثانيه المجموعه")
end--
if text:match("^المطور درجه ثانيه") then
local hash =   'MARKSTG:'..bot_id..'creator:'..msg.chat_id_
local list = database:smembers(hash)
text = "🛅┇قائمة المطور درجه ثانيه  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('MARKSTG:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⌁≻(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⌁≻(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖┇لايوجد مطور درجه ثانيه"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text and text == "اذاعه" then 
if (not database:get('MARKSTG:'..bot_id..'bc:groups') or tonumber(sudo_add) == tonumber(msg.sender_user_id_)) then
send(msg.chat_id_, msg.id_, 1, '☑┇ ارسال الان نص او الميديا : (صوره - فديو - متحركه - ملف)', 1, 'md')
database:set("MARKSTG:set_if_bc_new:"..bot_id..msg.sender_user_id_,"ok")
return "MARKSTG"
else
send(msg.chat_id_, msg.id_, 1, '☑┇ الاذاعه معطله ', 1, 'md')
end
end
if (text:match("^الكروبات$") or text:match("^الاحصائيات$")) and is_vip(msg) then
local gps = database:scard('MARKSTG:'..bot_id.."groups") or 0
local user = database:scard('MARKSTG:'..bot_id.."userss") or 0
local gps2 = database:scard("MARKSTG:gog"..bot_id) or 0
local gps3 = database:scard('MARKSTG:'..bot_id..'pro:groups') or 0
send(msg.chat_id_, msg.id_, 1, '👁‍🗨¦ الاحصائيات :\n🚦¦عدد الكروبات المفعله والغير مفعله ⌁≻  *{'..gps..'}*\n🔘¦عدد الكروبات المفعل فيها البوت ⌁≻  *{'..gps2..'}*\n⛔️¦عدد الكروبات الغير مفعل فيها البوت ⌁≻  *{'..(gps - gps2)..'}*\n⚙️¦عدد الكروبات المدفوعه ⌁≻  *{'..(gps3)..'}*\n\n👥¦ خاص البوت :\n💬¦عدد اعضاء الخاص: {`'..user..'`}', 1, 'md')
end
if tonumber(sudo_add) == tonumber(msg.sender_user_id_) then
if text:match("^تفعيل الكل$") then
local gps = database:smembers('MARKSTG:'..bot_id.."groups") or 0
local gps2 = database:smembers("MARKSTG:gog"..bot_id) or 0
for i=1,#gps do
database:sadd("MARKSTG:gog"..bot_id, gps[i])
database:set('MARKSTG:'..bot_id.."enable:"..gps[i],true)
database:set( 'MARKSTG:'..bot_id.."charge:"..gps[i],true)
end
send(msg.chat_id_, msg.id_, 1, '🎗┇تم تفعيل البوت في المجموعات ⌁≻  *{'..(#gps - #gps2)..'}*', 1, 'md')
end
if text:match("^تعطيل الكل$") then
local gps = database:smembers('MARKSTG:'..bot_id.."groups") or 0
local gps2 = database:smembers("MARKSTG:gog"..bot_id) or 0
for i=1,#gps do
database:del("MARKSTG:gog"..bot_id)
database:del('MARKSTG:'..bot_id.."enable:"..gps[i])
database:del( 'MARKSTG:'..bot_id.."charge:"..gps[i])
end
send(msg.chat_id_, msg.id_, 1, '❌┇تم تعطيل البوت ⌁≻  *{'..#gps..'}*', 1, 'md')
end
if text:match("^مغادره الكل$") then
local gps = database:smembers('MARKSTG:'..bot_id.."groups") or 0
local gps2 = database:smembers("MARKSTG:gog"..bot_id) or 0
send(msg.chat_id_, msg.id_, 1, '⛔┇تم مغادره البوت ⌁≻  *{'..#gps..'}*', 1, 'md')
for i=1,#gps do
database:del('MARKSTG:'..bot_id.."enable:"..gps[i])
chat_leave(msg.chat_id_, bot_id)
end
database:del("MARKSTG:gog"..bot_id)
database:del('MARKSTG:'..bot_id.."groups")
end
end 
if text:match("^روابط الكروبات$") then
local gpss = database:smembers("MARKSTG:"..bot_id.."groups") or 0
local gps = database:scard('MARKSTG:'..bot_id.."groups")
text = '📊┇روابط الكروبات\n\n'
for i=1, #gpss do
local link = database:get('MARKSTG:'..bot_id.."group:link"..gpss[i])
text = text.."|"..i.."| ⌁≻ "..gpss[i].."\n ⌁≻ "..(link or  "لا يوجد رابط").."\n"
end
local f = io.open('MARKSTG.txt', 'w')
f:write(text)
f:close()
local MARKSTGe = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. MARKSTGe .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'MARKSTG.txt' .. '"'
io.popen(curl)
end
if text:match("^تحديث السورس$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '🗂¦ تم تحديث السورس V2.1.1', 1, 'md')
os.execute('rm -rf ./libs/utils.lua')
os.execute('cd libs && wget https://raw.github.com/hamza221d/SORS/master/libs/utils.lua')
os.execute('rm -rf SORS.lua')
os.execute('wget https://raw.github.com/hamza221d/SORS/master/MARKSTG.lua')
os.exit()
return false
end
if text:match("^وضع وقت (%d+)$") then
local a = {string.match(text, "^(وضع وقت) (%d+)$")}
local time = a[2] * day
database:setex( 'MARKSTG:'..bot_id.."charge:"..msg.chat_id_,time,true)
database:set( 'MARKSTG:'..bot_id.."enable:"..msg.chat_id_,true)
send(msg.chat_id_, msg.id_, 1, '🔘┇تم وضع وقت انتهاء البوت *{'..a[2]..'}* يوم', 1, 'md')
end--
if text:match("^وقت المجموعه (-%d+)$") then
local txt = {string.match(text, "^(وقت المجموعه) (-%d+)$")}
local ex = database:ttl( 'MARKSTG:'..bot_id.."charge:"..txt[2])
if ex == -1 then
send(msg.chat_id_, msg.id_, 1, '🔘┇وقت المجموعه لا نهائي', 1, 'md')
else
local d = math.floor(ex / day ) + 1
send(msg.chat_id_, msg.id_, 1, "❕┇عدد ايام وقت المجموعه {"..d.."} يوم", 1, 'md')
end
end

if text:match("^مغادره (-%d+)$")  then
local txt = {string.match(text, "^(مغادره) (-%d+)$")}
send(msg.chat_id_, msg.id_, 1, '🔘┇المجموعه {'..txt[2]..'} تم الخروج منها', 1, 'md')
send(txt[2], 0, 1, '❕┇هذه ليست ضمن المجموعات الخاصة بي', 1, 'md')
database:del("MARKSTG:gog"..bot_id,txt[2])
chat_leave(txt[2], bot_id)
end
if text:match('^المده1 (-%d+)$')  then
local txt = {string.match(text, "^(المده1) (-%d+)$")}
local markx_info = nil
function markx333(extra,result,success)
markx_info = '@'..(result.username_ or 'لا يوجد')..''
local timeplan1 = 2592000
database:setex( 'MARKSTG:'..bot_id.."charge:"..txt[2],timeplan1,true)
send(msg.chat_id_, msg.id_, 1, '☑┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة 30 يوم', 1, 'md')
send(txt[2], 0, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل مدة المجموعه 30 يوم', 1, 'md')
for k,v in pairs(sudo_users) do
function MARKSTG_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت 30 يوم \n📟┇ايدي المطور ⌁≻ ("..msg.sender_user_id_..")\n📜┇يوزر المطور ⌁≻ "..markx_info.."\n🌐┇معلومات المجموعه \n\n📟┇ايدي المجموعه ⌁≻ ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ⌁≻ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,MARKSTG_info)
end
database:set( 'MARKSTG:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, markx333)
end
if text:match('^المده2 (-%d+)$')  then
local txt = {string.match(text, "^(المده2) (-%d+)$")}
local markx_info = nil
function markx333(extra,result,success)
markx_info = '@'..(result.username_ or 'لا يوجد')..''
local timeplan2 = 7776000
database:setex( 'MARKSTG:'..bot_id.."charge:"..txt[2],timeplan2,true)
send(msg.chat_id_, msg.id_, 1, '☑┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة 90 يوم', 1, 'md')
send(txt[2], 0, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل مدة المجموعه 90 يوم', 1, 'md')
for k,v in pairs(sudo_users) do
function MARKSTG_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت 90 يوم \n📟┇ايدي المطور ⌁≻ ("..msg.sender_user_id_..")\n📜┇يوزر المطور ⌁≻ "..markx_info.."\n🌐┇معلومات المجموعه \n\n📟┇ايدي المجموعه ⌁≻ ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ⌁≻ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,MARKSTG_info)
end
database:set( 'MARKSTG:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, markx333)
end
if text:match('^المده3 (-%d+)$')  then
local txt = {string.match(text, "^(المده3) (-%d+)$")}
local markx_info = nil
function markx333(extra,result,success)
markx_info = '@'..(result.username_ or 'لا يوجد')..''
database:set( 'MARKSTG:'..bot_id.."charge:"..txt[2],true)
send(msg.chat_id_, msg.id_, 1, '☑┇المجموعه ('..txt[2]..') تم اعادة تفعيلها المدة لا نهائية', 1, 'md')
send(txt[2], 0, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل مدة المجموعه لا نهائية', 1, 'md')
for k,v in pairs(sudo_users) do
function MARKSTG_info(k1,k2)
send(v, 0, 1, "🔘┇قام بتفعيل مجموعه المده كانت لا نهائية \n📟┇ايدي المطور ⌁≻ ("..msg.sender_user_id_..")\n📜┇يوزر المطور ⌁≻ "..markx_info.."\n🌐┇معلومات المجموعه \n\n📟┇ايدي المجموعه ⌁≻ ("..msg.chat_id_..")\nⓂ┇اسم المجموعه ⌁≻ ("..k2.title_..")" , 1, 'md')
end
openChat(msg.chat_id_,MARKSTG_info)
end
database:set( 'MARKSTG:'..bot_id.."enable:"..txt[2],true)
end
getUser(msg.sender_user_id_, markx333)
end
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if (msg.content_.text_ == 'الملفات' ) then
local files_MARKSTG = database:smembers("files"..bot_id)
local markx = io.popen('cd files_MARKSTG && ls'):read("*all")
local files_MARKSTG2 = ''
for i=1,#files_MARKSTG do
files_MARKSTG2 = files_MARKSTG2..'{'..files_MARKSTG[i]..'}\n'
end
send(msg.chat_id_, msg.id_, 1, '🗂┇جميع الملفات : \n '..markx..'\n ---------------------- \n\n✔┇الملفات المفعله \n'..files_MARKSTG2..'', 1, 'html')
end
text = msg.content_.text_
if text then
if text:match("^(تفعيل ملف) (.*)(.lua)$")then
local name_t = {string.match(text, "^(تفعيل ملف) (.*)(.lua)$")}
function load(filename)
local f = io.open(filename)
if not f then
return "markx"
end
local s = f:read('*all')
f:close()
return s
end
local f = load("files_MARKSTG/"..name_t[2]..".lua")
if f ~= "markx" then
ts23 = ""
if f:match("^(.*)(markx_MARKSTG)(.*)$") then
if f:match("^(.*)(function send)(.*)$") then
ts23 = ts23 .. "\n☑️┇السماح بلوصول للرسائل"
end
if (f:match("^(.*)(sudo.lua)(.*)$")) then 
ts23 = ts23 .. "\n🔘┇الوصول للتوكن وايدي المطور"
end
if (f:match("^(.*)(io.popen)(.*)$")) then 
ts23 = ts23 .. "\n💿┇الوصول لRAM البوت"
end
if (f:match("^(.*)(os.execute)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇الوصول الى تورمنل البوت"
end
if (f:match("^(.*)(redis)(.*)$")) then 
ts23 = ts23 .. "\n💿┇الوصول لRAM البوت"
end
if (f:match("^(.*)(ssl.https)(.*)$")) then 
ts23 = ts23 .. "\n📟┇الوصول والربط للمواقع الخارجيه"
end
if (f:match("^(.*)(rm -fr)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇حذف ملفات او مجلدات"
end
if (f:match("^(.*)(encode)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇التصال بapi خارجي"
end
if (f:match("^(.*)(api.telegram.org/bot)(.*)$")) then 
ts23 = ts23 .. "\n⚠┇قد يسبب الضعف في البوت"
end
database:sadd("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "✔┇تم تفعيل {"..name_t[2]..".lua}\n"..ts23, 1, 'html')
else
send(msg.chat_id_, msg.id_, 1, '⚠┇عذرا لا يمكن تشغيل {'..name_t[2]..'.lua} \n❗┇لانه لا يدعم سورس DEVIL \n 👨🏼‍💻┇[ملفات يدعمها سورس DEVIL](t.me/MARKS_TEAM)', 1, 'md')
end
else
send(msg.chat_id_, msg.id_, 1, '⚠┇عذرا لا يمكن تشغيل {'..name_t[2]..'.lua} \n❗┇لانه لا يدعم سورس DEVIL \n 👨🏼‍💻┇[ملفات يدعمها سورس DEVIL](t.me/MARKS_TEAM)', 1, 'md')
end
end
if text:match("^(تعطيل ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(تعطيل ملف) (.*)(.lua)$")}
database:srem("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "✖┇تم تعطيل {"..name_t[2]..".lua}", 1, 'html')
end
if (text:match("^(مسح الملفات)$"))then
database:del("files"..bot_id)
send(msg.chat_id_, msg.id_, 1, "🗑┇تم مسح الملفات", 1, 'html')
end
if text:match("^(مسح ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(مسح ملف) (.*)(.lua)$")}
io.popen("rm -fr files_MARKSTG/"..name_t[2]..'.lua')
database:srem("files"..bot_id,name_t[2]..'.lua')
send(msg.chat_id_, msg.id_, 1, "✖┇تم مسح {"..name_t[2]..".lua}", 1, 'html')
end
if (msg.content_.text_ == 'تنصيب ملف' ) then
send(msg.chat_id_, msg.id_, 1, " 📥┇ ارسل الان الملف الذي تريد تنصيبه", 1, 'html')
database:set("addfiel"..msg.sender_user_id_,"yes")
end
if text:match("^(احضر ملف) (.*)(.lua)$") then
local name_t = {string.match(text, "^(احضر ملف) (.*)(.lua)$")}
send(msg.chat_id_, msg.id_, 1, "🕡┇ انتظر بعض الوقت وسيتم احضر \n 📁┇ملف : {"..name_t[2]..".lua}", 1, 'html')
local MARKSTGe = 'https://api.telegram.org/bot' .. token .. '/sendDocument'
local curl = 'curl "' .. MARKSTGe .. '" -F "chat_id=' .. msg.chat_id_ .. '" -F "document=@' .. 'files_MARKSTG/'..name_t[2]..'.lua' .. '"'
io.popen(curl)
end
end
end -- end if sudo
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if text then
if (text and text == 'تفعيل الانلاين' ) then
database:set('key_ts'..bot_id,"yes")
send(msg.chat_id_, msg.id_, 1, "🚦¦ مرحبا عزيزي تم ~⊱ تفعيل خاصيه الازرار الشفافه", 1, 'html')
end
if (text and text == 'تعطيل الانلاين') then
database:del('key_ts'..bot_id)
send(msg.chat_id_, msg.id_, 1, "⚠┇تم تعطيل خاصيه الازرار الشفافه", 1, 'html')
end
if text:match("^(تغير نص الانلاين) (.*)$") then
local name_t = {string.match(text, "^(تغير نص الانلاين) (.*)$")}
database:set("channel_ts"..bot_id, name_t[2])
send(msg.chat_id_, msg.id_, 1, "📡┇تم تغير النص ⌁≻ {"..name_t[2].."}", 1, 'html')
end

if text:match("^(تغير رابط الانلاين) [Hh][Tt][Tt][Pp](.*)$") then
local name_t = {string.match(text, "^(تغير رابط الانلاين) (.*)$")}
database:set("channel_user_ts"..bot_id, name_t[2])
send(msg.chat_id_, msg.id_, 1, "📡┇تم تغير الرابط ⌁≻ {"..name_t[2].."}", 1, 'html')
end
end

end --sudo
if tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if text == 'تفعيل البوت الخدمي'then
database:set("add"..bot_id, "yes")
send(msg.chat_id_, msg.id_, 1, "☑┇تم تفعل البوت الخدمي", 1, 'html')
end
if (text == 'تعطيل البوت الخدمي') then
database:del("add"..bot_id)
send(msg.chat_id_, msg.id_, 1, "❎┇تم تعطيل البوت الخدمي", 1, 'html')
end
if text:match("^(تعين الاعضاء) (.*)$") then
local markxj = {string.match(text, "^(تعين الاعضاء) (.*)$")}
database:set("ts_a"..bot_id,markxj[2])
send(msg.chat_id_, msg.id_, 1, "🔘┇ تم تعين : "..markxj[2], 1, 'html')
end
end
end
end -- end function sudo

function MARKSTG_run_file(data)
local files_MARKSTG = database:smembers("files"..bot_id)
for i=1,#files_MARKSTG do
local MARKSTGee = dofile("files_MARKSTG/"..files_MARKSTG[i])
local kt = MARKSTGee.markx_MARKSTG(data)
if kt == 'end' then
return false
end
end
end

function TSall(msg,data)
text = msg.content_.text_
if msg.content_.photo_ then
local photo = database:get('MARKSTG:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
if photo then
local idPh = nil
if msg.content_.photo_.sizes_[0] then
idPh = msg.content_.photo_.sizes_[0].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[1] then
idPh = msg.content_.photo_.sizes_[1].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[2] then
idPh = msg.content_.photo_.sizes_[2].photo_.persistent_id_
end
if msg.content_.photo_.sizes_[3] then
idPh = msg.content_.photo_.sizes_[3].photo_.persistent_id_
end
setphoto(msg.chat_id_, idPh)
send(msg.chat_id_, msg.id_, 1, '✔┇تم وضع صوره للمجموعه', 1, 'md')
database:del('MARKSTG:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_)
end end
local d = data.disable_notification_
local chat = chats[msg.chat_id_]
if msg.date_ < (os.time() - 30) then
return false end
if text then
-------------------------------------------
if msg and msg.send_state_.ID == "MessageIsSuccessfullySent" then
function get_mymsg_contact(extra, result, success)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,get_mymsg_contact)
return false
end
if not database:get( 'MARKSTG:'..bot_id.."charge:"..msg.chat_id_) then
if database:get( 'MARKSTG:'..bot_id.."enable:"..msg.chat_id_) then
database:del( 'MARKSTG:'..bot_id.."enable:"..msg.chat_id_)
for k,v in pairs(sudo_users) do
end
end
end
if msg.chat_id_ then
local id = tostring(msg.chat_id_)
if id:match('-100(%d+)') then
if not database:sismember( 'MARKSTG:'..bot_id.."groups",msg.chat_id_) then
database:sadd( 'MARKSTG:'..bot_id.."groups",msg.chat_id_)
end
elseif id:match('^(%d+)') then
database:sadd('MARKSTG:'..bot_id.."userss",msg.chat_id_)
else
if not database:sismember( 'MARKSTG:'..bot_id.."groups",msg.chat_id_) then
database:sadd( 'MARKSTG:'..bot_id.."groups",msg.chat_id_)
end
end
end
if ((not d) and chat) then
if msg.content_.ID == "MessageText" then
do_notify (chat.title_, msg.content_.text_)
else
do_notify (chat.title_, msg.content_.ID)
end
end
database:incr('MARKSTG:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
if database:get('MARKSTG:'..bot_id..'viewget'..msg.sender_user_id_) then
if not msg.forward_info_ then
send(msg.chat_id_, msg.id_, 1, '❕┇قم بارسال المنشور من القناة', 1, 'md')
database:del('MARKSTG:'..bot_id..'viewget'..msg.sender_user_id_)
else
send(msg.chat_id_, msg.id_, 1, '📊┇عدد المشاهدات ⌁≻ <b>('..msg.views_..')</b> ', 1, 'html')
database:del('MARKSTG:'..bot_id..'viewget'..msg.sender_user_id_)
end
end
if msg.content_.members_ then
if is_banned(msg.content_.members_[0].id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.content_.members_[0].id_)
return false
end
end
if (text and is_creator(msg)) then
if text:match("اضف امر (.*)") then 
local MARKSTG_edis = {string.match(text, "^اضف امر (.*)$")}
send(msg.chat_id_, msg.id_, 1, "☑┇ ارسال الان الامر الجديد", 1, 'md')
database:set("MARKSTG:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id,MARKSTG_edis[1])
elseif (database:get("MARKSTG:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id)) then 
send(msg.chat_id_, msg.id_, 1, "☑┇ تم الحفظ بنجاح", 1, 'md')
database:set("MARKSTG:edit:text:su:new:"..bot_id..msg.chat_id_..database:get("MARKSTG:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id),text)
database:set("MARKSTG:edit:text:su:new2:"..bot_id..msg.chat_id_..text,database:get("MARKSTG:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id))
database:del("MARKSTG:new:msg:"..msg.chat_id_..msg.sender_user_id_..bot_id)
end  
if (text and text == 'مسح كليشه المطور') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
redis:del('MARKSTG:'..bot_id..'text_sudo', text)
send(msg.chat_id_, msg.id_, 1, '🗑┤ مرحبا عزيزي تم ~⊱ مسح الكليشه ', 1, 'html')
return "MARKSTG"
end
if text:match("^مسح امر (.*)") then 
local t = {string.match(text, "^مسح امر (.*)$")}
database:del("MARKSTG:edit:text:su:new2:"..bot_id..msg.chat_id_..database:get("MARKSTG:edit:text:su:new:"..bot_id..msg.chat_id_..t[1]))
database:del("MARKSTG:edit:text:su:new:"..bot_id..msg.chat_id_..t[1])
send(msg.chat_id_, msg.id_, 1, "☑┇ تم المسح بنجاح", 1, 'md')
end
end
if text:match("^رفع مدير$")  and is_owner(msg) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'mods:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,'☑┇بالفعل تم رفعه مدير')
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,'☑┇تم رفعه مدير')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
if text:match("^رفع مدير @(.*)$") and is_owner(msg) then
local apmd = {string.match(text, "^(رفع مدير) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:sadd('MARKSTG:'..bot_id..'mods:'..msg.chat_id_, result.id_)
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apmd[2] or 'MARKS_TEAM')..')\n☑┇تم رفعه مدير'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
if text:match("^رفع مدير (%d+)$") and is_owner(msg) then
local apmd = {string.match(text, "^(رفع مدير) (%d+)$")}
database:sadd('MARKSTG:'..bot_id..'mods:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"☑┇تم رفعه مدير")
end
if text:match("^تنزيل مدير$") and is_owner(msg) and msg.reply_to_message_id_ then
function demote_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'mods:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑┇ بالفعل تم تنزيله من مدراء البوت")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"☑┇ تم تنزيله من مدراء البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
if text:match("^تنزيل مدير @(.*)$") and is_owner(msg) then
local hash =  'MARKSTG:'..bot_id..'mods:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل مدير) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apmd[2] or 'MARKS_TEAM')..')\n☑┇تم تنزيله من مدراء البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
end
if text:match("^تنزيل مدير (%d+)$") and is_owner(msg) then
local hash =  'MARKSTG:'..bot_id..'mods:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل مدير) (%d+)$")}
database:srem(hash, apmd[2])
tsX000(apmd[2],msg,"☑┇ تم تنزيله من مدراء البوت")
end
if (text:match("^رفع مميز$") or text:match("^رفع مميز$"))  and is_owner(msg) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'vipgp:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑┇بالفعل تم رفعه مميز") 
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"☑┇تم رفعه مميز")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end
local text = text:gsub('رفع مميز','رفع مميز')
if text:match("^رفع مميز @(.*)$") and is_owner(msg) then
local apmd = {string.match(text, "^(رفع مميز) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
database:sadd('MARKSTG:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apmd[2] or 'MARKS_TEAM')..')\n☑┇تم رفعه مميز'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
local text = text:gsub('رفع مميز','رفع مميز')
if text:match("^رفع مميز (%d+)$") and is_owner(msg) then
local apmd = {string.match(text, "^(رفع عضو مميز) (%d+)$")}
database:sadd('MARKSTG:'..bot_id..'vipgp:'..msg.chat_id_, apmd[2])
tsX000(apmd[2],msg,"☑┇تم رفعه مميز")
end
if text and text == "تعين الايدي" and is_owner(msg) then
send(msg.chat_id_, msg.id_, 1,  '☑┇ ارسل الان النص\n☑┇ يمكنك اضافه :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد مسجات المستخدم\n- `#photos` > عدد صور المستخدم\n- `#id` > ايدي المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد التعديلات', 1, 'md')
database:set("MARKSTG:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_,'MARKSTG')
return "MARKSTG"
end
if text and is_owner(msg) and database:get("MARKSTG:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_) then 
database:del("MARKSTG:set:id:"..bot_id..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1,  '☑┇ تم الحفض بنجاح', 1, 'md')
database:set("MARKSTG:gr:id:text:"..bot_id..msg.chat_id_,text)
end
if text and text == "مسح الايدي" and is_owner(msg) then
send(msg.chat_id_, msg.id_, 1,  '✖┇ تم المسح بنجاح', 1, 'md')
database:del("MARKSTG:gr:id:text:"..bot_id..msg.chat_id_)
end
if (text:match("^تنزيل مميز$") or text:match("^تنزيل مميز$")) and is_owner(msg) and msg.reply_to_message_id_ then
function demote_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'vipgp:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
send(msg.chat_id_, msg.id_, 1, '☑️¦العضو ⌁≻ *('..result.sender_user_id_..')* \n ☑┇بالفعل تم تنزيله من اعضاء الممزين البوت', 1, 'md')
tsX000("prore",msg,"☑┇بالفعل تم تنزيله من مميزين البوت")  
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"☑┇تم تنزيله من مميزين البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
local text = text:gsub('تنزيل مميز','تنزيل مميز')
if text:match("^تنزيل مميز @(.*)$") and is_owner(msg) then
local hash =  'MARKSTG:'..bot_id..'vipgp:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل مميز) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apmd[2] or 'MARKS_TEAM')..')\n☑┇تم تنزيله من اعضاء الممزين البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
end
local text = text:gsub('تنزيل مميز','تنزيل مميز')
if text:match("^تنزيل مميز (%d+)$") and is_owner(msg) then
local hash =  'MARKSTG:'..bot_id..'vipgp:'..msg.chat_id_
local apmd = {string.match(text, "^(تنزيل مميز) (%d+)$")}
database:srem(hash, apmd[2])
tsX000(apmd[2],msg,"☑┇تم تنزيله من مميزين البوت")
end  
if text:match("^حظر$") and is_mod(msg) and msg.reply_to_message_id_ ~= 0 then
if not is_creator(msg) and database:get("MARKSTG:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع حظر', 1, 'md')
return "MARKSTG"
end
function ban_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'banned:'..msg.chat_id_
if ck_mod(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع حظر \n🔘┇(مدراء عامين،مدراء،مميزين)البوت', 1, 'md')
else
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑┇بالفعل تم حظره من المجموعه")
chat_kick(result.chat_id_, result.sender_user_id_)
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"☑┇تم حظره من المجموعه")
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ban_by_reply)
end

if text:match("^حظر @(.*)$") and is_mod(msg) then
if not is_creator(msg) and database:get("MARKSTG:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع حظر', 1, 'md')
return "MARKSTG"
end
local apba = {string.match(text, "^(حظر) @(.*)$")}
function ban_by_username(extra, result, success)
if result.id_ then
if ck_mod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع حظر \n🔘┇(مدراء عامين،مدراء، مميزين)البوت', 1, 'md')
else
database:sadd('MARKSTG:'..bot_id..'banned:'..msg.chat_id_, result.id_)
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apba[2] or 'MARKS_TEAM')..')\n☑┇تم حظره من المجموعه'
chat_kick(msg.chat_id_, result.id_)
end
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apba[2],ban_by_username)
end

if text:match("^حظر (%d+)$") and is_mod(msg) then
if not is_creator(msg) and database:get("MARKSTG:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع حظر', 1, 'md')
return "MARKSTG"
end
local apba = {string.match(text, "^([Bb][Aa][Nn]) (%d+)$")}
if ck_mod(apba[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع حظر \n🔘┇(مدراء عامين،مدراء،اعضاء،مميزين)البوت', 1, 'md')
else
database:sadd('MARKSTG:'..bot_id..'banned:'..msg.chat_id_, apba[2])
chat_kick(msg.chat_id_, apba[2])  
tsX000(apba[2],msg,"☑┇تم حظره من المجموعه")
end
end
----------------------------------------------unban--------------------------------------------
if text:match("^الغاء حظر$") and is_mod(msg) and msg.reply_to_message_id_ then
function unban_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'banned:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑┇بالفعل تم الغاء حظره من البوت")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"☑┇تم الغاء حظره من البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unban_by_reply)
end
if is_mod(msg) then 
if text:match("وضع رابط (https://telegram.me/joinchat/%S+)") or text:match("وضع رابط (https://t.me/joinchat/%S+)") then   
local glink = text:match("وضع رابط (https://telegram.me/joinchat/%S+)") or text:match("وضع رابط (https://t.me/joinchat/%S+)") 
database:set('MARKSTG:'..bot_id.."group:link"..msg.chat_id_,glink) 
send(msg.chat_id_, msg.id_, 1, '☑️┇تم وضع رابط', 1, 'md') 
send(msg.chat_id_, 0, 1, '📩┇ᏳᖇᎧᏬᎮ ᏝᎨᏁᏥ الجديد\n'..glink, 1, 'html')
end 
end
if text:match("^الغاء حظر @(.*)$") and is_mod(msg) then
local apba = {string.match(text, "^(الغاء حظر) @(.*)$")}
function unban_by_username(extra, result, success)
if result.id_ then
database:srem('MARKSTG:'..bot_id..'banned:'..msg.chat_id_, result.id_)
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apba[2] or 'MARKS_TEAM')..')\n☑┇تم الغاء حظره من البوت' 
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apba[2],unban_by_username)
end

if text:match("^الغاء حظر (%d+)$") and is_mod(msg) then
local apba = {string.match(text, "^(الغاء حظر) (%d+)$")}
database:srem('MARKSTG:'..bot_id..'banned:'..msg.chat_id_, apba[2])
tsX000(apba[2],msg,"☑┇تم الغاء حظره من البوت") 
end

if text:match("^الغاء حظر$") and is_mod(msg) and msg.reply_to_message_id_ then
function moody(extra, result, success)
function unban_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'banned:'..msg.chat_id_
database:srem(hash, result.sender_user_id_)
bot.changeChatMemberStatus(msg.chat_id_, result.sender_user_id_, "Left")
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unban_by_reply)
end
bot.channel_get_kicked(msg.chat_id_,moody)
end

if text:match("^الغاء حظر @(.*)$") and is_mod(msg) then
local apba = {string.match(text, "^(الغاء حظر) @(.*)$")}
function moody(extra, result, success)
function unban_by_username(extra, result, success)
if result.id_ then
database:srem('MARKSTG:'..bot_id..'banned:'..msg.chat_id_, result.id_)
bot.changeChatMemberStatus(msg.chat_id_, result.id_, "Left")
else
end
send(msg.chat_id_, msg.id_, 1, txxt, 1, 'html')
end
resolve_username(apba[2],unban_by_username)
end
bot.channel_get_kicked(msg.chat_id_,moody)
end

if text:match("^الغاء حظر (%d+)$") and is_mod(msg) then
local apba = {string.match(text, "^(الغاء حظر) (%d+)$")}
function moody(extra, result, success)
database:srem('MARKSTG:'..bot_id..'banned:'..msg.chat_id_, apba[2])
bot.changeChatMemberStatus(msg.chat_id_, apba[2], "Left")
end
bot.channel_get_kicked(msg.chat_id_,moody)
end

if text:match("^مسح الكل$") and is_owner(msg) and msg.reply_to_message_id_ then
function delall_by_reply(extra, result, success)
if ck_mod(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع مسح مسجات \n🔘┇(مدراء عامين،مدراء،اعضاء مميزين)البوت', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑️¦العضو ⌁≻ *('..result.sender_user_id_..')* \n🗑┇تم حذف كل مسجاته\n', 1, 'md')
del_all_msgs(result.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,delall_by_reply)
end

if text:match("^مسح الكل (%d+)$") and is_owner(msg) then
local ass = {string.match(text, "^(مسح الكل) (%d+)$")}
if ck_mod(ass[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع مسح مسجات \n🔘┇(مدراء عامين،مدراء،مميزين)البوت', 1, 'md')
else
del_all_msgs(msg.chat_id_, ass[2])
send(msg.chat_id_, msg.id_, 1, '☑️¦العضو ⌁≻ *('..ass[2]..')* \n🗑┇تم مسح كل مسجاته\n', 1, 'md')
end
end

if text:match("^مسح الكل @(.*)$") and is_owner(msg) then
local apbll = {string.match(text, "^(مسح الكل) @(.*)$")}
function delall_by_username(extra, result, success)
if result.id_ then
if ck_mod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع مسح مسجات \n🔘┇(مدراء عامين،مدراء،اعضاء مميزين)البوت', 1, 'md')
return false
end
del_all_msgs(msg.chat_id_, result.id_)
texts = '☑️¦العضو ⌁≻ ('..result.id_..') \n🗑┇تم مسح كل مسجاته'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'html')
end
resolve_username(apbll[2],delall_by_username)
end
-----------------------------------------banall--------------------------------------------------
if text:match("^حظر عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function gban_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'gbanned:'
if is_admin(result) then
send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع حظر عام \n🔘┇(مدراء عامين،مدراء،اعضاء مميزين)البوت', 1, 'md')
else
database:sadd(hash, result.sender_user_id_)
chat_kick(result.chat_id_, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم حظره عام")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,gban_by_reply)
end

if text:match("^حظر عام @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(حظر عام) @(.*)$")}
function gban_by_username(extra, result, success)
if result.id_ then
if ck_admin(result.id_) then
send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع حظر عام \n🔘┇(مدراء عامين،مدراء،مميزين)البوت', 1, 'md')
else
local hash =  'MARKSTG:'..bot_id..'gbanned:'
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apbll[2] or 'MARKS_TEAM')..')\n🚫┇تم حظره من المجموعات البوت'
database:sadd(hash, result.id_)
end
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apbll[2],gban_by_username)
end

if text:match("^حظر عام (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(حظر عام) (%d+)$")}
local hash =  'MARKSTG:'..bot_id..'gbanned:'
if ck_admin(apbll[2]) then
send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع حظر عام \n🔘┇(مدراء عامين،مدراء،مميزين)البوت', 1, 'md')
else
database:sadd(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم حظره عام")
end
end
if text:match("^الغاء حظر عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function ungban_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'gbanned:'
tsX000("prore",msg,"🚫┇تم الغاء حظره عام")
database:srem(hash, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ungban_by_reply)
end

if text:match("^الغاء حظر عام @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apid = {string.match(text, "^(الغاء حظر عام) @(.*)$")}
function ungban_by_username(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'gbanned:'
if result.id_ then
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apid[2] or 'MARKS_TEAM')..')\n🚫┇تم الغاء حظره من المجموعات البوت'
database:srem(hash, result.id_)
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apid[2],ungban_by_username)
end

if text:match("^الغاء حظر عام (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(الغاء حظر عام) (%d+)$")}
local hash =  'MARKSTG:'..bot_id..'gbanned:'
database:srem(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم الغاء حظره عام")
end

if text:match("^كتم عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function gmute_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'gmuted:'
if is_admin(result) then
send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع كتم عام \n🔘┇(مدراء عامين،مدراء،مميزين)البوت', 1, 'md')
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم كتمه عام")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,gmute_by_reply)
end

if text:match("^كتم عام @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(كتم عام) @(.*)$")}
function gmute_by_username(extra, result, success)
if result.id_ then
if ck_admin(result.id_) then
send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع كتم عام \n🔘┇(مدراء عامين،مدراء،مميزين)البوت', 1, 'md')
else
local hash =  'MARKSTG:'..bot_id..'gmuted:'
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apbll[2] or 'MARKS_TEAM')..')\n🚫┇تم كتمه من المجموعات البوت'
database:sadd(hash, result.id_)
end
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apbll[2],gmute_by_username)
end

if text:match("^كتم عام (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(كتم عام) (%d+)$")}
local hash =  'MARKSTG:'..bot_id..'gmuted:'
if ck_admin(apbll[2]) then
send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع كتم عام \n🔘┇(مدراء عامين،مدراء،مميزين)البوت', 1, 'md')
else
database:sadd(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم كتمه عام")
end
end
if text:match("^الغاء كتم عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function ungmute_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'gmuted:'
tsX000("prore",msg,"🚫┇تم الغاء كتمه عام")
database:srem(hash, result.sender_user_id_)
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,ungmute_by_reply)
end

if text:match("^الغاء كتم عام @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apid = {string.match(text, "^(الغاء كتم العام) @(.*)$")}
function ungmute_by_username(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'gmuted:'
if result.id_ then
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apid[2] or 'MARKS_TEAM')..')\n🚫┇تم الغاء كتمه من المجموعات البوت'
database:srem(hash, result.id_)
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apid[2],ungmute_by_username)
end

if text:match("^الغاء كتم عام (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apbll = {string.match(text, "^(الغاء كتم العام) (%d+)$")}
local hash =  'MARKSTG:'..bot_id..'gmuted:'
database:srem(hash, apbll[2])
tsX000(apbll[2],msg,"🚫┇تم الغاء كتمه عام")
end

if text:match("^كتم$") and is_mod(msg) and msg.reply_to_message_id_ ~= 0 then
function mute_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'muted:'..msg.chat_id_
if ck_mod(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '❕┇لا تستطيع كتم \n🔘┇(مدراء عامين،مدراء،مميزين)البوت', 1, 'md')
else
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🚫┇بالفعل تم كتمه")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم كتمه من البوت")
end
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,mute_by_reply)
end
if text:match("^كتم @(.*)$") and is_mod(msg) then
local apsi = {string.match(text, "^(كتم) @(.*)$")}
function mute_by_username(extra, result, success)
if result.id_ then
if ck_mod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع كتم \n🔘┇(مدراء عامين،مدراء،مميزين)البوت', 1, 'md')
else
database:sadd('MARKSTG:'..bot_id..'muted:'..msg.chat_id_, result.id_)
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apsi[2] or 'MARKS_TEAM')..')\n🚫┇تم كتمه من البوت'
end
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apsi[2],mute_by_username)
end
if text:match("^كتم (%d+)$") and is_mod(msg) then
local apsi = {string.match(text, "^(كتم) (%d+)$")}
if ck_mod(apsi[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع كتم \n🔘┇(مدراء عامين،مدراء،اعضاء مميزين)البوت', 1, 'md')
else
database:sadd('MARKSTG:'..bot_id..'muted:'..msg.chat_id_, apsi[2])
tsX000(apsi[2],msg,"🚫┇تم كتمه من البوت")
end
end
if text:match("^الغاء كتم$") and is_mod(msg) and msg.reply_to_message_id_ then
function unmute_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'muted:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"🚫┇بالفعل تم الغاء كتمه من البوت")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"🚫┇تم الغاء كتمه من البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,unmute_by_reply)
end
if text:match("^الغاء كتم @(.*)$") and is_mod(msg) then
local apsi = {string.match(text, "^(الغاء كتم) @(.*)$")}
function unmute_by_username(extra, result, success)
if result.id_ then
database:srem('MARKSTG:'..bot_id..'muted:'..msg.chat_id_, result.id_)
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apsi[2] or 'MARKS_TEAM')..')\n🚫┇تم الغاء كتمه من البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apsi[2],unmute_by_username)
end

if text:match("^الغاء كتم (%d+)$") and is_mod(msg) then
local apsi = {string.match(text, "^(الغاء كتم) (%d+)$")}
database:srem('MARKSTG:'..bot_id..'muted:'..msg.chat_id_, apsi[2])
tsX000(apsi[2],msg,"🚫┇تم الغاء كتمه من البوت")
end

if text:match("^طرد$") and msg.reply_to_message_id_ ~=0 and is_mod(msg) then
if not is_creator(msg) and database:get("MARKSTG:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع طرد', 1, 'md')
return "MARKSTG"
end
function kick_reply(extra, result, success)
if ck_mod(result.sender_user_id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع طرد \n🔘┇(مدراء عامين،مدراء،مميزين)البوت', 1, 'md')
else
tsX000("prore",msg,"🚫┇تم طرده من المجموعه")
chat_kick(result.chat_id_, result.sender_user_id_)
end
end
getMessage(msg.chat_id_,msg.reply_to_message_id_,kick_reply)
end  
if text:match("^طرد @(.*)$") and is_mod(msg) then
if not is_creator(msg) and database:get("MARKSTG:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع طرد', 1, 'md')
return "MARKSTG"
end
local apki = {string.match(text, "^(طرد) @(.*)$")}
function kick_by_username(extra, result, success)
if result.id_ then
if ck_mod(result.id_, msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع طرد \n🔘┇(مدراء عامين،مدراء،مميزين)البوت', 1, 'md')
else
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apki[2] or 'MARKS_TEAM')..')\n🚫┇تم طرده من المجموعه'
chat_kick(msg.chat_id_, result.id_)
end
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apki[2],kick_by_username)
end  
if text:match("^طرد (%d+)$") and is_mod(msg) then
if not is_creator(msg) and database:get("MARKSTG:lock:ban_and_kick"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع طرد', 1, 'md')
return "MARKSTG"
end
local apki = {string.match(text, "^(طرد) (%d+)$")}
if ck_mod(apki[2], msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✖┇لا تستطيع طرد \n🔘┇(مدراء عامين،مدراء،مميزين)البوت', 1, 'md')
else
chat_kick(msg.chat_id_, apki[2])
tsX000(apki[2],msg,"🚫┇تم طرده من المجموعه")
end
end
if text:match("^رفع مدير عام$") and is_creator(msg) and msg.reply_to_message_id_ then
function setowner_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'owners:'..msg.chat_id_
if database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑┇بالفعل تم رفع مدير عام في البوت")
else
database:sadd(hash, result.sender_user_id_)
tsX000("prore",msg,"☑┇تم رفع مدير عام في البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,setowner_by_reply)
end  
if text:match("^رفع مدير عام @(.*)$") and is_creator(msg) then
local apow = {string.match(text, "^(رفع مدير عام) @(.*)$")}
function setowner_by_username(extra, result, success)
if result.id_ then
database:sadd('MARKSTG:'..bot_id..'owners:'..msg.chat_id_, result.id_)
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apow[2] or 'MARKS_TEAM')..')\n☑┇تم رفع مدير عام في البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],setowner_by_username)
end 
if text:match("^رفع مدير عام (%d+)$") and is_creator(msg) then
local apow = {string.match(text, "^(رفع مدير عام) (%d+)$")}
database:sadd('MARKSTG:'..bot_id..'owners:'..msg.chat_id_, apow[2])
tsX000(apow[2],msg,"☑┇تم رفع مدير عام في البوت")
end  
if text:match("^تنزيل مدير عام$") and is_creator(msg) and msg.reply_to_message_id_ then
function deowner_by_reply(extra, result, success)
local hash =  'MARKSTG:'..bot_id..'owners:'..msg.chat_id_
if not database:sismember(hash, result.sender_user_id_) then
tsX000("prore",msg,"☑┇بالفعل تم تنزيله من مدراء عامين البوت")
else
database:srem(hash, result.sender_user_id_)
tsX000("prore",msg,"☑┇تم تنزيله من مدراء عامين البوت")
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,deowner_by_reply)
end  
if text:match("^تنزيل مدير عام @(.*)$") and is_creator(msg) then
local apow = {string.match(text, "^(تنزيل مدير عام) @(.*)$")}
local hash =  'MARKSTG:'..bot_id..'owners:'..msg.chat_id_
function remowner_by_username(extra, result, success)
if result.id_ then
database:srem(hash, result.id_)
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apow[2] or 'MARKS_TEAM')..')\n☑┇تم تنزيله من مدراء عامين البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apow[2],remowner_by_username)
end  
if text:match("^تنزيل مدير عام (%d+)$") and is_creator(msg) then
local hash =  'MARKSTG:'..bot_id..'owners:'..msg.chat_id_
local apow = {string.match(text, "^(تنزيل مدير عام) (%d+)$")}
database:srem(hash, apow[2])
tsX000(apow[2],msg,"☑┇تم تنزيله من مدراء عامين البوت")
end
if text:match("^المدراء$") and is_owner(msg) then
local hash =   'MARKSTG:'..bot_id..'mods:'..msg.chat_id_
local list = database:smembers(hash)
text = "👥┇قائمة المدراء ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('MARKSTG:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⌁≻(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⌁≻(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖┇لايوجد مدراء"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
-----------------------------------------------
if (text and text == "ابلاغ" and msg.reply_to_message_id_ ~= 0 and (not database:get("MARKSTG:mute:deleta:msg:"..bot_id..msg.chat_id_))) then 
b = database:get("MARKSTG:user:deleteL:msg:"..msg.chat_id_..bot_id..msg.sender_user_id_)
if b and b == os.date("%x") then 
send(msg.chat_id_, msg.id_, 1, "☑️¦ لا يمكنك الابلاغ اكثر من مره في اليوم", 1, 'html')
else
database:set("MARKSTG:user:deleteL:msg:"..msg.chat_id_..bot_id..msg.sender_user_id_,os.date("%x"))
y = database:get("MARKSTG:fel:o:me:"..bot_id..msg.chat_id_) or 10
x = database:get("MARKSTG:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_) or 0
send(msg.chat_id_, msg.reply_to_message_id_, 1, "⚠┇تم الابلاغ على الرساله\n⚠┇تبقى {"..(y-(x+1)).."} حتى يتم حذف الرساله", 1, 'html')
database:incr("MARKSTG:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_)
if (database:get("MARKSTG:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_)) then 
x = database:get("MARKSTG:fel:msg:me:"..bot_id..msg.chat_id_..msg.reply_to_message_id_)
y = database:get("MARKSTG:fel:o:me:"..bot_id..msg.chat_id_) or 10
if tonumber(x) >= tonumber(y) then 
send(msg.chat_id_, 0, 1, "⚠┇تم مسج الرساله بنجاح", 1, 'html')
delete_msg(msg.chat_id_, {[0] = msg.reply_to_message_id_})
end
end
end 
end
if (text and text == "تعطيل الابلاغ" and is_creator(msg)) then 
database:set("MARKSTG:mute:deleta:msg:"..bot_id..msg.chat_id_,"MARKSTGE")
send(msg.chat_id_, msg.id_, 1, "🔑┇تم تعطيل خاصيه الابلاغ", 1, 'html')
end
if (text and text == "تفعيل الابلاغ" and is_creator(msg)) then 
database:del("MARKSTG:mute:deleta:msg:"..bot_id..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, "🔑┇تم تفعيل خاصيه الابلاغ", 1, 'html')
end
if text and text:match("(تعين عدد الابلاغ) (%d+)") and is_creator(msg) then 
local a = {string.match(text, "^(تعين عدد الابلاغ) (%d+)$")}
database:set("MARKSTG:fel:o:me:"..bot_id..msg.chat_id_,a[2])
send(msg.chat_id_, msg.id_, 1, "☑️¦تم تعين عدد الابلاغ {"..a[2].."}", 1, 'html')
end
if text:match("^المميزين") and is_owner(msg) then
local hash =   'MARKSTG:'..bot_id..'vipgp:'..msg.chat_id_
local list = database:smembers(hash)
text = "👥┇قائمة المميزين ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('MARKSTG:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⌁≻(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⌁≻(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖┇لايوجد مميزين"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^قائمه المنع$") and is_mod(msg) then
local hash =  'MARKSTG:'..bot_id..'filters:'..msg.chat_id_
if hash then
local names = database:hkeys(hash)
text = "⚠┇قائمة الكلمات الممنوعه ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for i=1, #names do
text = text.."<b>|"..i.."|</b>⌁≻("..names[i]..")\n"
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #names == 0 then
text = "✖┇لايوجد كلمات ممنوعه"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
end
if text and text == "معلومات" and is_mod(msg) then 
function dl_cb22( t1,t2 )
local MARKSTG_098 = 0
if database:get("MARKSTG:get:mod:"..bot_id..msg.chat_id_) then 
t = database:get("MARKSTG:get:mod:"..bot_id..msg.chat_id_)
MARKSTG_098 = tonumber(t2.member_count_) - tonumber(t)
end
send(msg.chat_id_, msg.id_, 1, "📟┇معلومات المجموعه\n☑️¦عدد مدراء الكروب : "..t2.administrator_count_.."\n👥┇عدد الاعضاء : "..t2.member_count_.." | ("..MARKSTG_098..")\n🔥┇عدد المطرودين : "..t2.kicked_count_, 1, 'md')
database:set("MARKSTG:get:mod:"..bot_id..msg.chat_id_,t2.member_count_)   
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb22, nil)
end
if text:match("^المكتومين$") and is_mod(msg) then
local hash =   'MARKSTG:'..bot_id..'muted:'..msg.chat_id_
local list = database:smembers(hash)
text = "🚫┇قائمة المكتومين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('MARKSTG:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⌁≻(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⌁≻(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖┇لايوجد مكتومين"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^المدراء العامين$") and is_creator(msg) then
local hash =   'MARKSTG:'..bot_id..'owners:'..msg.chat_id_
local list = database:smembers(hash)
text = "🛄┇قائمة المدراء العامين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('MARKSTG:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⌁≻(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⌁≻(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖┇لايوجد مدراء عامين"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^المحظورين$") and is_mod(msg) then
local hash =   'MARKSTG:'..bot_id..'banned:'..msg.chat_id_
local list = database:smembers(hash)
text = "⛔┇قائمة المحظورين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('MARKSTG:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⌁≻(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⌁≻(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖┇لايوجد محظورين"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if  msg.content_.text_:match("^قائمه العام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local hash =   'MARKSTG:'..bot_id..'gbanned:'
local list = database:smembers(hash)
text = "⛔┇قائمة الحظر العام  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('MARKSTG:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⌁≻(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⌁≻(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖┇لايوجد محظورين عام"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if  msg.content_.text_:match("^المكتومين عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local hash =   'MARKSTG:'..bot_id..'gmuted:'
local list = database:smembers(hash)
text = "⛔┇قائمة الكتم العام  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('MARKSTG:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⌁≻(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⌁≻(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖┇لايوجد مكتومين عام"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end  
if text:match("^ايدي$") and msg.reply_to_message_id_ ~= 0 then
function id_by_reply(extra, result, success)
if not database:get('MARKSTG:'..bot_id..'id:mute'..msg.chat_id_) then 
local msgs = database:get('MARKSTG:'..bot_id..'user:msgs'..msg.chat_id_..':'..result.sender_user_id_) or 0
local edit = database:get('MARKSTG:'..bot_id..'user:editmsg'..msg.chat_id_..':'..result.sender_user_id_) or 0
local msg2 = msg
msg2.sender_user_id_ = result.sender_user_id_
if is_sudo(msg2) then
MARKSTG_oop = 'مطور السورس'
elseif is_creator(msg) then
MARKSTG_oop = 'مطور درجه ثانيه'
elseif (database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_) and database:get("MARKSTG:all_if:"..database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_) ..bot_id..msg.chat_id_)) then 
MARKSTG_oop = database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_)
elseif is_owner(msg2) then
MARKSTG_oop = 'مدير عام الكروب'
elseif ck_mod(result.sender_user_id_,msg.chat_id_) then
MARKSTG_oop = 'مدير للكروب'
elseif is_vip(msg2) then
MARKSTG_oop = 'مميز الكروب'
else
MARKSTG_oop = 'لا شيء'
end
send(msg.chat_id_, msg.id_, 1,"💳┤ايديك ~⪼  `{"..result.sender_user_id_.."}`\n👨‍✈️┤رتبتك ~⪼ ➣ {"..MARKSTG_oop.."}\n📨┤رسائلك ~⪼ `{"..msgs.."}`\n📧┤السحكات ~⪼`{"..edit.."}`", 1, 'md')
else
send(msg.chat_id_, msg.id_, 1,"`"..result.sender_user_id_.."`", 1, 'md')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,id_by_reply)
end  
if text:match("^id @(.*)$") then
local ap = {string.match(text, "^(id) @(.*)$")}
function id_by_username(extra, result, success)
if result.id_ then
if not database:get('MARKSTG:'..bot_id..'id:mute'..msg.chat_id_) then 
local msgs = database:get('MARKSTG:'..bot_id..'user:msgs'..msg.chat_id_..':'..result.id_) or 0
local edit = database:get('MARKSTG:'..bot_id..'user:editmsg'..msg.chat_id_..':'..result.id_) or 0
local msg2 = msg
msg2.sender_user_id_ = result.id_
if is_sudo(msg2) then
MARKSTG_oop = 'مطور السورس'
elseif is_creator(msg) then
MARKSTG_oop = 'مطور درجه ثانيه'
elseif (database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..result.id_) and database:get("MARKSTG:all_if:"..database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..result.id_) ..bot_id..msg.chat_id_)) then 
MARKSTG_oop = database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..result.id_)
elseif is_owner(msg2) then
MARKSTG_oop = 'مدير عام الكروب'
elseif ck_mod(result.id_,msg.chat_id_) then
MARKSTG_oop = 'مدير للكروب'
elseif is_vip(msg2) then
MARKSTG_oop = ' مميز الكروب'
else
MARKSTG_oop = 'لا شيء'
end
texts = "💳┤ايديك ~⪼  `{"..result.id_.."}`\n👨‍✈️┤رتبتك ~⪼ ➣ {"..MARKSTG_oop.."}\n📨┤رسائلك ~⪼ `{"..msgs.."}`\n📧┤السحكات ~⪼`{"..edit.."}`"
else
texts = "`"..result.id_.."`"
end
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(ap[2],id_by_username)
end  
if text:match("^احضر صوره (%d+)$") and msg.reply_to_message_id_ == 0 and not database:get('MARKSTG:'..bot_id..'get:photo'..msg.chat_id_) then
local pronumb = {string.match(text, "^(احضر صوره) (%d+)$")}
local ph = pronumb[2] - 1
local function gpro(extra, result, success)
if result.photos_[ph] then
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[ph].sizes_[1].photo_.persistent_id_)
else
send(msg.chat_id_, msg.id_, 1, "❕┇لا تملك صوره رقم <b>{"..pronumb[2].."}</b> في بروفايلك", 1, 'html')
end
end
tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = msg.sender_user_id_,
offset_ = 0,
limit_ = pronumb[2]
}, gpro, nil)
end
if text:match("^وضع تكرار (%d+)$") and is_owner(msg) then
local floodMARKSTG = {string.match(text, "^(وضع تكرار) (%d+)$")}
if tonumber(floodMARKSTG[2]) < 2 then
send(msg.chat_id_, msg.id_, 1, '🔘┇ضع التكرار من *{2}* الى  *{99999}*', 1, 'md')
else
database:set('MARKSTG:'..bot_id..'flood:MARKSTG:'..msg.chat_id_,floodMARKSTG[2])
send(msg.chat_id_, msg.id_, 1, '☑┇تم  وضع التكرار بالطرد للعدد ⌁≻  *{'..floodMARKSTG[2]..'}*', 1, 'md')
end
end
if (text and text == "تعطيل الاعلانات" and is_creator(msg)) then 
if not is_sudo(msg) then 
database:set("MARKSTG:gr:not:ads:"..bot_id..msg.chat_id_..os.date("%x"),"ok")
send(msg.chat_id_, msg.id_, 1, '🖲┇ تم تعطيل ضهور الاعلانات لمده يوم \n📊┇ [يمكنك يوزره المزيد حول الاعلانات هنا](https://t.me/LE_C4_KR)', 1, "md") 
else
send(msg.chat_id_, msg.id_, 1, '💥┇ عزيزي المطور لايمكنك تعطيل هاذه الامر \n📊┇ [يمكنك يوزره المزيد حول الاعلانات هنا](https://t.me/LE_C4_KR)', 1, "md") 
end
end
if (text and text == "تفعيل الاعلانات" and is_creator(msg)) then 
database:del("MARKSTG:gr:not:ads:"..bot_id..msg.chat_id_..os.date("%x"))
send(msg.chat_id_, msg.id_, 1, '🖲┇تم تفعيل ضهور الاعلانات \n📊┇ [يمكنك يوزره المزيد حول الاعلانات هنا](https://t.me/LE_C4_KR)', 1, "md") 
end  
if text:match("^وضع زمن التكرار (%d+)$") and is_owner(msg) then
local floodt = {string.match(text, "^(وضع زمن التكرار) (%d+)$")}
if tonumber(floodt[2]) < 1 then
send(msg.chat_id_, msg.id_, 1, '🔘┇ضع العدد من *{1}* الى  *{99999}*', 1, 'md')
else
database:set('MARKSTG:'..bot_id..'flood:time:'..msg.chat_id_,floodt[2])
send(msg.chat_id_, msg.id_, 1, '☑┇تم  وضع الزمن التكرار للعدد ⌁≻  *{'..floodt[2]..'}*', 1, 'md')
end
end
if text:match("^الرابط$") then
if not database:get("MARKSTG:mute:link:gr:"..bot_id..msg.chat_id_) then 
function dl_cb222( t1,t2 )
if t2.invite_link_ ~= false then 
send(msg.chat_id_, msg.id_, 1, '📩┇رابط المجموعه...\n'..(t2.invite_link_ or "Erorr"), 1, "html")
elseif (database:get('MARKSTG:'..bot_id.."group:link"..msg.chat_id_)) then 
send(msg.chat_id_, msg.id_, 1, '📩┇رابط المجموعه...\n'..database:get('MARKSTG:'..bot_id.."group:link"..msg.chat_id_), 1, "html")
else
send(msg.chat_id_, msg.id_, 1, '⚠️┇لا يوجد رابط اكتب {وضع رابط+الرابط} لوضع رابط جديد للمجموعه', 1, "html")
end
end
tdcli_function ({
ID = "GetChannelFull",
channel_id_ = getChatId(msg.chat_id_).ID
}, dl_cb222, nil)
else 
send(msg.chat_id_, msg.id_, 1, '🖲┇الرابط معطل', 1, "html") 
end
end
-----------------------------------------------------------
if text:match("^تفعيل الترحيب$") and is_mod(msg) then
send(msg.chat_id_, msg.id_, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل الترحيب في المجموعه', 1, 'md')
database:set('MARKSTG:'..bot_id.."welcome"..msg.chat_id_,true)
end
if text:match("^تعطيل الترحيب$") and is_mod(msg) then
send(msg.chat_id_, msg.id_, 1, '✔️┤ مرحبا عزيزي تم ~⊱ تعطيل الترحيب في المجموعه', 1, 'md')
database:del('MARKSTG:'..bot_id.."welcome"..msg.chat_id_)
end
if text:match("^وضع ترحيب (.*)$") and is_mod(msg) then
local welcome = {string.match(text, "^(وضع ترحيب) (.*)$")}
send(msg.chat_id_, msg.id_, 1, '☑┇تم وضع ترحيب\n📜┇⌁≻('..welcome[2]..')', 1, 'md')
database:set('MARKSTG:'..bot_id..'welcome:'..msg.chat_id_,welcome[2])
end
if text:match("^مسح الترحيب$") and is_mod(msg) then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف الترحيب', 1, 'md')
database:del('MARKSTG:'..bot_id..'welcome:'..msg.chat_id_)
end
if text:match("^جلب الترحيب$") and is_mod(msg) then
local wel = database:get('MARKSTG:'..bot_id..'welcome:'..msg.chat_id_)
if wel then
send(msg.chat_id_, msg.id_, 1, '📜┇الترحيب\n⌁≻('..wel..')', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✖┇لم يتم وضع ترحيب للمجموعه\n', 1, 'md')
end
end  
if text:match("^منع (.*)$") and is_mod(msg) then
local filters = {string.match(text, "^(منع) (.*)$")}
local name = string.sub(filters[2], 1, 50)
database:hset('MARKSTG:'..bot_id..'filters:'..msg.chat_id_, name, 'filtered')
send(msg.chat_id_, msg.id_, 1, "☑┇تم اضافتها لقائمه المنع\n🔘┇{"..name.."}", 1, 'md')
end  
if text:match("^الغاء منع (.*)$") and is_mod(msg) then
local rws = {string.match(text, "^(الغاء منع) (.*)$")}
local name = string.sub(rws[2], 1, 50)
database:hdel('MARKSTG:'..bot_id..'filters:'..msg.chat_id_, rws[2])
send(msg.chat_id_, msg.id_, 1, "☑┇تم حذفها من لقائمه المنع\n🔘┇{"..rws[2].."}", 1, 'md')
end  
if (text and text == "تنظيف قائمه المحظورين" and is_creator(msg)) then 
local function getChannelMembers(channel_id, filter, offset, limit, cb)
if not limit or limit > 200 then
limit = 200
end
tdcli_function ({
ID = "GetChannelMembers",
channel_id_ = getChatId(channel_id).ID,
filter_ = {
ID = "ChannelMembers" .. filter
},
offset_ = offset or 0,
limit_ = limit
}, cb or dl_cb, nil)
end
function markxididi(t1,t2)
if t2.members_ then 
for i=1,#t2.members_ do 
bot.changeChatMemberStatus(msg.chat_id_, t2.members_[i].user_id_, "Left")
end
send(msg.chat_id_, msg.id_, 1, '☑┇تم الغاء حظر {'..t2.total_count_..'} عضو', 1, 'md')
end
end
getChannelMembers(msg.chat_id_,"Kicked",0,10000,markxididi)
end
if (text:match("^كشف البوتات$") or text:match("^البوتات$")) and is_mod(msg) then
local txt = {string.match(text, "^كشف البوتات$")}
local function cb(extra,result,success)
local list = result.members_
text = '📊┇البوتات\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
local n = 0
for k,v in pairs(list) do
if v.user_id_ ~= bot_id then
n = (n + 1)
local user_info = database:hgetall('MARKSTG:'..bot_id..'user:'..v.user_id_)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..n.."|</b>⌁≻(@"..username..")\n"
else
text = text.."<b>|"..n.."|</b>⌁≻(<code>"..v.user_id_.."</code>)\n"
end
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list ~= 0 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
else
send(msg.chat_id_, msg.id_, 1, "📊┇لا توجد بوتات في المجموعه", 1, 'html')
end
end
bot.channel_get_bots(msg.chat_id_,cb)
end
if text:match("^رسائلي$") and msg.reply_to_message_id_ == 0  then
local user_msgs = database:get('MARKSTG:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
if not database:get('MARKSTG:'..bot_id..'id:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, "📨┇عدد رسائلك ⌁≻ *{"..user_msgs.."}*", 1, 'md')
else
end
end
if text:match("^جهاتي$") then
add = (tonumber(database:get('MARKSTG:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
send(msg.chat_id_, msg.id_, 1, "📨┇عدد جهاتك ⌁≻ *{"..add.."}*\n📨┇سيتم حذف العدد بعد هذه الرساله", 1, 'md')
database:del('MARKSTG:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if text:match("^مسح سحكاتي$") then
edit = (tonumber(database:get('MARKSTG:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_)) or 0)
send(msg.chat_id_, msg.id_, 1, "📨┇عدد سحكاتك ~⪼ *{"..edit.."}*\n📨┇سيتم حذف العدد بعد هذه الرساله", 1, 'md')
database:del('MARKSTG:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_)
end
if text:match("^(سحكاتي)$") or text:match("^(سحكاتي)$") then
local edit = database:get('MARKSTG:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
send(msg.chat_id_, msg.id_, 1, "📨┇عدد سحكاتك ~⪼ *{"..edit.."}*", 1, 'md')
end
if text:match("^مسح المحظورين عام$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
text = '🗑┤ مرحبا عزيزي تم ~⊱ مسح محظورين عام'
database:del('MARKSTG:'..bot_id..'gbanned:')
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
if text:match("^مسح المكتومين عام") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
text = '🗑┤ مرحبا عزيزي تم ~⊱ مسح المكتومين عام'
database:del('MARKSTG:'..bot_id..'gmuted:')
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
if (text:match("^(تعين عدد الاحرف) (%d+)$") and is_mod(msg)) then
MARKSTG_0 = {string.match(text, "^(تعين عدد الاحرف) (%d+)$")}
send(msg.chat_id_, msg.id_, 1, '☑┇ تم تعين عدد الاحرف {`'..MARKSTG_0[2]..'`}', 1, 'md')
database:set("MARKSTG:not:word:"..bot_id..msg.chat_id_,MARKSTG_0[2])
end
if text:match("^مسح (.*)$") and is_mod(msg) then
local txt = {string.match(text, "^(مسح) (.*)$")}
if txt[2] == 'banlist' or txt[2] == 'Banlist' or txt[2] == 'المحظورين' then
database:del('MARKSTG:'..bot_id..'banned:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑┤ مرحبا عزيزي تم ~⊱ مسح المحظورين  من البوت ', 1, 'md')
end
if txt[2] == 'creators' and is_sudo(msg) or txt[2] == 'creatorlist' and is_sudo(msg) or txt[2] == 'Creatorlist' and is_sudo(msg) or txt[2] == 'Creators' and is_sudo(msg) or txt[2] == 'المطور درجه ثانيه' and is_sudo(msg) then
database:del('MARKSTG:'..bot_id..'creator:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑┤ مرحبا عزيزي تم ~⊱ مسح قائمه المطور درجه ثانيه', 1, 'md')
end
if txt[2] == 'البوتات' then
local function cb(extra,result,success)
local bots = result.members_
for i=0 , #bots do
if tonumber(bots[i].user_id_) ~= tonumber(bot_id) then chat_kick(msg.chat_id_,bots[i].user_id_)
end
end
end
bot.channel_get_bots(msg.chat_id_,cb)
send(msg.chat_id_, msg.id_, 1, '☑┇تم طرد جميع البوتات', 1, 'md')
end
if txt[2] == 'المدراء' and is_owner(msg) then
database:del('MARKSTG:'..bot_id..'mods:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '☑┇تم تنزيل المدراء', 1, 'md')
end
if  txt[2] == 'المميزين' and is_owner(msg) then
database:del('MARKSTG:'..bot_id..'vipgp:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '☑┇تم تنزيل المميزين', 1, 'md')
end
if  txt[2] == 'المدراء العامين' and is_creator(msg) then
database:del('MARKSTG:'..bot_id..'owners:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '☑┇تم تنزيل المدراء العامين', 1, 'md')
end
if  txt[2] == 'مسح القوانين' then
database:del('MARKSTG:'..bot_id..'rules'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑┤ مرحبا عزيزي تم ~⊱ مسح القوانين المحفوظه', 1, 'md')
end
if txt[2] == 'مسح الرابط' then
database:del('MARKSTG:'..bot_id..'group:link'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑┤ مرحبا عزيزي تم ~⊱ مسح الرابط المحفوظ', 1, 'md')
end
if txt[2] == 'قائمه المنع' then
database:del('MARKSTG:'..bot_id..'filters:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑┤ مرحبا عزيزي تم ~⊱ مسح قائمه المنع', 1, 'md')
end
if  txt[2] == 'المكتومين' then
database:del('MARKSTG:'..bot_id..'muted:'..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑┤ مرحبا عزيزي تم ~⊱ مسح قائمه المكتومين', 1, 'md')
end
end
                
if (text and (text == "تعطيل الطرد" or text == "تعطيل الحظر") and is_creator(msg)) then
database:set("MARKSTG:lock:ban_and_kick"..bot_id..msg.chat_id_,"MARKSTG")
send(msg.chat_id_, msg.id_, 1, '✔️┤ مرحبا عزيزي تم ~⊱ تعطيل (طرد - حضر) الاعضاء', 1, 'md')
end
if (text and (text == "تفعيل الطرد" or text == "تفعيل الحظر") and is_creator(msg)) then
database:del("MARKSTG:lock:ban_and_kick"..bot_id..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل (طرد - حضر) الاعضاء', 1, 'md')
end
if text:match("^اضافه قائمه المحظورين$") and is_creator(msg) then
local txt = {string.match(text, "^(اضافه قائمه المحظورين)$")}
local function cb(extra,result,success)
local list = result.members_
for k,v in pairs(list) do
bot.addChatMember(msg.chat_id_, v.user_id_, 200, dl_cb, nil)
end
text = '☑┇تم اضافه قائمه المحظورين للمجموعه'
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
bot.channel_get_kicked(msg.chat_id_,cb)
end
if text:match("^طرد المحذوفين$") and is_creator(msg) then
local txt = {string.match(text, "^(طرد المحذوفين)$")}
local function getChatId(chat_id)
local chat = {}
local chat_id = tostring(chat_id)
if chat_id:match('^-100') then
local channel_id = chat_id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = chat_id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
local function check_delete(arg, data)
for k, v in pairs(data.members_) do
local function clean_cb(arg, data)
if not data.first_name_ then
bot.changeChatMemberStatus(msg.chat_id_, data.id_, "Kicked")
end
end
bot.getUser(v.user_id_, clean_cb)
end
text = '☑┇تم طرد الحسابات المحذوفه'
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, check_delete, nil)
end
if text:match("^طرد المتروكين$") and is_creator(msg) then
local txt = {string.match(text, "^(طرد المتروكين)$")}
local function getChatId(chat_id)
local chat = {}
local chat_id = tostring(chat_id)
if chat_id:match('^-100') then
local channel_id = chat_id:gsub('-100', '')
chat = {ID = channel_id, type = 'channel'}
else
local group_id = chat_id:gsub('-', '')
chat = {ID = group_id, type = 'group'}
end
return chat
end
local function check_deactive(arg, data)
for k, v in pairs(data.members_) do
local function clean_cb(arg, data)
if data.type_.ID == "UserTypeGeneral" then
if data.status_.ID == "UserStatusEmpty" then
bot.changeChatMemberStatus(msg.chat_id_, data.id_, "Kicked")
end
end
end
bot.getUser(v.user_id_, clean_cb)
end
text = '☑┇تم طرد الحسابات المتروكة من المجموعة'
send(msg.chat_id_, msg.id_, 1, text, 1, 'md')
end
tdcli_function ({ID = "GetChannelMembers",channel_id_ = getChatId(msg.chat_id_).ID,offset_ = 0,limit_ = 5000}, check_deactive, nil)
end
if text:match("^مدراء الكروب$") and is_owner(msg) then
local txt = {string.match(text, "^مدراء المجموعه$")}
local function cb(extra,result,success)
local list = result.members_
text = '📊┇مدراء الكروب\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n'
local n = 0
for k,v in pairs(list) do
n = (n + 1)
local user_info = database:hgetall('MARKSTG:'..bot_id..'user:'..v.user_id_)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..n.."|</b>⌁≻(@"..username..")\n"
else
text = text.."<b>|"..n.."|</b>⌁≻(<code>"..v.user_id_.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
bot.channel_get_admins(msg.chat_id_,cb)
end
if text:match("^رفع المدراء$") and is_owner(msg) then
local txt = {string.match(text, "^رفع المدراء$")}
local function cb(extra,result,success)
local list = result.members_
moody = '🔘┤ مرحبا عزيزي تم ~⊱ رفع مدراء المجموعه في البوت\n'
local n = 0
for k,v in pairs(list) do
n = (n + 1)
local hash =  'MARKSTG:'..bot_id..'mods:'..msg.chat_id_
database:sadd(hash, v.user_id_)
end
send(msg.chat_id_, msg.id_, 1, moody, 1, 'html')
end
bot.channel_get_admins(msg.chat_id_,cb)
end
if text:match("^الاعدادات$") and is_mod(msg) then
if database:get("lock_media:MARKSTG"..msg.chat_id_..bot_id) then
mute_all = 'تم التفعيل»'
else
mute_all = 'غير مفعل»'
end
------------
if database:get("lock_chat:MARKSTG"..msg.chat_id_..bot_id) then
mute_text = 'تم التفعيل»'
else
mute_text = 'غير مفعل»'
end
------------
if database:get("lock_photo:MARKSTG"..msg.chat_id_..bot_id) then
mute_photo = 'تم التفعيل»'
else
mute_photo = 'غير مفعل»'
end
------------
if database:get("lock_video:MARKSTG"..msg.chat_id_..bot_id) then
mute_video = 'تم التفعيل»'
else
mute_video = 'غير مفعل»'
end
if database:get("lock_note:MARKSTG"..msg.chat_id_..bot_id) then
mute_note = 'تم التفعيل»'
else
mute_note = 'غير مفعل»'
end
-----------
if database:get("lock_gif:MARKSTG"..msg.chat_id_..bot_id) then
mute_gifs = 'تم التفعيل»'
else
mute_gifs = 'غير مفعل»'
end
-----------
if not database:get('MARKSTG:'..bot_id..'flood:MARKSTG:'..msg.chat_id_) then
flood_m = 10
else
flood_m = database:get('MARKSTG:'..bot_id..'flood:MARKSTG:'..msg.chat_id_)
end
if not database:get( 'MARKSTG:'..bot_id..'flood:time:'..msg.chat_id_) then
flood_t = 10
else
flood_t = database:get( 'MARKSTG:'..bot_id..'flood:time:'..msg.chat_id_)
end
------------
if database:get("lock_audeo:MARKSTG"..msg.chat_id_..bot_id) then
mute_music = 'تم التفعيل»'
else
mute_music = 'غير مفعل»'
end
------------
if database:get("lock_bot:MARKSTG"..msg.chat_id_..bot_id) then
mute_bots = 'تم التفعيل»'
else
mute_bots = 'غير مفعل»'
end

if database:get("lock_botAndBan:MARKSTG"..msg.chat_id_..bot_id) then
mute_botsb = 'تم التفعيل»'
else
mute_botsb = 'غير مفعل»'
end
if database:get("lock_lllll:MARKSTG"..msg.chat_id_..bot_id) then
mute_flood = 'تم التفعيل»'
else
mute_flood = 'غير مفعل»'
end
------------
if database:get("lock_inline:MARKSTG"..msg.chat_id_..bot_id) then
mute_in = 'تم التفعيل»'
else
mute_in = 'غير مفعل»'
end
------------
if database:get("lock_voice:MARKSTG"..msg.chat_id_..bot_id) then
mute_voice = 'تم التفعيل»'
else
mute_voice = 'غير مفعل»'
end
------------
if database:get("lock_edit:MARKSTG"..msg.chat_id_..bot_id) then
mute_edit = 'تم التفعيل»'
else
mute_edit = 'غير مفعل»'
end
------------
if database:get("lock_link:MARKSTG"..msg.chat_id_..bot_id) then
mute_links = 'تم التفعيل»'
else
mute_links = 'غير مفعل»'
end
------------
if database:get("lock_pin:MARKSTG"..msg.chat_id_..bot_id) then
lock_pin = 'تم التفعيل»'
else
lock_pin = 'غير مفعل»'
end

if database:get("lock_files:MARKSTG"..msg.chat_id_..bot_id) then
mute_doc = 'تم التفعيل»'
else
mute_doc = 'غير مفعل»'
end

if database:get("lock_mark:MARKSTG"..msg.chat_id_..bot_id) then
mute_mdd = 'تم التفعيل»'
else
mute_mdd = 'غير مفعل»'
end
------------
if database:get("lock_stecker:MARKSTG"..msg.chat_id_..bot_id) then
lock_sticker = 'تم التفعيل»'
else
lock_sticker = 'غير مفعل»'
end
------------
if database:get("lock_new:MARKSTG"..msg.chat_id_..bot_id) then
lock_tgservice = 'تم التفعيل»'
else
lock_tgservice = 'غير مفعل»'
end
------------
if database:get("lock_tag:MARKSTG"..msg.chat_id_..bot_id) then
lock_htag = 'تم التفعيل»'
else
lock_htag = 'غير مفعل»'
end

if database:get("lock_sarha:MARKSTG"..msg.chat_id_..bot_id) then
lock_cmd = 'تم التفعيل»'
else
lock_cmd = 'غير مفعل»'
end
------------
if database:get("lock_username:MARKSTG"..msg.chat_id_..bot_id) then
lock_tag = 'تم التفعيل»'
else
lock_tag = 'غير مفعل»'
end
------------
if database:get("lock_contact:MARKSTG"..msg.chat_id_..bot_id) then
lock_contact = 'تم التفعيل»'
else
lock_contact = 'غير مفعل»'
end
------------
if database:get("lock_en:MARKSTG"..msg.chat_id_..bot_id) then
lock_english = 'تم التفعيل»'
else
lock_english = 'غير مفعل»'
end
------------
if database:get("lock_ar:MARKSTG"..msg.chat_id_..bot_id) then
lock_persian = 'تم التفعيل»'
else
lock_persian = 'غير مفعل»'
end
------------
if database:get("lock_fwd:MARKSTG"..msg.chat_id_..bot_id) then
lock_forward = 'تم التفعيل»'
else
lock_forward = 'غير مفعل»'
end

if database:get('MARKSTG:'..bot_id..'rep:mute'..msg.chat_id_) then
lock_rep = 'تم التفعيل»'
else
lock_rep = 'غير مفعل»'
end
------------
if database:get('MARKSTG:'..bot_id..'repsudo:mute'..msg.chat_id_) then
lock_repsudo = 'تم التفعيل»'
else
lock_repsudo = 'غير مفعل»'
end
------------
if database:get('MARKSTG:'..bot_id..'repowner:mute'..msg.chat_id_) then
lock_repowner = 'تم التفعيل»'
else
lock_repowner = 'غير مفعل»'
end
------------
if database:get('MARKSTG:'..bot_id..'id:mute'..msg.chat_id_) then
lock_id = 'تم التفعيل»'
else
lock_id = 'غير مفعل»'
end
------------
if database:get('MARKSTG:'..bot_id..'pin:mute'..msg.chat_id_) then
lock_pind = 'تم التفعيل»'
else
lock_pind = 'غير مفعل»'
end
------------
if database:get('MARKSTG:'..bot_id..'id:mute'..msg.chat_id_) then
lock_id_photo = 'تم التفعيل»'
else
lock_id_photo = 'غير مفعل»'
end
------------
if database:get( 'MARKSTG:'..bot_id.."welcome"..msg.chat_id_) then
send_welcome = 'تم التفعيل»'
else
send_welcome = 'غير مفعل»'
end
------------
local ex = database:ttl( 'MARKSTG:'..bot_id.."charge:"..msg.chat_id_)
if ex == -1 then
exp_dat = 'لا نهائي'
else
exp_dat = math.floor(ex / 86400) + 1
end
------------
local TXT = "🚸┇اعدادات اوامر «قفل وفتح»\n╾———▾———╼\n✔┇⌁≻ مفعل\n✖┇⌁≻ معطل\n╾———▾———╼\n"
..mute_all.."الميديا".."\n"
..mute_links.." الروابط".."\n"
..mute_edit .." التعديل".."\n"
..mute_bots .." البوتات".."\n"
..mute_botsb.." البوتات بالطرد".."\n"
..lock_english.." اللغه الانكليزيه".."\n"
..lock_forward.." اعاده التوجيه".."\n"
..lock_pin.." التثبيت".."\n"
..lock_persian.." اللغه الفارسيه".."\n"
..lock_htag.." التاكات".."\n"
..lock_tag.." اليوزرات".."\n"
..lock_tgservice.." الاشعارات".."\n"
..mute_flood.." التكرار".."\n\n"
..mute_text.." الدردشه".."\n"
..mute_gifs.." الصور المتحركه".."\n"
..mute_voice.." الصوتيات".."\n"
..mute_music.." الاغاني".."\n"
..mute_in.." الانلاين".."\n"
..lock_sticker.." الملصقات".."\n\n"
..lock_contact.." جهات الاتصال".."\n"
..mute_video.." الفيديوهات".."\n"
..lock_cmd.." الشارحه".."\n"
..mute_mdd.." الماركدون".."\n"
..mute_doc.." الملفات".."\n"
..mute_photo.." الصور".."\n"
..mute_note.." بصمه الفيديو".."\n"
..lock_repsudo.." ردود المطور".."\n\n"
..lock_repowner.." ردود المدير عام".."\n"
..lock_id.."الايدي".."\n"
..lock_pind.."خاصية التثبيت".."\n"
..lock_id_photo.."الايدي بالصوره".."\n"
..send_welcome.." الترحيب".."\n"
.."╾———▾———╼\n"
..'🚸» عدد التكرار : '..flood_m..'\n'
..'🚦» زمن التكرار : '..flood_m..'\n'
..'🚸» انقضاء البوت: '..exp_dat..' من آلآيام \n╾———▴———╼'
send(msg.chat_id_, msg.id_, 1, TXT, 1, 'md')
end

if (text and text == 'تفعيل اطردني') and is_owner(msg) then
if not database:get('MARKSTG:'..bot_id..'kickme:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇امر اطردني بالفعل تم تفعيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل امر اطردني', 1, 'md')
database:del('MARKSTG:'..bot_id..'kickme:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل اطردني') and is_owner(msg) then
if database:get('MARKSTG:'..bot_id..'kickme:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇امر اطردني بالفعل تم تعطيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔️┤ مرحبا عزيزي تم ~⊱ تعطيل امر اطردني', 1, 'md')
database:set('MARKSTG:'..bot_id..'kickme:mute'..msg.chat_id_,true)
end
end

if text:match("^اطردني$") then
if not database:get('MARKSTG:'..bot_id..'kickme:mute'..msg.chat_id_) then
redis:set('MARKSTG:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
redis:set('MARKSTG:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
send(msg.chat_id_, msg.id_, 1, '🚷┇ ارسل ؛ نعم ، ليتم دفرك\n🔘┇ارسل ؛ لا ، لالغاء الامر', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '⚠┇تم تعطيل امر اطردني', 1, 'md')
end
end
local yess = redis:get('MARKSTG:'..bot_id..'kickyess'..msg.sender_user_id_..'')
if yess == 'kickyes' then
if text:match("^نعم$") then
if is_vip(msg) then
send(msg.chat_id_, msg.id_, 1, '❕┇لا استطيع دفر \n🔘┇(مدراء عامين،مدراء،مميزين)البوت', 1, 'md')
else
local yess = redis:get('MARKSTG:'..bot_id..'kickyess'..msg.sender_user_id_..'')
if yess == 'kickyes' then
chat_kick(msg.chat_id_, msg.sender_user_id_)
redis:del('MARKSTG:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
redis:del('MARKSTG:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
send(msg.chat_id_, msg.id_, 1, '✅┇تم دفرك من المجموعه', 1, 'md')
end
end
end
if text:match("^لا$") then
local noo = redis:get('MARKSTG:'..bot_id..'kicknoo'..msg.sender_user_id_..'')
if noo == 'kickno' then
redis:del('MARKSTG:'..bot_id..'kickyess'..msg.sender_user_id_..'', 'kickyes')
redis:del('MARKSTG:'..bot_id..'kicknoo'..msg.sender_user_id_..'', 'kickno')
send(msg.chat_id_, msg.id_, 1, '🔘┇تم الغاء الامر', 1, 'md')
end
end
end

if (text and text == 'تغير كليشه المطور') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('MARKSTG:'..bot_id..'texts'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local markx2 = redis:get('MARKSTG:'..bot_id..'texts'..msg.sender_user_id_..'')
if markx2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('MARKSTG:'..bot_id..'texts'..msg.sender_user_id_..'', 'no')
redis:set('MARKSTG:'..bot_id..'text_sudo', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false end
end
if text:match("^[Dd][Ee][Vv]$")or text:match("^مطور بوت$") or text:match("^مطورين$") or text:match("^مطور السورس$") or text:match("^مطور$") or text:match("^المطور$") and msg.reply_to_message_id_ == 0 then
local text_sudo = redis:get('MARKSTG:'..bot_id..'text_sudo')
local nmarkx = redis:get('MARKSTG:'..bot_id..'nmmarkx')
local namarkx = redis:get('MARKSTG:'..bot_id..'namarkx')
if text_sudo then
send(msg.chat_id_, msg.id_, 1, text_sudo, 1, 'md')
else
sendContact(msg.chat_id_, msg.id_, 0, 1, nil, (nmarkx or 9647810611817), (namarkx or "DEVIL TEAM"), "", bot_id)
end
end
for k,v in pairs(sudo_users) do
if text:match("^تغير رقم المطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '• `الان يمكنك ارسال رقم المطور` 🗳', 1, 'md')
redis:set('MARKSTG:'..bot_id..'nmarkx'..msg.sender_user_id_..'', 'msg')
return false end
end
if text:match("^+(.*)$") then
local markxo = redis:get('MARKSTG:'..bot_id..'sudoo'..text..'')
local markx2 = redis:get('MARKSTG:'..bot_id..'nmarkx'..msg.sender_user_id_..'')
if markx2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '• `الان يمكنك ارسال الاسم الذي تريده` 📝', 1, 'md')
redis:set('MARKSTG:'..bot_id..'nmmarkx', text)
redis:set('MARKSTG:'..bot_id..'nmarkx'..msg.sender_user_id_..'', 'mmsg')
return false end
end
if text:match("^(.*)$") then
local markx2 = redis:get('MARKSTG:'..bot_id..'nmarkx'..msg.sender_user_id_..'')
if markx2 == 'mmsg' then
send(msg.chat_id_, msg.id_, 1, '• `تم حفظ الاسم يمكنك اظهار الجه بـ ارسال امر المطور` ☑', 1, 'md')
redis:set('MARKSTG:'..bot_id..'nmarkx'..msg.sender_user_id_..'', 'no')
redis:set('MARKSTG:'..bot_id..'namarkx', text)
local nmmarkx = redis:get('MARKSTG:'..bot_id..'nmmarkx')
sendContact(msg.chat_id_, msg.id_, 0, 1, nil, nmmarkx, text , "", bot_id)
return false end
end

if text:match("^اضف مطور$")  and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function promote_by_reply(extra, result, success)
if redis:sismember('MARKSTG:'..bot_id..'dev', result.sender_user_id_) then
tsX000("prore",msg,'☑┇بالفعل تم رفعه مطور')
else
redis:set('MARKSTG:'..bot_id..'sudoo'..result.sender_user_id_..'', 'yes')
redis:sadd('MARKSTG:'..bot_id..'dev', result.sender_user_id_)
tsX000("prore",msg,'☑┇تم رفعه مطور')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end

if text:match("^اضف مطور @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apmd = {string.match(text, "^(اضف مطور) @(.*)$")}
function promote_by_username(extra, result, success)
if result.id_ then
redis:set('MARKSTG:'..bot_id..'sudoo'..result.id_..'', 'yes')
redis:sadd('MARKSTG:'..bot_id..'dev', result.id_)
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apmd[2] or 'MARKS_TEAM')..')\n\n☑┇تم رفعه مطور'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end

if text:match("^اضف مطور (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apmd = {string.match(text, "^(اضف مطور) (%d+)$")}
redis:set('MARKSTG:'..bot_id..'sudoo'..apmd[2]..'', 'yes')
redis:sadd('MARKSTG:'..bot_id..'dev', apmd[2])
tsX000(apmd[2],msg,'☑┇تم رفعه مطور')
end

if text:match("^حذف مطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) and msg.reply_to_message_id_ then
function demote_by_reply(extra, result, success)
if not redis:sismember('MARKSTG:'..bot_id..'dev', result.sender_user_id_) then
tsX000("prore",msg,'☑┇ بالفعل تم تنزيله من المطورين')
else
redis:del('MARKSTG:'..bot_id..'sudoo'..result.sender_user_id_..'', 'no')
redis:srem('MARKSTG:'..bot_id..'dev', result.sender_user_id_)
tsX000("prore",msg,'☑┇ تم تنزيله من مطورين البوت')
end
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end

if text:match("^حذف مطور @(.*)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apmd = {string.match(text, "^(حذف مطور) @(.*)$")}
function demote_by_username(extra, result, success)
if result.id_ then
redis:del('MARKSTG:'..bot_id..'sudoo'..result.id_..'', 'no')
redis:srem('MARKSTG:'..bot_id..'dev', result.id_)
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apmd[2] or 'MARKS_TEAM')..')\n☑┇ تم تنزيله من مطورين البوت'
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
end  
if text:match("^حذف مطور (%d+)$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local apmd = {string.match(text, "^(حذف مطور) (%d+)$")}
redis:del('MARKSTG:'..bot_id..'sudoo'..apmd[2]..'', 'no')
redis:srem('MARKSTG:'..bot_id..'dev', apmd[2])
tsX000(apmd[2],msg,'☑┇ تم تنزيله من مطورين البوت')
end
if not database:get('MARKSTG:'..bot_id..'repowner:mute'..msg.chat_id_) then
local markx = redis:get('MARKSTG:'..bot_id..'markx'..text..''..msg.chat_id_..'')
if markx then 
function markx_MARKSTG_re(t1,t2)
local user_msgs = database:get('MARKSTG:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit = database:get('MARKSTG:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local t = ""
if is_sudo(msg) then
t = 'مطور السورس'
elseif is_creator(msg) then
t = 'مطور درجه ثانيه'
elseif (database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("MARKSTG:all_if:"..database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = 'مدير عام الكروب'
elseif is_mod(msg) then
t = 'مدير للكروب'
elseif is_vip(msg) then
t = 'مميز للكروب'
else
t = 'لا شيء'
end
local markx = markx:gsub('#username',(t2.username_ or 'لا يوجد')) 
local markx = markx:gsub('#name',(t2.first_name_ or 'لا يوجد'))
local markx = markx:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local markx = markx:gsub('#edit',(edit or 'لا يوجد'))
local markx = markx:gsub('#msgs',(user_msgs or 'لا يوجد'))
local markx = markx:gsub('#stast',(t or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, markx, 1, 'md')
end
getUser(msg.sender_user_id_, markx_MARKSTG_re)
elseif (redis:get('MARKSTG:'..bot_id..':sticker:'..text..''..msg.chat_id_..'')) then 
tdcli.sendSticker(chat_id, msg.id_, 0, 1, nil, redis:get('MARKSTG:'..bot_id..':sticker:'..text..''..msg.chat_id_..''))
elseif (redis:get('MARKSTG:'..bot_id..':voice:'..text..''..msg.chat_id_..'')) then 
tdcli.sendVoice(chat_id, msg.id_, 0, 1, nil, redis:get('MARKSTG:'..bot_id..':voice:'..text..''..msg.chat_id_..''))
elseif (redis:get('MARKSTG:'..bot_id..':video:'..text..''..msg.chat_id_..'')) then 
tdcli.sendVideo(chat_id, msg.id_, 0, 1, nil, redis:get('MARKSTG:'..bot_id..':video:'..text..''..msg.chat_id_..''))
elseif (redis:get('MARKSTG:'..bot_id..':gif:'..text..''..msg.chat_id_..'')) then 
tdcli.sendDocument(chat_id, msg.id_, 0, 1, nil, redis:get('MARKSTG:'..bot_id..':gif:'..text..''..msg.chat_id_..''))
elseif (redis:get('MARKSTG:'..bot_id..':file:'..text..''..msg.chat_id_..'')) then
tdcli.sendDocument(chat_id, msg.id_, 0, 1, nil, redis:get('MARKSTG:'..bot_id..':file:'..text..''..msg.chat_id_..''))
end
end
if not database:get('MARKSTG:'..bot_id..'repsudo:mute'..msg.chat_id_) then
local markx = redis:get('MARKSTG:'..bot_id..'markx'..text..'')
if markx then 
function markx_MARKSTG_re(t1,t2)
local user_msgs = database:get('MARKSTG:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local edit = database:get('MARKSTG:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
local t = ""
if is_sudo(msg) then
t = 'مطور السورس'
elseif is_creator(msg) then
t = 'مطور درجه ثانيه'
elseif (database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("MARKSTG:all_if:"..database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = 'مدير عام الكروب'
elseif is_mod(msg) then
t = 'مدير الكروب'
elseif is_vip(msg) then
t = 'مميز الكروب'
else
t = 'لا شيء'
end
markx = markx:gsub('#username',(t2.username_ or 'لا يوجد'))
markx = markx:gsub('#name',(t2.first_name_ or 'لا يوجد'))
markx = markx:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
markx = markx:gsub('#edit',(edit or 'لا يوجد'))
markx = markx:gsub('#msgs',(user_msgs or 'لا يوجد'))
markx = markx:gsub('#stast',(t or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, markx, 1, 'html')
end
getUser(msg.sender_user_id_, markx_MARKSTG_re)
elseif (redis:get('MARKSTG:'..bot_id..':sticker:'..text)) then 
tdcli.sendSticker(chat_id, msg.id_, 0, 1, nil, redis:get('MARKSTG:'..bot_id..':sticker:'..text))
elseif (redis:get('MARKSTG:'..bot_id..':voice:'..text)) then 
tdcli.sendVoice(chat_id, msg.id_, 0, 1, nil, redis:get('MARKSTG:'..bot_id..':voice:'..text))
elseif (redis:get('MARKSTG:'..bot_id..':video:'..text)) then 
tdcli.sendVideo(chat_id, msg.id_, 0, 1, nil, redis:get('MARKSTG:'..bot_id..':video:'..text))
elseif (redis:get('MARKSTG:'..bot_id..':gif:'..text)) then 
tdcli.sendDocument(chat_id, msg.id_, 0, 1, nil, redis:get('MARKSTG:'..bot_id..':gif:'..text))
elseif (redis:get('MARKSTG:'..bot_id..':file:'..text)) then
tdcli.sendDocument(chat_id, msg.id_, 0, 1, nil, redis:get('MARKSTG:'..bot_id..':file:'..text))
end  
end

if text:match("^اضف رد$") and is_owner(msg) then
send(msg.chat_id_, msg.id_, 1, '📥┇ارسل الكلمه التي تريد اضافتها', 1, 'md')
redis:set('MARKSTG:'..bot_id..'markx1'..msg.sender_user_id_..''..msg.chat_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local markx1 = redis:get('MARKSTG:'..bot_id..'markx1'..msg.sender_user_id_..''..msg.chat_id_..'')
if markx1 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل الرد الذي تريد اضافته \n📥┇ قد يكون (ملف - فديو - نص - ملصق - بصمه - متحركه ) ', 1, 'md')
send(msg.chat_id_, msg.id_, 1,  '☑┇ يمكنك اضافه الى النص :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد مسجات المستخدم\n- `#name` > اسم المستخدم\n- `#id` > ايدي المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد التعديلات', 1, 'md')
redis:set('MARKSTG:'..bot_id..'markx1'..msg.sender_user_id_..''..msg.chat_id_..'', 're')
redis:set('MARKSTG:'..bot_id..'msg'..msg.sender_user_id_..''..msg.chat_id_..'', text)
redis:sadd('MARKSTG:'..bot_id..'repowner'..msg.sender_user_id_..''..msg.chat_id_..'', text)
return false end
end

if text:match("^مسح رد$") and is_owner(msg) then
send(msg.chat_id_, msg.id_, 1, '📥┇ارسل الكلمه التي تريد مسحها', 1, 'md')
redis:set('MARKSTG:'..bot_id..'markx1'..msg.sender_user_id_..''..msg.chat_id_..'', 'nomsg')
return false end
if text:match("^(.*)$") then
local markx1 = redis:get('MARKSTG:'..bot_id..'markx1'..msg.sender_user_id_..''..msg.chat_id_..'')
if markx1 == 'nomsg' then
send(msg.chat_id_, msg.id_, 1, '🗑┤ مرحبا عزيزي تم ~⊱ مسح الرد', 1, 'md')
redis:set('MARKSTG:'..bot_id..'markx1'..msg.sender_user_id_..''..msg.chat_id_..'', 'no')
redis:del('MARKSTG:'..bot_id..'markx'..text..''..msg.chat_id_..'')
redis:del('MARKSTG:'..bot_id..':sticker:'..text..''..msg.chat_id_..'')
redis:del('MARKSTG:'..bot_id..':voice:'..text..''..msg.chat_id_..'')
redis:del('MARKSTG:'..bot_id..':video:'..text..''..msg.chat_id_..'')
redis:del('MARKSTG:'..bot_id..':gif:'..text..''..msg.chat_id_..'')
redis:del('MARKSTG:'..bot_id..':file:'..text..''..msg.chat_id_..'')
redis:srem('MARKSTG:'..bot_id..'markxre'..msg.chat_id_..'', text)
end
end

if text:match("^اضف رد للكل$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
send(msg.chat_id_, msg.id_, 1, '📥┇ارسل الكلمه التي تريد اضافته', 1, 'md')
redis:set('MARKSTG:'..bot_id..'markx1'..msg.sender_user_id_..'', 'msg')
return false end
local markx1 = redis:get('MARKSTG:'..bot_id..'markx1'..msg.sender_user_id_..'')
if markx1 == 'msg' and text then
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل الرد الذي تريد اضافته \n📥┇ قد يكون (ملف - فديو - نص - ملصق - بصمه - متحركه ) ', 1, 'md')
send(msg.chat_id_, msg.id_, 1,  '☑┇ يمكنك اضافه الى النص :\n- `#username` > اسم المستخدم\n- `#msgs` > عدد مسجات المستخدم\n- `#name` > اسم المستخدم\n- `#id` > ايدي المستخدم\n- `#stast` > موقع المستخدم \n- `#edit` > عدد التعديلات', 1, 'md')
redis:set('MARKSTG:'..bot_id..'markx1'..msg.sender_user_id_..'', 're')
redis:set('MARKSTG:'..bot_id..'msg'..msg.sender_user_id_..'', text)
return false end

if text:match("^مسح رد للكل$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
send(msg.chat_id_, msg.id_, 1, '📥┇ارسل الكلمه التي تريد مسحها' , 1, 'md')
redis:set('MARKSTG:'..bot_id..'markx1'..msg.sender_user_id_..'', 'nomsg')
return false end
if text:match("^(.*)$") then
local markx1 = redis:get('MARKSTG:'..bot_id..'markx1'..msg.sender_user_id_..'')
if markx1 == 'nomsg' then
send(msg.chat_id_, msg.id_, 1, '🗑┤ مرحبا عزيزي تم ~⊱ مسح الرد', 1, 'md')
redis:set('MARKSTG:'..bot_id..'markx1'..msg.sender_user_id_..'', 'no')
redis:del('MARKSTG:'..bot_id..':sticker:'..text)
redis:del('MARKSTG:'..bot_id..':voice:'..text)
redis:del('MARKSTG:'..bot_id..':video:'..text)
redis:del('MARKSTG:'..bot_id..':gif:'..text)
redis:del('MARKSTG:'..bot_id..':file:'..text)
redis:del('MARKSTG:'..bot_id..'markx'..text)
redis:srem('MARKSTG:'..bot_id..'markxresudo', text)
end
end
if text:match("^مسح المطورين$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local list = redis:smembers('MARKSTG:'..bot_id..'dev')
for k,v in pairs(list) do
redis:del('MARKSTG:'..bot_id..'dev')
redis:del('MARKSTG:'..bot_id..'sudoo'..v)
end
send(msg.chat_id_, msg.id_, 1, "🗑┤ مرحبا عزيزي تم ~⊱ مسح مطورين البوت", 1, 'md')
end
if text:match("^مسح ردود المدير عام$") and is_owner(msg) then
local list = redis:smembers('MARKSTG:'..bot_id..'markxre'..msg.chat_id_..'')
for k,v in pairs(list) do
redis:del('MARKSTG:'..bot_id..'markxre'..msg.chat_id_..'', text)
redis:del('MARKSTG:'..bot_id..'markx'..v..''..msg.chat_id_)
redis:del('MARKSTG:'..bot_id..':sticker:'..v..msg.chat_id_)
redis:del('MARKSTG:'..bot_id..':voice:'..v..msg.chat_id_)
redis:del('MARKSTG:'..bot_id..':video:'..v..msg.chat_id_)
redis:del('MARKSTG:'..bot_id..':gif:'..v..msg.chat_id_)
redis:del('MARKSTG:'..bot_id..':file:'..v..msg.chat_id_)
redis:del('MARKSTG:'..bot_id..'markx'..v..msg.chat_id_)
end
send(msg.chat_id_, msg.id_, 1, "• `تم مسح ردود المدير عام` 🗑", 1, 'md')
end
if text:match("^مسح ردود المطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
local list = redis:smembers('MARKSTG:'..bot_id..'markxresudo')
for k,v in pairs(list) do
redis:del('MARKSTG:'..bot_id..'markxresudo', text)
redis:del('MARKSTG:'..bot_id..'markx'..v..'')
redis:del('MARKSTG:'..bot_id..':sticker:'..v)
redis:del('MARKSTG:'..bot_id..':voice:'..v)
redis:del('MARKSTG:'..bot_id..':video:'..v)
redis:del('MARKSTG:'..bot_id..':gif:'..v)
redis:del('MARKSTG:'..bot_id..':file:'..v)
redis:del('MARKSTG:'..bot_id..'markx'..v)
end
send(msg.chat_id_, msg.id_, 1, "🗑┤ مرحبا عزيزي تم ~⊱ مسح ردود المطور", 1, 'md')
end

if text:match("^المطورين$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
local list = redis:smembers('MARKSTG:'..bot_id..'dev')
text = "🚦┇قائمه المطورين  ،\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
local user_info = database:hgetall('MARKSTG:'..bot_id..'user:'..v)
if user_info and user_info.username then
local username = user_info.username
text = text.."<b>|"..k.."|</b>⌁≻(@"..username..")\n"
else
text = text.."<b>|"..k.."|</b>⌁≻(<code>"..v.."</code>)\n"
end
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "✖┇لايوجد مطورين"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
------------------------------------
if text:match("^ردود المطور$") and tonumber(msg.sender_user_id_) == tonumber(sudo_add)  then
local list = redis:smembers('MARKSTG:'..bot_id..'markxresudo')
text = "📑┇قائمه ردود المطور\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
text = text.."<b>|"..k.."|</b>⌁≻("..v..")\n"
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then
text = "❕┇لا يوجد ردود للمطور"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^ردود المدير عام$") and is_owner(msg) then
local list = redis:smembers('MARKSTG:'..bot_id..'markxre'..msg.chat_id_..'')
text = "📑┇قائمه ردود المدير عام\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ \n"
for k,v in pairs(list) do
text = text.."<b>|"..k.."|</b>⌁≻("..v..")\n"
if #text > 7000 then
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
text = ""
end
end
if #list == 0 then 
text = "❕┇لا يوجد ردود للمدير عام"
end
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end

if text:match("^كرر (.*)$") and is_mod(msg) then
local txt = {string.match(text, "^(كرر) (.*)$")}
send(msg.chat_id_, msg.id_, 1, txt[2], 1, 'html')
end  
if text:match("^وضع قوانين (.*)$") and is_mod(msg) then
local txt = {string.match(text, "^(وضع قوانين) (.*)$")}
database:set('MARKSTG:'..bot_id..'rules'..msg.chat_id_, txt[2])
send(msg.chat_id_, msg.id_, 1, "✔┇تم وضع القوانين للمجموعه", 1, 'md')
end
if text:match("^القوانين$") then
local rules = database:get('MARKSTG:'..bot_id..'rules'..msg.chat_id_)
if rules then
send(msg.chat_id_, msg.id_, 1, '⚜┇قوانين المجموعه هي\n'..rules, 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '⚜┇لم يتم حفظ قوانين للمجموعه', 1, 'md')
end
end  
if text:match("^وضع اسم (.*)$") and is_mod(msg)  then
local txt = {string.match(text, "^(وضع اسم) (.*)$")}
changetitle(msg.chat_id_, txt[2])
send(msg.chat_id_, msg.id_, 1, '✔┇تم تحديث اسم المجموعه الى \n'..txt[2], 1, 'md')
end
if text:match("^وضع صوره") and is_mod(msg) then
database:set('MARKSTG:'..bot_id..'setphoto'..msg.chat_id_..':'..msg.sender_user_id_,true)
send(msg.chat_id_, msg.id_, 1, '📥┇قم بارسال صوره الان', 1, 'md')
end
if text:match("^مسح الصوره") and is_mod(msg) then
https.request('https://api.telegram.org/bot'..token..'/deleteChatPhoto?chat_id='..msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '🗑┇تم مسح الصوره', 1, 'md')
end
if text:match("^وضع وصف (.*)$") and is_mod(msg) then
local text = {string.match(text, "^(وضع وصف) (.*)$")}
bot.changeChannelAbout(msg.chat_id_,text[2])
send(msg.chat_id_, msg.id_, 1, "✔┇تم وضع وصف للمجموعه", 1, 'md')
end  
if text:match("^الوقت$") and is_mod(msg) then
local ex = database:ttl( 'MARKSTG:'..bot_id.."charge:"..msg.chat_id_)
if ex == -1 then
send(msg.chat_id_, msg.id_, 1, '🔘┇وقت المجموعه لا نهائي` ☑', 1, 'md')
else
local d = math.floor(ex / day ) + 1
send(msg.chat_id_, msg.id_, 1, "❕┇عدد ايام وقت المجموعه {"..d.."} يوم", 1, 'md')
end
end  
if text:match("^مسح$") and msg.reply_to_message_id_ ~= 0 and is_mod(msg) then
delete_msg(msg.chat_id_, {[0] = msg.reply_to_message_id_})
delete_msg(msg.chat_id_, {[0] = msg.id_})
end
----------------------------------------------------------------------------------------------
if text:match('^مسح (%d+)$') and is_owner(msg) then
local matches = {string.match(text, "^(مسح) (%d+)$")}
if msg.chat_id_:match("^-100") then
if tonumber(matches[2]) > 100 or tonumber(matches[2]) < 1 then
pm = '❕┇لا تستطيع مسح اكثر من 100 رساله'
send(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
else
tdcli_function ({
ID = "GetChatHistory",
chat_id_ = msg.chat_id_,
from_message_id_ = 0,
offset_ = 0,
limit_ = tonumber(matches[2])}, delmsg, nil)
pm ='☑┇تم <b>{'..matches[2]..'}</b> من المسجات\n🗑┇مسحها'
send(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
end
else pm ='❕┇هناك خطاء'
send(msg.chat_id_, msg.id_, 1, pm, 1, 'html')
end
end
----------------------------------------------------------------------------------------------
if (text and text == 'تفعيل الايدي بالصوره') and is_owner(msg) then
if not database:get('MARKSTG:'..bot_id..'id:photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇الايدي بالصوره بالفعل تم تفعيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل الايدي بالصوره', 1, 'md')
database:del('MARKSTG:'..bot_id..'id:photo'..msg.chat_id_)
end
end
if (text and text == 'تعطيل الايدي بالصوره') and is_owner(msg) then
if database:get('MARKSTG:'..bot_id..'id:photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇الايدي بالصوره بالفعل تم تعطيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔️┤ مرحبا عزيزي تم ~⊱ تعطيل الايدي بالصوره', 1, 'md')
database:set('MARKSTG:'..bot_id..'id:photo'..msg.chat_id_,true)
end
end
if (text and text == 'تفعيل احضر صوره') and is_owner(msg) then
if not database:get('MARKSTG:'..bot_id..'get:photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇احضر صوره بالفعل تم تفعيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل احضر صوره', 1, 'md')
database:del('MARKSTG:'..bot_id..'get:photo'..msg.chat_id_)
end
end
if (text and text == 'تعطيل احضر صوره') and is_owner(msg) then
if database:get('MARKSTG:'..bot_id..'get:photo'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇احضر صوره بالفعل تم تعطيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔️┤ مرحبا عزيزي تم ~⊱ تعطيل احضر صوره', 1, 'md')
database:set('MARKSTG:'..bot_id..'get:photo'..msg.chat_id_,true)
end
end
if  (text and text == 'تفعيل وضع المدفوع') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:sismember('MARKSTG:'..bot_id..'pro:groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇بالفعل تم اضافه المجموعه الى الوضع المدفوع', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇تم اضافه المجموعه الى الوضع المدفوع', 1, 'md')
database:sadd('MARKSTG:'..bot_id..'pro:groups',msg.chat_id_)
end
end
if (text and text == 'تعطيل وضع المدفوع') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if not database:sismember('MARKSTG:'..bot_id..'pro:groups',msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇بالفعل تم حذف المجموعه من الوضع المدفوع', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف المجموعه من الوضع المدفوع', 1, 'md')
database:srem('MARKSTG:'..bot_id..'pro:groups',msg.chat_id_)
end
end
if (text and text == 'تفعيل الاذاعه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if not database:get('MARKSTG:'..bot_id..'bc:groups') then
send(msg.chat_id_, msg.id_, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل اذاعه البوت', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل اذاعه البوت', 1, 'md')
database:del('MARKSTG:'..bot_id..'bc:groups')
end
end
if (text and text == 'تعطيل الاذاعه') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:get('MARKSTG:'..bot_id..'bc:groups') then
send(msg.chat_id_, msg.id_, 1, '✔️┤ مرحبا عزيزي تم ~⊱ تعطيل اذاعه البوت', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔️┤ مرحبا عزيزي تم ~⊱ تعطيل اذاعه البوت', 1, 'md')
database:set('MARKSTG:'..bot_id..'bc:groups',true)
end
end
if (text and text == 'تفعيل المغادره') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if not database:get('MARKSTG:'..bot_id..'leave:groups') then
send(msg.chat_id_, msg.id_, 1, '☑┇مغادره بالفعل تم تفعيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل مغادره البوت', 1, 'md')
database:del('MARKSTG:'..bot_id..'leave:groups'..msg.chat_id_)
end
end
if (text and text == 'تعطيل المغادره') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
if database:get('MARKSTG:'..bot_id..'leave:groups') then
send(msg.chat_id_, msg.id_, 1, '☑┇مغادره بالفعل تم تعطيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔️┤ مرحبا عزيزي تم ~⊱ تعطيل مغادره البوت', 1, 'md')
database:set('MARKSTG:'..bot_id..'leave:groups'..msg.chat_id_,true)
end
end
if (text and text == "مسح صلاحيه" and is_creator(msg)) then
send(msg.chat_id_, msg.id_, 1, '☑┇ارسال الان اسم الصلاحيه', 1, 'md')
database:set("MARKSTG:is_del_if:"..bot_id..msg.chat_id_..msg.sender_user_id_,"ok")
return "MARKSTG"
end  
if (text and database:get("MARKSTG:is_del_if:"..bot_id..msg.chat_id_..msg.sender_user_id_)) then 
send(msg.chat_id_, msg.id_, 1, '☑┇تم حذف صلاحيه بنجاح', 1, 'md')
database:del("MARKSTG:all_if:"..text..bot_id..msg.chat_id_)
database:del("MARKSTG:is_del_if:"..bot_id..msg.chat_id_..msg.sender_user_id_)
end
if (text and text == "اضف صلاحيه" and is_creator(msg)) then 
send(msg.chat_id_, msg.id_, 1, '☑┇ارسال الان اسم الصلاحيه', 1, 'md')
database:set("MARKSTG:new:if:"..bot_id..msg.chat_id_..msg.sender_user_id_,"ok1")
return "MARKSTG"
end
if text and database:get("MARKSTG:new:if:"..bot_id..msg.chat_id_..msg.sender_user_id_) then 
database:del("MARKSTG:new:if:"..bot_id..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل نوع الصلاحيه المطلوبه \n🔰┇{ `مدير عام` ،`مدير` ،`عضو مميز` ,`لا شيئ `}', 1, 'md')
database:set("MARKSTG:new:if:text:"..bot_id..msg.chat_id_..msg.sender_user_id_,text)
database:set("MARKSTG:new:if2:"..bot_id..msg.chat_id_..msg.sender_user_id_,"ok1")
return "MARKSTG"
end
if (text and database:get("MARKSTG:new:if2:"..bot_id..msg.chat_id_..msg.sender_user_id_)) then 
if (text == "مدير" or text == "مدير عام" or text == "عضو مميز" or text == "لا شيئ") then 
database:del("MARKSTG:new:if2:"..bot_id..msg.chat_id_..msg.sender_user_id_)
tsha_text = database:get("MARKSTG:new:if:text:"..bot_id..msg.chat_id_..msg.sender_user_id_)
send(msg.chat_id_, msg.id_, 1, '☑️┇تم حفض الصلاحيه بنجاح \n⚠️┇الاوامر { رفع/تنزيل '..tsha_text..' }', 1, 'md')
database:set("MARKSTG:all_if:"..tsha_text..bot_id..msg.chat_id_,text)
database:del("MARKSTG:new:if:text:"..bot_id..msg.chat_id_..msg.sender_user_id_)
else 
send(msg.chat_id_, msg.id_, 1, '📥┇الان ارسل نوع الصلاحيه المطلوبه \n🔰┇{ `مدير عام` ،`مدير` ،`عضو مميز` ,`لا شيئ `}', 1, 'md')
end
end
if text then 
if text:match("^رفع (.*)$")  and is_owner(msg) and msg.reply_to_message_id_ then
a = {string.match(text, "^رفع (.*)$")}
ts_text = database:get("MARKSTG:all_if:"..a[1]..bot_id..msg.chat_id_)
if ts_text then 
function promote_by_reply(extra, result, success)
if ts_text == "مدير" then 
database:sadd('MARKSTG:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "مميز" then 
database:sadd('MARKSTG:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "مدير عام" then 
database:sadd('MARKSTG:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
end
database:set("MARKSTG:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_,a[1])
function markx33332(extra,result2,success)
info = '☑️¦العضو ⌁≻ ['..result2.first_name_..'](t.me/'..(result2.username_ or 'MARKSTGTeam')..')\n☑┇تم رفعه '..a[1]
send(msg.chat_id_, msg.id_, 1,info, 1, 'md')
end
getUser(result.sender_user_id_, markx33332)  
end 
getMessage(msg.chat_id_, msg.reply_to_message_id_,promote_by_reply)
end 
end
if text:match("^رفع (.*) @(.*)$") and is_owner(msg) then
local apmd = {string.match(text, "^رفع (.*) @(.*)$")}
ts_text = database:get("MARKSTG:all_if:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then 
function promote_by_username(extra, result, success)
if result.id_ then
if ts_text == "مدير" then 
database:sadd('MARKSTG:'..bot_id..'mods:'..msg.chat_id_, result.id_)
elseif ts_text == "مميز" then 
database:sadd('MARKSTG:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
elseif ts_text == "مدير عام" then 
database:sadd('MARKSTG:'..bot_id..'owners:'..msg.chat_id_, result.id_)
end
database:set("MARKSTG:name_user:"..bot_id..msg.chat_id_..result.id_,apmd[1])
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apmd[2] or 'MARKS_TEAM')..')\n☑┇تم رفعه '..apmd[1]
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],promote_by_username)
end
end
if text:match("^رفع (.*) (%d+)$") and is_owner(msg) then
local apmd = {string.match(text, "^رفع (.*) (%d+)$")}
ts_text = database:get("MARKSTG:all_if:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then 
if ts_text == "مدير" then 
database:sadd('MARKSTG:'..bot_id..'mods:'..msg.chat_id_, apmd[2])
elseif ts_text == "عضو مميز" then 
database:sadd('MARKSTG:'..bot_id..'vipgp:'..msg.chat_id_, apmd[2])
elseif ts_text == "مدير عام" then 
database:sadd('MARKSTG:'..bot_id..'owners:'..msg.chat_id_, apmd[2])
end
database:set("MARKSTG:name_user:"..bot_id..msg.chat_id_..apmd[2],apmd[1])
tsX000(apmd[2],msg,"☑┇تم رفعه "..apmd[1])
end
end
if text:match("^تنزيل (.*)$") and is_owner(msg) and msg.reply_to_message_id_ then
a = {string.match(text, "^تنزيل (.*)$")}
ts_text = database:get("MARKSTG:all_if:"..a[1]..bot_id..msg.chat_id_)
if ts_text then 
function demote_by_reply(extra, result, success)
if ts_text == "مدير" then 
database:srem('MARKSTG:'..bot_id..'mods:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "مميز" then 
database:srem('MARKSTG:'..bot_id..'vipgp:'..msg.chat_id_, result.sender_user_id_)
elseif ts_text == "مدير عام" then 
database:srem('MARKSTG:'..bot_id..'owners:'..msg.chat_id_, result.sender_user_id_)
end
database:del("MARKSTG:name_user:"..bot_id..msg.chat_id_..result.sender_user_id_)
tsX000("prore",msg,"☑┇ تم تنزيله من "..a[1])
end
getMessage(msg.chat_id_, msg.reply_to_message_id_,demote_by_reply)
end
end
if text:match("^تنزيل (.*) @(.*)$") and is_owner(msg) then
local apmd = {string.match(text, "^تنزيل (.*) @(.*)$")}
ts_text = database:get("MARKSTG:all_if:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then 
function demote_by_username(extra, result, success)
if result.id_ then
if ts_text == "مدير" then 
database:srem('MARKSTG:'..bot_id..'mods:'..msg.chat_id_, result.id_)
elseif ts_text == "مميز" then 
database:srem('MARKSTG:'..bot_id..'vipgp:'..msg.chat_id_, result.id_)
elseif ts_text == "مدير عام" then 
database:srem('MARKSTG:'..bot_id..'owners:'..msg.chat_id_, result.id_)
end
texts = '☑️¦العضو ⌁≻ ['..result.title_..'](t.me/'..(apmd[2] or 'MARKS_TEAM')..')\n☑┇تم تنزيله من '..apmd[1]
database:del("MARKSTG:name_user:"..bot_id..msg.chat_id_..result.id_)
else
texts = '✖┇خطاء'
end
send(msg.chat_id_, msg.id_, 1, texts, 1, 'md')
end
resolve_username(apmd[2],demote_by_username)
end
end
if text:match("^تنزيل (.*) (%d+)$") and is_owner(msg) then
local apmd = {string.match(text, "^تنزيل (.*) (%d+)$")}
ts_text = database:get("MARKSTG:all_if:"..apmd[1]..bot_id..msg.chat_id_)
if ts_text then 
if ts_text == "مدير" then 
database:srem('MARKSTG:'..bot_id..'mods:'..msg.chat_id_, apmd[2])
elseif ts_text == "مميز" then 
database:srem('MARKSTG:'..bot_id..'vipgp:'..msg.chat_id_, apmd[2])
elseif ts_text == "مدير عام" then 
database:srem('MARKSTG:'..bot_id..'owners:'..msg.chat_id_, apmd[2])
end
tsX000(apmd[2],msg,"☑┇ تم تنزيله من "..apmd[1])
database:del("MARKSTG:name_user:"..bot_id..msg.chat_id_..apmd[2])
end
end
end 
if (text and text == 'تفعيل ردود المطور') and is_owner(msg) then
if not database:get('MARKSTG:'..bot_id..'repsudo:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇ردود المطور بالفعل تم تفعيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل ردود المطور', 1, 'md')
database:del('MARKSTG:'..bot_id..'repsudo:mute'..msg.chat_id_)
end
end
if  (text and text == 'تعطيل ردود المطور') and is_owner(msg) then
if database:get('MARKSTG:'..bot_id..'repsudo:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇ردود المطور بالفعل تم تعطيلها', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, 'تم تعطيل ردود المطور', 1, 'md')
database:set('MARKSTG:'..bot_id..'repsudo:mute'..msg.chat_id_,true)
end
end
if (text and text == 'تفعيل ردود المدير عام') and is_owner(msg) then
if not database:get('MARKSTG:'..bot_id..'repowner:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل ردود المدير عام', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل ردود المدير عام', 1, 'md')
database:del('MARKSTG:'..bot_id..'repowner:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل ردود المدير عام') and is_owner(msg) then
if database:get('MARKSTG:'..bot_id..'repowner:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔️┤ مرحبا عزيزي تم ~⊱ تعطيل ردود المدير عام ', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔️┤ مرحبا عزيزي تم ~⊱ تعطيل ردود المدير عام ', 1, 'md')
database:set('MARKSTG:'..bot_id..'repowner:mute'..msg.chat_id_,true)
end
end
if text:match("^ايدي المجموعه$") then
send(msg.chat_id_, msg.id_, 1, "*"..msg.chat_id_.."*", 1, 'md')
end
if (text and text == 'تفعيل الايدي') and is_owner(msg) then
if not database:get('MARKSTG:'..bot_id..'id:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل الايدي', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل الايدي', 1, 'md')
database:del('MARKSTG:'..bot_id..'id:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل الايدي') and is_owner(msg) then
if database:get('MARKSTG:'..bot_id..'id:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '✔️┤ مرحبا عزيزي تم ~⊱ تعطيل الايدي', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔️┤ مرحبا عزيزي تم ~⊱ تعطيل الايدي', 1, 'md')
database:set('MARKSTG:'..bot_id..'id:mute'..msg.chat_id_,true)
end
end
if (text and text == "تعطيل الرابط" and is_owner(msg)) then 
send(msg.chat_id_, msg.id_, 1, '✔️┤ مرحبا عزيزي تم ~⊱ تعطيل امر الروابط', 1, 'md')
database:set("MARKSTG:mute:link:gr:"..bot_id..msg.chat_id_,"ok")
end
if (text and text == "تفعيل الرابط" and is_owner(msg)) then 
send(msg.chat_id_, msg.id_, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل امر الروابط', 1, 'md')
database:del("MARKSTG:mute:link:gr:"..bot_id..msg.chat_id_)
end
if text and text == "تعين مجموعه المطور" and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '☑┇ تم تعين ⌁≻ `'..msg.chat_id_..'`', 1, 'md')
database:set("MARKSTG"..bot_id..":sudo:gr",msg.chat_id_)
end
if text and text == "مسح مجموعه المطور" and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '🗑┤ مرحبا عزيزي تم ~⊱ مسح مجموعه المطور', 1, 'md')
database:del("MARKSTG"..bot_id..":sudo:gr")
end
if text:match("^ايدي$") and msg.reply_to_message_id_ == 0 then
local markx_info = nil
function markx333(extra,result,success)
markx_info = '@'..(result.username_ or 'لا يوجد')..''
local function getpro(extra, result, success)
local all_photo_MARKSTG = result.total_count_ 
local user_msgs = database:get('MARKSTG:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_)
local msguser = tonumber(database:get('MARKSTG:'..bot_id..'user:msgs'..msg.chat_id_..':'..msg.sender_user_id_) or 1)
local edit = database:get('MARKSTG:'..bot_id..'user:editmsg'..msg.chat_id_..':'..msg.sender_user_id_) or 0
if result.photos_[0] then
if is_sudo(msg) then
t = 'مطور السورس'
elseif is_creator(msg) then
t = 'مطور درجه ثانيه'
elseif (database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("MARKSTG:all_if:"..database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = 'مدير عام الكروب'
elseif is_mod(msg) then
t = 'مدير للكروب'
elseif is_vip(msg) then
t = 'مميز الكروب'
else
t = 'لا شيء'
end
if not database:get('MARKSTG:'..bot_id..'id:mute'..msg.chat_id_) then
if not database:get('MARKSTG:'..bot_id..'id:photo'..msg.chat_id_) then
if not database:get("MARKSTG:gr:id:text:"..bot_id..msg.chat_id_) then 
local markx_text = {
"تنكرط ولكعبا❤️😔",
"وفبس امصك☹️",
"نصاوت ونرتبط يحلو🙈",
"رجع صورتك خزيتنا😂",
"شلزكت بهصورا ديمعود😂",
"هذه ويهك 😂",
"ببكن علاقه جاده 😹",
"وجهك وجه الچوب ختتف😹",
}
markx3 = math.random(#markx_text)
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,"🌌┐ "..markx_text[markx3].."\n💳┤ايديك~⊱"..msg.sender_user_id_.."\n📡┤رتبتك~⊱ "..t..'\n🌟┤تفاعلك~⊱ {'..formsgg(msguser).."}\n🚸┤معرفك~⊱ "..markx_info.."\n💌┤رسائلك~⊱ {"..user_msgs.."}\n📝┘سحكاتك~⊱ {"..edit.."}\n┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉",msg.id_,msg.id_.."")
else 
local MARKSTG_new_text = database:get("MARKSTG:gr:id:text:"..bot_id..msg.chat_id_)
local MARKSTG_new_text = MARKSTG_new_text:gsub('#username',(markx_info or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#edit',(edit or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#stast',(t or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#photos',(all_photo_MARKSTG or 'لا يوجد'))
sendPhoto(msg.chat_id_, msg.id_, 0, 1, nil, result.photos_[0].sizes_[1].photo_.persistent_id_,MARKSTG_new_text,msg.id_,msg.id_.."")
end
else
if is_sudo(msg) then
t = 'مطور السورس'
elseif is_creator(msg) then
t = 'مطور درجه ثانيه'
elseif (database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("MARKSTG:all_if:"..database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = 'مدير عام الكروب'
elseif is_mod(msg) then
t = 'مدير الكروب'
elseif is_vip(msg) then
t = 'مميز الكروب'
else
t = 'لا شيء'
end
if not database:get("MARKSTG:gr:id:text:"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, "💳┤ايديك ~⪼  ("..msg.sender_user_id_..")\n🎫┤معرفك ~⪼ "..markx_info.."\n👨‍✈️┤رتبتك ~⪼  "..t.."\n📨┤رسائلك ~⪼ <b>{"..user_msgs.."}</b>\n📧┤السحكات ~⪼<b>{"..edit.."}</b>\n╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍", 1, 'html')
else 
local MARKSTG_new_text = database:get("MARKSTG:gr:id:text:"..bot_id..msg.chat_id_)
local MARKSTG_new_text = MARKSTG_new_text:gsub('#username',(markx_info or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#edit',(edit or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#stast',(t or 'لا يوجد'))   
local MARKSTG_new_text = MARKSTG_new_text:gsub('#photos',(all_photo_MARKSTG or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, MARKSTG_new_text, 1, 'html')
end   
end
else
end
else
if is_sudo(msg) then
t = 'مطور السورس'
elseif is_creator(msg) then
t = 'مطور درجه ثانيه'
elseif (database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("MARKSTG:all_if:"..database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = 'مدير عام الكروب'
elseif is_mod(msg) then
t = 'مدير للكروب'
elseif is_vip(msg) then
t = 'مميز الكروب'
else
t = 'لا شيء'
end
if not database:get('MARKSTG:'..bot_id..'id:mute'..msg.chat_id_) then
if not database:get('MARKSTG:'..bot_id..'id:photo'..msg.chat_id_) then
if not database:get("MARKSTG:gr:id:text:"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, "❖ ᎒انت لا تملك صوره في بروفايلك\n💳┤ايديك ~⪼  ("..msg.sender_user_id_..")\n🎫┤معرفك ~⪼ "..markx_info.."\n👨‍✈️┤رتبتك ~⪼  "..t.."\n📨┤رسائلك ~⪼ <b>{"..user_msgs.."}</b>\n📧┤السحكات ~⪼<b>{"..edit.."}</b>\n╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍ ", 1, 'html')
else 
local MARKSTG_new_text = database:get("MARKSTG:gr:id:text:"..bot_id..msg.chat_id_)
local MARKSTG_new_text = MARKSTG_new_text:gsub('#username',(markx_info or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#edit',(edit or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#stast',(t or 'لا يوجد'))   
local MARKSTG_new_text = MARKSTG_new_text:gsub('#photos',(all_photo_MARKSTG or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, MARKSTG_new_text, 1, 'html')
end
else
if is_sudo(msg) then
t = 'مطور السورس'
elseif is_creator(msg) then
t = 'مطور درجه ثانيه'
elseif (database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) and database:get("MARKSTG:all_if:"..database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_) ..bot_id..msg.chat_id_)) then 
t = database:get("MARKSTG:name_user:"..bot_id..msg.chat_id_..msg.sender_user_id_)
elseif is_owner(msg) then
t = 'مدير عام الكروب'
elseif is_mod(msg) then
t = 'مدير للكروب'
elseif is_vip(msg) then
t = 'مميز الكروب'
else
t = 'لا شيء'
end
if not database:get("MARKSTG:gr:id:text:"..bot_id..msg.chat_id_) then 
send(msg.chat_id_, msg.id_, 1, "💳┤ايديك ~⪼  ("..msg.sender_user_id_..")\n🎫┤معرفك ~⪼ "..markx_info.."\n👨‍✈️┤رتبتك ~⪼  "..t.."\n📨┤رسائلك ~⪼ <b>{"..user_msgs.."}</b>\n📧┤السحكات ~⪼<b>{"..edit.."}</b>\n╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍╍", 1, 'html')
else 
local MARKSTG_new_text = database:get("MARKSTG:gr:id:text:"..bot_id..msg.chat_id_)
local MARKSTG_new_text = MARKSTG_new_text:gsub('#username',(markx_info or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#id',(msg.sender_user_id_ or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#edit',(edit or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#msgs',(user_msgs or 'لا يوجد'))
local MARKSTG_new_text = MARKSTG_new_text:gsub('#stast',(t or 'لا يوجد'))   
local MARKSTG_new_text = MARKSTG_new_text:gsub('#photos',(all_photo_MARKSTG or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, MARKSTG_new_text, 1, 'html')  
end 
end
else
end
end
end
tdcli_function ({
ID = "GetUserProfilePhotos",
user_id_ = msg.sender_user_id_,
offset_ = 0,
limit_ = 1
}, getpro, nil)
end
getUser(msg.sender_user_id_, markx333)
end
if text:match('^الحساب (%d+)$') then
local id = text:match('^الحساب (%d+)$')
local text = 'اضغط لمشاهده الحساب'
tdcli_function ({ID="SendMessage", chat_id_=msg.chat_id_, reply_to_message_id_=msg.id_, disable_notification_=0, from_background_=1, reply_markup_=nil, input_message_content_={ID="InputMessageText", text_=text, disable_web_page_preview_=1, clear_draft_=0, entities_={[0] = {ID="MessageEntityMentionName", offset_=0, length_=19, user_id_=id}}}}, dl_cb, nil)
end
local function oChat(chat_id,cb)
tdcli_function ({
ID = "OpenChat",
chat_id_ = chat_id
}, cb, nil)
end
if text:match("^معلومات (.*)$") then
local memb = {string.match(text, "^(معلومات) (.*)$")}
function whois(extra,result,success)
if result.username_ then
result.username_ = '@'..result.username_
else
result.username_ = 'لا يوجد يوزر'
end
send(msg.chat_id_, msg.id_, 1, '🎫┤معرفك ~⪼ ('..(result.username_..')\n✰ ᎒ ᏁᎯᗰᏋ ➣ ('..result.first_name_ or "MARKSTG")..')', 1, 'md')
end
getUser(memb[2],whois)
end
if (text and text == 'تفعيل التثبيت') and is_owner(msg) then
if not database:get('MARKSTG:'..bot_id..'pin:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇التثبيت بالفعل تم تفعيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '🚦¦ مرحبا عزيزي تم ~⊱ تفعيل التثبيت', 1, 'md')
database:del('MARKSTG:'..bot_id..'pin:mute'..msg.chat_id_)
end
end
if (text and text == 'تعطيل التثبيت') and is_owner(msg) then
if database:get('MARKSTG:'..bot_id..'pin:mute'..msg.chat_id_) then
send(msg.chat_id_, msg.id_, 1, '☑┇التثبيت بالفعل تم تعطيله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '✔️┤ مرحبا عزيزي تم ~⊱ تعطيل التثبيت', 1, 'md')
database:set('MARKSTG:'..bot_id..'pin:mute'..msg.chat_id_,true)
end
end
if text:match("^ثبت$")or text:match("^Pin$")or text:match("^تثبيت$") and is_mod(msg) and not is_owner(msg) then
local id = msg.id_
local msgs = {[0] = id}
if not database:get('MARKSTG:'..bot_id..'pin:mute'..msg.chat_id_) then
pin(msg.chat_id_,msg.reply_to_message_id_,0)
database:set('MARKSTG:'..bot_id..'pinnedmsg'..msg.chat_id_,msg.reply_to_message_id_)
send(msg.chat_id_, msg.id_, 1, '☑┇تم تثبيت الرساله',1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇التثبيت معطل',1, 'md')
end
end
if text:match("^الغاء تثبيت$") and is_mod(msg) and not is_owner(msg) or text:match("^الغاء التثبيت") and is_mod(msg) and not is_owner(msg) then
if not database:get('MARKSTG:'..bot_id..'pin:mute'..msg.chat_id_) then
unpinmsg(msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '☑┇تم الغاء تثبيت الرساله', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '☑┇الغاء التثبيت معطل', 1, 'md')
end
end
if text:match("^ثبت$")or text:match("^pin$")or text:match("^تثبيت$") and is_owner(msg) then
local id = msg.id_
local msgs = {[0] = id}
pin(msg.chat_id_,msg.reply_to_message_id_,0)
database:set('MARKSTG:'..bot_id..'pinnedmsg'..msg.chat_id_,msg.reply_to_message_id_)
send(msg.chat_id_, msg.id_, 1, '☑┇تم تثبيت الرساله',1, 'md')
end
if text:match("^الغاء تثبيت$") and is_owner(msg) or text:match("^الغاء التثبيت") and is_owner(msg) then
unpinmsg(msg.chat_id_)
send(msg.chat_id_, msg.id_, 1, '☑┇تم الغاء تثبيت الرساله', 1, 'md')
end
if text:match("^مشاهده منشور$") then
database:set('MARKSTG:'..bot_id..'viewget'..msg.sender_user_id_,true)
send(msg.chat_id_, msg.id_, 1, '📥┇قم بارسال المنشور الان ',1, 'md')
end
if (text and text == 'استعاده الاوامر') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
redis:del('MARKSTG:'..bot_id..'help', text)
redis:del('MARKSTG:'..bot_id..'h1', text)
redis:del('MARKSTG:'..bot_id..'h2', text)
redis:del('MARKSTG:'..bot_id..'h3', text)
redis:del('MARKSTG:'..bot_id..'h4', text)
redis:del('MARKSTG:'..bot_id..'h5', text)
redis:del('MARKSTG:'..bot_id..'h6', text)
send(msg.chat_id_, msg.id_, 1, '☑┇تم استعاده جميع كلايش الاوامر', 1, 'html')
end
if (text and text == 'تغير امر الاوامر') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('MARKSTG:'..bot_id..'hhh'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local markx2 = redis:get('MARKSTG:'..bot_id..'hhh'..msg.sender_user_id_..'')
if markx2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('MARKSTG:'..bot_id..'hhh'..msg.sender_user_id_..'', 'no')
redis:set('MARKSTG:'..bot_id..'help', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false end
end
if text:match("^الاوامر$") and is_mod(msg) then
local help = redis:get('MARKSTG:'..bot_id..'help')
local text =  [[
‎📮┇مرحبا عزيزي هناك {4} اوامر لعرضها
﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎
‎🚸┇م1 ~⪼ لعرض اوامر الحمايه
    
‎📬┇م2 ~⪼ لعرض اوامر المدراء
‎
🚥┇م3 ~⪼ لعرض اوامر المدراء العامين والمطور درجه ثانيه

🎖┇م4 ~⪼ لعرض اوامر المطورين
﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎
قناتنا ~» @MARKS_TEAM
]]
send(msg.chat_id_, msg.id_, 1, (help or text), 1, 'html')
end
if (text and text == 'تغير امر م1') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('MARKSTG:'..bot_id..'h11'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local markx2 = redis:get('MARKSTG:'..bot_id..'h11'..msg.sender_user_id_..'')
if markx2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('MARKSTG:'..bot_id..'h11'..msg.sender_user_id_..'', 'no')
redis:set('MARKSTG:'..bot_id..'h1', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false end
end
if (text:match("^م1$") or text == "م١") and is_mod(msg) then
local h1 = redis:get('MARKSTG:'..bot_id..'h1')
local text =  [[
    📮┇ اوامر حمايه المجموعه
    ﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎
    قفل + فتح >> lock + unlock
    ﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎
    🔐┇ { قفل / فتح } الروابط 
    🔐┇ { قفل / فتح } التاك
    🔐┇ { قفل / فتح } الشارحه
    🔐┇ { قفل / فتح } المعرف
    🔐┇ { قفل / فتح } التثبيت
    🔐┇ { قفل / فتح } التعديل
    🔐┇ { قفل / فتح } المتحركه
    🔐┇ { قفل / فتح } الملفات
    🔐┇ { قفل / فتح } الصور
    ﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎
    🔐┇ { قفل / فتح } الملصقات
    🔐┇ { قفل / فتح } الفيديو
    🔐┇ { قفل / فتح } الانلاين
    🔐┇ { قفل / فتح } الدردشه
    🔐┇ { قفل / فتح } التوجية
    🔐┇ { قفل / فتح } الاغاني
    🔐┇ { قفل / فتح } الماركدون
    🔐┇ { قفل / فتح } الاشعارات
    🔐┇ { قفل / فتح } الجهات
    🔐┇ { قفل / فتح } الصوت
    ﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎
    🔐┇ { قفل / فتح } الفارسيه
    🔐┇ { قفل / فتح } العربيه
    🔐┇ { قفل / فتح } البوتات
    🔐┇ { قفل / فتح }الانكليزيه
    🔐┇ { قفل / فتح } الميديا
    🔐┇ { قفل / فتح } التكرار
    🔐┇ { قفل / فتح} الكلايش
    ﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎﹎
    قناتنا ~» @MARKS_TEAM
    ]]send(msg.chat_id_, msg.id_, 1, (h1 or text), 1, 'html')
end
if (text and text == 'تغير امر م2') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('MARKSTG:'..bot_id..'h22'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local markx2 = redis:get('MARKSTG:'..bot_id..'h22'..msg.sender_user_id_..'')
if markx2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('MARKSTG:'..bot_id..'h22'..msg.sender_user_id_..'', 'no')
redis:set('MARKSTG:'..bot_id..'h2', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false end
end
if (text:match("^م2$") or text == "م٢") and is_mod(msg) then
local h2 = redis:get('MARKSTG:'..bot_id..'h2')
local text =  [[
    🚧 | اوامر المدراء
    ➖➖➖➖➖➖➖➖➖➖➖➖
    🚫 |《كتم/الغاء كتم
    📛 |  حظر/الغاءحظر
    🚷 | طرد / شحت
    💢 | منع/الغاء منع +الكلمه
    📝 | المحظورين 
    📝 | المكتومين 
    📝 | قائمه المنع 
    ➖➖➖➖➖➖➖➖➖➖➖➖
    🔘 | تثبيت/الغاء تثبيت 
    ⚙️ | الاعدادات 
    ➖➖➖➖➖➖➖➖➖➖➖➖
    📎 | الرابط 
    🗒 | القوانين 
    ➖➖➖➖➖➖➖➖➖➖➖➖
    👋🏻 | وضع/حذف/احضر  الترحيب
    👋🏻 | تفعيل/تعطيل  الترحيب
    🆘 | تفعيل/تعطيل الابلاغ 
    🆘 | تعين عدد الابلاغ  + العدد
    ➖➖➖➖➖➖➖➖➖➖➖➖
    📟 | معلومات + ايدي
    📟 | الحساب + ايدي
    ♻️ | كرر + الكلمه
    ➖➖➖➖➖➖➖➖➖➖➖➖
    🏧 | ايدي 
    📲 | جهاتي 
    ✏️ | سحكاتي 
    📬 | رسائلي 
    💢 | ابلاغ 
    🚥 | الكروب 
    ➖➖➖➖➖➖➖➖➖➖➖➖
    📫 | وضع اسم 》
    📫 | وضع رابط 》
    📫 | وضع صوره 》
    📫 | وضع وصف 》
    📫 | وضع قوانين 
    ➖➖➖➖➖➖➖➖➖➖➖➖
    📫 | مسح قائمه المنع 
    📫 | مسح مالمحظورين
    📫 | مسح المكتومين
    📫 | مسح القوانين 
    📫 | مسح البوتات 
    📫 | مسح الصوره 
    📫 | مسح الرابط 
    ➖➖➖➖➖➖➖➖➖➖➖➖
    قناتنا ~» @MARKS_TEAM
    
    ]]
send(msg.chat_id_, msg.id_, 1, (h2 or text), 1, 'html')
end
if (text and text == 'تغير امر م3') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('MARKSTG:'..bot_id..'h33'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local markx2 = redis:get('MARKSTG:'..bot_id..'h33'..msg.sender_user_id_..'')
if markx2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('MARKSTG:'..bot_id..'h33'..msg.sender_user_id_..'', 'no')
redis:set('MARKSTG:'..bot_id..'h3', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return false end
end
if (text:match("^م3$") or text == "م٣") and is_mod(msg) then
local h3 = redis:get('MARKSTG:'..bot_id..'h3')
local text =  [[
    👨‍✈️ : المدراء العامين
    ➖➖➖➖➖➖➖➖➖➖➖➖➖
    ⏳┇ وضع تكرار + العدد
    ⏳┇ وضع زمن التكرار + العدد
    ➖➖➖➖➖➖➖➖➖➖➖➖➖
    🔘┇ رفع تنزيل مدير عام
    🔘┇ رفع تنزيل مدير
    🔘┇ رفع تنزيل مميز
    ➖➖➖➖➖➖➖➖➖➖➖➖➖
    🔳┇ تفعيل/تعطيل الايدي بالصوره
    🔳┇ تفعيل/تعطيل الايدي
    💬┇ تفعيل/تعطيل ردود المطور
    💬┇ تفعيل/تعطيل ردود المدير عام
    🏧┇ تفعيل/تعطيل  التثبيت
    🚳┇ تفعيل/تعطيل  اطردني
    ➖➖➖➖➖➖➖➖➖➖➖➖➖
    اوامر المطور درجه ثانيه 🥇
    ➖➖➖➖➖➖➖➖➖➖➖➖➖
    🗑┇ رفع/مسح المدراء
    🗑┇ اضف/مسح  رد
    🗑┇ المدراء~لعرض المدراء
    💬┇ ردود المدير عام 
    🔘┇ مدراء الكروب
    🔘┇ المميزين
    🗑┇ مسح + عدد  لمسح الرسائل
    🗑┇ مسح المدراء العامين
    🗑┇ طرد المتروكين ~المحذوفين
    🚥┇ الغاء حظر الكل/لفك الحظر عن الكل
    🗑┇تعين/مسح ايدي
    🗑┇ ضف/مسح صلاحيه
    🗑┇ اضف/مسح امر+اسم الامر المظاف
    🚥┇ تفعيل/تعطيل الحظر
    🚥┇ تفعيل/تعطيل الطرد
    ➖➖➖➖➖➖➖➖➖➖➖➖➖
    قناتنا ~» @MARKS_TEAM
]]
send(msg.chat_id_, msg.id_, 1, (h3 or text), 1, 'html')
end
if (text and text == 'تغير امر م4') and tonumber(msg.sender_user_id_) == tonumber(sudo_add) then
send(msg.chat_id_, msg.id_, 1, '📥┇الان يمكنك ارسال الكليشه  ليتم حفظها', 1, 'html')
redis:set('MARKSTG:'..bot_id..'h44'..msg.sender_user_id_..'', 'msg')
return false end
if text:match("^(.*)$") then
local markx2 = redis:get('MARKSTG:'..bot_id..'h44'..msg.sender_user_id_..'')
if markx2 == 'msg' then
send(msg.chat_id_, msg.id_, 1, '☑┇تم حفظ الكليشه يمكنك اظهارها بارسال الامر', 1, 'html')
redis:set('MARKSTG:'..bot_id..'h44'..msg.sender_user_id_..'', 'no')
redis:set('MARKSTG:'..bot_id..'h4', text)
send(msg.chat_id_, msg.id_, 1, text , 1, 'html')
return
false
end
end
if (text:match("^م4$") or text == "م٤") and is_sudo(msg) then
local h4 = redis:get('MARKSTG:'..bot_id..'h4')
local text =  [[
    ♾ : اوامر المطور
    ➖➖➖➖➖➖➖➖➖➖➖➖
    ⚠️ : تفعيل/تعطيل 
    ⚠️ : تفعيل/تعطيل المغادره
    ⚠️ : تفعيل/تعطيل الاذاعه
    ⚠️ : تفعيل/تعطيل البوت الخدمي
    🚸 : تعين الاعضاء + رقم
    🚸 : اضف/مسح رد للكل
    💬 : ردود المطور
    👁‍🗨 : تغير رقم المطور
    🗑 : تغير/مسح كليشه المطور
    🗑 : تعين/مسح مجموعه المطور 
    🔗 : الكروبات
    ➖➖➖➖➖➖➖➖➖➖➖➖
    📛 : حظر/الغاء حظر عام
    🚫 : كتم/الغاء كتم  عام
    📛 : المحظورين عام
    🚫 : المكتومين عام
    ➖➖➖➖➖➖➖➖➖➖➖➖
    🔘 : رفع/حذف مطور
    🔘 : رفع/تنزيل مطور درجه ثانيه
    🔘 : رفع/تنزيل مدير عام
    🔘 : رفع/تنزيل مدير
    🔘 : المطورين
    🔘 : المطور درجه ثانيه
    🔘 : المدراء
    🔘 : المدراء 
    ➖➖➖➖➖➖➖➖➖➖➖➖
    🔘 : استعادة الاوامر
    🔘 : مسح ردود المطور
    🔘 : مسح المطورين
    🔘 : الغاء المحظورين عام
    🔘 : تنزيل المدراء العامين
    🔘 : تنزيل المدراء
    🔘 : تنزيل المطور درجه ثانيه
    🔘 : الغاء المكتومين عام ➖➖➖➖➖➖➖➖➖➖➖➖
    🔘 : تغير امرالاوامر/م1/م2/م3/م4
    📡 : اذاعه
    🗂 : الملفات
    🗂 : تفعيل/تعطيل ملف+اسم الملف
    🗂 : تنصيب حذف احضر+اسم الملف
    🗂 : مسح الملفات
    ➖➖➖➖➖➖➖➖➖➖➖➖
    🔘 : تغير نص الانلاين+النص
    🔘 : تغير رابط الانلاين+الرابط
    🔘 : تفعيل/تعطيل الانلاين
➖➖➖➖➖➖➖➖➖➖➖➖
    قناتنا ~> @MARKS_TEAM
]]
   if (text:match("^م5$") or text == "اوامر التقيد") and is_sudo(msg) then
local h4 = redis:get('MARKSTG:'..bot_id..'h4')
local text =  [[
☑️┇لتفعيل خاصية التقيد عليك تثبيت الملف من قناة ملفات السورس
🗂┇قناة الملفات @MARKS_TEAM
☑️┇ اوامر التقيد 
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔒┇قفل ~⪼ لقفل امر
🔐┇فتح ~⪼ لفتح امر
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
📎┇الروابط بالتقيد
📝┇المعرف بالتقيد
📡┇التاك بالتقيد
⚒┇الشارحه بالتقيد
📺┇المتحركه بالتقيد
🗂┇الملفات بالتقيد
🌅┇الصور بالتقيد
💳┇الملصقات بالتقيد
🎥┇الفيديو بالتقيد
⏳┇الانلاين بالتقيد
💬┇الدردشه بالتقيد
🔚┇التوجيه بالتقيد
📻┇الاغاني بالتقيد
🎙┇الصوت بالتقيد
📞┇الجهات بالتقيد
🕹┇الماركدون بالتقيد
🇮🇶┇العربيه بالتقيد
🇱🇷┇الانكليزية بالتقيد
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🚹┇تقيد
🚹┇الغاء تقيد
🚹┇المقيدين
🚹┇مسح المقيدين
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
    قناتنا ~> @MARKS_TEAM
]]     
send(msg.chat_id_, msg.id_, 1, (h4 or text), 1, 'html')
end
if text:match("^اصدار$") or text:match("^با سورس$") or text:match("^السورس$") or text:match("^سورس$") then
local text =  [[
❖
👋┇اهلا بك في سورس DEVIL

~طريقه آلتنصيب
⇊⇊⇊

`git clone https://github.com/markstg/MARKSTG.git && cd MARKSTG && chmod +x install.sh && ./install.sh`
——————————————
كود الرن
`./MARKSTG/mx`
——————————————
🔘┇انسخ الكود وخلي بلترمينال 
🔘┇ ورا ميكمل تنصيب حيطلب منك توكن البوت والايدي
🔘┇ااكتبهن ومبروك عليك التنصيب
➖➖➖➖➖ ➖➖➖➖➖
📜┋للاستفسار راسل المطور
🔘┋<a href="https://telegram.me/MARKS_TEAM">قناه السورس</a>
📁┇<a href="https://telegram.me/MARKS_TEAM">ملفات السورس</a>
🔎┇<a href="t.me/VIP_12K_BOT">بوت تواصل السورس</a> 
]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if text:match("^اريد رابط حذف$") or text:match("^رابط حذف$") or text:match("^رابط الحذف$") or text:match("^الرابط حذف$") or text:match("^اريد رابط الحذف$") then
local text =  [[
🗑┇رابط حذف التلي ، ⬇
‼┇قبل متحذف فكر ولتسرع بالتوفيق حياتي♥'
┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉ ┉
🔎┇<a href="https://telegram.org/deactivate">اضغط هنا للحذف الحساب" </a>
]]
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
end
end
function tdcli_update_callback(data)
local chat = {}
if (data.ID == "UpdateNewMessage") then
local Data_MARKSTG = data
msg = data.message_
text = msg.content_.text_
if database:get('MARKSTG:'..bot_id.."charge:"..msg.chat_id_) then
if (not is_mod(msg) and not is_vip(msg)) then 
print("~⊱ is member "..msg.sender_user_id_) 
if is_muted(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return "MARKSTG"
end
z_MARKSTG = TSCheckMsg(msg)
if z_MARKSTG and z_MARKSTG == "stop" then 
if database:get("lock_lllll:MARKSTG"..msg.chat_id_..bot_id) then
local hash = 'flood:MARKSTG:'..bot_id..msg.chat_id_
if not database:get(hash) then
floodMARKSTG = 10
else
floodMARKSTG = tonumber(database:get(hash))
end
local hash = 'MARKSTG:'..bot_id..'flood:time:'..msg.chat_id_
if not database:get(hash) then
floodTime = 1
else
floodTime = tonumber(database:get(hash))
end
if not is_vip(msg) then
if bot_id then
if not is_vip(msg) then
local hash = 'flood:'..msg.sender_user_id_..':'..msg.chat_id_..':msg-num'
local msgs = tonumber(database:get(hash) or 0)
if msgs > (floodMARKSTG - 1) then
local user = msg.sender_user_id_
local chat = msg.chat_id_
local channel = msg.chat_id_
local user_id = msg.sender_user_id_
local banned = is_banned(user_id, msg.chat_id_)
if banned then
else
local id = msg.id_
local msgs = {[0] = id}
local chat = msg.chat_id_
user_id = msg.sender_user_id_
o = database:get("MARKSTG:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
if (o and (tonumber(o) >= 5)) then
database:set("lock_media:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_audeo:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_video:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_photo:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_stecker:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_voice:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_gif:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_note:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_word:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_mark:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_link:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set("lock_new:MARKSTG"..msg.chat_id_..bot_id,"ok")
database:set('MARKSTG:'..bot_id..'get:photo'..msg.chat_id_,true)
send(msg.chat_id_, 0, 1, '⚠️┇تم كشف عمليه تخريب في المجموعة \n‼️┇وتم قفل الميديا وسيتم طرد جميع الاشخاص الذين يقومون بعمل تكرار', 1, 'md')
else
send(msg.chat_id_, msg.id_, 1, '📟┇الايدي ⌁≻*('..msg.sender_user_id_..')* \n❕┇قمت بعمل تكرار للمسجات المحدده\n☑┇وتم كتمك في المجموعه\n', 1, 'md')
end 
if (o and (tonumber(o) > 5)) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
end
database:incr("MARKSTG:spam:lock:"..os.date("%x")..bot_id..msg.chat_id_)
database:sadd('MARKSTG:'..bot_id..'muted:'..msg.chat_id_, msg.sender_user_id_)
end
end
database:setex(hash, floodTime, msgs+1)
end
end
end
end
return "MARKSTG"
end
end
if data.message_.content_.text_ then   
if database:get("MARKSTG:edit:text:su:new2:"..bot_id..data.message_.chat_id_..data.message_.content_.text_) then
local MARKSTG_edit_text = database:get("MARKSTG:edit:text:su:new2:"..bot_id..data.message_.chat_id_..data.message_.content_.text_)
if MARKSTG_edit_text then
data.message_.content_.text_ = MARKSTG_edit_text
end
end
end
local msg = data.message_
text = msg.content_.text_
if is_sudo(msg) then 
if database:get("MARKSTG:set_if_bc_new:"..bot_id..msg.sender_user_id_) then 
database:del("MARKSTG:set_if_bc_new:"..bot_id..msg.sender_user_id_)
local pro = database:scard('MARKSTG:'..bot_id..'pro:groups') or 0
if text then 
local gpss = database:smembers( 'MARKSTG:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('MARKSTG:'..bot_id..'pro:groups', gpss[i]) then
send(gpss[i], 0, 1, text, 1, 'html')		
end					
end
end
if (data.message_.content_.sticker_) then 
gpss = database:smembers( 'MARKSTG:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('MARKSTG:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendSticker(gpss[i], 0,0, 1, nil, data.message_.content_.sticker_.sticker_.persistent_id_)
end
end
elseif (data.message_.content_.voice_) then 
gpss = database:smembers( 'MARKSTG:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('MARKSTG:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendVoice(gpss[i], 0,0, 1, nil, data.message_.content_.voice_.voice_.persistent_id_)
end
end
elseif (data.message_.content_.video_) then 
gpss = database:smembers( 'MARKSTG:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('MARKSTG:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendVideo(gpss[i], 0,0, 1, nil, data.message_.content_.video_.video_.persistent_id_)
end
end
elseif (data.message_.content_.animation_) then 
gpss = database:smembers( 'MARKSTG:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('MARKSTG:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendDocument(gpss[i], 0,0, 1, nil, data.message_.content_.animation_.animation_.persistent_id_)
end
end
elseif (data.message_.content_.document_) then
gpss = database:smembers( 'MARKSTG:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('MARKSTG:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendDocument(gpss[i], 0,0, 1, nil, data.message_.content_.document_.document_.persistent_id_)
end
end
elseif (data.message_.content_.photo_) then
local id_markx = nil
if data.message_.content_.photo_.sizes_[0] then
id_markx = data.message_.content_.photo_.sizes_[0].photo_.persistent_id_
end
if data.message_.content_.photo_.sizes_[1] then
id_markx = data.message_.content_.photo_.sizes_[1].photo_.persistent_id_
end
if data.message_.content_.photo_.sizes_[2] then
id_markx = data.message_.content_.photo_.sizes_[2].photo_.persistent_id_
end	
if data.message_.content_.photo_.sizes_[3] then
id_markx = data.message_.content_.photo_.sizes_[3].photo_.persistent_id_
end
gpss = database:smembers( 'MARKSTG:'..bot_id.."groups") or 0
for i=1, #gpss do
if not database:sismember('MARKSTG:'..bot_id..'pro:groups', gpss[i]) then
tdcli.sendPhoto(gpss[i], 0, 0, 1, nil, id_markx,(msg.content_.caption_ or " "))
end					
end
end
gpss = database:smembers( 'MARKSTG:'..bot_id.."groups") or 0
send(msg.chat_id_, msg.id_, 1, '☑┇تم نشر الرساله في {'..(#gpss - pro)..'} مجموعه ', 1, 'md')
end
end
local markx1 = redis:get('MARKSTG:'..bot_id..'markx1'..msg.sender_user_id_..''..msg.chat_id_..'')
if markx1 == 're' then
local markx2 = redis:get('MARKSTG:'..bot_id..'msg'..msg.sender_user_id_..''..msg.chat_id_..'')
if text then 
redis:set('MARKSTG:'..bot_id..'markx'..markx2..''..msg.chat_id_..'', text)
elseif (data.message_.content_.sticker_) then 
redis:set('MARKSTG:'..bot_id..':sticker:'..markx2..''..msg.chat_id_..'', data.message_.content_.sticker_.sticker_.persistent_id_)
elseif (data.message_.content_.voice_) then 
redis:set('MARKSTG:'..bot_id..':voice:'..markx2..''..msg.chat_id_..'', data.message_.content_.voice_.voice_.persistent_id_)
elseif (data.message_.content_.video_) then 
redis:set('MARKSTG:'..bot_id..':video:'..markx2..''..msg.chat_id_..'', data.message_.content_.video_.video_.persistent_id_)
elseif (data.message_.content_.animation_) then 
redis:set('MARKSTG:'..bot_id..':gif:'..markx2..''..msg.chat_id_..'', data.message_.content_.animation_.animation_.persistent_id_)
elseif (data.message_.content_.document_) then
redis:set('MARKSTG:'..bot_id..':file:'..markx2..''..msg.chat_id_..'', data.message_.content_.document_.document_.persistent_id_)
else
end -- end if text 
redis:sadd('MARKSTG:'..bot_id..'markxre'..msg.chat_id_..'', markx2)
send(msg.chat_id_, msg.id_, 1, "☑┇تم حفظ الرد", 1, 'md')
redis:set('MARKSTG:'..bot_id..'markx1'..msg.sender_user_id_..''..msg.chat_id_..'', 'no')
end
local markx1 = redis:get('MARKSTG:'..bot_id..'markx1'..msg.sender_user_id_..'')
if markx1 == 're' then
local markx2 = redis:get('MARKSTG:'..bot_id..'msg'..msg.sender_user_id_..'')
if text then 
redis:set('MARKSTG:'..bot_id..'markx'..markx2..'', text)
elseif (msg.content_.sticker_) then 
redis:set('MARKSTG:'..bot_id..':sticker:'..markx2, msg.content_.sticker_.sticker_.persistent_id_)
elseif (msg.content_.voice_) then 
redis:set('MARKSTG:'..bot_id..':voice:'..markx2, msg.content_.voice_.voice_.persistent_id_)
elseif (msg.content_.video_) then 
redis:set('MARKSTG:'..bot_id..':video:'..markx2, msg.content_.video_.video_.persistent_id_)
elseif (msg..content_.animation_) then 
redis:set('MARKSTG:'..bot_id..':gif:'..markx2, data.message_.content_.animation_.animation_.persistent_id_)
elseif (msg.content_.document_) then
redis:set('MARKSTG:'..bot_id..':file:'..markx2, msg.content_.document_.document_.persistent_id_)
end
redis:sadd('MARKSTG:'..bot_id..'markxresudo', markx2)
send(msg.chat_id_, msg.id_, 1, "☑┇تم حفظ الرد", 1, 'md')
redis:set('MARKSTG:'..bot_id..'markx1'..msg.sender_user_id_..'', 'no')
end
--         ~⊱                 Run MARKSTG                         ««              --
if is_mod(msg) then TSlocks(msg) print("\27[1;34m~⊱ is mod "..msg.sender_user_id_.."\27[m") end
TSall(msg,data)
function check_username(extra,result,success)
local username = (result.username_ or '')
local svuser = 'MARKSTG:'..bot_id..'user:'..result.id_
if username then
database:hset(svuser, 'username', username)
end
end
getUser(msg.sender_user_id_,check_username)
if msg.content_.ID == "MessageChatAddMembers" then
database:incr('MARKSTG:'..bot_id..'user:add'..msg.chat_id_..':'..msg.sender_user_id_)
end
if msg.content_.ID == "MessageChatJoinByLink" then
function get_welcome(extra,result,success)
if database:get('MARKSTG:'..bot_id..'welcome:'..msg.chat_id_) then
text = database:get('MARKSTG:'..bot_id..'welcome:'..msg.chat_id_)
else
text = '👋🏻┇هلا وغلا  ؛ {fr}\n🙋🏼‍♂️┇نورك مشعشع الگروب @{us}'
end
local text = text:gsub('{fr}',(result.first_name_ or 'لا يوجد'))
local text = text:gsub('{ls}',(result.last_name_ or 'لا يوجد'))
local text = text:gsub('{us}',(result.username_ or 'لا يوجد'))
send(msg.chat_id_, msg.id_, 1, text, 1, 'html')
end
if database:get('MARKSTG:'..bot_id.."welcome"..msg.chat_id_) then
getUser(msg.sender_user_id_,get_welcome)
end end
if msg.content_.ID == "MessagePinMessage" then
if database:get('MARKSTG:'..bot_id..'pinnedmsg'..msg.chat_id_) and database:get("lock_pin:MARKSTG"..msg.chat_id_..bot_id) then
local pin_id = database:get('MARKSTG:'..bot_id..'pinnedmsg'..msg.chat_id_)
pin(msg.chat_id_,pin_id,0)
end
end
if msg.content_.document_ then
local infooo = database:get("addfiel"..msg.sender_user_id_)
if (infooo and infooo == "yes") then
send(msg.chat_id_, msg.id_, 1, "📤┇جاري تنصيب الملف ..", 1, 'html')
local id_markx = msg.content_.document_.document_.persistent_id_
function download_to_file(url, file_path)
local respbody = {}
local options = {
url = url,
sink = ltn12.sink.table(respbody),
redirect = true
}
local response = nil
options.redirect = false
response = {https.request(options)}
local code = response[2]
local headers = response[3]
local status = response[4]
if code ~= 200 then return false, code end
file = io.open(file_path, "w+")
file:write(table.concat(respbody))
file:close()
return file_path, code
end
local url_markx3 = 'https://api.telegram.org/bot' .. token .. '/getfile?file_id='..id_markx
local markx3 = https.request(url_markx3)
local markx6 = JSON.decode(markx3)
local photo_markx = download_to_file('https://api.telegram.org/file/bot'..token..'/'..markx6.result.file_path, 'files_MARKSTG/'..msg.content_.document_.file_name_)
send(msg.chat_id_, msg.id_, 1, "✔┇تم تنصيب الملف بنجاح", 1, 'html')
database:del("addfiel"..msg.sender_user_id_)
end
end
end
TSadd(msg)
if is_gbanned(msg.sender_user_id_, msg.chat_id_) then
chat_kick(msg.chat_id_, msg.sender_user_id_)
delete_msg(msg.chat_id_,{[0] = msg.id_})
return
end
if is_gmuted(msg.sender_user_id_, msg.chat_id_) then
delete_msg(msg.chat_id_,{[0] = msg.id_})
return
end
if is_sudo(msg) then TSsudo(msg) print("\27[1;32m~⊱ is sudo "..msg.sender_user_id_.."\27[m") end
id = tostring(msg.chat_id_)
if id and id:match('^(%d+)') then
database:sadd('MARKSTG:'..bot_id.."userss",msg.chat_id_)
end
MARKSTG_run_file(Data_MARKSTG)
--         ~⊱                 Start UpdateChat                         ««              --
elseif (data.ID == "UpdateChat") then
chat = data.chat_
chats[chat.id_] = chat
elseif (data.ID == "UpdateMessageEdited") then
local msg = data
function get_msg_contact(extra, result, success)
local text = (result.content_.text_ or result.content_.caption_)
local msgg = result 
database:incr('MARKSTG:'..bot_id..'user:editmsg'..msgg.chat_id_..':'..msgg.sender_user_id_)
if (not is_vip(msgg) and not text) then 
if database:get("MARKSTG:lo:edit:new:"..bot_id..msgg.chat_id_) then 
msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end
end
if (result.content_.caption_ and not is_vip(msgg)) then 
if (result.content_.caption_:match("(.*)@(.*)") or result.content_.caption_:match("@")) then 
if database:get("lock_username:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) 
end 
end 
end
if (not is_vip(msgg) and text) then
check_filter_words(result, text)
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link.note:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end
if text:match("[Tt][Ee][Ll][Ee][Gg][Rr][Aa][Mm].[Mm][Ee]") or
text:match("[Tt].[Mm][Ee]") or text:match("[Tt][Ll][Gg][Rr][Mm].[Mm][Ee]") or
text:match("[Tt][Ee][Ll][Ee][Ss][Cc][Oo].[Pp][Ee]") then
if database:get("lock_link.note:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if result.id_ and result.content_.text_ then
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") then
if database:get("lock_link:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end end 
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[Hh][Tt][Tt][Pp][Ss]://") or text:match("[Hh][Tt][Tt][Pp]://") or text:match(".[Ii][Rr]") or text:match(".[Cc][Oo][Mm]") or text:match(".[Oo][Rr][Gg]") or text:match(".[Ii][Nn][Ff][Oo]") or text:match("[Ww][Ww][Ww].") or text:match(".[Tt][Kk]") then
if database:get("lock_link.note:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs)
end end end end end
if result.id_ and result.content_.text_ then
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("(.*)(@)(.*)") then
if database:get("lock_username:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("@") then
if database:get("lock_username.note:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if result.id_ and result.content_.text_ then
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("#") then
if database:get("lock_tag:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("#") then
if database:get("lock_tag.note:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("/")  then
if database:get("lock_sarha:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("/")  then
if database:get("lock_sarha.note:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[\216-\219][\128-\191]") then
if database:get("lock_ar:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end  end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[\216-\219][\128-\191]") then
if database:get("lock_ar.note:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end  end
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end 
if not is_vip(msgg) then
check_filter_words(result, text)
if text:match("[ASDFGHJKLQWERTYUIOPZXCVBNMasdfghjklqwertyuiopzxcvbnm]") then
if database:get("lock_en.note:MARKSTG"..msg.chat_id_..bot_id) then
local msgs = {[0] = data.message_id_}
delete_msg(msg.chat_id_,msgs) end end end 
if not is_vip(msgg) then
check_filter_words(result, text)
if database:get("lock_edit:MARKSTG"..msg.chat_id_..bot_id) then
local id = msg.message_id_
local msgs = {[0] = id}
local chat = msg.chat_id_
delete_msg(chat,msgs) end end end end
getMessage(msg.chat_id_, msg.message_id_,get_msg_contact)
--         ~⊱                 End UpdateChat                          ««              --
elseif (data.ID == "UpdateOption" and data.name_ == "my_id") then
tdcli_function ({ID="GetChats", offset_order_="9223372036854775807", offset_chat_id_=0, limit_=20}, dl_cb, nil)
end
end

--[[
BY MARKS 
DEV @P_PPPP
CH > @MARKS_TEAM
CH > @LE_C4_KR
--]]
