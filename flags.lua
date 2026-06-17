local flags = {}

flags.verbose = false
flags.execute = true

function flags.Get(args)
	for i=1, #args do
		local a = args[i]
		if a == "--verbose" then flags.verbose = true end
		if a == "--no-execute" then flags.execute = false end
	end
end

return flags
