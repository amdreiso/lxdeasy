
Bind({SUPER, ENTER}, Exec("alacritty"))
Bind({SUPER, "q"},   Exec("firefox"))

Bind({SUPER, SHIFT, F7},   Exec("brightnessctl set 100-"))
Bind({SUPER, SHIFT, F8},   Exec("brightnessctl set +100"))

Bind({SUPER, SHIFT, "q"}, SoloAction("Close"))

for i=1, 10 do
	Bind({SUPER, i-1}, Custom("desktop", "desktop", i-1))
end

