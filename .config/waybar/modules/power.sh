
# A loop to keep the script running
while true; do
    cpu_power=$(sensors | grep "PPT" | awk '{print $2}' | head -n 1)
    gpu_power=$(sensors | grep '(cap = 315.00 W)' | grep -oP 'PPT:\s*\K\d+\.\d+')
    echo "CPU: $cpu_power W | GPU: $gpu_power W"
    sleep 1
done