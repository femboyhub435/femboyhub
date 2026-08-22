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
	Stamina = w:AddTab("Stamina", "zap"),
	JaneDoe = w:AddTab("Jane Doe", "gem"),
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

cbGb:AddSlider("KillerFOV", {
	Text = "Killer FOV Angle",
	Default = 70,
	Min = 10,
	Max = 180,
	Rounding = 0,
})

cbGb:AddLabel("This auto block already has facing check built-in.")

cbGb:AddDropdown("AntiBaitMethod", {
	Values = {"Better", "Better Better", "Blatant"},
	Default = "Better",
	Multi = false,
	Text = "Anti Bait Method",
})

cbGb:AddToggle("AntiBait", {
	Text = "Anti Block Bait",
	Default = true,
})

cbGb:AddToggle("ShowIndicator", {
	Text = "Show Attack Indicator",
	Default = true,
})

cbGb:AddToggle("AttackIndicator", {
	Text = "Killer Attacking (Indicator)",
	Default = false,
})

cbGb:AddToggle("BaitLunge", {
	Text = "Bait Velocity Lunge",
	Default = false,
})

cbGb:AddToggle("LegitLunge", {
	Text = "Legit Lunge",
	Default = false,
})

cbGb:AddToggle("HitboxShake", {
	Text = "Hitbox Shake",
	Default = false,
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
	Text = "FOV Part Type",
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

local bEspGb = tabs.ESP:AddLeftGroupbox("Built-in ESP (Forsaken)")

bEspGb:AddToggle("Nametag", {
	Text = "Nametag",
	Default = false,
})

bEspGb:AddToggle("ShowHighlight", {
	Text = "Show Highlight",
	Default = false,
}):AddColorPicker("FillColor", {
	Default = Color3.fromRGB(255, 255, 255),
	Title = "Fill Color",
})

bEspGb:AddLabel("Highlight Outline"):AddColorPicker("OutlineColor", {
	Default = Color3.fromRGB(255, 255, 255),
	Title = "Outline Color",
})

bEspGb:AddSlider("FillTrans", {
	Text = "Fill Transparency",
	Default = 0.5,
	Min = 0,
	Max = 1,
	Rounding = 2,
})

bEspGb:AddSlider("OutlineTrans", {
	Text = "Outline Transparency",
	Default = 0,
	Min = 0,
	Max = 1,
	Rounding = 2,
})

bEspGb:AddToggle("ShowSurvivor", {
	Text = "Show Survivor Name",
	Default = true,
})

bEspGb:AddToggle("ShowUser", {
	Text = "Show Username",
	Default = true,
})

bEspGb:AddToggle("ShowHealth", {
	Text = "Show Health",
	Default = true,
})

local dEspGb = tabs.ESP:AddRightGroupbox("Drawing ESP")

dEspGb:AddToggle("DrawBoxes", {
	Text = "Show Boxes",
	Default = false,
})

dEspGb:AddToggle("DynScale", {
	Text = "Dynamic Box Scale",
	Default = true,
})

dEspGb:AddToggle("DrawNames", {
	Text = "Show Names",
	Default = false,
})

dEspGb:AddToggle("DrawTracers", {
	Text = "Show Tracers",
	Default = false,
})

dEspGb:AddToggle("DrawHealth", {
	Text = "Show Healthbar",
	Default = true,
})

dEspGb:AddToggle("DrawDist", {
	Text = "Show Distance",
	Default = true,
})

dEspGb:AddLabel("Survivor Color"):AddColorPicker("DrawSurvColor", {
	Default = Color3.fromRGB(0, 255, 150),
	Title = "Survivor Color",
})

dEspGb:AddLabel("Killer Color"):AddColorPicker("DrawKillColor", {
	Default = Color3.fromRGB(255, 0, 0),
	Title = "Killer Color",
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

local jdGb = tabs.JaneDoe:AddLeftGroupbox("Crystal Auto-Fire")

jdGb:AddToggle("JDEnabled", {
	Text = "Enable Jane Doe Aimbot",
	Default = false,
})

jdGb:AddToggle("JDAimbot", {
	Text = "Aimbot (Silent Aim)",
	Default = false,
})

jdGb:AddSlider("JDAimOffset", {
	Text = "Aim Offset (Y)",
	Default = -3,
	Min = -5,
	Max = 5,
	Rounding = 1,
})

jdGb:AddSlider("JDPrediction", {
	Text = "Prediction",
	Default = 6,
	Min = 0,
	Max = 10,
	Rounding = 1,
})

jdGb:AddToggle("JDShowFOV", {
	Text = "Show FOV Circle",
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

local jdGb2 = tabs.JaneDoe:AddRightGroupbox("Axe Lock-On")

jdGb2:AddToggle("JDAxe", {
	Text = "Enable Axe Lock-On",
	Default = false,
})

jdGb2:AddSlider("JDAxeDur", {
	Text = "Lock Duration (s)",
	Default = 17,
	Min = 5,
	Max = 30,
	Rounding = 1,
})

local jdGb3 = tabs.JaneDoe:AddLeftGroupbox("Forever Hold")

jdGb3:AddToggle("JDForeverHold", {
	Text = "Forever Hold (Max Speed)",
	Default = false,
})

local jdGb4 = tabs.JaneDoe:AddRightGroupbox("LeBron Shoot")

jdGb4:AddToggle("JDLebron", {
	Text = "LeBron Shoot (Arc)",
	Default = false,
})

local mnGb = tabs["UI Settings"]:AddLeftGroupbox("Menu")
mnGb:AddButton("Unload", function() lib:Unload() end)
mnGb:AddLabel("Menu bind"):AddKeyPicker("MenuKeybind", {
	Default = "End",
	NoUI = true,
	Text = "Menu bind",
})
lib.ToggleKeybind = opt.MenuKeybind

local tgGb = tabs["UI Settings"]:AddLeftGroupbox("Toggles")
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

tog.WatermarkToggle:OnChanged(function()
	lib:SetWatermarkVisibility(tog.WatermarkToggle.Value)
end)
tog.KeybindToggle:OnChanged(function()
	lib.KeybindFrame.Visible = tog.KeybindToggle.Value
end)
opt.DPIScale:OnChanged(function()
	local raw = opt.DPIScale.Value
	local val = type(raw) == "number" and raw or tonumber(tostring(raw):match("%d+")) or 100
	lib:SetDPIScale(val)
end)

local plrs = game:GetService("Players")
local rs = game:GetService("ReplicatedStorage")
local run = game:GetService("RunService")
local lp = plrs.LocalPlayer
local pgui = lp:WaitForChild("PlayerGui", 10)
local tui = pgui and pgui:WaitForChild("TemporaryUI", 10)
local dhand = require(rs.Modules.Data.DataHandler)
local acts = require(rs.Modules.Gameplay.Actors)
local nts = rs.Systems.Character.Game.Nametags
local spm = require(rs.Systems.Character.Game.Sprinting)
local pdir = workspace:WaitForChild("Players", 10)

local conns = {}

local so = {
	Max = spm.MaxStamina,
	Gain = spm.StaminaGain,
	Time = spm.timeUntilStaminaRecovers,
	DefMax = spm.DefaultConfig and spm.DefaultConfig.MaxStamina or 100,
	DefGain = spm.DefaultConfig and spm.DefaultConfig.StaminaGain or 15
}

local function updStam()
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
		local mv = opt.MaxStamina.Value
		local gv = opt.StaminaGain.Value
		local fr = tog.FastRegen.Value
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

local abActive = {}
local abConns = {}
local hitActive = false
local pIndex = 1
local kAttacking = {}

table.insert(conns, run.Heartbeat:Connect(function()
	if not tog.ShowIndicator.Value then return end
	local any = false
	for _, a in pairs(kAttacking) do if a then any = true break end end
	if tog.AttackIndicator.Value ~= any then tog.AttackIndicator:SetValue(any) end
end))


local punchAnims = {
	["rbxassetid://96959123077498"] = true,
	["rbxassetid://72722244508749"] = true
}

local punchAimbotAnims = {
	["rbxassetid://87259391926321"] = true,
	["rbxassetid://140703210927645"] = true,
	["rbxassetid://136007065400978"] = true,
	["rbxassetid://129843313690921"] = true,
	["rbxassetid://86709774283672"] = true,
	["rbxassetid://108807732150251"] = true,
	["rbxassetid://138040001965654"] = true,
	["rbxassetid://86096387000557"] = true
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
	["rbxassetid://133709029886490"] = true
}

local drawings = {}
local docESPObjects = {}

local function mkDraw(inst, isKiller)
	if drawings[inst] then return end
	local function ln()
		local l = Drawing.new("Line")
		l.Visible = false
		l.Thickness = 1
		return l
	end
	local name = Drawing.new("Text")
	name.Size = 13
	name.Center = true
	name.Outline = true
	name.OutlineColor = Color3.new(0, 0, 0)
	name.Visible = false
	local dist = Drawing.new("Text")
	dist.Size = 11
	dist.Center = true
	dist.Outline = true
	dist.OutlineColor = Color3.new(0, 0, 0)
	dist.Color = Color3.new(1, 1, 1)
	dist.Visible = false
	drawings[inst] = {
		tlH = ln(), tlV = ln(),
		trH = ln(), trV = ln(),
		blH = ln(), blV = ln(),
		brH = ln(), brV = ln(),
		hpBg = ln(), hpFill = ln(),
		tracer = ln(),
		name = name,
		dist = dist,
		isKiller = isKiller
	}
end

local function rmDraw(inst)
	local d = drawings[inst]
	if not d then return end
	d.tlH:Remove() d.tlV:Remove()
	d.trH:Remove() d.trV:Remove()
	d.blH:Remove() d.blV:Remove()
	d.brH:Remove() d.brV:Remove()
	d.hpBg:Remove() d.hpFill:Remove()
	d.tracer:Remove()
	d.name:Remove()
	d.dist:Remove()
	drawings[inst] = nil
end

local function hideAll(d)
	d.tlH.Visible = false d.tlV.Visible = false
	d.trH.Visible = false d.trV.Visible = false
	d.blH.Visible = false d.blV.Visible = false
	d.brH.Visible = false d.brV.Visible = false
	d.hpBg.Visible = false d.hpFill.Visible = false
	d.tracer.Visible = false
	d.name.Visible = false
	d.dist.Visible = false
end

table.insert(conns, run.RenderStepped:Connect(function()
	local cam = workspace.CurrentCamera
	if not cam then return end
	local vp = cam.ViewportSize
	local drawBox = tog.DrawBoxes.Value
	local drawName = tog.DrawNames.Value
	local drawTrace = tog.DrawTracers.Value
	local drawHp = tog.DrawHealth.Value
	local drawDist = tog.DrawDist.Value
	local dynScale = tog.DynScale.Value
	for inst, d in pairs(drawings) do
		local root = inst:FindFirstChild("HumanoidRootPart")
		local hum = inst:FindFirstChildOfClass("Humanoid")
		local head = inst:FindFirstChild("Head")
		if not root or not hum or not head or hum.Health <= 0 or not inst.Parent then
			hideAll(d)
			continue
		end
		local hrpScrn, onScreen = cam:WorldToViewportPoint(root.Position)
		if not onScreen then
			hideAll(d)
			continue
		end
		local headScrn = cam:WorldToViewportPoint(head.Position + Vector3.new(0, head.Size.Y / 2 + 0.1, 0))
		local feetScrn = cam:WorldToViewportPoint(root.Position - Vector3.new(0, 3, 0))
		local top = math.min(headScrn.Y, feetScrn.Y)
		local bot = math.max(headScrn.Y, feetScrn.Y)
		local h = bot - top
		local bw = h * 0.5
		local cx = hrpScrn.X
		local left = cx - bw / 2
		local right = cx + bw / 2
		local depth = hrpScrn.Z
		local thick = dynScale and math.clamp(200 / depth, 1, 3) or 1
		local cl = dynScale and math.clamp(h * 0.28, 5, 22) or h * 0.28
		local col = d.isKiller and opt.DrawKillColor.Value or opt.DrawSurvColor.Value
		local function setLn(ln, fx, fy, tx, ty)
			ln.From = Vector2.new(fx, fy)
			ln.To = Vector2.new(tx, ty)
			ln.Color = col
			ln.Thickness = thick
			ln.Visible = drawBox
		end
		setLn(d.tlH, left, top, left + cl, top)
		setLn(d.tlV, left, top, left, top + cl)
		setLn(d.trH, right, top, right - cl, top)
		setLn(d.trV, right, top, right, top + cl)
		setLn(d.blH, left, bot, left + cl, bot)
		setLn(d.blV, left, bot, left, bot - cl)
		setLn(d.brH, right, bot, right - cl, bot)
		setLn(d.brV, right, bot, right, bot - cl)
		local hp = math.clamp(hum.Health / math.max(hum.MaxHealth, 1), 0, 1)
		local barX = left - 5
		local barFillBot = bot
		local barFillTop = bot - h * hp
		d.hpBg.From = Vector2.new(barX, top)
		d.hpBg.To = Vector2.new(barX, bot)
		d.hpBg.Color = Color3.fromRGB(20, 20, 20)
		d.hpBg.Thickness = thick + 2
		d.hpBg.Visible = drawHp and drawBox
		d.hpFill.From = Vector2.new(barX, barFillBot)
		d.hpFill.To = Vector2.new(barX, barFillTop)
		d.hpFill.Color = Color3.fromHSV(hp * 0.33, 0.9, 1)
		d.hpFill.Thickness = thick + 2
		d.hpFill.Visible = drawHp and drawBox
		local tp = plrs:GetPlayerFromCharacter(inst)
		local dispName = tp and tp.Name or inst.Name
		d.name.Text = dispName
		d.name.Position = Vector2.new(cx, top - 15)
		d.name.Color = col
		d.name.Visible = drawName
		d.dist.Text = math.floor(depth) .. "m"
		d.dist.Position = Vector2.new(cx, bot + 2)
		d.dist.Visible = drawDist and drawBox
		d.tracer.From = Vector2.new(vp.X / 2, vp.Y)
		d.tracer.To = Vector2.new(cx, bot)
		d.tracer.Color = col
		d.tracer.Thickness = thick
		d.tracer.Visible = drawTrace
	end
end))


local function isGrn(c)
	return c and c.G > 0.7 and c.R < 0.5 and c.B < 0.5
end

local jdFOVCircle = Drawing.new("Circle")
jdFOVCircle.Thickness = 1
jdFOVCircle.Filled = false
jdFOVCircle.Visible = false
jdFOVCircle.NumSides = 64

table.insert(conns, run.RenderStepped:Connect(function()
	local show = tog.JDShowFOV.Value
	jdFOVCircle.Visible = show
	if not show then return end
	local cam = workspace.CurrentCamera
	if not cam then return end
	local vp = cam.ViewportSize
	jdFOVCircle.Position = Vector2.new(vp.X / 2, vp.Y / 2)
	jdFOVCircle.Radius = opt.JDFOVRadius.Value
	jdFOVCircle.Color = opt.JDFOVColor.Value
	jdFOVCircle.Transparency = 1
end))


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

	local dConn = root.DescendantAdded:Connect(function(d)
		if not tog.AutoBlock.Value then return end
		if d:IsA("Sound") and killerSounds[d.SoundId] then
			task.spawn(function()
				kAttacking[k] = true
				task.delay(0.8, function()
					kAttacking[k] = false
				end)
				local lChar = lp.Character
				local lRoot = lChar and lChar:FindFirstChild("HumanoidRootPart")
				if lRoot and root.Parent then
					local diff = lRoot.Position - root.Position
					local dist = diff.Magnitude
					local limit = kAttacking[k] and 22 or 15
					if dist <= limit then
						local facing = true
						if tog.FacingCheck.Value then
							local dotLimit = math.cos(math.rad(opt.KillerFOV.Value / 2))
							local lv = root.CFrame.LookVector
							local vel = root.AssemblyLinearVelocity
							local checkDir = vel.Magnitude > 3 and (lv * 0.6 + vel.Unit * 0.4).Unit or lv
							facing = checkDir:Dot(diff.Unit) >= dotLimit
						end
						if facing then
							if tog.AntiBait.Value and not fndHb(k) then return end
							rs.Modules.Network.Network.RemoteEvent:FireServer("UseActorAbility", {"Block"})
						end
					end
				end
			end)
		end
	end)

	local function clean()
		if dConn then dConn:Disconnect() dConn = nil end
		if fovPart then fovPart:Destroy() fovPart = nil end
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
		local diff = lRoot.Position - root.Position
		local dist = diff.Magnitude
		local limit = kAttacking[k] and 22 or 15
		local facing = true
		if tog.FacingCheck.Value then
			local dotLimit = math.cos(math.rad(opt.KillerFOV.Value / 2))
			local lv = root.CFrame.LookVector
			local vel = root.AssemblyLinearVelocity
			local checkDir = vel.Magnitude > 3 and (lv * 0.6 + vel.Unit * 0.4).Unit or lv
			facing = checkDir:Dot(diff.Unit) >= dotLimit
		end
		local guaranteed = kAttacking[k] and dist <= limit and facing
		local fovCol = guaranteed and Color3.fromRGB(0, 255, 80) or opt.FOVColor.Value

		if typeVal == "Flat" then
			fovPart.Shape = Enum.PartType.Cylinder
			fovPart.Size = Vector3.new(0.2, sizeD, sizeD)
			fovPart.Material = Enum.Material.ForceField
			fovPart.CFrame = root.CFrame * CFrame.new(0, -3, 0) * CFrame.Angles(0, 0, math.rad(90))
			fovPart.Transparency = opt.FOVTrans.Value
			fovPart.Color = fovCol
		elseif typeVal == "Cone" then
			fovPart.Shape = Enum.PartType.Block
			local cw = sizeD * math.tan(math.rad(opt.KillerFOV.Value / 2)) * 2
			fovPart.Size = Vector3.new(cw, cw, sizeD)
			fovPart.Material = Enum.Material.ForceField
			fovPart.CFrame = root.CFrame * CFrame.new(0, 0, -sizeD / 2)
			fovPart.Transparency = opt.FOVTrans.Value
			fovPart.Color = fovCol
		else
			fovPart.Shape = Enum.PartType.Ball
			fovPart.Size = Vector3.new(sizeD, sizeD, sizeD)
			fovPart.Material = Enum.Material.ForceField
			fovPart.CFrame = root.CFrame
			fovPart.Transparency = opt.FOVTrans.Value
			fovPart.Color = fovCol
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
				local dist = (lRoot.Position - root.Position).Magnitude
				if dist < min then
					target = root
					min = dist
				end
			end
		end
	end
	return target, min
end

local aimHB = nil
local animStopConns = {}

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

local animConns = {}
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
		local aObj = anim.Animation
		if not aObj then return end
		local animId = aObj.AnimationId
		if punchAimbotAnims[animId] then
			hitActive = true
			task.spawn(function()
				task.wait(1)
				hitActive = false
			end)
		end
		if punchAnims[animId] then
			hitActive = false
		end
	end))

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
table.insert(conns, lp.CharacterAdded:Connect(lstChr))

local function appBlat()
	local lChar = lp.Character
	local lRoot = lChar and lChar:FindFirstChild("HumanoidRootPart")
	if not lRoot or not tog.AntiBait.Value then return end
	local target, dist = getCls()
	if not target then return end
	local offsets
	local method = opt.AntiBaitMethod.Value
	if method == "Blatant" then
		offsets = {
			target.CFrame.LookVector * 5,
			-target.CFrame.LookVector * 5,
			target.CFrame.RightVector * 5,
			-target.CFrame.RightVector * 5
		}
	else
		offsets = { target.CFrame.LookVector * 5 }
	end
	local pos = target.Position + offsets[pIndex]
	pIndex = pIndex + 1
	if #offsets < pIndex then pIndex = 1 end
	local dir = (pos - lRoot.Position).Unit
	local shake = not tog.HitboxShake.Value and Vector3.new(0, 0, 0) or Vector3.new(math.random(-50, 50) / 50, math.random(-50, 50) / 50, math.random(-50, 50) / 50)
	lRoot.Velocity = dir * (45 + dist * 10) + shake
end

local function appLegit()
	local lChar = lp.Character
	local lRoot = lChar and lChar:FindFirstChild("HumanoidRootPart")
	local hum = lChar and lChar:FindFirstChildOfClass("Humanoid")
	if not lRoot or not hum or not tog.AntiBait.Value then return end
	local target, dist = getCls()
	if not target then return end
	local offsets
	local method = opt.AntiBaitMethod.Value
	if method == "Blatant" then
		offsets = {
			target.CFrame.LookVector * 5,
			-target.CFrame.LookVector * 5,
			target.CFrame.RightVector * 5,
			-target.CFrame.RightVector * 5
		}
	else
		offsets = { target.CFrame.LookVector * 5 }
	end
	local pos = target.Position + offsets[pIndex]
	pIndex = pIndex + 1
	if #offsets < pIndex then pIndex = 1 end
	hum:MoveTo(pos)
end

table.insert(conns, run.Heartbeat:Connect(function()
	if tog.AntiBait.Value and hitActive then
		if tog.LegitLunge.Value then
			appLegit()
		elseif tog.BaitLunge.Value then
			local lChar = lp.Character
			local lRoot = lChar and lChar:FindFirstChild("HumanoidRootPart")
			if lChar and lRoot then
				local oldVel = lRoot.Velocity
				appBlat()
				run.RenderStepped:Wait()
				if hitActive then
					lRoot.Velocity = oldVel
				end
				run.Stepped:Wait()
				if hitActive then
					lRoot.Velocity = oldVel + Vector3.new(0, 0.1, 0)
				end
			end
		end
	end
end))

local function updChr(char)
	if not char then return end
	local hum = char:FindFirstChildOfClass("Humanoid")
	local head = char:FindFirstChild("Head")
	if not hum or not head or hum.Health <= 0 then return end

	local tag = nil
	if tui then
		for _, v in ipairs(tui:GetChildren()) do
			if v.Name == "Nametag" and v.Adornee == head then
				tag = v
				break
			end
		end
	end

	if not tog.Nametag.Value then
		if tag then tag:Destroy() end
		return
	end

	if not tag and tui then
		tag = nts.NametagTemplate:Clone()
		tag.Name = "Nametag"
		tag.Adornee = head
		tag.AlwaysOnTop = true
		tag.Parent = tui

		local titles = {"Survivor Name", "Username", "Health"}
		for i, tname in ipairs(titles) do
			local title = nts.TitleTemplate:Clone()
			title.Name = "Title" .. tostring(i)
			title.LayoutOrder = i
			title.TextTransparency = 0
			if title:FindFirstChild("UIStroke") then
				title.UIStroke.Transparency = 0
			end
			title.Parent = tag

			if tname == "Survivor Name" then
				local tp = plrs:GetPlayerFromCharacter(char)
				local act = tp and acts.CurrentActors and acts.CurrentActors[tp]
				title.Text = act and act.Config and act.Config.DisplayName or char.Name
				title.Size = (i == 1) and UDim2.fromScale(1, 0.8) or UDim2.fromScale(1, 0.3)
				title.TextColor3 = Color3.new(1, 1, 1)
			elseif tname == "Username" then
				local tp = plrs:GetPlayerFromCharacter(char)
				title.Text = char:GetAttribute("Username") or (tp and tp.Name) or "???"
				title.Size = (i == 1) and UDim2.fromScale(1, 0.8) or UDim2.fromScale(1, 0.3)
				title.TextColor3 = Color3.new(0.75, 0.75, 0.75)
			elseif tname == "Health" then
				local function upd()
					if not title.Parent or not hum.Parent then return end
					local r = hum.Health / math.max(hum.MaxHealth, 1)
					title.Text = math.ceil(hum.Health) .. "HP"
					title.TextColor3 = Color3.fromHSV(r / 3, 0.4, 1)
					if title:FindFirstChild("UIStroke") then
						title.UIStroke.Color = Color3.fromHSV(r / 3, 0.4, 0.25)
					end
				end
				upd()
				hum.HealthChanged:Connect(upd)
				title.Size = (i == 1) and UDim2.fromScale(1, 0.8) or UDim2.fromScale(1, 0.5)
			end
		end
	end

	if tag then
		local t1 = tag:FindFirstChild("Title1")
		if t1 then t1.Visible = tog.ShowSurvivor.Value end
		local t2 = tag:FindFirstChild("Title2")
		if t2 then t2.Visible = tog.ShowUser.Value end
		local t3 = tag:FindFirstChild("Title3")
		if t3 then t3.Visible = tog.ShowHealth.Value end

		local hl = tag:FindFirstChild("Highlight")
		if tog.ShowHighlight.Value then
			if not hl then
				hl = Instance.new("Highlight")
				hl.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
				hl.Adornee = char
				hl.Parent = tag
			end
			hl.Enabled = true
			hl.FillColor = opt.FillColor.Value
			hl.OutlineColor = opt.OutlineColor.Value
			hl.FillTransparency = opt.FillTrans.Value
			hl.OutlineTransparency = opt.OutlineTrans.Value
		else
			if hl then hl.Enabled = false end
		end

		for _, g in ipairs(tag:GetChildren()) do
			if g:IsA("GuiObject") then
				g.TextTransparency = 0
				if g:FindFirstChild("UIStroke") then
					g.UIStroke.Transparency = 0
				end
			end
		end
	end
end

local function updAl()
	for _, p in ipairs(plrs:GetPlayers()) do
		if p.Character then updChr(p.Character) end
	end
	if pdir then
		for _, sub in ipairs(pdir:GetChildren()) do
			if sub.Name ~= "Spectating" then
				for _, c in ipairs(sub:GetChildren()) do
					updChr(c)
				end
			end
		end
	end
	local cust = dhand:Get():FindFirstChild("Settings")
	cust = cust and cust:FindFirstChild("Customization")
	if cust then
		if cust:FindFirstChild("NametagsEnabled") then
			cust.NametagsEnabled.Value = tog.Nametag.Value
		end
		if cust:FindFirstChild("NametagDisplayType") then
			cust.NametagDisplayType.Value = tog.Nametag.Value and "Always" or "Never"
		end
	end
end

tog.Nametag:OnChanged(updAl)
tog.ShowHighlight:OnChanged(updAl)
opt.FillColor:OnChanged(updAl)
opt.OutlineColor:OnChanged(updAl)
opt.FillTrans:OnChanged(updAl)
opt.OutlineTrans:OnChanged(updAl)
tog.ShowSurvivor:OnChanged(updAl)
tog.ShowUser:OnChanged(updAl)
tog.ShowHealth:OnChanged(updAl)

tog.AutoBlock:OnChanged(updBlk)
tog.VisualFOV:OnChanged(updBlk)
opt.BlockPartType:OnChanged(updBlk)
opt.FOVColor:OnChanged(updBlk)
opt.FOVSize:OnChanged(updBlk)
opt.FOVTrans:OnChanged(updBlk)
opt.KillerFOV:OnChanged(updBlk)

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

local function hndPmp(d)
	if d:IsA("ProximityPrompt") and d.ObjectText == "Document" then
		local p = d.Parent
		if p then appDoc(p) end
	end
end

for _, v in ipairs(workspace:GetDescendants()) do
	hndPmp(v)
end
table.insert(conns, workspace.DescendantAdded:Connect(hndPmp))

local function trkChr(char, isKiller)
	mkDraw(char, isKiller)
	updChr(char)
end

local function wtch(fld)
	local isKiller = fld.Name == "Killers"
	for _, c in ipairs(fld:GetChildren()) do
		task.delay(0, function()
			local hum = c:WaitForChild("Humanoid", 5)
			local head = c:WaitForChild("Head", 5)
			if hum and head then trkChr(c, isKiller) end
		end)
	end
	table.insert(conns, fld.ChildAdded:Connect(function(c)
		local hum = c:WaitForChild("Humanoid", 5)
		local head = c:WaitForChild("Head", 5)
		if hum and head then trkChr(c, isKiller) end
	end))
	table.insert(conns, fld.ChildRemoved:Connect(function(c)
		rmDraw(c)
	end))
end

if pdir then
	local kf = pdir:FindFirstChild("Killers")
	if kf then wtch(kf) end
	local sf = pdir:FindFirstChild("Survivors")
	if sf then wtch(sf) end
	table.insert(conns, pdir.ChildAdded:Connect(function(sub)
		if sub.Name ~= "Spectating" then
			wtch(sub)
		end
	end))
end

for _, p in ipairs(plrs:GetPlayers()) do
	if p.Character then
		task.delay(0, function()
			local hum = p.Character:WaitForChild("Humanoid", 5)
			local head = p.Character:WaitForChild("Head", 5)
			if hum and head then trkChr(p.Character, false) end
		end)
	end
	table.insert(conns, p.CharacterAdded:Connect(function(c)
		local hum = c:WaitForChild("Humanoid", 5)
		local head = c:WaitForChild("Head", 5)
		if hum and head then trkChr(c, false) end
	end))
	table.insert(conns, p.CharacterRemoving:Connect(function(c)
		rmDraw(c)
	end))
end

table.insert(conns, plrs.PlayerAdded:Connect(function(p)
	table.insert(conns, p.CharacterAdded:Connect(function(c)
		local hum = c:WaitForChild("Humanoid", 5)
		local head = c:WaitForChild("Head", 5)
		if hum and head then trkChr(c, false) end
	end))
	table.insert(conns, p.CharacterRemoving:Connect(function(c)
		rmDraw(c)
	end))
end))

local jdEnabled = false
local jdAimbot = false
local jdPatched = false
local jdUnloaded = false
local jdAxeLocked = false
local jdKillerMotion = {}
local jdForeverHoldThread = nil
local jdNetRF = nil
local jdNetRE = nil
local jdRfDispatch = { hooks = {}, installed = false, origCb = nil }

pcall(function()
	jdNetRE = rs:WaitForChild("Modules", 10):WaitForChild("Network", 10):WaitForChild("Network", 10):WaitForChild("RemoteEvent", 10)
end)
pcall(function()
	jdNetRF = rs:WaitForChild("Modules", 10):WaitForChild("Network", 10):WaitForChild("Network", 10):WaitForChild("RemoteFunction", 10)
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
	local now = tick()
	local pos = hrp.Position
	local data = jdKillerMotion[hrp]
	if not data then
		jdKillerMotion[hrp] = { lastPos = pos, lastTime = now, vel = Vector3.zero }
		return Vector3.zero
	end
	local dt = now - data.lastTime
	if dt <= 0 then return data.vel end
	local v = (pos - data.lastPos) / dt
	data.lastPos = pos
	data.lastTime = now
	data.vel = v
	return v
end

local function jdNearKiller()
	local char = lp.Character
	local myHRP = char and char:FindFirstChild("HumanoidRootPart")
	if not myHRP then return nil end
	local kf = pdir and pdir:FindFirstChild("Killers")
	if not kf then return nil end
	local best, bestDist = nil, math.huge
	for _, k in ipairs(kf:GetChildren()) do
		local hrp = k:FindFirstChild("HumanoidRootPart")
		local h = k:FindFirstChildOfClass("Humanoid")
		if hrp and h and h.Health > 0 then
			local d = (hrp.Position - myHRP.Position).Magnitude
			if d < bestDist then bestDist = d; best = hrp end
		end
	end
	return best
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
		local pred = opt.JDPrediction.Value / 10
		local offset = opt.JDAimOffset.Value
		local vel = jdGetKillerVel(best)
		if reqName == "GetMousePosition" then
			return best.Position + vel * pred + Vector3.new(0, offset, 0)
		end
		if reqName == "GetCameraCF" then
			local cam = workspace.CurrentCamera
			if not cam then return nil end
			local target = best.Position + vel * pred + Vector3.new(0, offset, 0)
			if tog.JDLebron.Value then
				local spawnPos = myHRP.Position + Vector3.new(0, 2, 0)
				local g = workspace.Gravity
				local v0 = 250
				local delta = target - spawnPos
				local flat = Vector3.new(delta.X, 0, delta.Z)
				local dx = flat.Magnitude
				local dy = delta.Y
				local flatDir = dx > 0.01 and flat.Unit or Vector3.new(0, 0, 1)
				local v2 = v0 * v0
				local disc = v2 * v2 - g * (g * dx * dx + 2 * dy * v2)
				local theta
				if disc >= 0 then
					theta = math.atan2(v2 + math.sqrt(disc), g * dx)
				else
					theta = math.atan2(v2, g * dx)
				end
				local launchDir = (flatDir * math.cos(theta) + Vector3.new(0, math.sin(theta), 0)).Unit
				return CFrame.new(cam.CFrame.Position, cam.CFrame.Position + launchDir)
			end
			local dir = (target - cam.CFrame.Position).Unit
			return CFrame.new(cam.CFrame.Position, cam.CFrame.Position + dir)
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
		janeActor.Config.Crystal.ChannelTime = 0.01
		janeActor.Config.Crystal.ChargeSpeedMult = 100
		janeActor.Config.Crystal.MaxSpeed = 250
		janeActor.Config.Crystal.MinSpeed = 250
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
			ja.Config.Crystal.ChannelTime = 0.5
			ja.Config.Crystal.ChargeSpeedMult = 1.2
			ja.Config.Crystal.MaxSpeed = 250
			ja.Config.Crystal.MinSpeed = 60
		end
		return
	end
	jdOverrideCrystal()
	jdForeverHoldThread = task.spawn(function()
		while tog.JDForeverHold.Value and not jdUnloaded do
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

local jdAxeConn = nil
local jdLastActor = nil

task.spawn(function()
	while not jdUnloaded do
		task.wait(0.5)
		local cur = lp.Character
		if cur ~= jdLastActor then
			if jdLastActor ~= nil then
				jdPatched = false
				jdKillerMotion = {}
			end
			jdLastActor = cur
			if cur and jdEnabled then
				jdApplyPatch()
			end
		end
	end
end)

task.spawn(function()
	while not jdNetRE do task.wait(0.5) end
	if typeof(hookmetamethod) ~= "function" then return end
	local crystalInputName = lp.Name .. "CrystalInput"
	local jdHook
	jdHook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...)
		local method = getnamecallmethod()
		if method == "FireServer" and self == jdNetRE and jdEnabled and tog.JDForeverHold.Value then
			local args = {...}
			if args[1] == crystalInputName then
				local ja = acts.CurrentActors and acts.CurrentActors[lp]
				if ja and ja.State then
					ja.State.CrystalFullChargeTime = os.clock() - 999
				end
			end
		end
		return jdHook(self, ...)
	end))
end)

task.spawn(function()
	while not jdNetRE do task.wait(0.5) end
	local conn
	conn = jdNetRE.OnClientEvent:Connect(function(...)
		local args = {...}
		if not jdEnabled then return end
		if not tog.JDAxe.Value then return end
		if args[1] == "UseActorAbility" and args[2] and args[2][1] then
			local ok, bs = pcall(function() return buffer.tostring(args[2][1]) end)
			if ok and bs and bs:find("Axe") then
				task.spawn(function()
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
					local deadline = tick() + opt.JDAxeDur.Value
					local axeConn
					axeConn = run.RenderStepped:Connect(function()
						if tick() >= deadline or not tog.JDAxe.Value or jdUnloaded then
							axeConn:Disconnect()
							hum.AutoRotate = savedAR
							jdAxeLocked = false
							return
						end
						if not myHRP.Parent or not best.Parent then
							axeConn:Disconnect()
							hum.AutoRotate = savedAR
							jdAxeLocked = false
							return
						end
						local dir = Vector3.new(best.Position.X - myHRP.Position.X, 0, best.Position.Z - myHRP.Position.Z)
						if dir.Magnitude > 0 then
							myHRP.CFrame = CFrame.new(myHRP.Position, myHRP.Position + dir.Unit)
						end
					end)
				end)
			end
		end
	end)
	getgenv()._jdConn = conn
end)

lib:OnUnload(function()
	jdUnloaded = true
	if jdForeverHoldThread then
		task.cancel(jdForeverHoldThread)
		jdForeverHoldThread = nil
	end
	jdRemovePatch()
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
	if abConns.Added then abConns.Added:Disconnect() abConns.Added = nil end
	if abConns.Removed then abConns.Removed:Disconnect() abConns.Removed = nil end
	for _, handler in pairs(abActive) do
		handler()
	end
	for inst in pairs(drawings) do
		rmDraw(inst)
	end
	for m, o in pairs(docESPObjects) do
		if o.highlight then o.highlight:Destroy() end
		if o.billboard then o.billboard:Destroy() end
	end
	stpAim()
	jdFOVCircle:Remove()
end)

thm:SetLibrary(lib)
sav:SetLibrary(lib)
sav:IgnoreThemeSettings()
sav:SetIgnoreIndexes({"MenuKeybind"})
thm:SetFolder("femboyhub")
sav:SetFolder("femboyhub")
sav:BuildConfigSection(tabs["UI Settings"])
thm:ApplyToTab(tabs["UI Settings"])
sav:LoadAutoloadConfig()
