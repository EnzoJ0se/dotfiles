#!/bin/bash

sketchybar --add event aerospace_workspace_change

for sid in $(aerospace list-workspaces --all); do
    sketchybar --add item space.$sid left \
        --subscribe space.$sid aerospace_workspace_change \
        --set space.$sid \
        background.color=$ITEM_BG_COLOR \
        background.corner_radius=5 \
        background.height=20 \
        background.drawing=off \
        padding_left=5 \
        padding_right=5 \
        label.padding_left=4 \
        label.padding_right=6 \
        label.font="Hack Nerd Font:Bold:12.0" \
        label="$sid" \
        click_script="aerospace workspace $sid" \
        script="$CONFIG_DIR/plugins/aerospace.sh $sid"
done

sketchybar --add item chevron left \
           --set chevron icon= label.drawing=off icon.font="Hack Nerd Font:Bold:10.0" \
           --add item front_app left \
           --set front_app icon.drawing=off script="$PLUGIN_DIR/front_app.sh" \
           --subscribe front_app front_app_switched
