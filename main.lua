-- Gui to Lua
-- Version: 3.2

-- Instances:

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextBox = Instance.new("TextBox")
local TextButton = Instance.new("TextButton")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderColor3 = Color3.fromRGB(0, 0, 0)
Frame.BorderSizePixel = 0
Frame.Position = UDim2.new(0.0913242027, 0, 0.487179488, 0)
Frame.Size = UDim2.new(0, 500, 0, 300)

TextBox.Parent = Frame
TextBox.BackgroundColor3 = Color3.fromRGB(25, 25, 25)
TextBox.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextBox.BorderSizePixel = 0
TextBox.Size = UDim2.new(1, 0, 0.800000012, 0)
TextBox.ClearTextOnFocus = false
TextBox.Font = Enum.Font.SourceSans
TextBox.MultiLine = true
TextBox.Text = ""
TextBox.TextColor3 = Color3.fromRGB(240, 240, 240)
TextBox.TextSize = 20.000
TextBox.TextWrapped = true
TextBox.TextXAlignment = Enum.TextXAlignment.Left
TextBox.TextYAlignment = Enum.TextYAlignment.Top

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(10, 10, 10)
TextButton.BorderColor3 = Color3.fromRGB(0, 0, 0)
TextButton.BorderSizePixel = 0
TextButton.Position = UDim2.new(0, 0, 0.800000012, 0)
TextButton.Size = UDim2.new(0.400000006, 0, 0.200000003, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "Execute"
TextButton.TextColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextSize = 14.000

-- Scripts:

local function JJGTROG_fake_script() -- TextButton.LocalScript 
	local script = Instance.new('LocalScript', TextButton)

	script.Parent.MouseButton1Click:Connect(function()
		loadstring(script.Parent.Parent.TextBox.Text)()
	end)
end
coroutine.wrap(JJGTROG_fake_script)()
local function TSDL_fake_script() -- Frame.LocalScript 
	local script = Instance.new('LocalScript', Frame)

	local mouse = game.Players.LocalPlayer:GetMouse()
	local pos = {0,0}
	local btnDown = false 
	script.Parent.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then 
			btnDown = true 
			local xd = {mouse.X,mouse.Y}
			while btnDown do task.wait()
				script.Parent.Position = script.Parent.Position+UDim2.new(0,mouse.X-xd[1],0,mouse.Y-xd[2])
				xd = {mouse.X,mouse.Y}
			end	
		end
	end)
	
	script.Parent.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then 
			btnDown = false
		end
	end)
end
coroutine.wrap(TSDL_fake_script)()
