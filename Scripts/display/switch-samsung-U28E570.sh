# Create and add display mode
# These should only be called once a session, otherwise you'll get errors like 'Badname' etc.


xrandr --newmode "3840x2160_30.00"  338.75  3840 4080 4488 5136  2160 2163 2168 2200 -hsync +vsync 2>/dev/null
xrandr --addmode DP-1 3840x2160_30.00 2>/dev/null

# Switch DP-1 to new mode
xrandr --output DP-1 --mode 3840x2160_30.00 --rotate inverted --scale 1x1 --panning 3840x2160
xrandr --output eDP-1 --off
