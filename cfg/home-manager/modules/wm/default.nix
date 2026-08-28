{ pkgs, ... }:

{
  wayland.windowManager.sway = {
    enable = true;
    package = null;
    checkConfig = false;
    config = null;
    extraConfig = ''
      set $mainMod Mod1
      set $meta    Mod4
      set $term    foot
      set $fs      yazi
      set $editorGui  neovide
      set $editor  neovim

      output HDMI-A-1 {
          resolution 1920x1080@180Hz
          position   0 0
      }

      input type:keyboard {
          xkb_layout  us,ru
          xkb_options grp:caps_toggle
          repeat_rate  60
          repeat_delay 220
      }

      input type:pointer {
          accel_profile flat
          pointer_accel 0
      }

      input type:touchpad {
          tap enabled
          dwt enabled
          natural_scroll enabled
          scroll_method two_finger
          middle_emulation enabled
          click_method button_areas
          accel_profile adaptive
          pointer_accel 1.0
      }

      gaps inner 20
      gaps outer 5

      default_border          pixel 3

      client.focused          #ffffff  #1a1a1a  #ffffff  #404040    #ffffff
      default_floating_border pixel 5
      client.unfocused        #111111  #0a0a0a  #555555  #111111    #111111
      client.focused_inactive #222222  #111111  #888888  #222222    #222222
      hide_edge_borders       none
      client.urgent           #ffffff  #0a0a0a  #ffffff  #ffffff    #ffffff
      corner_radius 0
      blur enable
      blur_passes 5
      blur_radius 10
      blur_noise 0.02
      shadows enable
      shadow_blur_radius 20
      shadow_color #000000
      default_dim_inactive 0.09
      animation_duration_ms 80

      focus_follows_mouse yes
      mouse_warping       none
      workspace_auto_back_and_forth no

      floating_modifier $mainMod normal

      font pango:JetBrainsMono Nerd Font ExtraBold 14

      exec foot
      exec ayugram
      exec brave
      exec throne

      exec_always noctalia

      exec wl-paste --type text  --watch cliphist store
      exec wl-paste --type image --watch cliphist store

      exec dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP=sway
      exec systemctl --user start graphical-session.target

      for_window [app_id="neovide"]       move container to workspace number 1
      for_window [app_id="ghostty"]       move container to workspace number 3
      for_window [app_id="foot"]       move container to workspace number 3
      for_window [app_id="spotify"]       move container to workspace number 4
      for_window [app_id="obsidian"]      move container to workspace number 12
      for_window [app_id="brave-browser"] move container to workspace number 7
      for_window [app_id="steam"]         move container to workspace number 8
      for_window [app_id="vesktop"]       move container to workspace number 9
      for_window [app_id="ayugram"]       move container to workspace number 10
      for_window [app_id="VirtualBox"]    move container to workspace number 11

      for_window [app_id="neovide"]       opacity 0.85
      for_window [app_id="ghostty"]       opacity 0.80
      for_window [app_id="foot"]       opacity 0.80
      for_window [app_id="obsidian"]      opacity 0.80
      for_window [app_id="spotify"]       opacity 0.80
      for_window [app_id="ayugram"]       opacity 0.80

      for_window [app_id="xdg-desktop-portal.*"]           floating enable, resize set 900 600, move position center
      for_window [app_id="org.freedesktop.impl.portal.*"]  floating enable, resize set 900 600, move position center
      for_window [app_id="pavucontrol"]                    floating enable, resize set 700 450, move position center
      for_window [app_id="org.gnome.Calculator"]           floating enable, resize set 400 550, move position center
      for_window [app_id="qalculate.*"]                    floating enable, resize set 400 550, move position center

      set $ipc noctalia msg

      bindsym --to-code $meta+t exec $ipc panel-toggle launcher

      bindsym --to-code $meta+n exec $ipc panel-toggle control-center

      bindsym --to-code $meta+v exec $ipc panel-toggle clipboard

      bindsym $meta+f exec warpd --hint
      bindsym $meta+semicolon exec warpd --normal
      bindsym $meta+g exec warpd --grid

      bindsym --to-code $mainMod+m              exec $term
      bindsym --to-code $mainMod+n              exec $editor

      bindsym --to-code $meta+Shift+r           reload

      bindsym --to-code $mainMod+o              fullscreen toggle
      bindsym --to-code $mainMod+Tab            kill
      bindsym --to-code $mainMod+i              floating toggle
      bindsym --to-code $mainMod+Shift+i        sticky toggle

      bindsym --to-code $meta+h                 focus left
      bindsym --to-code $meta+l                 focus right
      bindsym --to-code $meta+k                 focus up
      bindsym --to-code $meta+j                 focus down

      bindsym --to-code $mainMod+h              move left
      bindsym --to-code $mainMod+l              move right
      bindsym --to-code $mainMod+k              move up
      bindsym --to-code $mainMod+j              move down
      bindsym --to-code $meta+Shift+Left        move left
      bindsym --to-code $meta+Shift+Right       move right

      bindsym --to-code $mainMod+ctrl+h         move left  20
      bindsym --to-code $mainMod+ctrl+l         move right 20
      bindsym --to-code $mainMod+ctrl+k         move up    20
      bindsym --to-code $mainMod+ctrl+j         move down  20

      bindsym --to-code $mainMod+x              focus next sibling
      bindsym --to-code $mainMod+z              focus prev sibling

      mode "resize" {
          bindsym h               resize shrink width  20px
          bindsym l               resize grow   width  20px
          bindsym k               resize shrink height 20px
          bindsym j               resize grow   height 20px

          bindsym Shift+h         resize shrink width  60px
          bindsym Shift+l         resize grow   width  60px
          bindsym Shift+k         resize shrink height 60px
          bindsym Shift+j         resize grow   height 60px

          bindsym Return          mode "default"
          bindsym Escape          mode "default"
      }
      bindsym --to-code $mainMod+p          mode "resize"

      bindsym --to-code $mainMod+a          workspace number 1
      bindsym --to-code $mainMod+q          workspace number 2
      bindsym --to-code $mainMod+w          workspace number 3
      bindsym --to-code $mainMod+e          workspace number 4
      bindsym --to-code $mainMod+r          workspace number 5
      bindsym --to-code $mainMod+f          workspace number 6
      bindsym --to-code $mainMod+c          workspace number 7
      bindsym --to-code $mainMod+1          workspace number 8
      bindsym --to-code $mainMod+2          workspace number 9
      bindsym --to-code $mainMod+3          workspace number 10
      bindsym --to-code $mainMod+4          workspace number 11
      bindsym --to-code $mainMod+5          workspace number 12
      bindsym --to-code $mainMod+6          workspace number 13
      bindsym --to-code $mainMod+7          workspace number 14
      bindsym --to-code $mainMod+8          workspace number 15
      bindsym --to-code $mainMod+9          workspace number 16
      bindsym --to-code $mainMod+0          workspace number 17

      bindsym --to-code $mainMod+ctrl+a     move container to workspace number 1; workspace number 1
      bindsym --to-code $mainMod+ctrl+q     move container to workspace number 2; workspace number 2
      bindsym --to-code $mainMod+ctrl+w     move container to workspace number 3; workspace number 3
      bindsym --to-code $mainMod+ctrl+e     move container to workspace number 4; workspace number 4
      bindsym --to-code $mainMod+ctrl+r     move container to workspace number 5; workspace number 5
      bindsym --to-code $mainMod+ctrl+f     move container to workspace number 6; workspace number 6
      bindsym --to-code $mainMod+ctrl+c     move container to workspace number 7; workspace number 7
      bindsym --to-code $mainMod+ctrl+1     move container to workspace number 8; workspace number 8
      bindsym --to-code $mainMod+ctrl+2     move container to workspace number 9; workspace number 9
      bindsym --to-code $mainMod+ctrl+3     move container to workspace number 10; workspace number 10
      bindsym --to-code $mainMod+ctrl+4     move container to workspace number 11; workspace number 11
      bindsym --to-code $mainMod+ctrl+5     move container to workspace number 12; workspace number 12
      bindsym --to-code $mainMod+ctrl+6     move container to workspace number 13; workspace number 13
      bindsym --to-code $mainMod+ctrl+7     move container to workspace number 14; workspace number 14
      bindsym --to-code $mainMod+ctrl+8     move container to workspace number 15; workspace number 15
      bindsym --to-code $mainMod+ctrl+9     move container to workspace number 16; workspace number 16
      bindsym --to-code $mainMod+ctrl+0     move container to workspace number 17; workspace number 17

      bindsym --to-code $mainMod+Shift+a    move container to workspace number 1
      bindsym --to-code $mainMod+Shift+q    move container to workspace number 2
      bindsym --to-code $mainMod+Shift+w    move container to workspace number 3
      bindsym --to-code $mainMod+Shift+e    move container to workspace number 4
      bindsym --to-code $mainMod+Shift+r    move container to workspace number 5
      bindsym --to-code $mainMod+Shift+f    move container to workspace number 6
      bindsym --to-code $mainMod+Shift+c    move container to workspace number 7
      bindsym --to-code $mainMod+Shift+1    move container to workspace number 8
      bindsym --to-code $mainMod+Shift+2    move container to workspace number 9
      bindsym --to-code $mainMod+Shift+3    move container to workspace number 10
      bindsym --to-code $mainMod+Shift+4    move container to workspace number 11
      bindsym --to-code $mainMod+Shift+5    move container to workspace number 12
      bindsym --to-code $mainMod+Shift+6    move container to workspace number 13
      bindsym --to-code $mainMod+Shift+7    move container to workspace number 14
      bindsym --to-code $mainMod+Shift+8    move container to workspace number 15
      bindsym --to-code $mainMod+Shift+9    move container to workspace number 16
      bindsym --to-code $mainMod+Shift+0    move container to workspace number 17

      bindsym --to-code $mainMod+d          workspace next_on_output
      bindsym --to-code $mainMod+s          workspace prev_on_output

      bindsym --to-code XF86AudioRaiseVolume    exec wpctl set-volume -l 1 @DEFAULT_AUDIO_SINK@ 1%+
      bindsym --to-code XF86AudioLowerVolume    exec wpctl set-volume @DEFAULT_AUDIO_SINK@ 1%-
      bindsym --to-code XF86AudioMute           exec wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bindsym --to-code XF86AudioMicMute        exec wpctl set-mute @DEFAULT_AUDIO_SOURCE@ toggle

      bindsym --to-code XF86AudioNext           exec playerctl next
      bindsym --to-code XF86AudioPause          exec playerctl play-pause
      bindsym --to-code XF86AudioPlay           exec playerctl play-pause
      bindsym --to-code XF86AudioPrev           exec playerctl previous
      bindsym --to-code $meta+Shift+p           exec playerctl play-pause
      bindsym --to-code $meta+Shift+n           exec playerctl next
      bindsym --to-code $meta+Shift+b           exec playerctl previous

      bindsym --to-code $mainMod+F12  exec grim -g "$(slurp)" - | tee ~/Pictures/Screenshots/$(date +%Y%m%d_%H%M%S).png | wl-copy

      bindsym --to-code $mainMod+F11  exec grim - | tee ~/Pictures/Screenshots/$(date +%Y%m%d_%H%M%S).png | wl-copy

      bindsym --to-code $mainMod+Shift+F12  exec grim -g "$(swaymsg -t get_tree | jq -r '.. | select(.focused?) | .rect | "\(.x),\(.y) \(.width)x\(.height)"')" - | tee ~/Pictures/Screenshots/$(date +%Y%m%d_%H%M%S).png | wl-copy

      include ~/.config/sway/noctalia
    '';
  };
}
