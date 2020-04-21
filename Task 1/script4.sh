#!/bin/bash

cd

echo "#!/bin/bash
Date=\$(date +\"%Y-%m-%d\")

cat attendance.log | grep \$date | grep YES | while read var
do
       	echo \$var | cat > temp.txt
        a=\$(awk '{print \$2}' temp.txt)
       	if [[ \"\$a\" == *\"Army\"* ]]
       	then
		(echo -n \"\$Date: \" && awk '{print \$2}' temp.txt) | cat >> /home/ArmyGeneral/attendance_record.txt
	elif [[ \"\$a\" == *\"Air\"* ]]
	then
		(echo -n \"\$Date: \" && awk '{print \$2}' temp.txt) | cat >> /home/AirForceGeneral/attendance_record.txt
	else
		(echo -n \"\$Date: \" && awk '{print \$2}' temp.txt) | cat >> /home/NavyMarshal/attendance_record.txt
   	fi
done 
echo \"\n\" >> cat /home/ArmyGeneral/attendance_record.txt
echo \"\n\" >> cat /home/NavyMarshal/attendance_record.txt
echo \"\n\" >> cat /home/AirForceGeneral/attendance_record.txt" > temp_script4.sh

#Allow execute permission
chmod 770 temp_script4.sh

#Creating crontab file
echo "00 06 * * * ./temp_script4.sh" > script4_cron.txt

#Installing crontab
crontab script4_cron.txt
