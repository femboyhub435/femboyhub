local plrs = game:GetService("Players")
local lp = plrs.LocalPlayer
local rs = game:GetService("ReplicatedStorage")
local run = game:GetService("RunService")
local stats = game:GetService("Stats")
local pdir = workspace:FindFirstChild("Players") or workspace:WaitForChild("Players", 5)

local dynSnd = {}
local dynAnm = {}
local dynUnb = {}
local kLook = {}
local kM1 = {}
local kAtk = {}
local abAct = {}
local conns = {}

local kSnd = {
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
	["rbxassetid://89004992452376"] = true,
}

local kAnm = {
	["rbxassetid://70785407091644"] = true,
	["rbxassetid://96167639214189"] = true,
	["rbxassetid://112649273029679"] = true,
	["rbxassetid://71231909569291"] = true,
	["rbxassetid://112748196946666"] = true,
	["rbxassetid://127142942415961"] = true,
	["rbxassetid://130625985300868"] = true,
	["rbxassetid://126830014841198"] = true,
	["rbxassetid://77375846492436"] = true,
}

local unbAnm = {
	["rbxassetid://126355327951215"] = true,
	["rbxassetid://121086746534252"] = true,
	["rbxassetid://101736016625776"] = true,
	["rbxassetid://85591573377728"] = true,
	["rbxassetid://84525150536125"] = true,
	["rbxassetid://75595031025056"] = true,
	["rbxassetid://125119944753086"] = true,
	["rbxassetid://107339108383093"] = true,
	["rbxassetid://125504560920616"] = true,
	["rbxassetid://111353853621577"] = true,
	["rbxassetid://92445608014276"] = true,
	["rbxassetid://73058828823673"] = true,
	["rbxassetid://140042539182927"] = true,
	["rbxassetid://137642639873297"] = true,
	["rbxassetid://93841120533318"] = true,
	["rbxassetid://91758760621955"] = true,
	["rbxassetid://132221505301108"] = true,
	["rbxassetid://94634594529334"] = true,
	["rbxassetid://100358581940485"] = true,
	["rbxassetid://86185540502966"] = true,
	["rbxassetid://138973708225026"] = true,
	["rbxassetid://106723424455179"] = true,
	["rbxassetid://92601588607898"] = true,
	["rbxassetid://99926368657642"] = true,
	["rbxassetid://130585724342678"] = true,
}

local function _addIds(val, tbl)
	if type(val) == "string" then
		local num = val:match("%d+")
		if num then tbl["rbxassetid://" .. num] = true end
	elseif type(val) == "table" then
		for _, v in pairs(val) do
			_addIds(v, tbl)
		end
	end
end

local function _parseCfg(m)
	if not (m and m:IsA("ModuleScript") and m.Name == "Config") then return end
	local cfg = require(m)
	if type(cfg) ~= "table" then return end

	if type(cfg.Animations) == "table" then
		for k, v in pairs(cfg.Animations) do
			local lk = string.lower(tostring(k))
			if lk == "slash" or lk == "enragedslash" or lk == "stab" or lk == "attack" or lk == "m1" or lk == "swing" or lk == "punch" then
				_addIds(v, dynAnm)
			elseif lk ~= "idle" and lk ~= "walk" and lk ~= "run" and lk ~= "injuredidle" and lk ~= "injuredwalk" and lk ~= "injuredrun" and lk ~= "enragedidle" and lk ~= "enragedwalk" and lk ~= "enragedrun" and lk ~= "crouch" and lk ~= "jump" and lk ~= "fall" then
				_addIds(v, dynUnb)
			end
		end
	end

	if type(cfg.Sounds) == "table" then
		for k, v in pairs(cfg.Sounds) do
			local lk = string.lower(tostring(k))
			if lk == "swing" or lk == "slash" or lk == "stab" or lk == "attack" or lk == "m1" then
				_addIds(v, dynSnd)
			end
		end
	end
end

