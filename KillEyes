local Plr = game.Players.LocalPlayer
 
local enableDamage = false
 
local currentLoadedRoom = workspace.CurrentRooms[game:GetService("ReplicatedStorage").GameData.LatestRoom.Value]
local eyes = game:GetObjects("rbxassetid://11388969546")[1]
 
if eyes then end
game.Workspace.CurrentRooms.ChildAdded:Connect(function()
    game.Workspace:FindFirstChild("Eyes"):Destroy()
    enableDamage = false
end)
local num=math.floor(#currentLoadedRoom.Nodes:GetChildren()/2)
eyes.CFrame=(
	num == 0 and currentLoadedRoom.Base or currentLoadedRoom.Nodes[num]
).CFrame + Vector3.new(0,7,0)
 
eyes.Parent = workspace
eyes.Ambience:Play()
task.wait(.5)
eyes.Attachment.Eyes.Enabled = true
 
local hum=game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid")
while true and enableDamage do
	local _, found = workspace.CurrentCamera:WorldToScreenPoint(eyes.Position)
	if found and hum.Health > 0 then
		hum.Health -= 10
		eyes.Attack:Play()
		wait(0.1)
		if hum.Health <= 0 then
			game:GetService("ReplicatedStorage").GameStats["Player_".. game.Players.LocalPlayer.Name].Total.DeathCause.Value = "Eyes"
			debug.setupvalue(getconnections(game:GetService("ReplicatedStorage").Bricks.DeathHint.OnClientEvent)[1].Function, 1, {
				"You died to the Eyes...", "They don't like to be stared at."
			})
		end
	end
	task.wait(.1)
end
