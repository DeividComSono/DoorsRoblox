for _, v in pairs(workspace.CurrentRooms:GetDescendants()) do
	if v:IsA("Part") and v.Name == "Hitbox" then
		v.Size = Vector3.new(500, 500, 500)
	end
end
