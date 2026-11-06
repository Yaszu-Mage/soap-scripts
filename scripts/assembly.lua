local folder = Instance.new("Folder")
folder.Parent = workspace
folder.Name = "Yaszu"
local players = game:GetService("Players")
local everyOne = Players:GetPlayers()
local yaszuFolder = Workspace:FindFirstChild("Yaszu")
local insertService = game:GetService("InsertService")
local witchHat = 18860971203
local 

local function addAccessoryToCharacter(player, id)
	local success, loadedModel = pcall(function()
		return insertService:LoadAsset(witchHat)
	end)
	if success and loadedModel then
		local accessory = loadedModel:Find
	else:

	end
end

for _, child in ipairs(yaszuFolder:GetChildren()) do
    child:Destroy()
end

for _, player in ipairs(everyOne) do 
	if player.Name == "yaszu"
		
	end
end



function createPart(x,y,z,width,height,depth,material,color)
	local part = Instance.new("Part")
	part.Position = Vector3.new(x, y, z)
	part.Size = Vector3.new(width, height, depth)
	part.Material = material
	part.BrickColor = BrickColor.new(color)
	part.Parent = yaszuFolder
	return part
end

local ManagablePart = {}

ManagablePart.__index = ManagablePart

function ManagablePart.new(x,y,z,width,height,depth,material,color)
	local self = setmetatable({}, ManagablePart)
	self.part = createPart(x, y, z, width, height, depth, material, color)
	return self
end

function ManagablePart:destroy()
	if self.part then
		self.part:Destroy()
		self.part = nil
	end
end

function ManagablePart:setPosition(x, y, z)
	if self.part then
		self.part.Position = Vector3.new(x, y, z)
	end
end

function ManagablePart:setSize(width, height, depth)
	if self.part then
		self.part.Size = Vector3.new(width, height, depth)
	end
end

function ManagablePart:setMaterial(material)
	if self.part then
		self.part.Material = material
	end
end

function ManagablePart:setColor(color)
	if self.part then
		self.part.BrickColor = BrickColor.new(color)
	end
end

function ManagablePart:getPart()
	return self.part
end

function ManagablePart:clone(x,y,z)
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

ManagablePart.new(0,0,0,128,1,128,Enum.Material.Plastic,"Bright Red")


print("im a goofy goober")

print("ROCK")