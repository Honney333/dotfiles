PASSWORD_FILE="$HOME/.cred/credentials.txt"
PASSWORD=$(<"$PASSWORD_FILE")
SERVER1_IP="192.168.1.1"
SERVER2_IP="192.168.1.22"
VAR1=FALSE
VAR2=FALSE

while true; do
    if ping -c 1 -W 2 "$SERVER1_IP" > /dev/null 2>&1 && [[ "$VAR1" == FALSE ]]; then
        echo "$PASSWORD" | sudo -S mount -t cifs //192.168.1.1/FRITZ.NAS /home/honney/mount/fritzNAS -o credentials=/home/honney/.cred/samba_credentials,nofail,uid=1000,gid=1000,vers=3.0,cache=none,nounix,noserverino,file_mode=0755,dir_mode=0755
        VAR1=TRUE
    else
        echo "Waiting for $SERVER1_IP to be reachable..."
        sleep 5
    fi

    if ping -c 1 -W 2 "$SERVER2_IP" > /dev/null 2>&1 && [[ "$VAR2" == FALSE ]]; then
        echo "$PASSWORD" | sudo -S mount -t cifs //192.168.1.22/Storage /home/honney/mount/Data -o credentials=/home/honney/.cred/trueNAS_credentials,nofail,vers=3.0,iocharset=utf8,rw,uid=1000,gid=1000,file_mode=0660,dir_mode=0770,noperm,nounix
        echo "$PASSWORD" | sudo -S mount -t cifs //192.168.1.22/Media /home/honney/mount/Media -o credentials=/home/honney/.cred/trueNAS_credentials,nofail,vers=3.0,iocharset=utf8,rw,uid=1000,gid=1000,file_mode=0660,dir_mode=0770,noperm,nounix
        echo "$PASSWORD" | sudo -S mount -t cifs //192.168.1.22/Ripping /home/honney/mount/Ripping -o credentials=/home/honney/.cred/trueNAS_credentials,nofail,vers=3.0,iocharset=utf8,rw,uid=1000,gid=1000,file_mode=0660,dir_mode=0770,noperm,nounix
        echo "$PASSWORD" | sudo -S mount -t cifs //192.168.1.22/Apps /home/honney/mount/Apps -o credentials=/home/honney/.cred/trueNAS_credentials,nofail,vers=3.0,iocharset=utf8,rw,uid=1000,gid=1000,file_mode=0660,dir_mode=0770,noperm,nounix
        VAR2=TRUE
    else
        sleep 5
    fi

    if [[ "$VAR1" == TRUE ]] && [[ "$VAR2" == TRUE ]]; then
        break
    fi
done
