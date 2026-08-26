local rs = game:GetService("ReplicatedStorage")
local dynSnd = {}
local dynAnm = {}
local dynUnb = {}

local function _add(val, tbl)
	if type(val) == "string" then
		local num = val:match("%d+")
		if num then tbl["rbxassetid://" .. num] = true end
	elseif type(val) == "table" then
		for _, v in pairs(val) do
			_add(v, tbl)
		end
	end
end

local function _parse(m)
	if not (m and m:IsA("ModuleScript") and m.Name == "Config") then return end
	local ok, cfg = pcall(require, m)
	if not (ok and type(cfg) == "table") then return end

	if type(cfg.Animations) == "table" then
		for k, v in pairs(cfg.Animations) do
			local lk = string.lower(tostring(k))
			if lk == "slash" or lk == "enragedslash" or lk == "stab" or lk == "attack" or lk == "m1" or lk == "swing" or lk == "punch" then
				_add(v, dynAnm)
			elseif lk ~= "idle" and lk ~= "walk" and lk ~= "run" and lk ~= "injuredidle" and lk ~= "injuredwalk" and lk ~= "injuredrun" and lk ~= "enragedidle" and lk ~= "enragedwalk" and lk ~= "enragedrun" and lk ~= "crouch" and lk ~= "jump" and lk ~= "fall" then
				_add(v, dynUnb)
			end
		end
	end

	if type(cfg.Sounds) == "table" then
		for k, v in pairs(cfg.Sounds) do
			local lk = string.lower(tostring(k))
			if lk == "swing" or lk == "slash" or lk == "stab" or lk == "attack" or lk == "m1" then
				_add(v, dynSnd)
			end
		end
	end
end

local function _scan()
	local ast = rs:FindFirstChild("Assets") or rs:WaitForChild("Assets", 5) or rs
	for _, d in ipairs(ast:GetDescendants()) do
		if d:IsA("ModuleScript") and d.Name == "Config" then
			_parse(d)
		end
	end
	ast.DescendantAdded:Connect(function(d)
		if d:IsA("ModuleScript") and d.Name == "Config" then
			task.delay(0.1, function() _parse(d) end)
		end
	end)
end

_scan()
