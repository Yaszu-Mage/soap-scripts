
function createPart(x,y,z,width,height,depth,material,color)
	local part = Instance.new("Part")
	part.Position = Vector3.new(x, y, z)
	part.Size = Vector3.new(width, height, depth)
	part.Material = material
	part.Color = color
	part.Parent = yaszuFolder
	return part
end
createPart(0,0,0,256,1,256,Enum.Material.Plastic,Color3.fromHex("#808080"))