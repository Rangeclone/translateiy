--[[
    Message Translator
    Made by Aim
    Credits to Riptxde for the sending chathook
--]]

if not game['Loaded'] then game['Loaded']:Wait() end; repeat wait(.06) until game:GetService('Players').LocalPlayer ~= nil

local YourLang = "en" -- Language code that the messages are going to be translated to
--local keys = {"trnsl.1.1.20171105T134956Z.795c7a0141d3061b.dc25bae76fa5740b2cdecb02396644dea58edd24", "trnsl.1.1.20180914T205319Z.b0ffef87e97badd3.e78787ec8a392b9772f8b8f56933b1d86463d330", "trnsl.1.1.20170410T181107Z.c28a1db45d8068d6.901d5ce86397ef466ed8dda0bbc6582bc840cda7", "trnsl.1.1.20130705T052930Z.27fcc82ff0c243be.c0e2f80d06217633cd117ad29131aff078a05530", "trnsl.1.1.20141123T002529Z.417145a2a99f3cca.6b7541014142f4b6ffdd9e7e46aa33cc176266a0", "trnsl.1.1.20141123T002340Z.2611ecba0f781c6c.b69c51344c53ff99342f75f37c25d9b23f7cb69f", "trnsl.1.1.20141123T002156Z.7b21abc3a324f822.a2f635970ba2d7b9fb3cc3815a7865e6910a2cad", "trnsl.1.1.20141123T002002Z.3f78ce23219e1465.df6127f6ff3c994436ef7953810a5b1617e3729a", "trnsl.1.1.20141123T001812Z.84fb26b9259f7f81.1a5a939ccfcdca6aad0868a95922530f50e7ad18", "trnsl.1.1.20141123T001643Z.a8b4bc882d660a46.6591690f2dca475d980414ccc77bd924abbc5f59", "trnsl.1.1.20141123T001508Z.c93b9683082a0f10.c0fa1bcc7c6405468621ef0ab7825cc445f7b3a6", "trnsl.1.1.20141123T001332Z.ff87353d0d4f9796.9d2d2d8e8517a847fa7472da126cc1e3ea164b10", "trnsl.1.1.20141123T001119Z.6b89f91f93c01011.0656c27e7224deadd83f86cd9591f6de284e614e", "trnsl.1.1.20141122T235745Z.4226df9020248357.2e4bbec6091eec12933f18115030b22297aedbe0", "trnsl.1.1.20141122T232750Z.26e49e2ee63c6998.135c1a4bce18427d17e9de0dff65c1307f9886c6", "trnsl.1.1.20141122T232108Z.ca7e2c03d1e66432.1f8270332e9d6fbd4a651e6309cf0e3f04b3648c", "trnsl.1.1.20141122T231521Z.afd069226e89ac2b.32ccdad22bc80b4cc3aa9fc2dfbb755bcae8bdbc", "trnsl.1.1.20141122T231058Z.cddc48558c86a186.029866c45c9bb0fca8d84b16f718d42e63d0804c", "trnsl.1.1.20141122T230616Z.1d64ca451625b543.7a3eec3823594f18524d6fe5c4a74c91ebff1aaa", "trnsl.1.1.20141122T230351Z.6d6cdc0f8a3d27a7.b0181b97e5ab53b7d0f7f777adaa450bdb44138c", "trnsl.1.1.20141122T230127Z.8a52a3b34d53cff5.33a9d17a187293b56e0957a0735ac387760d9d44", "trnsl.1.1.20141122T225804Z.56df9be112260d4d.5f897339fc421e7220bcfd724e01312bebf11251", "trnsl.1.1.20141122T225550Z.7355466038a9d515.5f591207e2af04249b795fbcb6643314c9a8ebdb", "trnsl.1.1.20141122T224900Z.af0389d255b83fb5.0dec7ea67ecbfca7b23b71d46e764a6835bbeae2", "trnsl.1.1.20141122T222911Z.f24646ec12fac560.f7eaa478325036b2c61f6a73ea39019412009485", "trnsl.1.1.20130811T164454Z.2facd8a3323b8111.e9f682063308aff12357de3c8a3260d6d6b71be7", "trnsl.1.1.20191105T220926Z.e747b96073e3c078.eaa300fca7f8ec15dbe6b87c84bc08925108275c", "trnsl.1.1.20170306T191951Z.66a368c52394039f.dac56045246cb91aa8da797d95dcfff798ba92f5", "trnsl.1.1.20200331T110242Z.9b513b0ed4f09237.33aec5c62db6c59d166b2d087085a48984c5e773", "trnsl.1.1.20190906T170533Z.2cdef571e4680794.3161998ff0a03702bffae1c9b1c6f5cfbd84a682", "trnsl.1.1.20200110T122307Z.0eab94a550695b16.851da33dae66e111a419c298ea04bbc64e9889cd", "trnsl.1.1.20200331T111658Z.debed69e977278e3.dc2212dc94324502e515153f8f706e70bfe9f323", "trnsl.1.1.20140119T122840Z.153993016d57a615.f959b90b06978b08dc59023e9f65ce02a8b81f17", "trnsl.1.1.20150216T113622Z.2ccb71d878ea0b58.5ac57322acecfa2d9001aad077fdcff21c206a43", "trnsl.1.1.20180503T101109Z.694928645d383920.68498c0926394e473a3fc3bb29194916fe09b118", "trnsl.1.1.20161230T113443Z.c46137935849d611.44c71c4e34ea5618addde835abddc4764bce0b5a", "trnsl.1.1.20190216T132508Z.f1854d20e242d1e3.92c6cb5a77545e536733b937079ba848f7017418", "trnsl.1.1.20190804T193438Z.2e1624971a28a333.3fb172aad0c334f981944c667a72b722c2c68382", "trnsl.1.1.20151103T231043Z.0a5368c915d3f2ea.1906616d49e10cfd99e499e1884cbc175178f28b", "trnsl.1.1.20130922T110455Z.4a9208e68c61a760.f819c1db302ba637c2bea1befa4db9f784e9fbb8", "trnsl.1.1.20140416T142106Z.337f3a5fe0789188.a30b8218d03f462842c2a23f22885f5757d6cfb8", "trnsl.1.1.20170517T154730Z.927d87b76de60242.7a92e4612778a4838d40ab192df5297d2a1af4ed", "trnsl.1.1.20200213T120753Z.2bcf4f729804ba6d.405e39125b71e57795f390ab765e5b052acf2be8"}
--local key = keys[math.random(#keys)] -- Sets your API key to a random one.

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

properties.Text = "[TR] To send messages in a language, say > followed by the target language/language code, e.g.: >ru or >russian. To disable (go back to original language), say >d."
StarterGui:SetCore("ChatMakeSystemMessage", properties)

-- See if selected API key is working, and if not, get a new one.
function test()
	game:HttpGetAsync("https://libretranslate.de/detect?q=hello")
end
--[[local s, e = pcall(test)
while not s do
	print("Error: "..e)
	key = keys[math.random(#keys)]
	wait()
	s, e = pcall(test)
end--]]

function translateFrom(message)
	local URL = "https://libretranslate.de/detect?q="..HttpService:UrlEncode(message)
	local lang = HttpService:JSONDecode(game:HttpGetAsync(URL))[1].language
	local translation
	if lang and lang ~= YourLang then
		--local URL = "https://translate.yandex.net/api/v1.5/tr.json/translate?key="..key.."&text="..HttpService:UrlEncode(message).."&lang="..lang.."-"..YourLang
		local URL = "https://libretranslate.de/translate?q="..HttpService:UrlEncode(message).."&source="..lang.."&target="..YourLang.."&format=text"
		translation = HttpService:JSONDecode(game:HttpGetAsync(URL)).translatedText
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
	local URL = "https://libretranslate.de/detect?q="..HttpService:UrlEncode(message)
	local lang = HttpService:JSONDecode(game:HttpGetAsync(URL))[1].language
	local translation
	if lang and lang ~= target then
		--local URL = "https://translate.yandex.net/api/v1.5/tr.json/translate?key="..key.."&text="..HttpService:UrlEncode(message).."&lang="..lang.."-"..target
		local URL = "https://libretranslate.de/translate?q="..HttpService:UrlEncode(message).."&source="..lang.."&target="..target.."&format=text"
		translation = HttpService:JSONDecode(game:HttpGetAsync(URL)).translatedText
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