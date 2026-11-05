--!strict

local Cooldown = {}

export type Handle = {
	tryUse: (now: number) -> boolean,
}

-- Use a monotonic timestamp in seconds from the same clock on each call.
function Cooldown.new(seconds: number): Handle
	assert(seconds >= 0 and seconds < math.huge, "Cooldown duration must be finite and non-negative")

	local readyAt = -math.huge
	return {
		tryUse = function(now: number): boolean
			if now < readyAt then
				return false
			end

			readyAt = now + seconds
			return true
		end,
	}
end

return Cooldown
