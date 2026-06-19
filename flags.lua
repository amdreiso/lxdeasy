local flags = {}

flags.verbose = false
flags.execute = true

local function printHelp()
	print("FLAGS:")
	print("	--verbose		verbs")
	print("	--no-execute		creates config file but doesn't reconfigure openbox")
	print("")
	print("Usage:")
	print("	Write your configuration in config.lua, in this folder")
	print("	then run ./lxdeasy to translate it into openbox's xml style")
end

function flags.Get(args)
	for i=1, #args do
		local a = args[i]
		if a == "--verbose" then flags.verbose = true end
		if a == "--no-execute" then flags.execute = false end
		if a == "--help" or "-h" then 
			printHelp()
			os.exit(0)
		end
	end
end

return flags
