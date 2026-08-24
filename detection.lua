local plrs = game:GetService("Players")
local rs = game:GetService("ReplicatedStorage")
local run = game:GetService("RunService")
local lp = plrs.LocalPlayer
local pdir = workspace:FindFirstChild("Players") or workspace:WaitForChild("Players", 10)

local netMod = nil
pcall(function()
	netMod = require(rs.Modules.Network.Network)
end)

local function encBuf(s)
	if typeof(s) ~= "string" then return s end
	local b = buffer.create(5 + #s)
	buffer.writeu8(b, 0, 3)
	buffer.writeu32(b, 1, #s)
	buffer.writestring(b, 5, s)
	return b
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

local cfg = {
	AutoBlock = true,
	FacingCheck = true,
	SmartFacing = true,
	VisionAngle = 135,
	WallCheck = true,
	FOVSize = 15,
	AntiBait = true,
	AntiBaitMethod = "Better",
	BlockReact = 0.15,
}

local kAttacking = {}
local kM1Data = {}
local kLookHistory = {}
local abActive = {}
local abConns = {}

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
	local qh = k:FindFirstChild("QueryHitbox") or k:FindFirstChild("Hitbox")
	if qh and qh:IsA("BasePart") then return true end
	for _, c in ipairs(k:GetChildren()) do
		local n = c:FindFirstChild("QueryHitbox") or c:FindFirstChild("Hitbox")
		if n and n:IsA("BasePart") then return true end
	end
	for _, v in ipairs(k:GetDescendants()) do
		if chkGrn(v) then return true end
		if v:IsA("BasePart") and (v.Name:find("Hitbox") or v.Name:find("Attack") or v.Name:find("Slash") or v.Name:find("Swing")) then
			return true
		end
	end
	local pts = workspace.GetPartBoundsInRadius and workspace:GetPartBoundsInRadius(r.Position, 20) or {}
	for _, p in ipairs(pts) do
		if chkGrn(p) then return true end
		if p.Name:find("Hitbox") and not p:IsDescendantOf(workspace:FindFirstChild("Players")) then return true end
		for _, v in ipairs(p:GetDescendants()) do
			if chkGrn(v) then return true end
		end
	end
	return false
end

local function checkWall(fromPos, toPos, ignoreList)
	if not cfg.WallCheck then return true end
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

local function isFacing(myRoot, targetRoot, killerModel)
	if not cfg.FacingCheck then return true end
	if not myRoot or not targetRoot then return false end
	local dir = myRoot.Position - targetRoot.Position
	local distSq = dir.X * dir.X + dir.Y * dir.Y + dir.Z * dir.Z
	if distSq < 36 then return true end

	local angleDeg = cfg.VisionAngle or 135
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

	if cfg.SmartFacing then
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

	local function handleAttack(triggerSrc)
		if not cfg.AutoBlock then return end
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
			local limit = cfg.FOVSize or 15
			local inDist = dist <= limit
			local wallOk = checkWall(lRoot.Position, root.Position, { k })
			local facingOk = isFacing(lRoot, root, k)

			if inDist and wallOk and facingOk then
				local antiMethod = cfg.AntiBaitMethod or "Better"
				if cfg.AntiBait and antiMethod ~= "Blatant" then
					local reactBase = cfg.BlockReact or 0.15
					local reactTime = math.min(reactBase, m1Spd * 0.3)
					local okHb = fndHb(k)
					if not okHb then
						local st = os.clock()
						while os.clock() - st < reactTime do
							if fndHb(k) then
								okHb = true
								break
							end
							task.wait()
						end
					end
					if not okHb and antiMethod ~= "Better Better" then
						return
					end
				end
				if not isFacing(lRoot, root, k) then return end
				fireAbility("Block")
			end
		end)
	end

	local soundConns = {}
	local function hookSnd(snd)
		if not (snd and snd:IsA("Sound")) or soundConns[snd] then return end
		local num = snd.SoundId:match("%d+")
		if not num or not killerSounds["rbxassetid://" .. num] then return end
		local c1 = snd.Played:Connect(function()
			handleAttack("Sound:" .. num)
		end)
		local c2 = snd:GetPropertyChangedSignal("IsPlaying"):Connect(function()
			if snd.IsPlaying then
				handleAttack("SoundPlaying:" .. num)
			end
		end)
		soundConns[snd] = { c1, c2 }
		if snd.IsPlaying then
			handleAttack("SoundInitial:" .. num)
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
					handleAttack("Anim:" .. num)
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
		kM1Data[k] = nil
		kLookHistory[k] = nil
		abActive[k] = nil
	end
	abActive[k] = clean

	local hConn
	hConn = run.Heartbeat:Connect(function()
		if not cfg.AutoBlock then
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
	end)
end

local function hookKillers()
	local kf = pdir and pdir:FindFirstChild("Killers")
	if kf then
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
	end
end

hookKillers()
