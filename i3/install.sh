cat << EOF < ./config
set $mod Mod4
# Font for window titles. Will also be used by the bar unless a different font
# is used in the bar {} block below.
font pango:monospace 8

# This font is widely installed, provides lots of unicode glyphs, right-to-left
# text rendering and scalability on retina/hidpi displays (thanks to pango).
#font pango:DejaVu Sans Mono 8

# The combination of xss-lock, nm-applet and pactl is a popular choice, so
# they are included here as an example. Modify as you see fit.

# xss-lock grabs a logind suspend inhibit lock and will use i3lock to lock the
# screen before suspend. Use loginctl lock-session to lock your screen.

# pacman -S qt5ct
# export QT_QPA_PLATFORMTHEME="qt5ct"
exec setxkbmap -model pc101 -layout us,ru -option grp:alt_shift_toggle



exec        --no-startup-id                 $i3/lock
exec_always --no-startup-id feh  --bg-center $wallpaper &
exec_always --no-startup-id                 $compton/compton.sh
#exec_always --no-startup-id                 $polybar/polybar.sh
#exec_always --no-startup-id                 xfce4-panel --disable-wm-check
exec_always --no-startup-id                 $i3/wifi
exec_always --no-startup-id                 $i3/clipboard
exec_always --no-startup-id                 $i3/power-manager 
#exec_always --no-startup-id                 $i3/pulseaudio
#exec_always --no-startup-id                 $i3/bluetooth
exec        --no-startup-id                 dunst




# Use Mouse+$mod to drag floating windows to their wanted position
floating_modifier $mod

bindsym $mod+w      exec rofi -show window
# start a terminal
bindsym $mod+Return exec kitty
# start a file manager
bindsym $mod+e      exec $i3/filemanager
bindsym $mod+m      exec $i3/monitor

#bindsym $mod+Return exec ~/.dotfiles/kitty/kitty.sh 
#bindsym $mod+Shift+Return exec kitty -T='main kitty' --detach --listen-on unix:$i3/kittytmp
# kill focused window
bindsym $mod+Shift+q kill

# start dmenu (a program launcher)
bindsym $mod+d exec  rofi -show drun -show-icons 
bindsym $mod+Shift+d exec  rofi-pass
#bindsym $mod+d exec --no-startup-id i3-dmenu-desktop
bindsym Print exec spectacle -b -r -c

# Pulse Audio controls
#increase sound volume
bindsym XF86AudioRaiseVolume exec --no-startup-id $i3/XF86Audio increase_volume
##decrease sound volume
bindsym XF86AudioLowerVolume exec --no-startup-id $i3/XF86Audio decrease_volume
## mute sound
bindsym XF86AudioMute        exec --no-startup-id $i3/XF86Audio mute
## mute mic
bindsym XF86AudioMicMute     exec --no-startup-id pactl set-source-mute 1 toggle 
bindsym Shift+XF86AudioMute        exec pavucontrol -t 3 & 
bindsym Shift+XF86AudioLowerVolume exec pavucontrol -t 4 & 

#bindsym $mod+p               exec --no-startup-id $i3/XF86Display.sh

# Screen brightness controls
## increase screen brightness
bindsym XF86MonBrightnessUp   exec --no-startup-id $i3/XF86MonBrightness up
## decrease screen brightness
bindsym XF86MonBrightnessDown exec --no-startup-id $i3/XF86MonBrightness down

bindsym $mod+n                exec --no-startup-id $i3/new-workspace
## Touchpad controls
## toggle touchpad
bindsym XF86TouchpadToggle exec --no-startup-id $i3/XF86TouchpadToggle
bindsym $mod+Shift+p       exec --no-startup-id $i3/XF86Display 

# change focus
bindsym $mod+h focus left
bindsym $mod+j focus down
bindsym $mod+k focus up
bindsym $mod+l focus right

# alternatively, you can use the cursor keys:
bindsym $mod+Left focus left
bindsym $mod+Down focus down
bindsym $mod+Up focus up
bindsym $mod+Right focus right

# move focused window
bindsym $mod+Shift+j move down
bindsym $mod+Shift+k move up
bindsym $mod+Shift+l move right
bindsym $mod+Shift+h move left

# alternatively, you can use the cursor keys:
bindsym $mod+Shift+Left move left
bindsym $mod+Shift+Down move down
bindsym $mod+Shift+Up move up
bindsym $mod+Shift+Right move right

# split in horizontal orientation
bindsym $mod+semicolon split h

# split in vertical orientation
bindsym $mod+v split v

# enter fullscreen mode for the focused container
bindsym $mod+f fullscreen toggle

# change container layout (stacked, tabbed, toggle split)
bindsym $mod+Shift+s layout stacking
bindsym $mod+Shift+w layout tabbed
bindsym $mod+Shift+e layout toggle split

# toggle tiling / floating
bindsym $mod+Shift+space floating toggle

# change focus between tiling / floating windows
bindsym $mod+space focus mode_toggle

# focus the parent container
bindsym $mod+a focus parent

# focus the child container
#bindsym $mod+d focus child

# Define names for default workspaces for which we configure key bindings later on.
# We use variables to avoid repeating the names in multiple places.
set $ws1 "1"
set $ws2 "2"
set $ws3 "3"
set $ws4 "4"
set $ws5 "5"
set $ws6 "6"
set $ws7 "7"
set $ws8 "8"
set $ws9 "9"
set $ws10 "10"

