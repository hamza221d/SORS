--[[
BY MARKS 
DEV @P_PPPP
CH > @MARKS_TEAM
CH > @LE_C4_KR
--]]
--------------------------------------
sudo_SORS = dofile("sudo.lua")
https = require("ssl.https")
JSON = dofile("./libs/JSON.lua")
local SORS_dev = io.open("SORS_online.lua")
if SORS_dev then
SORS_on = {string.match(SORS_dev:read('*all'), "^(.*)/(%d+)")}
local SORS_file = io.open("sudo.lua", 'w')
SORS_file:write("token = '" ..SORS_on[1].."'\n\nsudo_add = "..SORS_on[2].."" )
SORS_file:close()
https.request("https://api.telegram.org/bot"..SORS_on[1].."/sendMessage?chat_id="..SORS_on[2].."&text=Bot_SORS_is_start_new")
os.execute('cd .. && rm -rf .telegram-cli')
os.execute('rm -rf SORS_online.lua')  
os.execute('./tg -s ./SORS.lua $@ --bot='..SORS_on[1])
end
function chack(tokenCk)
local getme = "https://api.telegram.org/bot" ..tokenCk.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
print("\27[31m✓ تم\27[m \27[1;34m»»ارسل ايدي المطور الاساسي««\27[m")
local sudo_send  = io.read()
print("\27[31m✓ تم\27[m")
local SORS_file = io.open("sudo.lua", 'w')
SORS_file:write("token = '" ..tokenCk.."'\n\nsudo_add = "..sudo_send.."" )
SORS_file:close()
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
os.execute('./tg -s ./SORS.lua $@ --bot='..tokenCk)
else
print("\27[31m»»التوكن غير صحيح , اعد ارسال التوكن««\27[m")
local token_send = io.read()
chack(token_send)
end
end
os.execute('cd .. && rm -rf .telegram-cli')
if token and token == "TOKEN" then 
print("\27[1;34m»»ارسل توكن البوت««\27[m")
local token_send = io.read()
chack(token_send)
else 
os.execute('cd .. && rm -fr .telegram-cli')
os.execute('cd && rm -fr .telegram-cli')
sudo_SORS = dofile("sudo.lua")
local getme = "https://api.telegram.org/bot" ..token.. '/getme'
local req = https.request(getme)
local data = JSON:decode(req)
if data.ok == true then
os.execute('./tg -s ./SORS.lua $@ --bot='..token)
else
print("\27[31mالتوكن غير صيح , اعد ارسال التوكن««\27[m")
local token_send = io.read()
chack(token_send)
end
end
--[[
BY MARKS 
DEV @P_PPPP
CH > @MARKS_TEAM
CH > @LE_C4_KR
--]]
--------------------------------------