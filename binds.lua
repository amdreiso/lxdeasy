
Bind({SUPER, ENTER}, Exec("alacritty"))
Bind({SUPER, "q"},   Exec("firefox"))

Bind({SUPER, SHIFT, F7},   Exec("brightnessctl set 100-"))
Bind({SUPER, SHIFT, F8},   Exec("brightnessctl set +100"))

-- SoloActions don't have children, contrary to Action
Bind({SUPER, SHIFT, "q"}, SoloAction("Close"))

-- SUPER+1..10 will change desktop to chosen number
for i=1, 10 do
	Bind({SUPER, i-1}, Custom("desktop", "desktop", i-1))
end

