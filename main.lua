if getgenv().Library then
	pcall(function() getgenv().Library:Unload() end)
end

local repo = "https://raw.githubusercontent.com/femboyhub435/Obsidian/main/"
local lib = loadstring(game:HttpGet(repo .. "Library.lua"))()
local thm = loadstring(game:HttpGet(repo .. "addons/ThemeManager.lua"))()
local sav = loadstring(game:HttpGet(repo .. "addons/SaveManager.lua"))()

local opt = lib.Options
local tog = lib.Toggles

lib.ForceCheckbox = false
lib.ShowToggleFrameInKeybinds = true

local w = lib:CreateWindow({
	Title = "mspaint",
	Footer = "femboyhub",
	Icon = 95816097006870,
	NotifySide = "Right",
	ShowCustomCursor = true,
})

local tabs = {
	Combat = w:AddTab("Combat", "swords"),
	ESP = w:AddTab("ESP", "eye"),
	Generator = w:AddTab("Generator", "cpu"),
	Stamina = w:AddTab("Stamina", "zap"),
	Killer = w:AddTab("Killer", "skull"),
	JaneDoe = w:AddTab("Jane Doe", "gem"),
	Evil = w:AddTab("Evil", "flame"),
	["UI Settings"] = w:AddTab("UI Settings", "settings"),
}

local cbGb = tabs.Combat:AddLeftGroupbox("Combat Settings")

cbGb:AddToggle("AutoBlock", {
	Text = "Auto Block",
	Default = false,
})

cbGb:AddToggle("FacingCheck", {
	Text = "Facing Check",
	Default = true,
})

cbGb:AddToggle("SmartFacing", {
	Text = "Smart Facing",
	Default = true,
})

cbGb:AddSlider("VisionAngle", {
	Text = "Vision Angle",
	Default = 135,
	Min = 45,
	Max = 220,
	Rounding = 0,
})

cbGb:AddToggle("WallCheck", {
	Text = "Wall Check",
	Default = true,
})

cbGb:AddDropdown("AntiBaitMethod", {
	Values = {"Better", "Better Better", "Blatant"},
	Default = "Better",
	Multi = false,
	Text = "Anti Bait Method",
})

cbGb:AddToggle("AntiBait", {
	Text = "Anti Bait",
	Default = true,
})

cbGb:AddSlider("BlockReact", {
	Text = "Reaction Time",
	Default = 0.15,
	Min = 0,
	Max = 0.5,
	Rounding = 2,
})

cbGb:AddToggle("ShowIndicator", {
	Text = "Show Attack Indicator",
	Default = true,
})

cbGb:AddToggle("AttackIndicator", {
	Text = "Attack Indicator",
	Default = false,
})

cbGb:AddToggle("BaitLunge", {
	Text = "Bait Lunge",
	Default = false,
})

cbGb:AddSlider("BaitLungeSpeed", {
	Text = "Bait Lunge Speed",
	Default = 160,
	Min = 50,
	Max = 400,
	Rounding = 0,
})

cbGb:AddToggle("LegitLunge", {
	Text = "Legit Lunge",
	Default = false,
})

cbGb:AddSlider("LegitLungeSpeed", {
	Text = "Legit Lunge Speed",
	Default = 27.5,
	Min = 16,
	Max = 30,
	Rounding = 1,
})

cbGb:AddToggle("HitboxShake", {
	Text = "Hitbox Shake",
	Default = false,
})

cbGb:AddToggle("AutoPunch", {
	Text = "Auto Punch",
	Default = false,
})

cbGb:AddSlider("PunchDelay", {
	Text = "Punch Delay",
	Default = 0.3,
	Min = 0.05,
	Max = 1.0,
	Rounding = 2,
})

cbGb:AddToggle("PunchAutoFace", {
	Text = "Punch Auto Face",
	Default = true,
})

cbGb:AddToggle("PunchAimbot", {
	Text = "Punch Aimbot",
	Default = false,
})

cbGb:AddToggle("VisualFOV", {
	Text = "Visual FOV",
	Default = false,
}):AddColorPicker("FOVColor", {
	Default = Color3.fromRGB(255, 0, 0),
	Title = "FOV Color",
})

cbGb:AddDropdown("BlockPartType", {
	Values = {"Sphere", "Flat", "Cone"},
	Default = "Sphere",
	Multi = false,
	Text = "FOV Shape",
})

cbGb:AddSlider("FOVSize", {
	Text = "FOV Size",
	Default = 15,
	Min = 5,
	Max = 100,
	Rounding = 1,
})

cbGb:AddSlider("FOVTrans", {
	Text = "FOV Transparency",
	Default = 0.85,
	Min = 0,
	Max = 1,
	Rounding = 2,
})

local espGb = tabs.ESP:AddLeftGroupbox("Player ESP")

espGb:AddToggle("ESPEnabled", {
	Text = "Enable ESP",
	Default = true,
})

espGb:AddToggle("ESPHighlight", {
	Text = "Highlight ESP",
	Default = true,
})

espGb:AddToggle("ESPBillboards", {
	Text = "Billboard Info",
	Default = true,
})

espGb:AddToggle("ESPNames", {
	Text = "Show Names",
	Default = true,
})

espGb:AddToggle("ESPHealth", {
	Text = "Show Health",
	Default = true,
})

espGb:AddToggle("ESPDistance", {
	Text = "Show Distance",
	Default = true,
})

espGb:AddToggle("ESPTracer", {
	Text = "Tracers",
	Default = false,
})

espGb:AddSlider("ESPHighlightFillTrans", {
	Text = "Fill Transparency",
	Default = 0.5,
	Min = 0,
	Max = 1,
	Rounding = 2,
})

espGb:AddSlider("ESPHighlightOutlineTrans", {
	Text = "Outline Transparency",
	Default = 0,
	Min = 0,
	Max = 1,
	Rounding = 2,
})

local espColGb = tabs.ESP:AddRightGroupbox("ESP Colors")

espColGb:AddLabel("Killer Color"):AddColorPicker("ESPKillerColor", {
	Default = Color3.fromRGB(255, 30, 30),
	Title = "Killer Color",
})

espColGb:AddLabel("Survivor Color"):AddColorPicker("ESPSurvivorColor", {
	Default = Color3.fromRGB(0, 160, 255),
	Title = "Survivor Color",
})

local dcEspGb = tabs.ESP:AddRightGroupbox("Document ESP")

dcEspGb:AddToggle("ShowDocESP", {
	Text = "Show Documents",
	Default = false,
})

dcEspGb:AddLabel("Document Color"):AddColorPicker("DocESPColor", {
	Default = Color3.fromRGB(255, 0, 0),
	Title = "Document Color",
})

local gnEspGb = tabs.ESP:AddRightGroupbox("Generator ESP")

gnEspGb:AddToggle("ShowGenESP", {
	Text = "Show Generators",
	Default = false,
})

gnEspGb:AddLabel("Generator Color"):AddColorPicker("GenESPColor", {
	Default = Color3.fromRGB(255, 200, 50),
	Title = "Generator Color",
})

local genGb = tabs.Generator:AddLeftGroupbox("Auto Solve")

genGb:AddToggle("FlowAutoSolve", {
	Text = "Auto Solve Flow",
	Default = false,
})

genGb:AddSlider("FlowNodeSpeed", {
	Text = "Node Speed",
	Default = 0.04,
	Min = 0.01,
	Max = 0.50,
	Rounding = 2,
})

genGb:AddSlider("FlowLinePause", {
	Text = "Line Pause",
	Default = 0.60,
	Min = 0.00,
	Max = 1.00,
	Rounding = 2,
})

local stGb = tabs.Stamina:AddLeftGroupbox("Stamina Settings")

stGb:AddToggle("InfStamina", {
	Text = "Inf Stamina",
	Default = false,
})

stGb:AddToggle("FastRegen", {
	Text = "Fast Regen",
	Default = false,
})

stGb:AddSlider("MaxStamina", {
	Text = "Max Stamina",
	Default = 100,
	Min = 100,
	Max = 1000,
	Rounding = 0,
})

stGb:AddSlider("StaminaGain", {
	Text = "Stamina Gain",
	Default = 15,
	Min = 1,
	Max = 500,
	Rounding = 0,
})

local klrGb = tabs.Killer:AddLeftGroupbox("Killer Auto M1")

klrGb:AddToggle("KillerAutoM1", {
	Text = "Auto M1 (Trigger M1)",
	Default = false,
})

klrGb:AddSlider("KillerM1Dist", {
	Text = "Trigger Distance",
	Default = 12,
	Min = 4,
	Max = 25,
	Rounding = 1,
})

klrGb:AddSlider("KillerM1Delay", {
	Text = "M1 Cooldown",
	Default = 0.4,
	Min = 0.05,
	Max = 1.5,
	Rounding = 2,
})

klrGb:AddToggle("KillerM1Facing", {
	Text = "Facing Check",
	Default = true,
})

klrGb:AddToggle("KillerAutoFace", {
	Text = "Auto Face",
	Default = false,
})

local noliGb = tabs.Killer:AddRightGroupbox("Noli Void Rush")

noliGb:AddToggle("NoliVoidRushControl", {
	Text = "Free Steering",
	Default = false,
})

noliGb:AddToggle("NoliAimbot", {
	Text = "Void Rush Aimbot",
	Default = false,
})

noliGb:AddDropdown("NoliAimMode", {
	Values = {"Pathfind Around Walls", "Direct Lock"},
	Default = "Pathfind Around Walls",
	Multi = false,
	Text = "Aimbot Mode",
})

noliGb:AddSlider("NoliAimRange", {
	Text = "Aimbot Range",
	Default = 300,
	Min = 50,
	Max = 1000,
	Rounding = 0,
})

noliGb:AddToggle("NoliAimbotAutoFace", {
	Text = "Camera Lock",
	Default = true,
})

noliGb:AddSlider("NoliTurnSpeed", {
	Text = "Turn Multiplier",
	Default = 10,
	Min = 1,
	Max = 50,
	Rounding = 1,
})

noliGb:AddToggle("NoliCameraSteer", {
	Text = "Camera Steer",
	Default = true,
})

noliGb:AddToggle("NoliInstantTurn", {
	Text = "Instant Turn",
	Default = true,
})

noliGb:AddToggle("NoliInfiniteTurnDuration", {
	Text = "Infinite Turn",
	Default = true,
})

noliGb:AddToggle("NoliFastCharge", {
	Text = "Instant Charge",
	Default = false,
})

noliGb:AddToggle("NoliInfiniteDash", {
	Text = "Infinite Dash",
	Default = false,
})

noliGb:AddSlider("NoliDashSpeed", {
	Text = "Dash Speed",
	Default = 60,
	Min = 60,
	Max = 160,
	Rounding = 0,
})

local noliGb2 = tabs.Killer:AddLeftGroupbox("Noli Abilities")

noliGb2:AddToggle("NoliFastAttacks", {
	Text = "No Attack Endlag",
	Default = false,
})

noliGb2:AddToggle("NoliFastNova", {
	Text = "Fast Nova",
	Default = false,
})

noliGb2:AddToggle("NoliFastTeleport", {
	Text = "Instant Teleport",
	Default = false,
})

local jdGb = tabs.JaneDoe:AddLeftGroupbox("Crystal Auto-Fire")

jdGb:AddToggle("JDEnabled", {
	Text = "Enable Crystal Aimbot",
	Default = false,
})

jdGb:AddToggle("JDAimbot", {
	Text = "Silent Aim",
	Default = false,
})

jdGb:AddToggle("JDAutoFace", {
	Text = "Auto Face",
	Default = true,
})

jdGb:AddToggle("JDFOVCheck", {
	Text = "FOV Check",
	Default = true,
})

jdGb:AddSlider("JDAimOffset", {
	Text = "Aim Offset",
	Default = -3,
	Min = -5,
	Max = 5,
	Rounding = 1,
})

jdGb:AddSlider("JDPrediction", {
	Text = "Prediction",
	Default = 5,
	Min = 0,
	Max = 10,
	Rounding = 1,
})

jdGb:AddToggle("JDShowFOV", {
	Text = "FOV Circle",
	Default = false,
})

jdGb:AddSlider("JDFOVRadius", {
	Text = "FOV Radius",
	Default = 120,
	Min = 10,
	Max = 500,
	Rounding = 0,
})

jdGb:AddLabel("FOV Color"):AddColorPicker("JDFOVColor", {
	Default = Color3.fromRGB(255, 100, 0),
	Title = "FOV Color",
})

local jdGb2 = tabs.JaneDoe:AddRightGroupbox("Axe Lock")

jdGb2:AddToggle("JDAxe", {
	Text = "Axe Lock",
	Default = false,
})

jdGb2:AddSlider("JDAxeDur", {
	Text = "Lock Duration",
	Suffix = "s",
	Default = 2,
	Min = 0.5,
	Max = 10,
	Rounding = 1,
})

