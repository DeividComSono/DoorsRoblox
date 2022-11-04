local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()
local tween = game:GetService("TweenService")

local plr = game.Players.LocalPlayer
local char = plr.Character

getgenv().Death = false

local function SpawnEntity()
	if char:FindFirstChild("Spawner") then
	tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(1), {Contrast = 0.45}):Play()
	local entity = Creator.createEntity({
		CustomName = "A-60", -- Custom name of your entity
		Model = "https://github.com/DeividComSono/DoorsRoblox/blob/main/A-60.rbxm?raw=true", -- Can be GitHub file or rbxassetid
		Speed = 240, -- Percentage, 120 = default Rush speed
		DelayTime = 1, -- Time before starting cycles (seconds)
		HeightOffset = 0,
		CanKill = true,
		KillRange = 75,
		BreakLights = true,
		BackwardsMovement = false,
		FlickerLights = {
			true, -- Enabled
			2, -- Time (seconds)
		},
		Cycles = {
			Min = 1,
			Max = 2,
			WaitTime = 1,
		},
		CamShake = {
			true, -- Enabled
			{15, 15, 0.1, 1}, -- Shake values (don't change if you don't know)
			50, -- Shake start distance (from Entity to you)
		},
		Jumpscare = {
			false, -- Enabled ('false' if you don't want jumpscare)
			{
				Image1 = "rbxassetid://11287256498", -- Image1 url
				Image2 = "rbxassetid://11287256498", -- Image2 url
				Shake = true,
				Sound1 = {
					4903742660, -- SoundId
					{ Volume = 1 }, -- Sound properties
				},
				Sound2 = {
					4903742660, -- SoundId
					{ Volume = 1 }, -- Sound properties
				},
				Flashing = {
					true, -- Enabled
					Color3.fromRGB(255, 0, 0), -- Color
				},
				Tease = {
					true, -- Enabled ('false' if you don't want tease)
					Min = 1,
					Max = 1,
				},
			},
		},
		CustomDialog = {"Ado, ado, ado, quem leu é viado."}
	})

	-----[[ Advanced ]]-----
	entity.Debug.OnEntitySpawned = function(entityModel)
		print("Entity has spawned:", entityModel)
	end

	entity.Debug.OnEntityDespawned = function(entityModel)
		if getgenv().Death == false then
			local Achievements = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors/Custom%20Achievements/Source.lua"))()

			Achievements.Get({
   		 	Title = "Out of many Rebounds",
   	 		Desc = "Might Come back or not",
    		Reason = "Encounter and survive the rare Entity called A-60",
    		Image = "https://static.wikia.nocookie.net/r-rooms/images/b/bf/SIXTYOVERLAP.png/revision/latest/scale-to-width-down/350?cb=20221018181132",
			})
		end
		task.wait(1.5)
		tween:Create(game.Lighting.MainColorCorrection, TweenInfo.new(1), {Contrast = 0.1}):Play()
	end

	entity.Debug.OnEntityStartMoving = function(entityModel)
		print("Entity has started moving:", entityModel)
	end

	entity.Debug.OnEntityFinishedRebound = function(entityModel)
		print("Entity finished rebound:", entityModel)
	end

	entity.Debug.OnDeath = function()
		getgenv().Death = true
	end
	------------------------

	-- Run the created entity
	Creator.runEntity(entity)
	end
end

local contextActionService = game:GetService("ContextActionService")

contextActionService:BindAction("spawn", SpawnEntity, false, "b")
