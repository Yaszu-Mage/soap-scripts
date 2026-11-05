




function createPart(x,y,z,width,height,depth,material,color)
	local part = Instance.new("Part")
	part.Position = Vector3.new(x, y, z)
	part.Size = Vector3.new(width, height, depth)
	part.Material = material
	part.BrickColor = BrickColor.new(color)
	return part
end

local ManagablePart = {}
local Group = {}

Group.__index = Group
ManagablePart.__index = ManagablePart

function ManagablePart.new(x : number,y : number,z : number,width : number,height : number,depth : number,material : Enum.Material,color : string)
	local self = setmetatable({}, ManagablePart)
	self.part = createPart(x, y, z, width, height, depth, material, color)
	return self
end

function Group.new(Parts : table)
	local self = setmetatable({}, Group)
	self.parts = Parts
	return self
end

function ManagablePart:destroy()
	if self.part then
		self.part:Destroy()
		self.part = nil
	end
end

function ManagablePart:setPosition(x : number, y : number, z : number)
	if self.part then
		self.part.Position = Vector3.new(x, y, z)
	end
end

function ManagablePart:setSize(width : number, height : number, depth : number)
	if self.part then
		self.part.Size = Vector3.new(width, height, depth)
	end
end

function ManagablePart:setMaterial(material : Enum.Material)
	if self.part then
		self.part.Material = material
	end
end

function ManagablePart:setColor(color : string)
	if self.part then
		self.part.BrickColor = BrickColor.new(color)
	end
end

function ManagablePart:getPart()
	return self.part
end

function ManagablePart:clone(x : number, y : number, z : number)
	if self.part then
		local clonedPart = self.part:Clone()
		return ManagablePart.new(x, y, z, clonedPart.Size.X, clonedPart.Size.Y, clonedPart.Size.Z, clonedPart.Material, clonedPart.BrickColor.Name)
	end
end

function ManagablePart:getPosition()
	if self.part then
		return self.part.Position
	end
end


ManagablePart.new(0,1,0,12,12,12,Enum.Material.Plastic,"Bright Red")



function createHollowCubeatCenter(x : number,y : number,z : number,width : number,height : number,depth : number,thickness : number,material : Enum.Material,color : string)
	--Create Cube
	local floor = createPart(x, y, z, width, thickness, depth, material, color)
	local ceiling = createPart(x, y + height - thickness, z, width, thickness, depth, material, color)
	local left = createPart(x - width/2 + thickness/2, y + thickness/2, z, thickness, height - thickness, depth, material, color)
	local right = createPart(x + width/2 - thickness/2, y + thickness/2, z, thickness, height - thickness, depth, material, color)
	local front = createPart(x, y + thickness/2, z - depth/2 + thickness/2, width - thickness, height - thickness, thickness, material, color)
	local back = createPart(x, y + thickness/2, z + depth/2 - thickness/2, width - thickness, height - thickness, thickness, material, color)
	return {floor, ceiling, left, right, front, back}
end

function booleanUnion(part1, part2)
	-- Remove a part based on another part
end

print("im a goofy goober")

print("ROCK")