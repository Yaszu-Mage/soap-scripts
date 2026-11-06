-- workspace:ClearAllChildren()


local folder = Instance.new("Folder")
folder.Parent = workspace
folder.Name = "Yaszu"
local players = game:GetService("Players")
local everyOne = players:GetPlayers()
local yaszuFolder = workspace:FindFirstChild("Yaszu")
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
local self = setmetatable({}, computah)
local model = Instance.new("Model")
local surfaceGui = Instance.new("SurfaceGui")
surfaceGui.Face = Enum.NormalId.Front
surfaceGui.CanvasSize = Vector2.new(800,400)
local wall1 = createPart(x+4.5,y,z+0.5,1,8,2,Enum.Material.Plastic,Color3.fromHex("#808080"))
local wall2 = createPart(x-4.5,y,z+0.5,1,8,2,Enum.Material.Plastic,Color3.fromHex("#808080"))
local wall3 = createPart(x,y+4.5,z+0.5,10,1,2,Enum.Material.Plastic,Color3.fromHex("#808080"))
local wall4 = createPart(x,y,z+1,10,8,1,Enum.Material.Plastic,Color3.fromHex("#808080"))
local screen = createPart(x,y,z,8,8,2,Enum.Material.Plastic,Color3.fromHex("#ADD8E6"))
surfaceGui.Parent = screen
screen.Parent = model
wall1.Parent = model
wall2.Parent = model
wall3.Parent = model
wall4.Parent = model
local textLabel = Instance.new("TextLabel")
textLabel.Size = UDim2.new(1, 0, 1, 0)
textLabel.BackgroundTransparency = 1
textLabel.Text = text
textLabel.TextColor3 = Color3.fromRGB(0, 0, 0) 
textLabel.TextSize = 32
textLabel.TextScaled = true 
textLabel.Font = Enum.Font.SourceSansBold
textLabel.Parent = surfaceGui
	self.model = model
	return self
end

function computah:Destroy()
	if (self.model) then
		self.model:Destroy()
		self.model = nil
	end
	
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
		addAccessory(workspace.Yaszu,witchHat)
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
computah.new("Anyways, I made the house to the left, it's a wip so don't roast me, but my goal is to make a little town. >:D",9,5.1,18)

ManagablePart.new(0,0.1,0,1000,0,1000,Enum.Material.Plastic,Color3.fromHex("#567d46"))
local House = {}

House.__index = House

function House.new(x,y,z,width,height,depth, wallColor, floorColor, roofColor, glassColor)
	local self = setmetatable({},House)
	width = width or 20
	height = height or 10
	depth = depth or 20

	local wallThickness = 1
	local doorW, doorH = 4,7
	local winW, winH, winSill = 5, 4, 3
	local innerW = width - 2 * wallThickness
	local baseY = y+1
	local roofHeight = 6

	local model = Instance.new("Model")
	model.Name = "House"
	model.Parent = yaszuFolder
	self.model = model
	

	local function wall(px,py,pz,w,h,d)
		local part = createPart(px,py,pz,w,h,d,Enum.Material.Plastic, wallColor)
		part.Parent = model
		return part
	end

	local function part(x,y,z,width,height,depth,material,color)
		local part = createPart(x,y,z,width,height,depth,material,color)
		part.Parent = model
		return part

	end
	local floor = part(x,y +0.5,z,width + 1, 1 , depth + 1, Enum.Material.Wood, floorColor)
	local sideY = baseY + height / 2
	wall(x - width/2 + wallThickness/2, sideY, z, wallThickness,height, depth)
	wall(x + width/2 - wallThickness/2, sideY, z, wallThickness,height, depth)
	local frontZ = z + depth/2 - wallThickness/2
	local segmentWidth = (innerW - doorW) / 2
	wall(x - innerW/2 + segmentWidth/2, sideY, frontZ, segmentWidth, height,wallThickness)
	wall(x + innerW/2 - segmentWidth/2,sideY,frontZ,segmentWidth,height,wallThickness)
	wall(x, baseY + doorH + (height - doorH)/2, frontZ, doorW, height - doorH, wallThickness)
	local backZ = z- depth/2 + wallThickness/2

	local sideSegW = (innerW - winW) /2
		wall(x, baseY + winSill/2 + 0.2, backZ, innerW, winSill, wallThickness)
		wall(x, baseY + winSill + winH + (height - winSill - winH)/2, backZ,
		innerW, height - winSill - winH, wallThickness)
	wall(x - innerW/2 + sideSegW/2, baseY + winSill + winH/2 + 0.2, backZ, sideSegW, winH, wallThickness)
	wall(x + innerW/2 - sideSegW/2, baseY + winSill + winH/2 +0.2, backZ, sideSegW, winH, wallThickness)
	local glass = part(x, baseY + winSill + winH/2 + 0.2, backZ + 0.4, winW, winH, 0.2,
		Enum.Material.SmoothPlastic, glassColor)
	glass.Transparency = 0.5
	local half = width / 2
	local angle = math.atan2(roofHeight, half)
	local slabLen = math.sqrt(half^2 + roofHeight^2) + 1 -- +1 for overhang
	local roofY = baseY + height + roofHeight / 2
	for _, side in ipairs({-1, 1}) do
		local slab = part(x + side * half / 2, roofY, z, slabLen, 1, depth + 2,
			Enum.Material.Slate, roofColor)
		slab.CFrame = CFrame.new(x + side * half / 2, roofY, z)
			* CFrame.Angles(0, 0, -side * angle)
	end
	self.model = model
	return self
end

function House:getModel()
	return self.model
end

function House:destroy()
	if self.model then
		self.model:Destroy()
		self.model = nil
	end
end
function House:rotate(degrees)
	if self.model then
		self.model:PivotTo(self.model:GetPivot() * CFrame.Angles(0, math.rad(degrees), 0))
	end
end
function House:setRotation(degrees)
	if self.model then
		local pos = self.model:GetPivot().Position
		self.model:PivotTo(CFrame.new(pos) * CFrame.Angles(0, math.rad(degrees), 0))
	end
end
local color = Color3.fromHex("#D9C7A3")
local randomWall = math.random(10,32)
local bufferHouse = 10
local randomY = math.random(10,32)
local houseA = House.new(64,1,42,randomWall,randomY,randomWall,color,color,color,color)
randomWallTwo = math.random(10,32)
local houseB = House.new(64 + randomWall + bufferHouse,1,42,randomWallTwo,randomY,randomWallTwo,color,color,color,color)

houseB:rotate(180)
houseA:rotate(180)



local Lighting = game:GetService("Lighting")
local RunService = game:GetService("RunService")
local minutesPerSecond = 1
local computah = computah.new(tostring(Lighting.ClockTime),0,5.1,18)
-- RunService.Heartbeat:Connect(function(deltaTime)
-- 	Lighting.ClockTime = (Lighting.ClockTime + minutesPerSecond / 60) * deltaTime % 24
	
-- end)



