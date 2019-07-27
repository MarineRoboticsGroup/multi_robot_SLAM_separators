#!/bin/bash

export ROS_IP=$(echo $(hostname -I) | cut -d' ' -f 2)
export ROS_MASTER_URI=http://192.168.12.$1:11311

source "/root/rdpgo_ws/devel/setup.bash"

case "$4" in
        optimization)
            roslaunch robust_distributed_slam_module generic_robot_slam.launch local_robot_id:=$2 other_robot_id:=$3 port:=2458$2 --screen
            ;;
         
        separators)
            roslaunch multi_robot_separators multi_robot_slam_example.launch local_robot_id:=$2 other_robot_id:=$3 --screen
            ;;

        bag)
            roslaunch multi_robot_separators realsense_bag_example.launch local_robot_id:=$2 other_robot_id:=$3 bag:=$5 recorded_id:=$6 --screen
            ;;

        bash)
            /bin/bash
            ;;
        *)
            echo $"Usage: $4 {optimization|separators|bash}"
            exit 1
 
esac

