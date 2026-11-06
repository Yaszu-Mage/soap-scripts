local part = Instance.new("Part")
function createPart(x,y,z,width,height,depth,material,color)
	local part = Instance.new("Part")
	part.Position = Vector3.new(x, y, z)
	part.Size = Vector3.new(width, height, depth)
	part.Material = material
	part.Color = color
	part.Parent = yaszuFolder
	return part
end