local jdGb3 = tabs.JaneDoe:AddLeftGroupbox("Forever Hold")

jdGb3:AddToggle("JDForeverHold", {
	Text = "Forever Hold",
	Default = false,
})

local jdGb4 = tabs.JaneDoe:AddRightGroupbox("LeBron Shoot")

jdGb4:AddToggle("JDLebron", {
	Text = "LeBron Shoot",
	Default = false,
})

local evGb = tabs.Evil:AddLeftGroupbox("Desync")

evGb:AddToggle("FakePos", {
	Text = "Fake Position",
	Default = false,
})

evGb:AddDropdown("FakePosMode", {
	Values = {"In Air", "Random Shake", "Underground"},
	Default = "In Air",
	Multi = false,
	Text = "Desync Mode",
})

evGb:AddSlider("FakePosY", {
	Text = "Height Offset",
	Default = 200,
	Min = 50,
	Max = 500,
	Rounding = 0,
})

evGb:AddSlider("FakePosShakeRadius", {
	Text = "Shake Radius",
	Default = 15,
	Min = 3,
	Max = 50,
	Rounding = 1,
})

tog.FakePos:OnChanged(function(on)
	if not on then
		task.spawn(function()
			local char = lp.Character
			local hrp = char and char:FindFirstChild("HumanoidRootPart")
			if hrp and netMod and netMod.FireServerConnection then
				pcall(function()
					netMod:FireServerConnection(1, "UREMOTE_EVENT", {
						Position = hrp.Position,
						CFrame = hrp.CFrame,
						Velocity = hrp.AssemblyLinearVelocity,
					})
				end)
			end
		end)
	end
end)

local mnGb = tabs["UI Settings"]:AddLeftGroupbox("Menu")
mnGb:AddButton("Unload", function() lib:Unload() end)
mnGb:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
	Default = "End",
	NoUI = true,
	Text = "Menu bind",
})
lib.ToggleKeybind = opt.MenuKeybind

local tgGb = tabs["UI Settings"]:AddRightGroupbox("Menu Settings")
tgGb:AddToggle("WatermarkToggle", {
	Text = "Show Watermark",
	Default = true,
})
tgGb:AddToggle("KeybindToggle", {
	Text = "Show Keybinds",
	Default = false,
})
tgGb:AddDropdown("DPIScale", {
	Values = {"50%", "75%", "100%", "125%", "150%", "175%", "200%"},
	Default = "100%",
	Multi = false,
	Text = "DPI Scale",
})

thm:SetLibrary(lib)
sav:SetLibrary(lib)
sav:IgnoreThemeSettings()
sav:SetIgnoreIndexes({"MenuKeybind"})
thm:SetFolder("femboyhub")
sav:SetFolder("femboyhub")
sav:BuildConfigSection(tabs["UI Settings"])
thm:ApplyToTab(tabs["UI Settings"])

if tog.WatermarkToggle then
	tog.WatermarkToggle:OnChanged(function(v)
		pcall(function() lib:SetWatermarkVisibility(v) end)
	end)
end
if tog.KeybindToggle then
	tog.KeybindToggle:OnChanged(function(v)
		pcall(function()
			if lib.KeybindList then
				lib.KeybindList.Visible = v
			elseif lib.KeybindFrame then
				lib.KeybindFrame.Visible = v
			end
		end)
	end)
end
if opt.DPIScale then
	opt.DPIScale:OnChanged(function(v)
		pcall(function()
			local val = type(v) == "number" and v or tonumber(tostring(v):match("%d+")) or 100
			lib:SetDPIScale(val)
		end)
	end)
end

local plrs = game:GetService("Players")
local rs = game:GetService("ReplicatedStorage")
local run = game:GetService("RunService")
local hs = game:GetService("HttpService")
local pfs = game:GetService("PathfindingService")
local lp = plrs.LocalPlayer
local pgui = lp:FindFirstChild("PlayerGui") or lp:WaitForChild("PlayerGui", 5)
local tui = pgui and pgui:FindFirstChild("TemporaryUI")
local dhand = nil
pcall(function() dhand = require(rs.Modules.Data.DataHandler) end)
local acts = nil
pcall(function() acts = require(rs.Modules.Gameplay.Actors) end)
local nts = rs:FindFirstChild("Systems") and rs.Systems:FindFirstChild("Character") and rs.Systems.Character:FindFirstChild("Game") and rs.Systems.Character.Game:FindFirstChild("Nametags")
local spm = nil
pcall(function() spm = require(rs.Systems.Character.Game.Sprinting) end)
local pdir = workspace:FindFirstChild("Players") or workspace:WaitForChild("Players", 5)
local netMod = nil
pcall(function()
	netMod = require(rs.Modules.Network.Network)
end)

local controls = nil
pcall(function()
	local ps = lp:FindFirstChild("PlayerScripts")
	if ps then
		local pm = ps:FindFirstChild("PlayerModule")
		if pm then
			controls = require(pm):GetControls()
		end
	end
end)

local b64chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789+/"
local b64lookup = {}
for i = 1, 64 do b64lookup[b64chars:sub(i, i)] = i - 1 end

local function b64decode(str)
	local out = {}
	local clean = str:gsub("[^A-Za-z0-9+/=]", "")
	local len = #clean
	local i = 1
	while i <= len do
		local c1 = b64lookup[clean:sub(i, i)] or 0
		local c2 = b64lookup[clean:sub(i+1, i+1)] or 0
		local c3 = b64lookup[clean:sub(i+2, i+2)] or 0
		local c4 = b64lookup[clean:sub(i+3, i+3)] or 0
		local p3 = clean:sub(i+2, i+2) == "="
		local p4 = clean:sub(i+3, i+3) == "="
		local b1 = (c1 * 4) + math.floor(c2 / 16)
		table.insert(out, string.char(b1 % 256))
		if not p3 then table.insert(out, string.char(((c2 % 16) * 16 + math.floor(c3 / 4)) % 256)) end
		if not p4 and not p3 then table.insert(out, string.char(((c3 % 4) * 64 + c4) % 256)) end
		i = i + 4
	end
	return table.concat(out)
end

local function b64encode(str)
	local out = {}
	local len = #str
	local i = 1
	while i <= len do
		local b1 = string.byte(str, i)
		local b2 = (i + 1 <= len) and string.byte(str, i + 1) or nil
		local b3 = (i + 2 <= len) and string.byte(str, i + 2) or nil
		local c1 = math.floor(b1 / 4)
		local c2 = ((b1 % 4) * 16) + (b2 and math.floor(b2 / 16) or 0)
		local c3 = b2 and (((b2 % 16) * 4) + (b3 and math.floor(b3 / 64) or 0)) or nil
		local c4 = b3 and (b3 % 64) or nil
		table.insert(out, b64chars:sub(c1 + 1, c1 + 1))
		table.insert(out, b64chars:sub(c2 + 1, c2 + 1))
		table.insert(out, c3 and b64chars:sub(c3 + 1, c3 + 1) or "=")
		table.insert(out, c4 and b64chars:sub(c4 + 1, c4 + 1) or "=")
		i = i + 3
	end
	return table.concat(out)
end

local function getFakeOffset()
	local mode = opt.FakePosMode and opt.FakePosMode.Value or "In Air"
	if mode == "Random Shake" then
		local rad = opt.FakePosShakeRadius and opt.FakePosShakeRadius.Value or 15
		local ang = math.random() * math.pi * 2
		local dist = math.random() * rad + 2
		return math.cos(ang) * dist, (math.random() - 0.5) * 6, math.sin(ang) * dist
	elseif mode == "Underground" then
		local y = opt.FakePosY and opt.FakePosY.Value or 200
		return 0, -y, 0
	else
		local y = opt.FakePosY and opt.FakePosY.Value or 200
		return 0, y, 0
	end
end

local function spoofPosBuf(origBuf, xOff, yOff, zOff)
	if typeof(origBuf) ~= "buffer" then return origBuf end
	xOff = xOff or 0
	yOff = yOff or 0
	zOff = zOff or 0
	local fullStr = buffer.tostring(origBuf)
	local prefix = "\"base64\":\""
	local st, ed = fullStr:find(prefix, 1, true)
	if st and ed then
		local b64Start = ed + 1
		local b64End = fullStr:find("\"", b64Start, true)
		if b64End then
			local oldB64 = fullStr:sub(b64Start, b64End - 1)
			local raw = b64decode(oldB64)
			if #raw >= 12 then
				local b = buffer.fromstring(raw)
				if xOff ~= 0 then buffer.writef32(b, 0, buffer.readf32(b, 0) + xOff) end
				if yOff ~= 0 then buffer.writef32(b, 4, buffer.readf32(b, 4) + yOff) end
				if zOff ~= 0 then buffer.writef32(b, 8, buffer.readf32(b, 8) + zOff) end
				local newB64 = b64encode(buffer.tostring(b))
				buffer.writestring(origBuf, b64Start - 1, newB64)
				return origBuf
			end
		end
	end
	local blen = buffer.len(origBuf)
	if blen >= 13 and buffer.readu8(origBuf, 0) == 4 then
		if xOff ~= 0 then buffer.writef32(origBuf, 1, buffer.readf32(origBuf, 1) + xOff) end
		if yOff ~= 0 then buffer.writef32(origBuf, 5, buffer.readf32(origBuf, 5) + yOff) end
		if zOff ~= 0 then buffer.writef32(origBuf, 9, buffer.readf32(origBuf, 9) + zOff) end
	elseif blen >= 49 and buffer.readu8(origBuf, 0) == 6 then
		if xOff ~= 0 then buffer.writef32(origBuf, 1, buffer.readf32(origBuf, 1) + xOff) end
		if yOff ~= 0 then buffer.writef32(origBuf, 5, buffer.readf32(origBuf, 5) + yOff) end
		if zOff ~= 0 then buffer.writef32(origBuf, 9, buffer.readf32(origBuf, 9) + zOff) end
	elseif blen >= 12 then
		if xOff ~= 0 then buffer.writef32(origBuf, 0, buffer.readf32(origBuf, 0) + xOff) end
		if yOff ~= 0 then buffer.writef32(origBuf, 4, buffer.readf32(origBuf, 4) + yOff) end
		if zOff ~= 0 then buffer.writef32(origBuf, 8, buffer.readf32(origBuf, 8) + zOff) end
	end
	return origBuf
end