# switch to workspace
bindsym $mod+Tab workspace next
bindsym $mod+Shift+Tab workspace prev
bindsym $mod+1 workspace number $ws1
bindsym $mod+2 workspace number $ws2
bindsym $mod+3 workspace number $ws3
bindsym $mod+4 workspace number $ws4
bindsym $mod+5 workspace number $ws5
bindsym $mod+6 workspace number $ws6
bindsym $mod+7 workspace number $ws7
bindsym $mod+8 workspace number $ws8
bindsym $mod+9 workspace number $ws9
bindsym $mod+0 workspace number $ws10

# move focused container to workspace
bindsym $mod+Shift+1 move container to workspace number $ws1
bindsym $mod+Shift+2 move container to workspace number $ws2
bindsym $mod+Shift+3 move container to workspace number $ws3
bindsym $mod+Shift+4 move container to workspace number $ws4
bindsym $mod+Shift+5 move container to workspace number $ws5
bindsym $mod+Shift+6 move container to workspace number $ws6
bindsym $mod+Shift+7 move container to workspace number $ws7
bindsym $mod+Shift+8 move container to workspace number $ws8
bindsym $mod+Shift+9 move container to workspace number $ws9
bindsym $mod+Shift+0 move container to workspace number $ws10

# reload the configuration file
bindsym $mod+Shift+c reload
# restart i3 inplace (preserves your layout/session, can be used to upgrade i3)
bindsym $mod+Shift+r restart

mode "window" {
        # These bindings trigger as soon as you enter the resize mode

        bindsym h workspace back_and_forth
        bindsym j workspace prev
        bindsym k workspace next
        ## same bindings, but for the arrow keys
        #bindsym Left resize shrink width 10 px or 10 ppt
        #bindsym Down resize grow height 10 px or 10 ppt
        #bindsym Up resize shrink height 10 px or 10 ppt
        #bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+w mode "default"
}

#bindsym $mod+w mode "window"


# resize window (you can also use the mouse for that)
mode "resize" {
        # These bindings trigger as soon as you enter the resize mode

        # Pressing left will shrink the window’s width.
        # Pressing right will grow the window’s width.
        # Pressing up will shrink the window’s height.
        # Pressing down will grow the window’s height.
        bindsym h resize shrink width 9 px or 10 ppt
        bindsym j resize grow height 10 px or 10 ppt
        bindsym k resize shrink height 10 px or 10 ppt
        bindsym l resize grow width 10 px or 10 ppt

        # same bindings, but for the arrow keys
        bindsym Left resize shrink width 10 px or 10 ppt
        bindsym Down resize grow height 10 px or 10 ppt
        bindsym Up resize shrink height 10 px or 10 ppt
        bindsym Right resize grow width 10 px or 10 ppt

        # back to normal: Enter or Escape or $mod+r
        bindsym Return mode "default"
        bindsym Escape mode "default"
        bindsym $mod+r mode "default"
}

bindsym $mod+r mode "resize"


set $mode_system system (l) lock, (e) logout, (s) suspend, (h) hibernate, (r) reboot, (shift+s) shutdown

mode "$mode_system" {
    bindsym l exec       --no-startup-id $i3/i3-exit lock, mode "default"
    bindsym e exec       --no-startup-id $i3/i3-exit logout, mode "default"
    bindsym s exec       --no-startup-id $i3/i3-exit suspend, mode "default"
    bindsym h exec       --no-startup-id $i3/i3-exit hibernate, mode "default"
    bindsym r exec       --no-startup-id $i3/i3-exit reboot, mode "default"
    bindsym shift+s exec --no-startup-id $i3/i3-exit shutdown, mode "default"

    # back to normal: enter or escape
    bindsym Return mode "default"
    bindsym Escape mode "default"
}

bindsym $mod+o mode "$mode_system"

for_window [class=".*"] border pixel 2
# Xfce4 compatibility improvements
for_window [class="xfce4-panel"] floating enable,  border none, move right 700px, move down 450px, no_focus
for_window [class="Xfce4-panel"] floating enable; border pixel 2
for_window [window_role="pop-up"] floating enable
for_window [window_role="task_dialog"] floating enable





#assign [class="firefox"] $ws1
#assign [class="code-oss"] $ws3
#assign [title="MATLAB R2019b"] $ws3
#assign [class="Steam"] $ws4
#assign [class="Thunderbird"] $ws5
#assign [class="Mail"] $ws5
#assign [class="winword.exe"] $ws6
#assign [class="discord"] $ws7






for_window [class="MATLAB"] floating enable 
for_window [class="nm-connection-editor"] floating enable 
for_window [class="TelegramDesktop"] floating enable,resize set 380 480
#for_window [class="kitty"] resize set 380 480
for_window [title="MATLAB R2019b"] floating disable, border pixel 2
for_window [class="matplotlib"] floating enable, border pixel 2
for_window [class="Pavucontrol"] floating enable

for_window [class="feh"] floating enable, resize set 800 600

# Pretty features
#gaps inner 5
#gaps outer 5
#gaps bottom 0
#gaps top 0
#smart_gaps on
#smart_gaps inverse_outer

# Activate smart borders (always)
smart_borders on
# Activate smart borders (only when there are effectively no gaps)
#smart_borders no_gaps
# Hide edge borders only if there is one window with no gaps
#hide_edge_borders smart_no_gaps

#gaps outer current plus 5
#gaps horizontal current plus 40
#gaps outer current toggle 60


bindsym $mod+Shift+minus move scratchpad
bindsym $mod+minus scratchpad show

bar {
    font pango:monospace 10
    colors {
        background #263238
        statusline #cfd8dc
        #separator  #fefefe
    }
    i3bar_command  i3bar -t
    status_command i3blocks
    #mode hide
}

EOF