local function _scanAssets()
	local ast = rs:FindFirstChild("Assets") or rs:WaitForChild("Assets", 5) or rs
	for _, d in ipairs(ast:GetDescendants()) do
		if d:IsA("ModuleScript") and d.Name == "Config" then
			_parseCfg(d)
		end
	end
	table.insert(conns, ast.DescendantAdded:Connect(function(d)
		if d:IsA("ModuleScript") and d.Name == "Config" then
			task.delay(0.1, function() _parseCfg(d) end)
		end
	end))
end

task.spawn(_scanAssets)

local function _ping()
	local pi = stats and stats.Network:FindFirstChild("ServerStatsItem")
	local ps = pi and pi:FindFirstChild("Data Ping")
	return ps and ps:GetValue() or 0
end

local function _wall(p1, p2, ign)
	local p = RaycastParams.new()
	p.FilterType = Enum.RaycastFilterType.Exclude
	local list = { lp.Character, workspace.CurrentCamera }
	if ign then for _, v in ipairs(ign) do table.insert(list, v) end end
	p.FilterDescendantsInstances = list
	p.IgnoreWater = true
	local hit = workspace:Raycast(p1, p2 - p1, p)
	if hit and hit.Instance then
		local inst = hit.Instance
		if inst.CanCollide and inst.Transparency < 0.8 and not inst:IsDescendantOf(workspace:FindFirstChild("Players")) then
			return false
		end
	end
	return true
end

