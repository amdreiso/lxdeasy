
local ROFI = "rofi -show drun"


-- Binds

Bind({SUPER, ENTER}, Exec("alacritty"))
Bind({SUPER, "q"},   Exec("firefox"))

Bind({SUPER, "d"},   Exec(ROFI))

-- Screenshots
Bind({SUPER, SHIFT, "s"}, 	Exec("sh -c 'maim -s -o | xclip -selection clipboard -t image/png'"))
Bind({SUPER, "s"}, 			Exec("sh -c 'maim -s -o ~/Pictures/$(date +%%Y-%%m-%%d_%%H-%%M-%%S).png'"))

-- Windows
Bind({SUPER, SPACE}, SoloAction("ToggleMaximize"))
Bind({SUPER, SHIFT, "q"}, 	SoloAction("Close"))
Bind({SUPER, "f"}, 			SoloAction("ToggleMaximize"))
Bind({SUPER, SHIFT, "f"}, 	SoloAction("ToggleFullscreen"))

-- SUPER+1..10 will change desktop to chosen number
for i=1, 10 do
	--Bind({SUPER, i-1}, Custom("desktop", "desktop", i-1))
	Bind({SUPER, i-1}, Action("desktop", Custom("desktop", i-1)))
end


-- Mouse Binds
MouseBind(CONTEXT_FRAME, {SUPER, LEFT}, DRAG, SoloAction("Move"))
MouseBind(CONTEXT_FRAME, {SUPER, RIGHT}, DRAG, SoloAction("Resize"))


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

