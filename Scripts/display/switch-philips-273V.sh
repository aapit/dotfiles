# Create and add display mode
# These should only be called once a session, otherwise you'll get errors like 'Badname' etc.
xrandr --newmode "1920x1080_60.00"  173.00  1920 2048 2248 2576  1080 1083 1088 1120 -hsync +vsync 2>/dev/null
xrandr --addmode DP-1 1920x1080_60.00 2>/dev/null

# Switch DP-1 to new mode
xrandr --output DP-1 --mode 1920x1080_60.00 --scale 2x2 --panning 3840x2160
xrandr --output eDP-1 --off
