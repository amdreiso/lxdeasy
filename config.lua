-- Binds
local ROFI = "rofi -show drun"

Bind({SUPER, ENTER}, Exec("alacritty"))
Bind({SUPER, "q"},   Exec("firefox"))
Bind({SUPER, "d"},   Exec(ROFI))
Bind({SUPER, "e"},	 Exec("pcmanfm"))

-- Screenshots
Bind({SUPER, SHIFT, "s"}, 	Exec("sh -c 'maim -s -o | xclip -selection clipboard -t image/png'"))
Bind({SUPER, "s"}, 			Exec("sh -c 'maim -s -o ~/Pictures/$(date +%%Y-%%m-%%d_%%H-%%M-%%S).png'"))

-- Desktops
Under("desktops", {
	number = 4,
	firstdesk = 1,
	names = Field(
		Custom("name", "programming"),
		Custom("name", "browser"),
		Custom("name", "gaming")
	),
	popupTime = 200,
})

-- Windows
Bind({SUPER, SHIFT, SPACE}, SoloAction("ToggleMaximize"))
Bind({SUPER, SHIFT, "q"}, 	SoloAction("Close"))
Bind({SUPER, "f"}, 			SoloAction("ToggleMaximize"))
Bind({SUPER, SHIFT, "f"}, 	SoloAction("ToggleFullscreen"))
Bind({ALT, TAB}, 			SoloAction("NextWindow"))
Bind({ALT, SHIFT, TAB},		SoloAction("PreviousWindow"))

for i=1, 10 do
	-- SUPER+1..10 will change desktop to chosen number
	Bind({SUPER, i-1}, Action("desktop", Custom("desktop", i-1)))
	
	-- Move window to desktop
	Bind({SUPER, SHIFT, i-1}, 
		Action("SendToDesktop",
			Custom("to", i-1),
			Custom("follow", "no")
		)
	)
end

-- Mouse Binds
MouseBindContext(
	CONTEXT_FRAME,
	MouseBind({SUPER, LEFT}, 	DRAG, 	SoloAction("Move")),
	MouseBind({SUPER, RIGHT}, 	DRAG, 	SoloAction("Resize")),
	MouseBind({SUPER, UP}, 		CLICK, 	SoloAction("DesktopPrevious")),
	MouseBind({SUPER, DOWN}, 	CLICK, 	SoloAction("DesktopNext"))
)

-- Theme
local FONT = "SauceCodePro Nerd Font"

ThemeConfig {
	name 				= "Artwiz-boxed",
	titleLayout 		= "NLIMC",
	keepBorder 			= true,
	animateIconify 		= true,
}

ThemeFont("ActiveWindow", 				FONT, 10, "bold", "normal")
ThemeFont("InactiveWindow", 			FONT, 10, "bold", "normal")
ThemeFont("MenuHeader", 				FONT, 10, "normal", "normal")
ThemeFont("MenuItem", 					FONT, 10, "normal", "normal")
ThemeFont("OnScreenDisplay", 			FONT, 10, "bold", "normal")
ThemeFont("ActiveOnScreenDisplay", 		FONT, 8)
ThemeFont("InactiveOnScreenDisplay", 	FONT, 8)

-- Other
-- Window resistance
Under("resistance", {
	strength = 20,
	screen_edge_strength = 40,
})

-- Window focus
Under("focus", {
	followMouse = false,
	focusDelay = 200,
	raiseOnFocus = true,

	focusNew = true,
	focusLast = true,
	underMouse = false,
})

-- Window placement
Under("placement", {
	policy = "Smart",
	center = true,
	monitor = "Any",
})

pcall(loadfile(os.getenv("HOME") .. "/.config/lxdeasy/config.lua"))

