local flags = require("flags")
local cmd = {}

function Token(format, type)
	return {
		format = format,
		type = type
	}
end

function cmd.Exec(command)
	local f = string.format(
[[<action name="Execute">
    <command>%s</command>
  </action>]], command)

	return Token(f, "Exec")
end

function cmd.SoloAction(name)
	local f = string.format(
[[<action name="%s"/>
]], name)

  	return Token(f, "SoloAction")
end

function cmd.Action(name)
	local f = string.format(
[[<action name="%s">
    <dialog>no</dialog>
    <wrap>no</wrap>
  </action>]], name)

  	return Token(f, "Action")
end

function cmd.Custom(name, tag, command)
	local f = string.format(
[[<action name="%s">
    <%s>%s</%s>
  </action>]], name, tag, command, tag)

  	return Token(f, "Custom")
end

function cmd.Bind(bind, action)
	local formatBind = ""
	for i, v in pairs(bind) do
		local separator = "-"
		if i == 1 then separator = "" end
		formatBind = formatBind .. separator .. v
	end

	local res = string.format(
[[
  <keybind key="%s">
    %s
  </keybind>
]], formatBind, action.format)

	RESULT = RESULT .. res

	if flags.verbose then
		print("Bind '" .. formatBind .. "' set to action '" .. action.type .. "'")
	end
end

return cmd
