--!strict

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local common = ReplicatedStorage.RobloxCommon
local Cooldown = require(common.Shared.Cooldown)

local cooldown = Cooldown.new(2)
assert(cooldown.tryUse(10), "First use should succeed")
assert(not cooldown.tryUse(11), "Use before expiry should fail")
assert(cooldown.tryUse(12), "Use at expiry should succeed")

local pad = common.Assets.CheckpointPad:Clone()
assert(pad:IsA("Part") and pad.Anchored, "Expected an anchored checkpoint prefab")
pad.Position = Vector3.new(0, 1, 0)
pad.Parent = workspace

print("[RobloxCommonDemo] Cooldown e prefab verificati")
