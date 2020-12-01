# Create and add display mode
# These should only be called once a session, otherwise you'll get errors like 'Badname' etc.


xrandr --newmode "3840x2160_30.00"  338.75  3840 4080 4488 5136  2160 2163 2168 2200 -hsync +vsync 2>/dev/null

# When the intel UHD driver is set to TearFree option,
# the display is `DP1` instead of `DP-1`, and `eDP1` instead of `eDP-1`.
# Might have something to do with upgraded driver versions (`fbdev` or `video-intel`)
# during tweaking.
xrandr --addmode DP1 3840x2160_30.00 2>/dev/null
xrandr --addmode DP1 3840x2160_30.00 2>/dev/null

# Switch DP-1 to new mode
xrandr --output DP1 --mode 3840x2160_30.00 --rotate inverted --scale 1x1 --panning 3840x2160
xrandr --output eDP1 --off
