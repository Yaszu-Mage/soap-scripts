-- workspace:ClearAllChildren()

local folder = Instance.new("Folder")
folder.Parent = workspace
folder.Name = "Yaszu"
local players = game:GetService("Players")
local everyOne = players:GetPlayers()
local yaszuFolder = Workspace:FindFirstChild("Yaszu")
local insertService = game:GetService("InsertService")
local witchHat = 18860971203
local work = game:GetService("Workspace")




function createPart(x,y,z,width,height,depth,material,color)
	local part = Instance.new("Part")
	part.Position = Vector3.new(x, y, z)
	part.Size = Vector3.new(width, height, depth)
	part.Material = material
	part.Color = color
	part.Parent = yaszuFolder
	return part
end

local ManagablePart = {}

ManagablePart.__index = ManagablePart


local computah = {}
computah.__index = computah

function computah.new(text,x,y,z)
local surfaceGui = Instance.new("SurfaceGui")
surfaceGui.Face = Enum.NormalId.Front
surfaceGui.CanvasSize = Vector2.new(800,400)
createPart(x+4.5,y,z+0.5,1,8,2,Enum.Material.Plastic,Color3.fromHex("#808080"))
createPart(x-4.5,y,z+0.5,1,8,2,Enum.Material.Plastic,Color3.fromHex("#808080"))
createPart(x,y+4.5,z+0.5,10,1,2,Enum.Material.Plastic,Color3.fromHex("#808080"))
createPart(x,y,z+1,10,8,1,Enum.Material.Plastic,Color3.fromHex("#808080"))
surfaceGui.Parent = createPart(x,y,z,8,8,2,Enum.Material.Plastic,Color3.fromHex("#ADD8E6"))
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = text
textLabel.TextColor3 = Color3.fromRGB(0, 0, 0) 
textLabel.TextSize = 32
textLabel.TextScaled = true 
textLabel.Font = Enum.Font.SourceSansBold
textLabel.Parent = surfaceGui
end

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

ManagablePart.new(0,0,0,128,1,128,Enum.Material.Plastic,Color3.fromHex("#3E1550"))

local function addAccessory(character, id)
	if not character then return end 
	local humanoid = character:WaitForChild("Humanoid", 10)
	if not humanoid then return end

	local success, loadedModel = pcall(function()
		return insertService:LoadAsset(id)
	end)

	if success and loadedModel then
		local accessory = loadedModel:FindFirstChildOfClass("Accessory")
		if accessory then
			humanoid:AddAccessory(accessory)
		end
		loadedModel:Destroy()
	else
		warn("Failed to load asset:", id, loadedModel)
	end
end

for _, child in ipairs(yaszuFolder:GetChildren()) do
    child:Destroy()
end

local function onCharacterAdded(character)
	if character.Name == "Yaszu" then
		local bodyColors = character:FindFirstChildOfClass("BodyColors")
		if not bodyColors then
			bodyColors = Instance.new("BodyColors")
			bodyColors.Parent = character
		end
		local shirtColor = Color3.new(0,0,0)
		local bodyColor = Color3.new(1,1,1)
		local pantColor = Color3.new(0.4,0.4,0.4)
		bodyColors.HeadColor3 = bodyColor
		bodyColors.LeftArmColor3 = bodyColor
		bodyColors.RightArmColor3 = bodyColor
		bodyColors.LeftLegColor3 = pantColor
		bodyColors.RightLegColor3 = pantColor
		bodyColors.TorsoColor3 = shirtColor
	end
end

local function setup(player)
	if player.Name ~= "Yaszu" then return end
	player.CharacterAdded:Connect(onCharacterAdded)
	if player.Character then
		task.spawn(onCharacterAdded,player.Character)
		-- addAccessory(player,witchHat)
	end
end

players.PlayerAdded:Connect(setup)

if (players.LocalPlayer == nil) then
	ManagablePart.new(8,4,8,4,1,4,Enum.Material.Plastic,Color3.fromHex("#3E1550"))
end


players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(onCharacterAdded)
	if player.Character then
		ManagablePart.new(-8,8,-8,4,1,4,Enum.Material.Plastic,Color3.fromHex("#3E1550"))
		onCharacterAdded(player.Character)
	end
end)

for _, player in ipairs(players:GetPlayers()) do
	setup(player)
	-- if player.Name == "Yaszu" then
	-- 	addAccessory(player,witchHat)
	-- 	onCharacterAdded(player.Character)
	-- end
	
end

ManagablePart.new(0,1,0,128,1,128,Enum.Material.Plastic,Color3.fromHex("#3E1550"))
work.ChildRemoved:Connect(function(descendant)
	if (decendent == nil) then
		return
	end
    if (decendent.Name == "Yaszu") then
		local folder = Instance.new("Folder")
		folder.Parent = workspace
		folder.Name = "Yaszu"
		ManagablePart.new(0,1,0,1280,1,1280,Enum.Material.Plastic,Color3.fromHex("#3E1550"))
	end
end)
yaszuFolder:ClearAllChildren()
print("im a goofy goober")
print("ROCK")

computah.new("Hey, for whoever finds this, if you need console access or to print something, let @Yaszu know, I made a computah class so you can just make it physical. Okay have fun!",18,5.1,18)


local House = {}

House.__index = House

function House.new(x,y,z,width,height,depth, wallColor, floorColor, roofColor, glassColor)
	local self = setmetatable({},House)
	width = width or 20
	height = height or 10
	depth = depth or 20

	local wallThickness = 1
	local doorW, doorH = 4,7
	local innerW = width - 2 * wallThickness
	local baseY = y+1
	local roofHeight = 6

	local model = Instance.new("Model")
	model.Name = "House"
	model.Parent = yaszuFolder
	self.model = model
	local floor = createPart(x,y + 0.5,z,width, 1 , depth, Enum.Material.Wood, floorColor)

	local function wall(px,py,pz,w,h,d)
		return createPart(px,py,pz,w,h,d,Enum.Material.Plastic, wallColor)
	end
	local sideY = baseY + 10 / 2
	wall(x - width/2 + wallThickness/2, sideY, z, wallThickness,height, depth)
	wall(x + width/2 - wallThickness/2, sideY, z, wallThickness,height, depth)



end
local color = Color3.fromHex("#D9C7A3")

House.new(32,1,32,4,4,color,color,color,color)
