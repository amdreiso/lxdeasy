local flags = {}

flags.verbose = false

function flags.Get(args)
	for i=1, #args do
		local a = args[i]
		if a == "--verbose" then flags.verbose = true end
	end
end

return flags
