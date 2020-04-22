#!/bin/bash

# Creating account and directory for Chief Commander and troop chiefs
 sudo useradd -m ChiefCommander 
 echo -e "ChiefCommander@123\nChiefCommander@123" |sudo passwd ChiefCommander

 sudo useradd -m ArmyGeneral 
 echo -e "ArmyGeneral@123\nArmyGeneral@123" | sudo passwd ArmyGeneral
 sudo useradd -m NavyMarshal
 echo -e "NavyMarshal@123\nNavyMarshal@123" | sudo passwd NavyMarshal
 sudo useradd AirForceGeneral 
 echo -e "AirForceGeneral@123\nAirForceGeneral@123" | sudo passwd AirForceGeneral

# Creating account and directory for Army,Navy and Airforce
a=1
while [ "$a" -le 50 ]
do
	sudo useradd -m Army$a
	echo -e "Army$a@123\nArmy$a@123" |sudo passwd Army$a
	sudo useradd -m Navy$a
	echo -e "Navy$a@123\nNavy$a@123" |sudo passwd Navy$a
	sudo useradd -m AirForce$a	
	echo -e "AirForce$a@123\nAirForce$a@123" |sudo passwd AirForce$a
	((a+=1))
done
