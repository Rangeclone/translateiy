--[[
    Message Translator
    Made by Aim
    Credits to Riptxde for the sending chathook
	Modder0Source - fixing API and optomization
--]]

if not game['Loaded'] then game['Loaded']:Wait() end; repeat wait(.06) until game:GetService('Players').LocalPlayer ~= nil

local YourLang = "en" -- Language code that the messages are going to be translated to


local Players = game:GetService("Players")
local LP = Players.LocalPlayer
local StarterGui = game:GetService('StarterGui')
for i=1, 15 do
    local r = pcall(StarterGui["SetCore"])
    if r then break end
    game:GetService('RunService').RenderStepped:wait()
end
wait()

local HttpService = game:GetService("HttpService")
local properties = {
    Color = Color3.new(1,1,0);
    Font = Enum.Font.SourceSansItalic;
    TextSize = 16;
}

game:GetService("StarterGui"):SetCore("SendNotification",
    {
        Title = "Chat Translator",
        Text = "Bug Fix",
        Duration = 3
    }
)
                  
properties.Text = "[V2] [TR] To send messages in a language, say > followed by the target language/language code, e.g.: >ru or >russian. To disable (go back to original language), say >d."
StarterGui:SetCore("ChatMakeSystemMessage", properties)

-- See if selected API key is working, and if not, get a new one.
--[[function test()
    game:HttpGetAsync("https://translate.yandex.net/api/v1.5/tr.json/detect?key="..key.."&text=h")
end
local s, e = pcall(test)
while not s do
    print("Error: "..e)
    key = keys[math.random(#keys)]
    wait()
    s, e = pcall(test)
end--]]

function translateFrom(message)
    local URL = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=de&dt=t&dj=1&source=input&q="..HttpService:UrlEncode(message)
    local lang = HttpService:JSONDecode(game:HttpGetAsync(URL)).src
    local translation
    if lang and lang ~= YourLang then
	local URL = "https://translate.googleapis.com/translate_a/single?client=gtx&sl="..lang.."&tl="..YourLang.."&dt=t&dj=1&source=input&q="..HttpService:UrlEncode(message)
        translation = HttpService:JSONDecode(game:HttpGetAsync(URL)).sentences[1].trans
    end
    return {translation, lang}
end

function get(plr, msg)
    local tab = translateFrom(msg)
    local translation = tab[1]
    if translation then
        properties.Text = "("..tab[2]:upper()..") ".."[".. plr.Name .."]: "..translation
        StarterGui:SetCore("ChatMakeSystemMessage", properties)
    end
end

for i, plr in ipairs(Players:GetPlayers()) do
    plr.Chatted:Connect(function(msg)
        get(plr, msg)
    end)
end
Players.PlayerAdded:Connect(function(plr)
    plr.Chatted:Connect(function(msg)
        get(plr, msg)
    end)
end)

-- Language Dictionary
local l = {afrikaans = "af",albanian = "sq",amharic = "am",arabic = "ar",armenian = "hy",azerbaijani = "az",bashkir = "ba",basque = "eu",belarusian = "be",bengal = "bn",bosnian = "bs",bulgarian = "bg",burmese = "my",catalan = "ca",cebuano = "ceb",chinese = "zh",croatian = "hr",czech = "cs",danish = "da",dutch = "nl",english = "en",esperanto = "eo",estonian = "et",finnish = "fi",french = "fr",galician = "gl",georgian = "ka",german = "de",greek = "el",gujarati = "gu",creole = "ht",hebrew = "he",hillmari = "mrj",hindi = "hi",hungarian = "hu",icelandic = "is",indonesian = "id",irish = "ga",italian = "it",japanese = "ja",javanese = "jv",kannada = "kn",kazakh = "kk",khmer = "km",kirghiz = "ky",korean = "ko",laotian = "lo",latin = "la",latvian = "lv",lithuanian = "lt",luxembourg = "lb",macedonian = "mk",malagasy = "mg",malayalam = "ml",malay = "ms",maltese = "mt",maori = "mi",marathi = "mr",mari = "mhr",mongolian = "mn",nepalese = "ne",norwegian = "no",papiamento = "pap",persian = "fa",polish = "pl",portuguese = "pt",punjabi = "pa",romanian = "ro",russian = "ru",scottish = "gd",serbian = "sr",sinhalese = "si",slovak = "sk",slovenian = "sl",spanish = "es",sundanese = "su",swahili = "sw",swedish = "sv",tagalog = "tl",tajik = "tg",tamil = "ta",tartar = "tt",telugu = "te",thai = "th",turkish = "tr",udmurt = "udm",ukrainian = "uk",urdu = "ur",uzbek = "uz",vietnamese = "vi",welsh = "cy",xhosa = "xh",yiddish = "yi"}

local sendEnabled = false
local target = ""

function translateTo(message, target)
    target = target:lower()
    if l[target] then target = l[target] end
    local URL = "https://translate.googleapis.com/translate_a/single?client=gtx&sl=auto&tl=de&dt=t&dj=1&source=input&q="..HttpService:UrlEncode(message)
    local lang = HttpService:JSONDecode(game:HttpGetAsync(URL)).src
    local translation
    if lang and lang ~= target then
       local URL = "https://translate.googleapis.com/translate_a/single?client=gtx&sl="..lang.."&tl="..target.."&dt=t&dj=1&source=input&q="..HttpService:UrlEncode(message)
        translation = HttpService:JSONDecode(game:HttpGetAsync(URL)).sentences[1].trans
    end
    return translation
end

function disableSend()
    sendEnabled = false
    properties.Text = "[TR] Sending Disabled"
    StarterGui:SetCore("ChatMakeSystemMessage", properties)
end

local CBar, CRemote, Connected = LP['PlayerGui']:WaitForChild('Chat')['Frame'].ChatBarParentFrame['Frame'].BoxFrame['Frame'].ChatBar, game:GetService('ReplicatedStorage').DefaultChatSystemChatEvents['SayMessageRequest'], {}

local HookChat = function(Bar)
    coroutine.wrap(function()
        if not table.find(Connected,Bar) then
            local Connect = Bar['FocusLost']:Connect(function(Enter)
                if Enter ~= false and Bar['Text'] ~= '' then
                    local Message = Bar['Text']
                    Bar['Text'] = '';
                    if Message == ">d" then
                        disableSend()
                    elseif Message:sub(1,1) == ">" and not Message:find(" ") then
                        sendEnabled = true
                        target = Message:sub(2)
			properties.Text = "[TR] Target set to: "..target
    			StarterGui:SetCore("ChatMakeSystemMessage", properties)
                    elseif sendEnabled then
                        Message = translateTo(Message, target)
                        game:GetService('Players'):Chat(Message); CRemote:FireServer(Message,'All')
                    else
                        game:GetService('Players'):Chat(Message); CRemote:FireServer(Message,'All')
                    end
                end
            end)
            Connected[#Connected+1] = Bar; Bar['AncestryChanged']:Wait(); Connect:Disconnect()
        end
    end)()
end

HookChat(CBar); local BindHook = Instance.new('BindableEvent')

local MT = getrawmetatable(game); local NC = MT.__namecall; setreadonly(MT, false)

MT.__namecall = newcclosure(function(...)
    local Method, Args = getnamecallmethod(), {...}
    if rawequal(tostring(Args[1]),'ChatBarFocusChanged') and rawequal(Args[2],true) then 
        if LP['PlayerGui']:FindFirstChild('Chat') then
            BindHook:Fire()
        end
    end
    return NC(...)
end)

BindHook['Event']:Connect(function()
    CBar = LP['PlayerGui'].Chat['Frame'].ChatBarParentFrame['Frame'].BoxFrame['Frame'].ChatBar
    HookChat(CBar)
end)