local function encBuf(s)
	if typeof(s) ~= "string" then return s end
	local b = buffer.create(5 + #s)
	buffer.writeu8(b, 0, 3)
	buffer.writeu32(b, 1, #s)
	buffer.writestring(b, 5, s)
	return b
end

local function decBuf(v)
	if typeof(v) == "buffer" then
		local t = buffer.readu8(v, 0)
		if t == 3 then
			local len = buffer.readu32(v, 1)
			return buffer.readstring(v, 5, len)
		end
		return buffer.tostring(v):gsub("%z", "")
	elseif typeof(v) == "string" then
		return v
	end
	return ""
end

local function fireAbility(name)
	local buf = encBuf(name)
	local re = rs:FindFirstChild("Modules") and rs.Modules:FindFirstChild("Network") and rs.Modules.Network:FindFirstChild("Network") and rs.Modules.Network.Network:FindFirstChild("RemoteEvent")
	if re then
		pcall(function()
			re:FireServer("UseActorAbility", { [1] = buf })
		end)
	end
	if netMod and netMod.FireServerConnection then
		pcall(function()
			netMod:FireServerConnection("UseActorAbility", "REMOTE_EVENT", name)
		end)
	end
end

local conns = {}
local unloaded = false

local so = {
	Max = spm and spm.MaxStamina or 100,
	Gain = spm and spm.StaminaGain or 15,
	Time = spm and spm.timeUntilStaminaRecovers or 2,
	DefMax = spm and spm.DefaultConfig and spm.DefaultConfig.MaxStamina or 100,
	DefGain = spm and spm.DefaultConfig and spm.DefaultConfig.StaminaGain or 15,
}

local function updStam()
	if not spm or not tog.InfStamina then return end
	if tog.InfStamina.Value then
		spm.MaxStamina = math.huge
		spm.StaminaGain = math.huge
		spm.Stamina = math.huge
		spm.StaminaCap = math.huge
		spm.timeUntilStaminaRecovers = 0
		if spm.DefaultConfig then
			spm.DefaultConfig.MaxStamina = math.huge
			spm.DefaultConfig.StaminaGain = math.huge
		end
	else
		local mv = opt.MaxStamina and opt.MaxStamina.Value or 100
		local gv = opt.StaminaGain and opt.StaminaGain.Value or 15
		local fr = tog.FastRegen and tog.FastRegen.Value or false
		spm.MaxStamina = mv
		spm.StaminaGain = gv
		spm.timeUntilStaminaRecovers = fr and 0 or so.Time
		if spm.DefaultConfig then
			spm.DefaultConfig.MaxStamina = mv
			spm.DefaultConfig.StaminaGain = gv
		end
	end
	if spm.__staminaChangedEvent then
		spm.__staminaChangedEvent:Fire(spm.Stamina)
	end
end
tog.InfStamina:OnChanged(updStam)
tog.FastRegen:OnChanged(updStam)
opt.MaxStamina:OnChanged(updStam)
opt.StaminaGain:OnChanged(updStam)

table.insert(conns, lp.CharacterAdded:Connect(function()
	task.wait(0.5)
	updStam()
end))

local coreGui = game:GetService("CoreGui")
local getHui = gethui or function() return coreGui end

local jdFovGui = Instance.new("ScreenGui")
jdFovGui.Name = "JDFOVCircleGui"
jdFovGui.ResetOnSpawn = false
jdFovGui.IgnoreGuiInset = true
jdFovGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
pcall(function()
	jdFovGui.Parent = getHui()
end)
if not jdFovGui.Parent then
	pcall(function() jdFovGui.Parent = coreGui end)
end
if not jdFovGui.Parent then
	pcall(function() jdFovGui.Parent = lp:WaitForChild("PlayerGui") end)
end

local jdFovFrame = Instance.new("Frame")
jdFovFrame.Name = "FOVCircle"
jdFovFrame.AnchorPoint = Vector2.new(0.5, 0.5)
jdFovFrame.Position = UDim2.fromScale(0.5, 0.5)
jdFovFrame.BackgroundTransparency = 1
jdFovFrame.BorderSizePixel = 0
jdFovFrame.Visible = false
jdFovFrame.Parent = jdFovGui

local jdFovAspect = Instance.new("UIAspectRatioConstraint")
jdFovAspect.AspectRatio = 1
jdFovAspect.AspectType = Enum.AspectType.FitWithinMaxSize
jdFovAspect.DominantAxis = Enum.DominantAxis.Width
jdFovAspect.Parent = jdFovFrame

local jdFovCorner = Instance.new("UICorner")
jdFovCorner.CornerRadius = UDim.new(0, 9999)
jdFovCorner.Parent = jdFovFrame

local jdFovStroke = Instance.new("UIStroke")
jdFovStroke.Color = Color3.fromRGB(255, 100, 0)
jdFovStroke.Thickness = 1.5
jdFovStroke.Transparency = 0
jdFovStroke.Parent = jdFovFrame

local abActive = {}
local abConns = {}
local hitActive = false
local pIndex = 1
local kAttacking = {}
local kM1Data = {}
local docESPObjects = {}
local genESPObjects = {}
local genConns = {}

local punchAnims = {
	["rbxassetid://96959123077498"] = true,
	["rbxassetid://72722244508749"] = true,
}

local punchAimbotAnims = {
	["rbxassetid://87259391926321"] = true,
	["rbxassetid://140703210927645"] = true,
	["rbxassetid://136007065400978"] = true,
	["rbxassetid://129843313690921"] = true,
	["rbxassetid://86709774283672"] = true,
	["rbxassetid://108807732150251"] = true,
	["rbxassetid://138040001965654"] = true,
	["rbxassetid://86096387000557"] = true,
}

local killerSounds = {
	["rbxassetid://102228729296384"] = true,
	["rbxassetid://140242176732868"] = true,
	["rbxassetid://112809109188560"] = true,
	["rbxassetid://136323728355613"] = true,
	["rbxassetid://115026634746636"] = true,
	["rbxassetid://84116622032112"] = true,
	["rbxassetid://108907358619313"] = true,
	["rbxassetid://127793641088496"] = true,
	["rbxassetid://86174610237192"] = true,
	["rbxassetid://95079963655241"] = true,
	["rbxassetid://101199185291628"] = true,
	["rbxassetid://119942598489800"] = true,
	["rbxassetid://84307400688050"] = true,
	["rbxassetid://113037804008732"] = true,
	["rbxassetid://105200830849301"] = true,
	["rbxassetid://75330693422988"] = true,
	["rbxassetid://82221759983649"] = true,
	["rbxassetid://81702359653578"] = true,
	["rbxassetid://108610718831698"] = true,
	["rbxassetid://112395455254818"] = true,
	["rbxassetid://109431876587852"] = true,
	["rbxassetid://109348678063422"] = true,
	["rbxassetid://85853080745515"] = true,
	["rbxassetid://98733709078792"] = true,
	["rbxassetid://105840448036441"] = true,
	["rbxassetid://114742322778642"] = true,
	["rbxassetid://105415540898010"] = true,
	["rbxassetid://106300477136129"] = true,
	["rbxassetid://80516583309685"] = true,
	["rbxassetid://116581754553533"] = true,
	["rbxassetid://71834552297085"] = true,
	["rbxassetid://119583605486352"] = true,
	["rbxassetid://117173212095661"] = true,
	["rbxassetid://104910828105172"] = true,
	["rbxassetid://79980897195554"] = true,
	["rbxassetid://116527305931161"] = true,
	["rbxassetid://131406927389838"] = true,
	["rbxassetid://94317217837143"] = true,
	["rbxassetid://121954639447247"] = true,
	["rbxassetid://128856426573270"] = true,
	["rbxassetid://131123355704017"] = true,
	["rbxassetid://107444859834748"] = true,
	["rbxassetid://133709029886490"] = true,
	["rbxassetid://124234993291213"] = true,
	["rbxassetid://113413858159336"] = true,
	["rbxassetid://105516183226360"] = true,
	["rbxassetid://128195973631079"] = true,
	["rbxassetid://79391273191671"] = true,
	["rbxassetid://73461198730771"] = true,
	["rbxassetid://74112135180579"] = true,
	["rbxassetid://125924168627504"] = true,
	["rbxassetid://94536463536431"] = true,
	["rbxassetid://128307808203038"] = true,
	["rbxassetid://103736328206432"] = true,
	["rbxassetid://81292728088654"] = true,
}

local killerAnims = {
	["rbxassetid://70785407091644"] = true,
	["rbxassetid://96167639214189"] = true,
	["rbxassetid://112649273029679"] = true,
	["rbxassetid://71231909569291"] = true,
	["rbxassetid://112748196946666"] = true,
	["rbxassetid://127142942415961"] = true,
	["rbxassetid://130625985300868"] = true,
}

local espFolder = Instance.new("Folder")
espFolder.Name = "ESP"
espFolder.Parent = getHui()
if not espFolder.Parent then
	espFolder.Parent = coreGui
end
if not espFolder.Parent then
	espFolder.Parent = pgui
end

local espObjects = {}
local espTracers = {}

local function rmEsp(inst)
	local o = espObjects[inst]
	if o then
		if o.highlight then o.highlight:Destroy() end
		if o.billboard then o.billboard:Destroy() end
		espObjects[inst] = nil
	end
	local tr = espTracers[inst]
	if tr then
		pcall(function() tr:Remove() end)
		espTracers[inst] = nil
	end
end

local function mkEsp(inst, isKiller)
	if espObjects[inst] then return end
	local root = inst:FindFirstChild("HumanoidRootPart")
	local head = inst:FindFirstChild("Head") or root
	if not root then return end

	local kCol = opt.ESPKillerColor and opt.ESPKillerColor.Value or Color3.fromRGB(255, 30, 30)
	local sCol = opt.ESPSurvivorColor and opt.ESPSurvivorColor.Value or Color3.fromRGB(0, 160, 255)
	local col = isKiller and kCol or sCol

	local hl = Instance.new("Highlight")
	hl.Name = inst.Name .. "_Highlight"
	hl.Adornee = inst
	hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
	hl.FillColor = col
	hl.OutlineColor = Color3.new(1, 1, 1)
	hl.FillTransparency = opt.ESPHighlightFillTrans and opt.ESPHighlightFillTrans.Value or 0.5
	hl.OutlineTransparency = opt.ESPHighlightOutlineTrans and opt.ESPHighlightOutlineTrans.Value or 0
	hl.Enabled = (tog.ESPEnabled and tog.ESPEnabled.Value) and (tog.ESPHighlight and tog.ESPHighlight.Value) or false
	hl.Parent = espFolder

	local bb = Instance.new("BillboardGui")
	bb.Name = inst.Name .. "_Billboard"
	bb.Adornee = head
	bb.Size = UDim2.new(0, 160, 0, 50)
	bb.StudsOffset = Vector3.new(0, 2.8, 0)
	bb.AlwaysOnTop = true
	bb.Enabled = (tog.ESPEnabled and tog.ESPEnabled.Value) and (tog.ESPBillboards and tog.ESPBillboards.Value) or false
	bb.Parent = espFolder

	local nameLbl = Instance.new("TextLabel")
	nameLbl.Name = "NameLabel"
	nameLbl.Size = UDim2.new(1, 0, 0, 16)
	nameLbl.Position = UDim2.new(0, 0, 0, 0)
	nameLbl.BackgroundTransparency = 1
	nameLbl.TextColor3 = col
	nameLbl.TextStrokeTransparency = 0
	nameLbl.TextStrokeColor3 = Color3.new(0, 0, 0)
	nameLbl.TextSize = 13
	nameLbl.Font = Enum.Font.SourceSansBold
	nameLbl.Visible = tog.ESPNames and tog.ESPNames.Value or true
	nameLbl.Parent = bb

	local infoLbl = Instance.new("TextLabel")
	infoLbl.Name = "InfoLabel"
	infoLbl.Size = UDim2.new(1, 0, 0, 14)
	infoLbl.Position = UDim2.new(0, 0, 0, 16)
	infoLbl.BackgroundTransparency = 1
	infoLbl.TextColor3 = Color3.fromRGB(220, 220, 220)
	infoLbl.TextStrokeTransparency = 0
	infoLbl.TextStrokeColor3 = Color3.new(0, 0, 0)
	infoLbl.TextSize = 11
	infoLbl.Font = Enum.Font.SourceSans
	infoLbl.Visible = (tog.ESPHealth and tog.ESPHealth.Value) or (tog.ESPDistance and tog.ESPDistance.Value)
	infoLbl.Parent = bb

	local tr = nil
	if Drawing and Drawing.new then
		pcall(function()
			tr = Drawing.new("Line")
			tr.Visible = false
			tr.Thickness = 1
			tr.Color = col
			espTracers[inst] = tr
		end)
	end

	espObjects[inst] = {
		highlight = hl,
		billboard = bb,
		nameLabel = nameLbl,
		infoLabel = infoLbl,
		isKiller = isKiller,
		root = root,
		head = head,
		inst = inst,
	}
end

local function isGrn(c)
	return c and c.G > 0.7 and c.R < 0.5 and c.B < 0.5
end

local function chkGrn(v)
	if v:IsA("Part") or v:IsA("MeshPart") or v:IsA("WedgePart") then
		if isGrn(v.Color) then return true end
	elseif v:IsA("SelectionBox") or v:IsA("BoxHandleAdornment") or v:IsA("ConeHandleAdornment") or v:IsA("CylinderHandleAdornment") then
		if isGrn(v.Color3) then return true end
	elseif v:IsA("Highlight") then
		if isGrn(v.FillColor) or isGrn(v.OutlineColor) then return true end
	end
	return false
end

local function fndHb(k)
	local r = k:FindFirstChild("HumanoidRootPart")
	if not r then return false end
	for _, v in ipairs(k:GetDescendants()) do
		if chkGrn(v) then return true end
	end
	local pts = workspace.GetPartBoundsInRadius and workspace:GetPartBoundsInRadius(r.Position, 20) or {}
	for _, p in ipairs(pts) do
		if chkGrn(p) then return true end
		for _, v in ipairs(p:GetDescendants()) do
			if chkGrn(v) then return true end
		end
	end
	return false
end

local function getCls()
	local lChar = lp.Character
	local lRoot = lChar and lChar:FindFirstChild("HumanoidRootPart")
	if not lRoot then return end
	local target, min = nil, math.huge
	for _, p in ipairs(plrs:GetPlayers()) do
		if p ~= lp and p.Character then
			local hum = p.Character:FindFirstChildOfClass("Humanoid")
			local root = p.Character:FindFirstChild("HumanoidRootPart")
			if hum and root and hum.MaxHealth > 500 then
				local d = (lRoot.Position - root.Position).Magnitude
				if d < min then
					target = root
					min = d
				end
			end
		end
	end
	return target, min
end

local kLookHistory = {}

local function checkWall(fromPos, toPos, ignoreList)
	if not (tog.WallCheck and tog.WallCheck.Value) then return true end
	local params = RaycastParams.new()
	params.FilterType = Enum.RaycastFilterType.Exclude
	local ignore = { lp.Character, workspace.CurrentCamera }
	if ignoreList then
		for _, v in ipairs(ignoreList) do table.insert(ignore, v) end
	end
	params.FilterDescendantsInstances = ignore
	params.IgnoreWater = true
	local dir = toPos - fromPos
	local result = workspace:Raycast(fromPos, dir, params)
	if result and result.Instance then
		local hit = result.Instance
		if hit.CanCollide and hit.Transparency < 0.8 and not hit:IsDescendantOf(workspace:FindFirstChild("Players")) then
			return false
		end
	end
	return true
end

local function isFacing(myRoot, targetRoot, fovAngle, killerModel)
	if not (tog.FacingCheck and tog.FacingCheck.Value) then return true end
	if not myRoot or not targetRoot then return false end
	local dir = myRoot.Position - targetRoot.Position
	local distSq = dir.X * dir.X + dir.Y * dir.Y + dir.Z * dir.Z
	if distSq < 36 then return true end

	local angleDeg = fovAngle or (opt.VisionAngle and opt.VisionAngle.Value) or 135
	local cosA = math.cos(math.rad(angleDeg / 2))
	local lv = targetRoot.CFrame.LookVector
	local flatDir = Vector3.new(dir.X, 0, dir.Z)
	local flatLv = Vector3.new(lv.X, 0, lv.Z)
	if flatDir.Magnitude > 0.01 and flatLv.Magnitude > 0.01 then
		local dot = flatLv.Unit:Dot(flatDir.Unit)
		if dot >= cosA then return true end
	else
		local dot = lv:Dot(dir.Unit)
		if dot >= cosA then return true end
	end

	if tog.SmartFacing and tog.SmartFacing.Value then
		local vel = targetRoot.AssemblyLinearVelocity
		local flatVel = Vector3.new(vel.X, 0, vel.Z)
		if flatVel.Magnitude > 1.5 and flatDir.Magnitude > 0.01 then
			if flatVel.Unit:Dot(flatDir.Unit) >= cosA then
				return true
			end
		end
		if killerModel and kLookHistory[killerModel] then
			local hist = kLookHistory[killerModel]
			local avg = Vector3.zero
			for _, v in ipairs(hist) do avg = avg + v end
			if #hist > 0 and (avg / #hist).Unit:Dot(dir.Unit) >= cosA then
				return true
			end
		end
	end

	return false
end

local function monitorKiller(k)
	if abActive[k] then return end
	local root = k:FindFirstChild("HumanoidRootPart")
	if not root then
		task.delay(0.1, function()
			if k.Parent then monitorKiller(k) end
		end)
		return
	end

	local fovPart = nil

	local function handleAttack()
		if not tog.AutoBlock.Value then return end
		task.spawn(function()
			local now = os.clock()
			if not kM1Data[k] then
				kM1Data[k] = { times = {}, avg = 0.8 }
			end
			local md = kM1Data[k]
			if #md.times > 0 then
				local gap = now - md.times[#md.times]
				if gap > 0.1 and gap < 3 then
					table.insert(md.times, now)
					if #md.times > 5 then table.remove(md.times, 1) end
					local sum = 0
					for i = 2, #md.times do
						sum = sum + (md.times[i] - md.times[i - 1])
					end
					md.avg = sum / (#md.times - 1)
				else
					md.times = { now }
				end
			else
				md.times = { now }
			end

			local m1Spd = md.avg
			kAttacking[k] = true
			task.delay(math.clamp(m1Spd * 1.2, 0.4, 2), function()
				kAttacking[k] = false
			end)

			local lChar = lp.Character
			local lRoot = lChar and lChar:FindFirstChild("HumanoidRootPart")
			if not lRoot or not root.Parent then return end
			local diff = lRoot.Position - root.Position
			local dist = diff.Magnitude
			local limit = opt.FOVSize and opt.FOVSize.Value or 15
			if dist <= limit and checkWall(lRoot.Position, root.Position, { k }) then
				if isFacing(lRoot, root, nil, k) then
					if tog.AntiBait and tog.AntiBait.Value then
						local reactBase = opt.BlockReact and opt.BlockReact.Value or 0.15
						local reactTime = math.min(reactBase, m1Spd * 0.3)
						local okHb = false
						local st = os.clock()
						while os.clock() - st < reactTime do
							if fndHb(k) then
								okHb = true
								break
							end
							task.wait()
						end
						if not okHb then return end
					end
					if not isFacing(lRoot, root, nil, k) then return end
					if tog.LegitLunge and tog.LegitLunge.Value then
						local hum = lChar:FindFirstChildOfClass("Humanoid")
						if hum then
							local pos = root.Position + root.CFrame.LookVector * 4
							local oldWs = hum.WalkSpeed
							local lWs = opt.LegitLungeSpeed and opt.LegitLungeSpeed.Value or 27.5
							hum.WalkSpeed = lWs
							if controls then
								pcall(function() controls:Disable() end)
							end
							hum:MoveTo(pos)
							task.delay(0.3, function()
								pcall(function()
									if hum and hum.Parent then
										hum.WalkSpeed = oldWs
									end
									if controls then
										controls:Enable()
									end
								end)
							end)
						end
					elseif tog.BaitLunge and tog.BaitLunge.Value then
						local targetPos = root.Position + root.CFrame.LookVector * 4
						local lungeDir = (targetPos - lRoot.Position).Unit
						local lungeSpd = opt.BaitLungeSpeed and opt.BaitLungeSpeed.Value or 160
						local shake = (tog.HitboxShake and tog.HitboxShake.Value) and Vector3.new(math.random(-20, 20)/20, math.random(-20, 20)/20, math.random(-20, 20)/20) or Vector3.zero
						local oldVel = lRoot.AssemblyLinearVelocity
						local lungeVel = lungeDir * lungeSpd + shake
						lRoot.AssemblyLinearVelocity = lungeVel
						lRoot.Velocity = lungeVel
						task.spawn(function()
							local st = os.clock()
							while os.clock() - st < 0.18 do
								if lRoot and lRoot.Parent then
									lRoot.AssemblyLinearVelocity = lungeVel
								end
								run.RenderStepped:Wait()
							end
							if lRoot and lRoot.Parent then
								lRoot.AssemblyLinearVelocity = oldVel
								lRoot.Velocity = oldVel
							end
						end)
					end
					fireAbility("Block")
					if tog.AutoPunch and tog.AutoPunch.Value then
						local pDelay = opt.PunchDelay and opt.PunchDelay.Value or 0.3
						task.delay(pDelay, function()
							if not (tog.AutoPunch and tog.AutoPunch.Value) or unloaded then return end
							local curChar = lp.Character
							local curHRP = curChar and curChar:FindFirstChild("HumanoidRootPart")
							if not curHRP or not root.Parent then return end
							if not isFacing(curHRP, root, nil, k) then return end
							if not checkWall(curHRP.Position, root.Position, { k }) then return end
							if tog.PunchAutoFace and tog.PunchAutoFace.Value then
								local flat = Vector3.new(root.Position.X - curHRP.Position.X, 0, root.Position.Z - curHRP.Position.Z)
								if flat.Magnitude > 0.01 then
									curHRP.CFrame = CFrame.new(curHRP.Position, curHRP.Position + flat.Unit)
								end
							end
							fireAbility("Punch")
						end)
					end
				end
			end
		end)
	end

	local soundConns = {}
	local function hookSnd(snd)
		if not (snd and snd:IsA("Sound")) or soundConns[snd] then return end
		local num = snd.SoundId:match("%d+")
		if not num or not killerSounds["rbxassetid://" .. num] then return end
		local c1 = snd.Played:Connect(function()
			handleAttack()
		end)
		local c2 = snd:GetPropertyChangedSignal("IsPlaying"):Connect(function()
			if snd.IsPlaying then
				handleAttack()
			end
		end)
		soundConns[snd] = { c1, c2 }
		if snd.IsPlaying then
			handleAttack()
		end
	end

	for _, d in ipairs(k:GetDescendants()) do
		hookSnd(d)
	end

	local dConn = k.DescendantAdded:Connect(function(d)
		hookSnd(d)
	end)

	local aConn = nil
	local kHum = k:FindFirstChildOfClass("Humanoid")
	if kHum then
		aConn = kHum.AnimationPlayed:Connect(function(anim)
			local aObj = anim.Animation
			if aObj then
				local num = aObj.AnimationId:match("%d+")
				if num and (killerAnims["rbxassetid://" .. num] or killerAnims[aObj.AnimationId]) then
					handleAttack()
				end
			end
		end)
	end

	local function clean()
		if dConn then dConn:Disconnect() dConn = nil end
		if aConn then aConn:Disconnect() aConn = nil end
		for _, tbl in pairs(soundConns) do
			for _, c in ipairs(tbl) do c:Disconnect() end
		end
		table.clear(soundConns)
		if fovPart then fovPart:Destroy() fovPart = nil end
		kM1Data[k] = nil
		kLookHistory[k] = nil
		abActive[k] = nil
	end
	abActive[k] = clean

	local hConn
	hConn = run.Heartbeat:Connect(function()
		local active = tog.AutoBlock.Value or tog.VisualFOV.Value
		if not active then
			clean()
			if hConn then hConn:Disconnect() hConn = nil end
			return
		end
		if not k.Parent or not root.Parent then
			clean()
			if hConn then hConn:Disconnect() hConn = nil end
			return
		end

		if not kLookHistory[k] then kLookHistory[k] = {} end
		table.insert(kLookHistory[k], root.CFrame.LookVector)
		if #kLookHistory[k] > 6 then table.remove(kLookHistory[k], 1) end

		local lChar = lp.Character
		local lRoot = lChar and lChar:FindFirstChild("HumanoidRootPart")
		if not lRoot then
			if fovPart then fovPart.Parent = nil end
			return
		end

		local fovLimit = opt.FOVSize.Value
		if kAttacking[k] then
			fovLimit = fovLimit * 1.5
		end

		if tog.VisualFOV.Value then
			local typeVal = opt.BlockPartType.Value
			local cam = workspace.CurrentCamera

			if not fovPart then
				fovPart = Instance.new("Part")
				fovPart.CanCollide = false
				fovPart.CanTouch = false
				fovPart.CanQuery = false
				fovPart.CastShadow = false
				fovPart.Anchored = true
				fovPart.Parent = cam or workspace
			end

			local sizeD = fovLimit

			if typeVal == "Flat" then
				fovPart.Shape = Enum.PartType.Cylinder
				fovPart.Size = Vector3.new(0.2, sizeD, sizeD)
				fovPart.Material = Enum.Material.ForceField
				fovPart.CFrame = root.CFrame * CFrame.new(0, -3, 0) * CFrame.Angles(0, 0, math.rad(90))
				fovPart.Transparency = opt.FOVTrans.Value
				fovPart.Color = opt.FOVColor.Value
			elseif typeVal == "Cone" then
				fovPart.Shape = Enum.PartType.Block
				local vAngle = (opt.VisionAngle and opt.VisionAngle.Value) or 135
				local cw = sizeD * math.tan(math.rad(vAngle / 2)) * 2
				fovPart.Size = Vector3.new(cw, cw, sizeD)
				fovPart.Material = Enum.Material.ForceField
				fovPart.CFrame = root.CFrame * CFrame.new(0, 0, -sizeD / 2)
				fovPart.Transparency = opt.FOVTrans.Value
				fovPart.Color = opt.FOVColor.Value
			else
				fovPart.Shape = Enum.PartType.Ball
				fovPart.Size = Vector3.new(sizeD, sizeD, sizeD)
				fovPart.Material = Enum.Material.ForceField
				fovPart.CFrame = root.CFrame
				fovPart.Transparency = opt.FOVTrans.Value
				fovPart.Color = opt.FOVColor.Value
			end
		else
			if fovPart then fovPart:Destroy() fovPart = nil end
		end
	end)
	table.insert(conns, hConn)
end

local function updBlk()
	local active = tog.AutoBlock.Value or tog.VisualFOV.Value
	local kf = pdir and pdir:FindFirstChild("Killers")
	if active and kf then
		for _, k in ipairs(kf:GetChildren()) do
			monitorKiller(k)
		end
		if not abConns.Added then
			abConns.Added = kf.ChildAdded:Connect(monitorKiller)
		end
		if not abConns.Removed then
			abConns.Removed = kf.ChildRemoved:Connect(function(child)
				local handler = abActive[child]
				if handler then handler() end
			end)
		end
	else
		if abConns.Added then abConns.Added:Disconnect() abConns.Added = nil end
		if abConns.Removed then abConns.Removed:Disconnect() abConns.Removed = nil end
		for _, handler in pairs(abActive) do
			handler()
		end
		table.clear(abActive)
	end
end

local aimHB = nil
local animStopConns = {}
local animConns = {}

local function stpAim()
	if aimHB then
		aimHB:Disconnect()
		aimHB = nil
	end
end

local function strAim(root)
	stpAim()
	aimHB = run.Heartbeat:Connect(function()
		if not tog.PunchAimbot.Value then
			stpAim()
			return
		end
		local target = getCls()
		local cam = workspace.CurrentCamera
		if target and root then
			local dir = (target.Position - root.Position).Unit
			root.CFrame = CFrame.new(root.Position, root.Position + Vector3.new(dir.X, 0, dir.Z))
			if cam then
				cam.CFrame = CFrame.new(cam.CFrame.Position, target.Position)
			end
		end
	end)
end

local function cleanAnimConns()
	for _, conn in ipairs(animConns) do
		conn:Disconnect()
	end
	table.clear(animConns)
end

local function lstChr(char)
	local hum = char:WaitForChild("Humanoid", 10)
	local root = char:WaitForChild("HumanoidRootPart", 10)
	if not hum or not root then return end

	cleanAnimConns()
	for _, conn in ipairs(animStopConns) do conn:Disconnect() end
	table.clear(animStopConns)

	table.insert(animConns, hum.AnimationPlayed:Connect(function(anim)
		if not tog.PunchAimbot.Value then return end
		local aObj = anim.Animation
		if not aObj then return end
		local animId = aObj.AnimationId
		if punchAimbotAnims[animId] then
			strAim(root)
			local stopConn
			stopConn = anim.Stopped:Connect(function()
				stpAim()
				if stopConn then
					stopConn:Disconnect()
					local idx = table.find(animStopConns, stopConn)
					if idx then table.remove(animStopConns, idx) end
				end
			end)
			table.insert(animStopConns, stopConn)
		end
	end))
end

if lp.Character then lstChr(lp.Character) end
table.insert(conns, lp.CharacterAdded:Connect(function(c)
	lstChr(c)
end))

table.insert(conns, run.Heartbeat:Connect(function()
	if not tog.ShowIndicator.Value then return end
	local any = false
	for _, a in pairs(kAttacking) do if a then any = true break end end
	if tog.AttackIndicator.Value ~= any then tog.AttackIndicator:SetValue(any) end
end))

local lastM1Time = 0
table.insert(conns, run.Heartbeat:Connect(function()
	if not (tog.KillerAutoM1 and tog.KillerAutoM1.Value) then return end
	local now = os.clock()
	local m1Delay = opt.KillerM1Delay and opt.KillerM1Delay.Value or 0.4
	local char = lp.Character
	local myHRP = char and char:FindFirstChild("HumanoidRootPart")
	if not myHRP then return end

	local kf = pdir and pdir:FindFirstChild("Killers")
	local amKiller = (kf and char:IsDescendantOf(kf)) or (char.Parent and char.Parent.Name == "Killers")
	if not amKiller then return end

	local sf = pdir and pdir:FindFirstChild("Survivors")
	if not sf then return end

	local target, bestDist = nil, math.huge
	local maxDist = opt.KillerM1Dist and opt.KillerM1Dist.Value or 12

	for _, m in ipairs(sf:GetChildren()) do
		if m ~= char and m:IsA("Model") then
			local r = m:FindFirstChild("HumanoidRootPart")
			local h = m:FindFirstChildOfClass("Humanoid")
			if r and h and h.Health > 0 then
				local d = (r.Position - myHRP.Position).Magnitude
				if d <= maxDist and d < bestDist then
					bestDist = d
					target = r
				end
			end
		end
	end

	if not target then return end

	if tog.KillerAutoFace and tog.KillerAutoFace.Value then
		local flat = Vector3.new(target.Position.X - myHRP.Position.X, 0, target.Position.Z - myHRP.Position.Z)
		if flat.Magnitude > 0.01 then
			myHRP.CFrame = CFrame.new(myHRP.Position, myHRP.Position + flat.Unit)
		end
		local cam = workspace.CurrentCamera
		if cam then
			cam.CFrame = CFrame.new(cam.CFrame.Position, target.Position)
		end
	end

	if tog.KillerM1Facing and tog.KillerM1Facing.Value then
		local diff = target.Position - myHRP.Position
		if diff.Magnitude >= 5 then
			local dot = myHRP.CFrame.LookVector:Dot(diff.Unit)
			if dot < 0.2 then return end
		end
	end

	if now - lastM1Time < m1Delay then return end
	lastM1Time = now
	fireAbility("Stab")
end))

table.insert(conns, run.RenderStepped:Connect(function()
	local cam = workspace.CurrentCamera
	if not cam then return end
	local vp = cam.ViewportSize

	local showJdFov = tog.JDShowFOV.Value
	jdFovFrame.Visible = showJdFov
	if showJdFov then
		local rad = opt.JDFOVRadius.Value
		local diam = rad * 2
		jdFovFrame.Size = UDim2.fromOffset(diam, diam)
		jdFovStroke.Color = opt.JDFOVColor.Value
		jdFovFrame.Position = UDim2.fromScale(0.5, 0.5)
	end

table.insert(conns, run.RenderStepped:Connect(function()
	local cam = workspace.CurrentCamera
	if not cam then return end
	local vp = cam.ViewportSize

	local showJdFov = tog.JDShowFOV.Value
	jdFovFrame.Visible = showJdFov
	if showJdFov then
		local rad = opt.JDFOVRadius.Value
		local diam = rad * 2
		jdFovFrame.Size = UDim2.fromOffset(diam, diam)
		jdFovStroke.Color = opt.JDFOVColor.Value
		jdFovFrame.Position = UDim2.fromScale(0.5, 0.5)
	end

	local espOn = tog.ESPEnabled and tog.ESPEnabled.Value
	local hlOn = espOn and (tog.ESPHighlight and tog.ESPHighlight.Value)
	local bbOn = espOn and (tog.ESPBillboards and tog.ESPBillboards.Value)
	local showNames = tog.ESPNames and tog.ESPNames.Value
	local showHp = tog.ESPHealth and tog.ESPHealth.Value
	local showDist = tog.ESPDistance and tog.ESPDistance.Value
	local showTracers = espOn and (tog.ESPTracer and tog.ESPTracer.Value)
	local kCol = opt.ESPKillerColor and opt.ESPKillerColor.Value or Color3.fromRGB(255, 30, 30)
	local sCol = opt.ESPSurvivorColor and opt.ESPSurvivorColor.Value or Color3.fromRGB(0, 160, 255)
	local fillTrans = opt.ESPHighlightFillTrans and opt.ESPHighlightFillTrans.Value or 0.5
	local outTrans = opt.ESPHighlightOutlineTrans and opt.ESPHighlightOutlineTrans.Value or 0

	local lChar = lp.Character
	local lRoot = lChar and lChar:FindFirstChild("HumanoidRootPart")

	for inst, obj in pairs(espObjects) do
		local root = inst:FindFirstChild("HumanoidRootPart")
		local hum = inst:FindFirstChildOfClass("Humanoid")
		local head = inst:FindFirstChild("Head") or root
		if not root or not inst.Parent or (inst == lChar) then
			if obj.highlight then obj.highlight.Enabled = false end
			if obj.billboard then obj.billboard.Enabled = false end
			local tr = espTracers[inst]
			if tr then tr.Visible = false end
			continue
		end

		local isK = obj.isKiller
		local col = isK and kCol or sCol

		if obj.highlight and obj.highlight.Parent then
			obj.highlight.Enabled = hlOn
			obj.highlight.FillColor = col
			obj.highlight.FillTransparency = fillTrans
			obj.highlight.OutlineTransparency = outTrans
		end

		if obj.billboard and obj.billboard.Parent then
			obj.billboard.Enabled = bbOn
			obj.billboard.Adornee = head
			if bbOn then
				local tp = plrs:GetPlayerFromCharacter(inst)
				local act = tp and acts.CurrentActors and acts.CurrentActors[tp]
				local dispName = act and act.Config and act.Config.DisplayName or (tp and tp.Name) or inst.Name
				obj.nameLabel.Text = (isK and "[KILLER] " or "") .. dispName
				obj.nameLabel.TextColor3 = col
				obj.nameLabel.Visible = showNames

				local infoParts = {}
				if hum and showHp then
					local curHp = math.max(0, math.ceil(hum.Health))
					local maxHp = math.max(1, math.ceil(hum.MaxHealth))
					table.insert(infoParts, curHp .. "/" .. maxHp .. " HP")
				end
				if lRoot and showDist then
					local d = math.floor((root.Position - lRoot.Position).Magnitude)
					table.insert(infoParts, d .. "m")
				end
				obj.infoLabel.Text = table.concat(infoParts, " • ")
				obj.infoLabel.Visible = (#infoParts > 0)
			end
		end

		local tr = espTracers[inst]
		if tr then
			if showTracers then
				local hrpScrn, onScreen = cam:WorldToViewportPoint(root.Position)
				if onScreen then
					tr.From = Vector2.new(vp.X / 2, vp.Y)
					tr.To = Vector2.new(hrpScrn.X, hrpScrn.Y)
					tr.Color = col
					tr.Visible = true
				else
					tr.Visible = false
				end
			else
				tr.Visible = false
			end
		end
	end
end))

local function updChr(char, isKiller)
	if not char then return end
	mkEsp(char, isKiller or false)
end

local function updAl()
	for _, p in ipairs(plrs:GetPlayers()) do
		if p.Character then updChr(p.Character, false) end
	end
	if pdir then
		local kf = pdir:FindFirstChild("Killers")
		if kf then
			for _, c in ipairs(kf:GetChildren()) do updChr(c, true) end
		end
		local sf = pdir:FindFirstChild("Survivors")
		if sf then
			for _, c in ipairs(sf:GetChildren()) do updChr(c, false) end
		end
	end
end

if tog.ESPEnabled then tog.ESPEnabled:OnChanged(updAl) end
if tog.ESPHighlight then tog.ESPHighlight:OnChanged(updAl) end
if tog.ESPBillboards then tog.ESPBillboards:OnChanged(updAl) end
if tog.ESPNames then tog.ESPNames:OnChanged(updAl) end
if tog.ESPHealth then tog.ESPHealth:OnChanged(updAl) end
if tog.ESPDistance then tog.ESPDistance:OnChanged(updAl) end
if tog.ESPTracer then tog.ESPTracer:OnChanged(updAl) end
if opt.ESPKillerColor then opt.ESPKillerColor:OnChanged(updAl) end
if opt.ESPSurvivorColor then opt.ESPSurvivorColor:OnChanged(updAl) end
if opt.ESPHighlightFillTrans then opt.ESPHighlightFillTrans:OnChanged(updAl) end
if opt.ESPHighlightOutlineTrans then opt.ESPHighlightOutlineTrans:OnChanged(updAl) end

tog.AutoBlock:OnChanged(updBlk)
tog.VisualFOV:OnChanged(updBlk)
opt.BlockPartType:OnChanged(updBlk)
opt.FOVColor:OnChanged(updBlk)
opt.FOVSize:OnChanged(updBlk)
opt.FOVTrans:OnChanged(updBlk)
opt.VisionAngle:OnChanged(updBlk)

local function appDoc(m)
	if docESPObjects[m] then return end
	local hl = Instance.new("Highlight")
	hl.FillColor = opt.DocESPColor.Value
	hl.OutlineColor = Color3.fromRGB(255, 255, 255)
	hl.FillTransparency = 0.4
	hl.OutlineTransparency = 0
	hl.Adornee = m
	hl.Parent = m
	hl.Enabled = tog.ShowDocESP.Value
	local bb = Instance.new("BillboardGui")
	bb.Adornee = m
	bb.Size = UDim2.new(0, 120, 0, 40)
	bb.StudsOffset = Vector3.new(0, 2.5, 0)
	bb.AlwaysOnTop = true
	bb.Parent = m
	bb.Enabled = tog.ShowDocESP.Value
	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, 0, 1, 0)
	lbl.BackgroundTransparency = 1
	lbl.Text = "Document"
	lbl.TextColor3 = opt.DocESPColor.Value
	lbl.TextStrokeTransparency = 0
	lbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	lbl.TextSize = 14
	lbl.Font = Enum.Font.SourceSansBold
	lbl.Parent = bb
	docESPObjects[m] = { highlight = hl, billboard = bb, label = lbl }
end

local function remDoc(m)
	local o = docESPObjects[m]
	if not o then return end
	if o.highlight then o.highlight:Destroy() end
	if o.billboard then o.billboard:Destroy() end
	docESPObjects[m] = nil
end

local function updDoc()
	for m, o in pairs(docESPObjects) do
		if o.highlight then
			o.highlight.Enabled = tog.ShowDocESP.Value
			o.highlight.FillColor = opt.DocESPColor.Value
		end
		if o.billboard then
			o.billboard.Enabled = tog.ShowDocESP.Value
		end
		if o.label then
			o.label.TextColor3 = opt.DocESPColor.Value
		end
	end
end

tog.ShowDocESP:OnChanged(updDoc)
opt.DocESPColor:OnChanged(updDoc)

local function getGenProg(o)
	if not o or not o.Parent then return 0 end
	local pv = o:FindFirstChild("Progress")
	if pv and (pv:IsA("NumberValue") or pv:IsA("IntValue")) then return pv.Value end
	local av = o:GetAttribute("Progress") or o:GetAttribute("Charge")
	if type(av) == "number" then return av end
	return 0
end

local function bldGenTxt(prog)
	if prog >= 100 then
		return "Generator ✓ DONE (100%)", Color3.fromRGB(100, 255, 100)
	end
	local pz = math.floor(prog / 25)
	return string.format("Generator %d/4 (%d%%)", pz, pz * 25), opt.GenESPColor.Value
end

local function updGenLbl(o)
	local data = genESPObjects[o]
	if not data or not data.label or not o.Parent then return end
	local txt, col = bldGenTxt(getGenProg(o))
	data.label.Text = txt
	data.label.TextColor3 = col
	if data.highlight then
		data.highlight.FillColor = col
	end
end

local function remGen(o)
	local data = genESPObjects[o]
	if not data then return end
	if data.highlight then data.highlight:Destroy() end
	if data.billboard then data.billboard:Destroy() end
	if genConns[o] then
		for _, c in ipairs(genConns[o]) do c:Disconnect() end
		genConns[o] = nil
	end
	genESPObjects[o] = nil
end

local function appGen(o)
	if genESPObjects[o] then return end
	local attach = o:FindFirstChild("HumanoidRootPart") or o:FindFirstChild("Torso") or o:FindFirstChildWhichIsA("BasePart") or (o:IsA("BasePart") and o)
	if not attach then return end

	local prog = getGenProg(o)
	local txt, col = bldGenTxt(prog)

	local hl = Instance.new("Highlight")
	hl.FillColor = col
	hl.OutlineColor = Color3.fromRGB(255, 255, 255)
	hl.FillTransparency = 0.4
	hl.OutlineTransparency = 0
	hl.Adornee = o
	hl.Parent = o
	hl.Enabled = tog.ShowGenESP.Value

	local bb = Instance.new("BillboardGui")
	bb.Adornee = attach
	bb.Size = UDim2.new(0, 160, 0, 40)
	bb.StudsOffset = Vector3.new(0, 4, 0)
	bb.AlwaysOnTop = true
	bb.Parent = o
	bb.Enabled = tog.ShowGenESP.Value

	local lbl = Instance.new("TextLabel")
	lbl.Size = UDim2.new(1, 0, 1, 0)
	lbl.BackgroundTransparency = 1
	lbl.Text = txt
	lbl.TextColor3 = col
	lbl.TextStrokeTransparency = 0
	lbl.TextStrokeColor3 = Color3.fromRGB(0, 0, 0)
	lbl.TextSize = 13
	lbl.Font = Enum.Font.SourceSansBold
	lbl.Parent = bb

	genESPObjects[o] = { highlight = hl, billboard = bb, label = lbl }

	local gc = {}
	local pv = o:FindFirstChild("Progress")
	if pv and (pv:IsA("NumberValue") or pv:IsA("IntValue")) then
		table.insert(gc, pv:GetPropertyChangedSignal("Value"):Connect(function()
			updGenLbl(o)
		end))
	end
	table.insert(gc, o.ChildAdded:Connect(function(c)
		if c.Name == "Progress" and (c:IsA("NumberValue") or c:IsA("IntValue")) then
			table.insert(gc, c:GetPropertyChangedSignal("Value"):Connect(function()
				updGenLbl(o)
			end))
			updGenLbl(o)
		end
	end))
	table.insert(gc, o.AttributeChanged:Connect(function(a)
		if a == "Progress" or a == "Charge" then
			updGenLbl(o)
		end
	end))
	table.insert(gc, o.AncestryChanged:Connect(function(_, parent)
		if not parent then
			remGen(o)
		end
	end))
	genConns[o] = gc
end

local function updGen()
	for o, data in pairs(genESPObjects) do
		local enabled = tog.ShowGenESP.Value
		if data.highlight then
			data.highlight.Enabled = enabled
		end
		if data.billboard then
			data.billboard.Enabled = enabled
		end
		updGenLbl(o)
	end
end

tog.ShowGenESP:OnChanged(updGen)
opt.GenESPColor:OnChanged(updGen)

local function hndPmp(d)
	if d:IsA("ProximityPrompt") and d.ObjectText == "Document" then
		local p = d.Parent
		if p then appDoc(p) end
	end
end

local function chkGen(o)
	if o.Name == "Generator" then
		appGen(o)
	end
end

for _, v in ipairs(workspace:GetDescendants()) do
	hndPmp(v)
	chkGen(v)
end
table.insert(conns, workspace.DescendantAdded:Connect(function(d)
	hndPmp(d)
	chkGen(d)
end))

local function flwKey(n)
	return n.row .. "-" .. n.col
end

local function flwNeigh(r1, c1, r2, c2)
	if r2 == r1 - 1 and c2 == c1 then return "up" end
	if r2 == r1 + 1 and c2 == c1 then return "down" end
	if r2 == r1 and c2 == c1 - 1 then return "left" end
	if r2 == r1 and c2 == c1 + 1 then return "right" end
	return false
end

local function flwOrd(path, eps)
	if not path or #path == 0 then return path end
	local lk = {}
	for _, n in ipairs(path) do lk[flwKey(n)] = n end
	local st
	for _, ep in ipairs(eps or {}) do
		for _, n in ipairs(path) do
			if n.row == ep.row and n.col == ep.col then st = { row = ep.row, col = ep.col }; break end
		end
		if st then break end
	end
	if not st then
		for _, n in ipairs(path) do
			local nb = 0
			for _, d in ipairs({{-1, 0}, {1, 0}, {0, -1}, {0, 1}}) do
				if lk[(n.row + d[1]) .. "-" .. (n.col + d[2])] then nb = nb + 1 end
			end
			if nb == 1 then st = { row = n.row, col = n.col }; break end
		end
	end
	if not st then st = { row = path[1].row, col = path[1].col } end
	local pool, ord = {}, {}
	for _, n in ipairs(path) do pool[flwKey(n)] = { row = n.row, col = n.col } end
	local cur = st
	table.insert(ord, { row = cur.row, col = cur.col })
	pool[flwKey(cur)] = nil
	while next(pool) do
		local mv = false
		for k, node in pairs(pool) do
			if flwNeigh(cur.row, cur.col, node.row, node.col) then
				table.insert(ord, { row = node.row, col = node.col })
				pool[k] = nil
				cur = node
				mv = true
				break
			end
		end
		if not mv then break end
	end
	return ord
end

local function flwSlv(pz)
	if not pz or not pz.Solution then return end
	local idxs = {}
	for i = 1, #pz.Solution do idxs[i] = i end
	for i = #idxs, 2, -1 do
		local j = math.random(1, i)
		idxs[i], idxs[j] = idxs[j], idxs[i]
	end
	for _, ci in ipairs(idxs) do
		local sol = pz.Solution[ci]
		if sol then
			local ord = flwOrd(sol, pz.targetPairs[ci])
			if ord and #ord > 0 then
				pz.paths[ci] = {}
				for _, node in ipairs(ord) do
					table.insert(pz.paths[ci], { row = node.row, col = node.col })
					pz:updateGui()
					task.wait(opt.FlowNodeSpeed.Value)
				end
				task.wait(opt.FlowLinePause.Value)
				pz:checkForWin()
			end
		end
	end
end

local origFGNew = nil
local fgMod = nil
pcall(function()
	local mf = rs:WaitForChild("Modules", 10)
	local mg = mf and mf:WaitForChild("Minigames", 10)
	local fgf = mg and mg:WaitForChild("FlowGameManager", 10)
	fgMod = fgf and fgf:WaitForChild("FlowGame", 10)
	if fgMod then
		local FG = require(fgMod)
		if FG and FG.new then
			origFGNew = FG.new
			FG.new = function(...)
				local p = origFGNew(...)
				if tog.FlowAutoSolve.Value then
					task.spawn(function()
						task.wait(0.3)
						flwSlv(p)
					end)
				end
				return p
			end
		end
	end
end)

local function trkChr(char, isKiller)
	mkEsp(char, isKiller)
end

local espFolderConns = {}

local function clearEspFolder()
	for _, c in ipairs(espFolderConns) do
		c:Disconnect()
	end
	table.clear(espFolderConns)
end

local function wtch(fld)
	local isKiller = fld.Name == "Killers"
	for _, c in ipairs(fld:GetChildren()) do
		task.delay(0, function()
			local hum = c:WaitForChild("Humanoid", 5)
			local root = c:WaitForChild("HumanoidRootPart", 5)
			if hum and root then trkChr(c, isKiller) end
		end)
	end
	table.insert(espFolderConns, fld.ChildAdded:Connect(function(c)
		local hum = c:WaitForChild("Humanoid", 5)
		local root = c:WaitForChild("HumanoidRootPart", 5)
		if hum and root then trkChr(c, isKiller) end
	end))
	table.insert(espFolderConns, fld.ChildRemoved:Connect(function(c)
		rmEsp(c)
	end))
end

local function hookPdir()
	clearEspFolder()

	for inst in pairs(espObjects) do
		rmEsp(inst)
	end

	if not pdir then return end

	local kf = pdir:FindFirstChild("Killers")
	if kf then wtch(kf) end
	local sf = pdir:FindFirstChild("Survivors")
	if sf then wtch(sf) end

	table.insert(espFolderConns, pdir.ChildAdded:Connect(function(sub)
		if sub.Name ~= "Spectating" then
			wtch(sub)
			if sub.Name == "Killers" then
				updBlk()
			end
		end
	end))

	table.insert(espFolderConns, pdir.ChildRemoved:Connect(function(sub)
		if sub.Name == "Killers" or sub.Name == "Survivors" then
			for _, c in ipairs(sub:GetChildren()) do
				rmEsp(c)
			end
		end
	end))

	updBlk()
	updAl()
end

hookPdir()

for _, p in ipairs(plrs:GetPlayers()) do
	if p.Character then
		task.delay(0, function()
			local hum = p.Character:WaitForChild("Humanoid", 5)
			local root = p.Character:WaitForChild("HumanoidRootPart", 5)
			if hum and root then trkChr(p.Character, false) end
		end)
	end
	table.insert(conns, p.CharacterAdded:Connect(function(c)
		local hum = c:WaitForChild("Humanoid", 5)
		local root = c:WaitForChild("HumanoidRootPart", 5)
		if hum and root then trkChr(c, false) end
		updChr(c, false)
	end))
	table.insert(conns, p.CharacterRemoving:Connect(function(c)
		rmEsp(c)
	end))
end

table.insert(conns, plrs.PlayerAdded:Connect(function(p)
	table.insert(conns, p.CharacterAdded:Connect(function(c)
		local hum = c:WaitForChild("Humanoid", 5)
		local root = c:WaitForChild("HumanoidRootPart", 5)
		if hum and root then trkChr(c, false) end
		updChr(c, false)
	end))
	table.insert(conns, p.CharacterRemoving:Connect(function(c)
		rmEsp(c)
	end))
end))

if pdir then
	table.insert(conns, pdir.ChildAdded:Connect(function(sub)
		if sub.Name == "Killers" or sub.Name == "Survivors" then
			hookPdir()
		end
	end))
end

local jdEnabled = false
local jdAimbot = false
local jdPatched = false
local jdAxeLocked = false
local jdForeverHoldThread = nil
local jdNetRF = nil
local jdNetRE = nil
local jdNetURE = nil
local jdRfDispatch = { hooks = {}, installed = false, origCb = nil }

pcall(function()
	jdNetRE = rs:WaitForChild("Modules", 10):WaitForChild("Network", 10):WaitForChild("Network", 10):WaitForChild("RemoteEvent", 10)
end)
pcall(function()
	jdNetRF = rs:WaitForChild("Modules", 10):WaitForChild("Network", 10):WaitForChild("Network", 10):WaitForChild("RemoteFunction", 10)
end)
pcall(function()
	jdNetURE = rs:WaitForChild("Modules", 10):WaitForChild("Network", 10):WaitForChild("Network", 10):WaitForChild("UnreliableRemoteEvent", 10)
end)

local function jdInstallRF(rf)
	if jdRfDispatch.installed then return end
	jdRfDispatch.installed = true
	if typeof(getcallbackvalue) == "function" then
		jdRfDispatch.origCb = getcallbackvalue(rf, "OnClientInvoke")
	else
		jdRfDispatch.origCb = rf.OnClientInvoke
	end
	rf.OnClientInvoke = function(reqName, ...)
		for id, fn in pairs(jdRfDispatch.hooks) do
			local ok, res = pcall(fn, reqName, ...)
			if ok and res ~= nil then return res end
		end
		if jdRfDispatch.origCb then
			local ok, res = pcall(jdRfDispatch.origCb, reqName, ...)
			if ok then return res end
		end
	end
end

local function jdUninstallRF(rf)
	if not jdRfDispatch.installed then return end
	if rf and jdRfDispatch.origCb then
		rf.OnClientInvoke = jdRfDispatch.origCb
	end
	jdRfDispatch.hooks = {}
	jdRfDispatch.origCb = nil
	jdRfDispatch.installed = false
end

local function jdGetKillerVel(hrp)
	if not hrp then return Vector3.zero end
	local vel = hrp.AssemblyLinearVelocity
	if vel and vel.Magnitude > 0.1 then
		if vel.Magnitude > 70 then
			return vel.Unit * 70
		end
		return vel
	end
	return Vector3.zero
end

local function jdNearKiller()
	local char = lp.Character
	local myHRP = char and char:FindFirstChild("HumanoidRootPart")
	if not myHRP then return nil end
	local kf = pdir and pdir:FindFirstChild("Killers")
	if not kf then return nil end
	local cam = workspace.CurrentCamera
	local vp = cam and cam.ViewportSize
	local center = vp and Vector2.new(vp.X / 2, vp.Y / 2)
	local fovRad = opt.JDFOVRadius.Value
	local fovOnly = tog.JDFOVCheck.Value or tog.JDShowFOV.Value

	local best, bestDist = nil, math.huge
	local fovBest, fovDist = nil, math.huge

	for _, k in ipairs(kf:GetChildren()) do
		local hrp = k:FindFirstChild("HumanoidRootPart")
		local h = k:FindFirstChildOfClass("Humanoid")
		if hrp and h and h.Health > 0 then
			local d = (hrp.Position - myHRP.Position).Magnitude
			if d < bestDist then
				bestDist = d
				best = hrp
			end
			if cam and center then
				local sp, onScrn = cam:WorldToViewportPoint(hrp.Position)
				if onScrn or sp.Z > 0 then
					local sDist = (Vector2.new(sp.X, sp.Y) - center).Magnitude
					if sDist <= fovRad and sDist < fovDist then
						fovDist = sDist
						fovBest = hrp
					end
				end
			end
		end
	end
	if fovOnly and fovBest then
		return fovBest
	end
	return fovBest or best
end

local function jdCalcTarget(best, myHRP, offset, predMult)
	local vel = jdGetKillerVel(best)
	local spawnPos = myHRP.Position + Vector3.new(0, 2, 0)
	local rawTarget = best.Position + Vector3.new(0, offset, 0)
	local dist = (rawTarget - spawnPos).Magnitude
	local v0 = 250
	local flightTime = (dist / v0) * (predMult / 5)
	return rawTarget + vel * flightTime, vel, dist, v0, spawnPos
end

local function jdBallisticDir(spawnPos, targetPos, v0)
	local g = workspace.Gravity
	local delta = targetPos - spawnPos
	local flat = Vector3.new(delta.X, 0, delta.Z)
	local dx = flat.Magnitude
	local dy = delta.Y
	local flatDir = dx > 0.01 and flat.Unit or Vector3.new(0, 0, 1)
	local v2 = v0 * v0
	local disc = v2 * v2 - g * (g * dx * dx + 2 * dy * v2)
	local theta
	if disc >= 0 then
		local tanTheta = (v2 + math.sqrt(disc)) / (g * dx)
		theta = math.atan(tanTheta)
	else
		theta = math.rad(45)
	end
	return (flatDir * math.cos(theta) + Vector3.new(0, math.sin(theta), 0)).Unit
end

local function jdApplyPatch()
	if jdPatched or not jdNetRF then return end
	jdInstallRF(jdNetRF)
	jdRfDispatch.hooks["jd"] = function(reqName)
		if not (jdEnabled and jdAimbot) then return nil end
		local char = lp.Character
		local myHRP = char and char:FindFirstChild("HumanoidRootPart")
		if not myHRP then return nil end
		local best = jdNearKiller()
		if not best then return nil end
		local pred = opt.JDPrediction.Value
		local offset = opt.JDAimOffset.Value
		local predPos, vel, dist, v0, spawnPos = jdCalcTarget(best, myHRP, offset, pred)

		if reqName == "GetMousePosition" then
			if tog.JDLebron.Value then
				local launchDir = jdBallisticDir(spawnPos, predPos, v0)
				return spawnPos + launchDir * dist
			end
			return predPos
		end

		if reqName == "GetCameraCF" then
			local cam = workspace.CurrentCamera
			if not cam then return nil end
			local launchDir
			if tog.JDLebron.Value then
				launchDir = jdBallisticDir(spawnPos, predPos, v0)
			else
				launchDir = (predPos - cam.CFrame.Position).Unit
			end
			if tog.JDAutoFace.Value then
				local flatLook = Vector3.new(launchDir.X, 0, launchDir.Z)
				if flatLook.Magnitude > 0.01 then
					myHRP.CFrame = CFrame.new(myHRP.Position, myHRP.Position + flatLook.Unit)
				end
			end
			return CFrame.new(cam.CFrame.Position, cam.CFrame.Position + launchDir)
		end
		return nil
	end
	jdPatched = true
end

local function jdRemovePatch()
	if not jdPatched then return end
	jdRfDispatch.hooks["jd"] = nil
	if not next(jdRfDispatch.hooks) then
		jdUninstallRF(jdNetRF)
	end
	jdPatched = false
end

local function jdOverrideCrystal()
	local janeActor = acts.CurrentActors and acts.CurrentActors[lp]
	if not janeActor then return end
	if janeActor.Config and janeActor.Config.Crystal then
		janeActor.Config.Crystal.MinChargeTime = 0.01
		janeActor.Config.Crystal.MaxChargeTime = 0.05
		janeActor.Config.ChannelTime = 0.01
		janeActor.Config.ChargeSpeedMult = 100
		janeActor.Config.MaxSpeed = 250
		janeActor.Config.MinSpeed = 250
	end
end

local function jdForceMaxCharge()
	local janeActor = acts.CurrentActors and acts.CurrentActors[lp]
	if janeActor and janeActor.State then
		janeActor.State.CrystalFullChargeTime = os.clock() - 999
	end
end

local function jdToggleForeverHold(on)
	if jdForeverHoldThread then
		task.cancel(jdForeverHoldThread)
		jdForeverHoldThread = nil
	end
	if not on then
		local ja = acts.CurrentActors and acts.CurrentActors[lp]
		if ja and ja.Config and ja.Config.Crystal then
			ja.Config.Crystal.MinChargeTime = 0.3
			ja.Config.Crystal.MaxChargeTime = 2.5
			ja.Config.ChannelTime = 0.5
			ja.Config.ChargeSpeedMult = 1.2
			ja.Config.MaxSpeed = 250
			ja.Config.MinSpeed = 60
		end
		return
	end
	jdOverrideCrystal()
	jdForeverHoldThread = task.spawn(function()
		while tog.JDForeverHold.Value and not unloaded do
			jdForceMaxCharge()
			local pg = lp:FindFirstChild("PlayerGui")
			if pg then
				local tmp = pg:FindFirstChild("TemporaryUI")
				local cui = tmp and tmp:FindFirstChild("ChargeUI")
				local bar = cui and cui:FindFirstChild("Bar")
				if bar then
					local pct = bar:FindFirstChild("Percent")
					if pct then pct.Text = "100%" end
					bar.ImageColor3 = Color3.fromRGB(0, 255, 0)
				end
			end
			task.wait(0.05)
		end
	end)
end

tog.JDEnabled:OnChanged(function(on)
	jdEnabled = on
	if on then jdApplyPatch() end
end)

tog.JDAimbot:OnChanged(function(on)
	jdAimbot = on
	if on then jdApplyPatch() end
end)

tog.JDForeverHold:OnChanged(jdToggleForeverHold)

tog.JDLebron:OnChanged(function(on)
	if on then jdApplyPatch() end
end)

local jdLastActor = nil

task.spawn(function()
	while not unloaded do
		task.wait(0.5)
		local cur = lp.Character
		if cur ~= jdLastActor then
			if jdLastActor ~= nil then
				jdPatched = false
			end
			jdLastActor = cur
			if cur and jdEnabled then
				jdApplyPatch()
			end
		end
	end
end)

task.spawn(function()
	while not (jdNetRE and jdNetURE) do task.wait(0.5) end
	if typeof(hookmetamethod) ~= "function" then return end
	local crystalInputName = lp.Name .. "CrystalInput"
	local origNamecall
	origNamecall = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
		local method = getnamecallmethod()
		if method == "FireServer" then
			if self == jdNetRE and jdEnabled and tog.JDForeverHold and tog.JDForeverHold.Value then
				local arg1 = ...
				if arg1 == crystalInputName then
					local ja = acts.CurrentActors and acts.CurrentActors[lp]
					if ja and ja.State then
						ja.State.CrystalFullChargeTime = os.clock() - 999
					end
				end
			end
			if tog.FakePos and tog.FakePos.Value and (self == jdNetURE or self == jdNetRE) then
				local xOff, yOff, zOff = getFakeOffset()
				local n = select("#", ...)
				for i = 1, n do
					local arg = select(i, ...)
					if typeof(arg) == "buffer" then
						spoofPosBuf(arg, xOff, yOff, zOff)
					elseif type(arg) == "table" then
						for _, v in pairs(arg) do
							if typeof(v) == "buffer" then
								spoofPosBuf(v, xOff, yOff, zOff)
							end
						end
					end
				end
			end
		end
		return origNamecall(self, ...)
	end))
end)

table.insert(conns, run.Heartbeat:Connect(function()
	if not (tog.FakePos and tog.FakePos.Value) then return end
	local char = lp.Character
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if not hrp then return end
	if jdNetURE then
		local xOff, yOff, zOff = getFakeOffset()
		local b = buffer.create(30)
		buffer.writef32(b, 0, hrp.Position.X + xOff)
		buffer.writef32(b, 4, hrp.Position.Y + yOff)
		buffer.writef32(b, 8, hrp.Position.Z + zOff)
		local vel = hrp.AssemblyLinearVelocity
		buffer.writef32(b, 12, vel.X)
		buffer.writef32(b, 16, vel.Y)
		buffer.writef32(b, 20, vel.Z)
		local b64 = b64encode(buffer.tostring(b))
		local jsonStr = '{"m":null,"t":"buffer","base64":"' .. b64 .. '"}'
		local pBuf = buffer.create(5 + #jsonStr)
		buffer.writeu8(pBuf, 0, 10)
		buffer.writeu32(pBuf, 1, #jsonStr)
		buffer.writestring(pBuf, 5, jsonStr)
		pcall(function()
			jdNetURE:FireServer(1, { [1] = pBuf })
		end)
	end
end))

task.spawn(function()
	while not jdNetRE do task.wait(0.5) end
	local conn
	conn = jdNetRE.OnClientEvent:Connect(function(...)
		local args = {...}
		if not jdEnabled then return end
		if not (tog.JDAxe and tog.JDAxe.Value) then return end
		if args[1] == "UseActorAbility" and args[2] and args[2][1] then
			local abName = decBuf(args[2][1])
			if abName:find("Axe") then
				if jdAxeLocked then return end
				local char = lp.Character
				local myHRP = char and char:FindFirstChild("HumanoidRootPart")
				local hum = char and char:FindFirstChildOfClass("Humanoid")
				if not myHRP or not hum then return end
				local best = jdNearKiller()
				if not best then return end
				jdAxeLocked = true
				local savedAR = hum.AutoRotate
				hum.AutoRotate = false
				local dur = opt.JDAxeDur and opt.JDAxeDur.Value or 2
				local deadline = os.clock() + dur
				local axeConn
				axeConn = run.RenderStepped:Connect(function()
					if os.clock() >= deadline or not tog.JDAxe.Value or unloaded then
						axeConn:Disconnect()
						hum.AutoRotate = savedAR
						jdAxeLocked = false
						return
					end
					if not myHRP.Parent or not best.Parent then
						axeConn:Disconnect()
						pcall(function() hum.AutoRotate = savedAR end)
						jdAxeLocked = false
						return
					end
					local dir = Vector3.new(best.Position.X - myHRP.Position.X, 0, best.Position.Z - myHRP.Position.Z)
					if dir.Magnitude > 0 then
						myHRP.CFrame = CFrame.new(myHRP.Position, myHRP.Position + dir.Unit)
					end
				end)
			end
		end
	end)
	getgenv()._jdConn = conn
end)

local function applyNoliConfigPatch()
	pcall(function()
		local cfgMod = rs:FindFirstChild("Assets") and rs.Assets:FindFirstChild("Killers") and rs.Assets.Killers:FindFirstChild("Noli") and rs.Assets.Killers.Noli:FindFirstChild("Config")
		local cfg = cfgMod and require(cfgMod)
		local ja = acts and acts.CurrentActors and acts.CurrentActors[lp]
		local targets = { cfg, ja and ja.Config }

		for _, c in ipairs(targets) do
			if c then
				if tog.NoliVoidRushControl and tog.NoliVoidRushControl.Value then
					c.VoidRushTurnSpeed = 999
					c.VoidRushInitialTurnMult = 999
					c.VoidRushInitialTurnDuration = 99999
				else
					c.VoidRushTurnSpeed = 1
					c.VoidRushInitialTurnMult = 6.6
					c.VoidRushInitialTurnDuration = 1.5
				end
				if tog.NoliFastCharge and tog.NoliFastCharge.Value then
					c.VoidRushChargeLength = 0.05
				else
					c.VoidRushChargeLength = 1
				end
				if tog.NoliInfiniteDash and tog.NoliInfiniteDash.Value then
					c.VoidRushDashLength = 99999
				else
					c.VoidRushDashLength = 3.5
				end
				if opt.NoliDashSpeed then
					c.VoidRushDashSpeed = opt.NoliDashSpeed.Value
				end
				if tog.NoliFastAttacks and tog.NoliFastAttacks.Value then
					c.StabWindup = 0.01
					c.StabEndlag = 0.05
					c.StabCooldown = 0.1
					c.VoidRushHitEndlag = 0.05
					c.VoidRushMissEndlag = 0.05
				else
					c.StabWindup = 0.35
					c.StabEndlag = 1.5
					c.StabCooldown = 1.8
					c.VoidRushHitEndlag = 0.85
					c.VoidRushMissEndlag = 2
				end
				if tog.NoliFastNova and tog.NoliFastNova.Value then
					c.NovaWindup = 0.05
					c.NovaProjectileSpeed = 250
					c.NovaExplosionRadius = 60
				else
					c.NovaWindup = 0.7
					c.NovaProjectileSpeed = 80
					c.NovaExplosionRadius = 26
				end
				if tog.NoliFastTeleport and tog.NoliFastTeleport.Value then
					c.ObservantTeleportWindup = 0.05
					c.ObservantTeleportEndlag = 0.05
					c.ObservantSpeed = 1
				else
					c.ObservantTeleportWindup = 1.45
					c.ObservantTeleportEndlag = 1.3
					c.ObservantSpeed = 0.2
				end
			end
		end
	end)
end

tog.NoliVoidRushControl:OnChanged(applyNoliConfigPatch)
opt.NoliTurnSpeed:OnChanged(applyNoliConfigPatch)
tog.NoliInstantTurn:OnChanged(applyNoliConfigPatch)
tog.NoliInfiniteTurnDuration:OnChanged(applyNoliConfigPatch)
tog.NoliFastCharge:OnChanged(applyNoliConfigPatch)
tog.NoliInfiniteDash:OnChanged(applyNoliConfigPatch)
opt.NoliDashSpeed:OnChanged(applyNoliConfigPatch)
tog.NoliFastAttacks:OnChanged(applyNoliConfigPatch)
tog.NoliFastNova:OnChanged(applyNoliConfigPatch)
tog.NoliFastTeleport:OnChanged(applyNoliConfigPatch)

table.insert(conns, lp.CharacterAdded:Connect(function()
	task.wait(0.5)
	applyNoliConfigPatch()
end))

local voidRushAnimIds = {
	["139835501033932"] = true,
	["126896426760253"] = true,
	["114356208094580"] = true,
	["135884061951801"] = true,
	["93841120533318"] = true,
	["91758760621955"] = true,
}

local lastPathTime = 0
local currentWaypoints = {}
local currentWpIndex = 1
local lastTargetRoot = nil

local function getNearestSurvivor(myPos, maxDist)
	local sf = pdir and pdir:FindFirstChild("Survivors")
	if not sf then return nil end
	local best, bestDist = nil, maxDist or 300
	for _, m in ipairs(sf:GetChildren()) do
		if m ~= lp.Character and m:IsA("Model") then
			local r = m:FindFirstChild("HumanoidRootPart")
			local h = m:FindFirstChildOfClass("Humanoid")
			if r and h and h.Health > 0 then
				local d = (r.Position - myPos).Magnitude
				if d < bestDist then
					bestDist = d
					best = r
				end
			end
		end
	end
	return best, bestDist
end

local wasNoliRushing = false
table.insert(conns, run.RenderStepped:Connect(function()
	if not (tog.NoliVoidRushControl and tog.NoliVoidRushControl.Value) then return end
	local char = lp.Character
	local hum = char and char:FindFirstChildOfClass("Humanoid")
	local hrp = char and char:FindFirstChild("HumanoidRootPart")
	if not (hum and hrp) then return end
	local isRushing = false
	for _, track in ipairs(hum:GetPlayingAnimationTracks()) do
		local aId = track.Animation and track.Animation.AnimationId or ""
		local num = aId:match("%d+")
		if num and voidRushAnimIds[num] then
			isRushing = true
			break
		end
	end
	local ja = acts and acts.CurrentActors and acts.CurrentActors[lp]
	if not isRushing and ja and ja.State and (ja.State.IsVoidRushing or ja.State.VoidRushing or ja.State.Dashing or ja.State.IsDashing) then
		isRushing = true
	end
	if not isRushing then
		local hVel = Vector3.new(hrp.AssemblyLinearVelocity.X, 0, hrp.AssemblyLinearVelocity.Z).Magnitude
		if hVel > 38 then
			local kf = pdir and pdir:FindFirstChild("Killers")
			if kf and char:IsDescendantOf(kf) then
				isRushing = true
			end
		end
	end
	if isRushing then
		wasNoliRushing = true
		hum.AutoRotate = false

		local steerTargetPos = nil
		if tog.NoliAimbot and tog.NoliAimbot.Value then
			local maxRange = opt.NoliAimRange and opt.NoliAimRange.Value or 300
			local target = getNearestSurvivor(hrp.Position, maxRange)
			if target then
				local mode = opt.NoliAimMode and opt.NoliAimMode.Value or "Pathfind Around Walls"
				local hasLos = checkWall(hrp.Position, target.Position, { lp.Character, target.Parent })
				if mode == "Direct Lock" or hasLos then
					steerTargetPos = target.Position
					currentWaypoints = {}
				else
					local now = os.clock()
					if now - lastPathTime > 0.15 or target ~= lastTargetRoot or #currentWaypoints == 0 then
						lastPathTime = now
						lastTargetRoot = target
						pcall(function()
							local path = pfs:CreatePath({
								AgentRadius = 2.5,
								AgentHeight = 5,
								AgentCanJump = true,
								WaypointSpacing = 4,
							})
							path:ComputeAsync(hrp.Position, target.Position)
							if path.Status == Enum.PathStatus.Success then
								currentWaypoints = path:GetWaypoints()
								currentWpIndex = 1
							else
								currentWaypoints = {}
							end
						end)
					end
					if #currentWaypoints > 0 then
						while currentWpIndex <= #currentWaypoints do
							local wp = currentWaypoints[currentWpIndex]
							local d = (Vector3.new(wp.Position.X, hrp.Position.Y, wp.Position.Z) - hrp.Position).Magnitude
							if d > 3 then
								steerTargetPos = wp.Position
								break
							end
							currentWpIndex = currentWpIndex + 1
						end
						if currentWpIndex > #currentWaypoints then
							steerTargetPos = target.Position
						end
					else
						steerTargetPos = target.Position
					end
				end
				if tog.NoliAimbotAutoFace and tog.NoliAimbotAutoFace.Value then
					local cam = workspace.CurrentCamera
					if cam then
						cam.CFrame = CFrame.new(cam.CFrame.Position, target.Position)
					end
				end
			end
		end

		local flat = nil
		if steerTargetPos then
			flat = Vector3.new(steerTargetPos.X - hrp.Position.X, 0, steerTargetPos.Z - hrp.Position.Z)
		elseif tog.NoliCameraSteer and tog.NoliCameraSteer.Value then
			local cam = workspace.CurrentCamera
			if cam then
				local look = cam.CFrame.LookVector
				flat = Vector3.new(look.X, 0, look.Z)
			end
		end

		if flat and flat.Magnitude > 0.01 then
			local dir = flat.Unit
			local spd = opt.NoliDashSpeed and opt.NoliDashSpeed.Value or 60
			hrp.CFrame = CFrame.lookAt(hrp.Position, hrp.Position + dir)
			hrp.AssemblyAngularVelocity = Vector3.zero
			hrp.AssemblyLinearVelocity = Vector3.new(dir.X * spd, hrp.AssemblyLinearVelocity.Y, dir.Z * spd)
			for _, obj in ipairs(hrp:GetChildren()) do
				if obj:IsA("BodyVelocity") then
					obj.Velocity = Vector3.new(dir.X * spd, obj.Velocity.Y, dir.Z * spd)
				elseif obj:IsA("LinearVelocity") then
					obj.VectorVelocity = Vector3.new(dir.X * spd, obj.VectorVelocity.Y, dir.Z * spd)
				elseif obj:IsA("BodyGyro") then
					obj.CFrame = CFrame.lookAt(hrp.Position, hrp.Position + dir)
				elseif obj:IsA("AlignOrientation") then
					obj.CFrame = CFrame.lookAt(hrp.Position, hrp.Position + dir)
				end
			end
			if ja then
				if ja.Config then
					ja.Config.VoidRushInitialTurnDuration = 99999
					ja.Config.VoidRushInitialTurnMult = 999
					ja.Config.VoidRushTurnSpeed = 999
				end
				if ja.State then
					ja.State.InitialTurn = true
					if ja.State.RushStartTime then ja.State.RushStartTime = os.clock() end
					if ja.State.TurnMultiplier then ja.State.TurnMultiplier = 999 end
					if ja.State.VoidRushDirection then ja.State.VoidRushDirection = dir end
					if ja.State.DashDirection then ja.State.DashDirection = dir end
					if ja.State.InitialDirection then ja.State.InitialDirection = dir end
					if ja.State.StartDirection then ja.State.StartDirection = dir end
					if ja.State.CurrentDirection then ja.State.CurrentDirection = dir end
					if ja.State.Direction then ja.State.Direction = dir end
					if ja.State.InitialCFrame then ja.State.InitialCFrame = CFrame.lookAt(hrp.Position, hrp.Position + dir) end
					if ja.State.StartCFrame then ja.State.StartCFrame = CFrame.lookAt(hrp.Position, hrp.Position + dir) end
					if ja.State.LastCFrame then ja.State.LastCFrame = CFrame.lookAt(hrp.Position, hrp.Position + dir) end
					if ja.State.MaxTurnAngle then ja.State.MaxTurnAngle = math.pi * 2 end
					if ja.State.TurnAngleLimit then ja.State.TurnAngleLimit = math.pi * 2 end
				end
			end
		end
	elseif wasNoliRushing then
		wasNoliRushing = false
		currentWaypoints = {}
		lastTargetRoot = nil
		pcall(function() hum.AutoRotate = true end)
	end
end))

lib:OnUnload(function()
	unloaded = true
	if jdForeverHoldThread then
		task.cancel(jdForeverHoldThread)
		jdForeverHoldThread = nil
	end
	jdRemovePatch()
	if origFGNew and fgMod then
		pcall(function()
			local FG = require(fgMod)
			if FG then FG.new = origFGNew end
		end)
	end
	if getgenv()._jdConn then
		getgenv()._jdConn:Disconnect()
		getgenv()._jdConn = nil
	end
	for _, conn in ipairs(conns) do
		conn:Disconnect()
	end
	cleanAnimConns()
	for _, conn in ipairs(animStopConns) do
		conn:Disconnect()
	end
	clearEspFolder()
	if abConns.Added then abConns.Added:Disconnect() abConns.Added = nil end
	if abConns.Removed then abConns.Removed:Disconnect() abConns.Removed = nil end
	for _, handler in pairs(abActive) do
		handler()
	end
	for inst in pairs(espObjects) do
		rmEsp(inst)
	end
	if espFolder then
		espFolder:Destroy()
	end
	for m, o in pairs(docESPObjects) do
		if o.highlight then o.highlight:Destroy() end
		if o.billboard then o.billboard:Destroy() end
	end
	for o, data in pairs(genESPObjects) do
		if data.highlight then data.highlight:Destroy() end
		if data.billboard then data.billboard:Destroy() end
	end
	for _, gc in pairs(genConns) do
		for _, c in ipairs(gc) do c:Disconnect() end
	end
	stpAim()
	if jdFovGui then
		jdFovGui:Destroy()
	end
end)

sav:LoadAutoloadConfig()
