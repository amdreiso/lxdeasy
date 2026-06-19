local flags = require("flags")

function Token(format, type)
	return {
		format = format,
		type = type
	}
end

function _G.Exec(command)
	local f = string.format(
[[<action name="Execute">
    <command>%s</command>
  </action>]], command)

	return Token(f, "Exec")
end

function _G.SoloAction(name)
	local f = string.format(
[[<action name="%s"/>]], name)

  	return Token(f, "SoloAction")
end

function _G.Action(name, ...)
	local arguments = {...}

  	local f = string.format([[<action name="%s">]], name)

	for i, v in pairs(arguments) do
		f = f .. "\n      " .. v.format
	end

	f = f .. "\n" .. "    </action>"

  	return Token(f, "Action")
end

function _G.Custom(tag, value)
	local f = string.format([[<%s>%s</%s>]], tag, value, tag)
  	return Token(f, "Custom")
end

function _G.FormatBind(bind)
	local formatBind = ""
	for i, v in pairs(bind) do
		local separator = "-"
		if i == 1 then separator = "" end
		formatBind = formatBind .. separator .. v
	end
	return formatBind
end

function _G.Bind(bind, action)
	bind = _G.FormatBind(bind)

	local res = string.format(
[[
  <keybind key="%s">
    %s
  </keybind>
]], bind, action.format)

	RESULT.keyboard = RESULT.keyboard .. res
end

function _G.MouseBind(context, bind, motion, ...)
	bind = _G.FormatBind(bind)

	local arguments = {...}

	local res = string.format(
[[
  <context name="%s">
    <mousebind button="%s" action="%s">]], context, bind, motion)

	for i, v in pairs(arguments) do
		res = res .. "\n      " .. v.format
	end

	res = res .. "\n" ..
[[
    </mousebind>
  </context>
]]
	RESULT.mouse = RESULT.mouse .. res
end

function _G.ThemeConfig(components)
	local theme = ""

	for k, v in pairs(components) do
		local value = v
		if type(v) == "boolean" then
			value = (v == true) and "yes" or "no"
		end
		local format = string.format("<%s>%s</%s>\n", k, value, k)
		theme = theme .. format
	end

	RESULT.theme = RESULT.theme .. theme
end

function _G.ThemeFont(place, name, size, weight, slant)
	local w = string.format("<weight>%s</weight>", weight) 
	local s = string.format("<slant>%s</slant>", slant) 

	if (weight == nil) then
		w = "<weight/>" 
	end

	if (slant == nil) then
		s = "<slant/>" 
	end

	local font = string.format([[<font place="%s">
  <name>%s</name>
    <size>%s</size>
    %s
    %s
  </font>]], place, name, size, w, s)
	RESULT.theme = RESULT.theme .. font
end

