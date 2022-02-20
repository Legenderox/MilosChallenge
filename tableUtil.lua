
function CopyTable(t)
	assert(type(t) == "table", "First argument must be a table")
	local tCopy = {}
	for k,v in pairs(t) do
		if (type(v) == "table") then
			tCopy[k] = CopyTable(v)
		else
			tCopy[k] = v
		end
	end
	return tCopy
end