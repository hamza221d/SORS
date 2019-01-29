--[[
BY MARKS 
DEV @P_PPPP
CH > @MARKS_TEAM
CH > @LE_C4_KR
--]]
--------------------------------------
local function keko_MARKSTG(data)
    local msg = data.message_
    redis = (loadfile "./libs/redis.lua")()
    database = Redis.connect('127.0.0.1', 6379)
    sudos = dofile('sudo.lua')
    JSON = (loadfile  "./libs/dkjson.lua")()
    bot_id_keko = {string.match(token, "^(%d+)(:)(.*)")}
    bot_id = tonumber(bot_id_keko[1])
    local function openChat(chat_id,dl_cb)
    tdcli_function ({
    ID = "GetChat",
    chat_id_ = chat_id
    }, dl_cb, nil)
    end
    function getUser(user_id, cb)
    tdcli_function ({
    ID = "GetUser",
    user_id_ = user_id
    }, cb, nil)
    end
    local function send(chat_id, reply_to_message_id, disable_notification, text, disable_web_page_preview, parse_mode)
    local TextParseMode = {ID = "TextParseModeMarkdown"}
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
    },
    }, dl_cb, nil)
    end
    if msg.content_.ID == "MessageChatDeleteMember" and tonumber(msg.content_.user_.id_) == tonumber(bot_id) then 
    database:srem("thsake:gog"..bot_id, msg.chat_id_)
    database:del('MARKSTG:'..bot_id.."charge:"..msg.chat_id_)
    function TSby(extra,result,success)
    function thsake_info2(k1,k2)
    function dl_cb222(t1,t2)
    send(tostring((database:get("MARKSTG"..bot_id..":sudo:gr") or sudo_add)), 0, 1, "🔘┇قام بطرد البوت من المجموعه \n🎫┇ايدي الشخص ~⪼ ("..msg.sender_user_id_..")\n📜┇معرف الشخص ~⪼ @"..(result.username_ or "لا يوجد").."\n🌐┇معلومات المجموعه \n\n🎫┇ايدي المجموعه ~⪼ ("..msg.chat_id_..")\nⓂ️┇اسم المجموعه ~⪼ ("..k2.title_..")\n📎┇رابط المجموعه ~⪼ ["..(t2.invite_link_ or database:get('MARKSTG:'..bot_id.."group:link"..msg.chat_id_) or "لا يمكنني الوصول الى الرابط").."]" , 1, 'html')
    end
    tdcli_function ({
    ID = "GetChannelFull",
    channel_id_ = getChatId(msg.chat_id_).ID
    }, dl_cb222, nil)
    end
    openChat(msg.chat_id_,thsake_info2) 
    end
    getUser(msg.sender_user_id_, TSby)
    end 
    end
    return {
        keko_MARKSTG = keko_MARKSTG,
    }
    --[[
--[[
BY MARKS 
DEV @P_PPPP
CH > @MARKS_TEAM
CH > @LE_C4_KR
--]]
--------------------------------------