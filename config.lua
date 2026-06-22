
local ROFI = "rofi -show drun"

-- Binds
Bind({SUPER, ENTER}, Exec("alacritty"))
Bind({SUPER, "q"},   Exec("firefox"))

Bind({SUPER, "d"},   Exec(ROFI))

-- Screenshots
Bind({SUPER, SHIFT, "s"}, 	Exec("sh -c 'maim -s -o | xclip -selection clipboard -t image/png'"))
Bind({SUPER, "s"}, 			Exec("sh -c 'maim -s -o ~/Pictures/$(date +%%Y-%%m-%%d_%%H-%%M-%%S).png'"))

-- Windows
Resistance {
	strength = 20,
	screen_edge_strength = 40,
}

Bind({SUPER, SHIFT, SPACE}, SoloAction("ToggleMaximize"))
Bind({SUPER, SHIFT, "q"}, 	SoloAction("Close"))
Bind({SUPER, "f"}, 			SoloAction("ToggleMaximize"))
Bind({SUPER, SHIFT, "f"}, 	SoloAction("ToggleFullscreen"))

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

-- available characters are NDSLIMC, each can occur at most once.
-- N: window icon
-- L: window label (AKA title).
-- I: iconify
-- M: maximize
-- C: close
-- S: shade (roll up/down)
-- D: omnipresent (on all desktops).

ThemeConfig({
	name 				= "Artwiz-boxed",
	titleLayout 		= "NLIMC",
	keepBorder 			= true,
	animateIconify 		= true
})

ThemeFont("ActiveWindow", 				FONT, 10, "bold", "normal")
ThemeFont("InactiveWindow", 			FONT, 10, "bold", "normal")
ThemeFont("MenuHeader", 				FONT, 10, "normal", "normal")
ThemeFont("MenuItem", 					FONT, 10, "normal", "normal")
ThemeFont("OnScreenDisplay", 			FONT, 10, "bold", "normal")
ThemeFont("ActiveOnScreenDisplay", 		FONT, 8)
ThemeFont("InactiveOnScreenDisplay", 	FONT, 8)

pcall(loadfile(os.getenv("HOME") .. "/.config/lxdeasy/config.lua"))

