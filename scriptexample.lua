-- me did smol script cuz public repo

game:GetService("PhysicsService"):RegisterCollisionGroup("Player")
game:GetService("PhysicsService"):CollisionGroupSetCollidable("Player", "Player", false)
game.Players.PlayerAdded:Connect(function(Player)
	Player.CharacterAdded:Connect(function()
		local Outline = Instance.new("Highlight")
		Outline.Name = "Outline"
		Outline.DepthMode = Enum.HighlightDepthMode.Occluded
		Outline.OutlineColor = Color3.fromRGB(0, 0, 0)
		Outline.FillTransparency = 1
		Outline.Parent = Player.Character
		Player.Character.Animate:Destroy()
		game.ReplicatedStorage.Animate:Clone().Parent = Player.Character
		local SpeedChanges = Instance.new("Folder")
		SpeedChanges.Name = "SpeedChanges"
		SpeedChanges.Parent = Player.Character
		coroutine.resume(coroutine.create(function()
			while true do
				task.wait()
				pcall(function()
					local Speed = 16
					for _, SpeedChange in pairs(SpeedChanges:GetChildren()) do
						pcall(function()
							Speed += SpeedChange.Value
						end)
					end
					Player.Character.Humanoid.WalkSpeed = Speed
				end)
			end
		end))
		coroutine.resume(coroutine.create(function()
			while true do
				task.wait(0.1)
				pcall(function()
					Player.Character.Humanoid.UseJumpPower = true
					if Player.Character:FindFirstChild("NoJumping") then
						Player.Character.Humanoid.JumpPower = 0
					else
						Player.Character.Humanoid.JumpPower = 50
					end
				end)
			end
		end))
		coroutine.resume(coroutine.create(function()
			while true do
				task.wait()
				pcall(function()
					if Player.Character:FindFirstChild("NoRotate") then
						Player.Character.Humanoid.AutoRotate = false
					else
						Player.Character.Humanoid.AutoRotate = true
					end
				end)
			end
		end))
		coroutine.resume(coroutine.create(function()
			while true do
				task.wait(0.1)
				pcall(function()
					local Description = Player.Character.Humanoid:GetAppliedDescription()
					Description.Torso = 0
					Description.RightArm = 0
					Description.LeftArm = 0
					Description.RightLeg = 0
					Description.LeftLeg = 0
					Player.Character.Humanoid:ApplyDescription(Description)
					for _, Limb in pairs(Player.Character:GetDescendants()) do
						pcall(function()
							Limb.CollisionGroup = "Player"
						end)
					end
				end)
			end
		end))
		local Sprint = Instance.new("NumberValue")
		Sprint.Name = "Sprint"
		Sprint.Value = 0
		Sprint.Parent = SpeedChanges
	end)
end)
