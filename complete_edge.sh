#!/bin/bash

sleep 1  

#---------------------EDGE

TERMINAL_ID_0=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.terminalIdsForSessionId 0)
qdbus org.kde.yakuake /yakuake/tabs setTabTitle 0 "Simulator"

SESSION_ID_1=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.addSession)
TERMINAL_ID_1=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.terminalIdsForSessionId 1)
qdbus org.kde.yakuake /yakuake/tabs setTabTitle 1 "Gazebo2Robocomp"


SESSION_ID_2=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.addSession)
TERMINAL_ID_2=$(qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.terminalIdsForSessionId 2)
qdbus org.kde.yakuake /yakuake/tabs setTabTitle 2 "Other"

qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.splitTerminalTopBottom "$TERMINAL_ID_2"	
qdbus org.kde.yakuake /yakuake/sessions org.kde.yakuake.splitTerminalTopBottom "$TERMINAL_ID_2" 


#---------------------GAZEBO SIMULATOR------------------------

qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 0 "rcnode&"
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 0 "cd ~/Repositories/Gazebo_ShadowWorld"
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 0 "gz sim shadow.sdf"

sleep 6

#---------------------Gazebo2Robocomp------------------------

qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 1 "cd ~/Repositories/gazebo-bridge/"
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 1 "bin/Gazebo2Robocomp etc/config"

sleep 1

#---------------------LASER VIEWER------------------------

qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 2 "cd ~/robocomp/components/robocomp-robolab/components/viewers/laser_viewer"
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 2 "bin/laser_viewer etc/gazebo_config"

sleep 1

#---------------------JOYSTICK PUBLISHER------------------------

qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 3 "cd ~/robocomp/components/robocomp-robolab/components/hardware/external_control/joystickpublish"
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 3 "bin/JoystickPublish etc/config_gazebo"

sleep 1

#---------------------CAMERA RGBD SIMPLE------------------------

qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 4 "cd ~/robocomp/components/robocomp-robolab/components/viewers/camera_rgbdsimple_viewer"
qdbus org.kde.yakuake /yakuake/sessions runCommandInTerminal 4 "bin/camera_rgbdsimple_viewer etc/gazebo_config"

sleep 1

#----------------------------------------------------------------------------------------------------#

