#!/bin/bash

cd

echo "#!/bin/bash
# Dehli's Location
x=28.7041
y=77.1025

#Declaring an array
declare -a arr

big=0
bigind=0
i=0
Date=\$(date \"+%Y-%m-%d\")
cat position.log | grep \$Date | grep Army| while read var
do
	echo \$var > buffer.txt
	a=\$(awk '{print \$3}' buffer.txt | cut -c4-10)
	b=\$(awk '{print \$4}' buffer.txt | cut -c4-10)
	temp=\$(echo \"(\$a-\$x)^2+(\$b-\$y)^2\"|bc)
	if [ \$i -lt 10 ]
	then
		arr[\$i]=\$temp
		if [ \$i -eq 0 ];then
			big=\$temp
			bigind=\$i
		elif (( \$(echo \"\$big < \${arr[\$i]}\" |bc) ));then
			big=\${arr[\$i]}
			bigind=\$i
		fi		
	elif (( \$(echo \"\$temp > \$big\" |bc) ))
	then
		arr[\$i]=0
	else
		arr[\$i]=\$temp
		arr[\$bigind]=0
		big=\${arr[0]}
                bigind=0
                for((z=1;z<=i;z++))
                do
                        if (( \$(echo \"\$big < \${arr[\$z]}\" |bc) ));then
                                big=\${arr[\$z]}
                                bigind=\$z
                        fi
                done
	fi
	((i++))
	if [ \$i -eq 50 ]
	then
		echo \"\$Date :\" | cat >> /home/ChiefCommander/nearest10.txt
		for((z=0;z<50;z++))
		do
			if (( \$(echo \"\${arr[\$z]} != 0\" |bc) ));then
				echo \"Army\$((\$z+1))\" | cat >> /home/ChiefCommander/nearest10.txt
			fi
		done
	fi

done" > temp_script7.sh

chmod 770 temp_script7.sh

echo "00 12 * * * ./temp_script7.sh" > script7_cron.txt

crontab script7_cron.txt
