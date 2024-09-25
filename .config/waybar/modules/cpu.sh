#!/bin/bash
# Read the CPU temperature from hwmon (replace hwmon2/temp1_input with your actual path)
cpu_temp=$(cat /sys/class/hwmon/hwmon5/temp1_input)

# Convert millidegrees Celsius to degrees Celsius
cpu_temp=$(echo "scale=1; $cpu_temp / 1000" | bc)

cpu_usage=$(top -bn1 | awk '/Cpu/ { print $2}')

cpu_power=$(sensors | grep "PPT" | awk '{print $2}' | head -n 1)

# Output the CPU temperature
echo "CPU: ${cpu_usage}%  ${cpu_temp}°C 󱐋 ${cpu_power} W"
