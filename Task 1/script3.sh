#!/bin/bash

cd

#Copying program to a another file in home directory
echo "#!/bin/bash
date=\$(date +\"%Y-%m-%d\")
cat position.log | grep date | while read pos
do
	echo \$var | cat > temp.txt
	user=\$(awk '{print \$2}' temp.txt)
	awk '{print \$1,\$3,\$4}' temp.txt | cat >> /home/\$user/post_alloted.txt
done" > temp_script3.sh

#Granting execute permission
chmod 770 temp_script3.sh

#Creating a crontab file
echo '00 00 * * * ./temp_script3.sh' > script3_cron.txt

#Installing crontab file
crontab script3_cron.txt
