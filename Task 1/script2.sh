#!/bin/bash

# Granting permissions to specific users using ACL commands
chmod 770 ChiefCommander

# Permission for Chief Commander to access troop Chiefs folder
setfacl -R -m u:ChiefCommander:rwx /home/ArmyGeneral
chmod 770 ArmyGeneral

setfacl -R -m u:ChiefCommander:rwx /home/NavyMarshal
chmod 770 NavyMarshal

setfacl -R -m u:ChiefCommander:rwx /home/AirForceGenral
chmod 770 AirForceGeneral

# Permission of Chief Commander and troop chiefs to access their soldiers home directory
a=1
while ["$a" -le 50 ]
do
	sudo setfacl -R -m u:ChiefCommander:rwx /home/Army$a
	sudo setfacl -R -m u:ArmyGeneral:rwx /home/Army$a
	chmod 770 Army$a
	sudo setfacl -R -m u:ChiefCommander:rwx /home/Navy$a
	sudo setfacl -R -m u:NavyMarshal:rwx /home/Navy$a
	chmod 770 Navy$a
	sudo setfacl -R -m u:ChiefCommander:rwx /home/AirForce$a
	sudo setfacl -R -m u:AirforceGeneral:rwx /home/AirForce$a
	chmod 770 Airforce$a
	((a+=1))
done