local function _facing(myR, kR, ang, km)
	if not myR or not kR then return false end
	local dir = myR.Position - kR.Position
	local distSq = dir.X * dir.X + dir.Y * dir.Y + dir.Z * dir.Z
	if distSq < 36 then return true end

	local p = _ping()
	local pBon = (p > 60) and math.clamp((p - 60) * 0.12, 0, 35) or 0
	local aDeg = math.clamp((ang or 135) + pBon, 30, 220)
	local cosA = math.cos(math.rad(aDeg / 2))

	local fDir = Vector3.new(dir.X, 0, dir.Z)
	local dMag = fDir.Magnitude
	local dUnit = dMag > 0.01 and fDir.Unit or dir.Unit

	local lv = kR.CFrame.LookVector
	local fLv = Vector3.new(lv.X, 0, lv.Z)
	local lvUnit = fLv.Magnitude > 0.01 and fLv.Unit or lv.Unit
	if lvUnit:Dot(dUnit) >= cosA then return true end

	if km then
		local h = km:FindFirstChild("Head")
		if h then
			local hlv = h.CFrame.LookVector
			local fHlv = Vector3.new(hlv.X, 0, hlv.Z)
			local hUnit = fHlv.Magnitude > 0.01 and fHlv.Unit or hlv.Unit
			if hUnit:Dot(dUnit) >= cosA then return true end
		end
	end

	local vel = kR.AssemblyLinearVelocity
	local fVel = Vector3.new(vel.X, 0, vel.Z)
	if fVel.Magnitude > 1.5 and dMag > 0.01 then
		if fVel.Unit:Dot(dUnit) >= cosA then return true end
		local comb = kR.CFrame.LookVector + fVel.Unit * 0.7
		local fComb = Vector3.new(comb.X, 0, comb.Z)
		if fComb.Magnitude > 0.01 and fComb.Unit:Dot(dUnit) >= cosA then return true end
	end

	if km and kLook[km] then
		local hist = kLook[km]
		if #hist >= 2 then
			local pred = hist[#hist] + (hist[#hist] - hist[1]) * 1.5
			local fPred = Vector3.new(pred.X, 0, pred.Z)
			if fPred.Magnitude > 0.01 and fPred.Unit:Dot(dUnit) >= cosA then return true end
		end
		local avg = Vector3.zero
		for _, v in ipairs(hist) do avg = avg + v end
		local fAvg = Vector3.new(avg.X, 0, avg.Z)
		if fAvg.Magnitude > 0.01 and fAvg.Unit:Dot(dUnit) >= cosA then return true end
	end

	return false
end

local function _hitbox(k)
	for _, d in ipairs(k:GetDescendants()) do
		if (d.Name == "Hitbox" or d.Name == "QueryHitbox" or d.Name == "DamageHitbox") and d:IsA("BasePart") then
			return d
		end
		if d:IsA("SelectionBox") or d:IsA("BoxHandleAdornment") then
			if d.Color3 == Color3.fromRGB(0, 255, 0) or d.Color3 == Color3.fromRGB(255, 0, 0) then
				return d
			end
		end
	end
	return nil
end

local function _unblockable(k)
	local hum = k:FindFirstChildOfClass("Humanoid")
	local anim = hum and (hum:FindFirstChildOfClass("Animator") or hum)
	if anim and anim.GetPlayingAnimationTracks then
		for _, trk in ipairs(anim:GetPlayingAnimationTracks()) do
			local obj = trk.Animation
			if obj then
				local num = obj.AnimationId:match("%d+")
				local rId = num and ("rbxassetid://" .. num)
				if (rId and (unbAnm[rId] or dynUnb[rId])) or unbAnm[obj.AnimationId] or dynUnb[obj.AnimationId] then
					return true
				end
			end
		end
	end
	return false
end

local lastBlk = 0
local function _block(k, dist, src)
	print(string.format("[AutoBlock] Triggered from %s (Dist: %.1fm)", tostring(src), dist))
	local re = rs:FindFirstChild("Modules") and rs.Modules:FindFirstChild("Network") and rs.Modules.Network:FindFirstChild("Network") and rs.Modules.Network.Network:FindFirstChild("RemoteEvent")
	if re then
		local b = buffer.create(10)
		buffer.writeu8(b, 0, 3)
		buffer.writeu32(b, 1, 5)
		buffer.writestring(b, 5, "Block")
		re:FireServer("UseActorAbility", { [1] = b })
	end
end

local function _attack(k, kRoot, src)
	if _unblockable(k) then return end
	task.spawn(function()
		if _unblockable(k) then return end
		local now = os.clock()
		if not kM1[k] then kM1[k] = { times = {}, avg = 0.8 } end
		local md = kM1[k]
		if #md.times > 0 then
			local gap = now - md.times[#md.times]
			if gap > 0.1 and gap < 3 then
				table.insert(md.times, now)
				if #md.times > 5 then table.remove(md.times, 1) end
				local s = 0
				for i = 2, #md.times do s = s + (md.times[i] - md.times[i - 1]) end
				md.avg = s / (#md.times - 1)
			else
				md.times = { now }
			end
		else
			md.times = { now }
		end

		local m1Spd = md.avg
		kAtk[k] = true
		task.delay(math.clamp(m1Spd * 1.2, 0.4, 2), function() kAtk[k] = false end)

		local myChar = lp.Character
		local myRoot = myChar and myChar:FindFirstChild("HumanoidRootPart")
		if not myRoot or not kRoot.Parent then return end

		local diff = myRoot.Position - kRoot.Position
		local dist = diff.Magnitude
		local p = _ping()
		local lim = 15 + math.clamp((p / 1000) * 16, 0, 6)
		local inDist = dist <= lim
		local wallOk = _wall(myRoot.Position, kRoot.Position, { k })
		local faceOk = _facing(myRoot, kRoot, 135, k)

		if inDist and wallOk and faceOk then
			local rTime = math.max(0.02, math.min(0.15 - math.clamp(p / 1200, 0, 0.12), m1Spd * 0.35))
			local iDist = dist
			local okHb = _hitbox(k)
			if not okHb then
				local st = os.clock()
				while os.clock() - st < rTime do
					if _hitbox(k) then okHb = true break end
					task.wait()
				end
			end
			local cDist = (myRoot.Position - kRoot.Position).Magnitude
			if not okHb and not (cDist <= iDist + 1.2) then return end
			if not _facing(myRoot, kRoot, 135, k) then return end

			if now - lastBlk < 0.35 then return end
			lastBlk = now
			_block(k, dist, src)
		end
	end)
end

local function _monitor(k)
	if abAct[k] then return end
	local root = k:FindFirstChild("HumanoidRootPart")
	if not root then
		task.delay(0.1, function() if k.Parent then _monitor(k) end end)
		return
	end

	local sConns = {}
	local function _hookSnd(s)
		if not (s and s:IsA("Sound")) or sConns[s] then return end
		local num = s.SoundId:match("%d+")
		if not num then return end
		local rId = "rbxassetid://" .. num
		if not (kSnd[rId] or dynSnd[rId]) then return end
		local c1 = s.Played:Connect(function() _attack(k, root, "Sound:" .. num) end)
		local c2 = s:GetPropertyChangedSignal("IsPlaying"):Connect(function()
			if s.IsPlaying then _attack(k, root, "SoundPlaying:" .. num) end
		end)
		sConns[s] = { c1, c2 }
		if s.IsPlaying then _attack(k, root, "SoundInitial:" .. num) end
	end

	for _, d in ipairs(k:GetDescendants()) do _hookSnd(d) end
	local dConn = k.DescendantAdded:Connect(_hookSnd)

	local aConn = nil
	local anmConn = nil
	local function _hookAnim(anm)
		if not anm then return end
		return anm.AnimationPlayed:Connect(function(track)
			local obj = track.Animation
			if obj then
				local num = obj.AnimationId:match("%d+")
				if num then
					local rId = "rbxassetid://" .. num
					if unbAnm[rId] or dynUnb[rId] then return end
					if kAnm[rId] or dynAnm[rId] then
						_attack(k, root, "Anim:" .. num)
						return
					end
				end
				if unbAnm[obj.AnimationId] or dynUnb[obj.AnimationId] then return end
				if kAnm[obj.AnimationId] or dynAnm[obj.AnimationId] then
					_attack(k, root, "Anim:" .. (num or obj.AnimationId))
				end
			end
		end)
	end

	local hum = k:FindFirstChildOfClass("Humanoid")
	if hum then
		aConn = _hookAnim(hum)
		local animator = hum:FindFirstChildOfClass("Animator")
		if animator then anmConn = _hookAnim(animator) end
		hum.ChildAdded:Connect(function(c)
			if c:IsA("Animator") then
				if anmConn then anmConn:Disconnect() end
				anmConn = _hookAnim(c)
			end
		end)
	end

	local hConn
	hConn = run.Heartbeat:Connect(function()
		if not root or not root.Parent then return end
		if not kLook[k] then kLook[k] = {} end
		local hist = kLook[k]
		table.insert(hist, root.CFrame.LookVector)
		if #hist > 6 then table.remove(hist, 1) end
	end)

	abAct[k] = function()
		if dConn then dConn:Disconnect() end
		if aConn then aConn:Disconnect() end
		if anmConn then anmConn:Disconnect() end
		if hConn then hConn:Disconnect() end
		for _, tbl in pairs(sConns) do for _, c in ipairs(tbl) do c:Disconnect() end end
		table.clear(sConns)
		kM1[k] = nil
		kLook[k] = nil
		abAct[k] = nil
	end
end

local function _watchKillers()
	local kf = pdir and pdir:FindFirstChild("Killers")
	if kf then
		for _, k in ipairs(kf:GetChildren()) do _monitor(k) end
		table.insert(conns, kf.ChildAdded:Connect(_monitor))
		table.insert(conns, kf.ChildRemoved:Connect(function(c)
			local h = abAct[c]
			if h then h() end
		end))
	end
	if pdir then
		table.insert(conns, pdir.ChildAdded:Connect(function(c)
			if c.Name == "Killers" then _watchKillers() end
		end))
	end
end

_watchKillers()
