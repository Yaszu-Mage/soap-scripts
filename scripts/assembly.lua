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

local part = currenScript.Parent
local surfaceGui = Instance.new("SurfaceGui")
surfaceGui.Face = Enum.NormalId.Front
surfaceGui.CanvasSize = Vector2.new(800,400)
surfaceGui.Parent = yaszuFolder
local pathString = currentScript:GetFullName()
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = pathString
textLabel.TextColor3 = Color3.fromRGB(0, 0, 0) 
textLabel.TextSize = 24
textLabel.TextScaled = true 
textLabel.Font = Enum.Font.SourceSansBold
textLabel.Parent = surfaceGui


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
		addAccessory(player,witchHat)
	end
end

players.PlayerAdded:Connect(setup)

if (players.LocalPlayer == nil) then
	ManagablePart.new(8,4,8,4,1,4,Enum.Material.Plastic,"Bright Red")
end


players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(onCharacterAdded)
	if player.Character then
		ManagablePart.new(-8,8,-8,4,1,4,Enum.Material.Plastic,"Bright Red")
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

ManagablePart.new(0,1,0,128,1,128,Enum.Material.Plastic,"Bright Red")
work.ChildRemoved:Connect(function(descendant)
	if (decendent == nil) then
		return
	end
    if (decendent.Name == "Yaszu") then
		local folder = Instance.new("Folder")
		folder.Parent = workspace
		folder.Name = "Yaszu"
		ManagablePart.new(0,1,0,128,1,128,Enum.Material.Plastic,"Bright Red")
	end
end)
yaszuFolder:ClearAllChildren()
print("im a goofy goober")
print("ROCK")