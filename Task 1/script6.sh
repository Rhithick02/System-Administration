#!/bin/bash

cd

echo "#!/bin/bash
Date=\$(date \"+%Y-%m-%d\")
cat /home/ArmyGeneral/attendance_record.txt | grep \$Date | cat >> /home/ChiefCommander/attendance_report.txt
cat /home/NavyMarshal/attendance_record.txt | grep \$Date | cat >> /home/ChiefCommander/attendance_report.txt
cat /home/AirForceGeneral/attendance_record.txt | grep \$Date | cat >> /home/ChiefCommander/attendance_report.txt" > temp_script6.sh

chmod 770 temp_script6.sh

echo " 00 12 * * * ./temp_script6.sh" > script6_cron.txt

crontab script6_cron.txt
