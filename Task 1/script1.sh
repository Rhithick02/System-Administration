#!/bin/bash

# Creating account and directory for Chief Commander and troop chiefs
sudo adduser ChiefCommander

sudo adduser ArmyGeneral

sudo adduser NavyMarshal

sudo adduser AirForceGeneral


# Creating account and directory for Army,Navy and Airforce
a=1
while [ "$a" -le 50 ]
do
        sudo adduser Army$a
        sudo adduser Navy$a
	sudo adduser AirForce$a	
	(($a+1))
done

