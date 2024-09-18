#!/bin/bash
# Read the GPU temperature from hwmon (replace hwmon4/temp1_input with your actual path)
gpu_temp=$(cat /sys/class/hwmon/hwmon3/temp2_input)

# Convert millidegrees Celsius to degrees Celsius
gpu_temp=$(echo "scale=1; $gpu_temp / 1000" | bc)

gpu_usage=$(rocm-smi --showuse | grep 'GPU\[0\]' | awk '{print $6}')


# Output the GPU temperature
echo "GPU: ${gpu_usage}%  ${gpu_temp}°C"
