local Creator = loadstring(game:HttpGet("https://raw.githubusercontent.com/RegularVynixu/Utilities/main/Doors%20Entity%20Spawner/Source.lua"))()

local entity = Creator.createEntity({
		CustomName = "Ambush", -- Custom name of your entity
		Model = "https://github.com/DeividComSono/DoorsRoblox/blob/main/AmbushMoving.rbxm?raw=true",
		Speed = 360, -- Percentage, 120 = default Rush speed 360 = default Ambush speed
		DelayTime = 3, -- Time before starting cycles (seconds)
		HeightOffset = 0,
		CanKill = false,
		KillRange = 150,
		BreakLights = true,
     BackwardsMovement = false,
		FlickerLights = {
			true, -- Enabled
			1, -- Time (seconds)
		},
		Cycles = {
			Min = 1,
			Max = 4,
			WaitTime = 1,
		},
		CamShake = {
			true, -- Enabled
			{2, 7, 0.1, 1},
			100,
		},
		Jumpscare = {
			true, -- Enabled ('false' if you don't want jumpscare)
			{
				Image1 = "rbxassetid://10483855823",
				Image2 = "rbxassetid://10483855823",
				Shake = true,
				Sound1 = {
					10483790459,
					{ Volume = 0.5 },
				},
				Sound2 = {
					10483837590,
					{ Volume = 0.5 },
				},
				Flashing = {
					false, -- Enabled
					Color3.fromRGB(255, 255, 255),
				},
				Tease = {
					false,
					Min = 1,
					Max = 3,
				},
			},
		},
		CustomDialog = {"lol"}
	})

	entity.Debug.OnEntitySpawned = function(entityModel)
		print("Entity has spawned:", entityModel)
	end

	entity.Debug.OnEntityDespawned = function(entityModel)
		print("Entity has despawned:", entityModel)
	end

	entity.Debug.OnEntityStartMoving = function(entityModel)
		print("Entity has started moving:", entityModel)
	end

	entity.Debug.OnEntityFinishedRebound = function(entityModel)
		print("Entity finished rebound:", entityModel)
	end

	entity.Debug.OnDeath = function()
		warn("You died.")
	end

	Creator.runEntity(entity)
