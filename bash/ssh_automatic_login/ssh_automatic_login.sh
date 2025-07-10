#!/usr/bin/bash

#TechAcademy Project - Unix Scripting
#Author: Tyler Hirata
#3/26/2020

if [ $1 = "-p" ];
then
	selection=1
    if [ "$selection" != "" ]; #not sure why $selections needs quotes.  I throws and error if it doesn't have qutotes.
    then
		if [ $selection = 1 ];
        then
            read -p 'Enter Username: ' uservar
            read -p 'Enter node: ' nodevar
            echo " "
               
			uservarcheck=$(ssh root@$nodevar cat /etc/passwd 2> /dev/null | grep $uservar | awk -F : '{print $1}') #checks to see if user account is on target server

            if [ "$uservar" = "$uservarcheck" ];
            then
                ssh -o PreferredAuthentications=password -o PubkeyAuthentication=no $uservar@$nodevar 2>/dev/null
            else
                echo "User does not have an account on the server".
                exit
            fi
        fi
    fi
fi

arguements_count=$#
arguements_array=($@)

#echo ${arguements_array[*]}

for (( i = 1; i < $arguements_count; i++ ));
do
        server=${arguements_array[i]}
        username=$(ssh root@$server cat /etc/passwd 2> /dev/null | grep $1 | awk -F : '{print $1}')

        if [ "$username" == "$1" ]; #user account check
        then
                if [ -d /home/"$1"/.ssh/ ] #checks if ssh directory exists on source server
                then
                        ssh-copy-id -i /home/"$1"/.ssh/id_rsa  $1@$server 2> /dev/null #copies ssh public key to target server
                        echo "Account detected on $server and ssh keys have been copied over."
                else
                        runuser -l $1 -c ssh-keygen -b 2048 -t rsa -f /home/"$1"/.ssh/id_rsa -q -N "" #creates ssh keypair if its not there as targeted user
                        ssh-copy-id -i /home/"$1"/.ssh/id_rsa $1@$server 2> /dev/null #copies ssh public key to target server and drops it in target user ssh directory
                        echo "Account detected on $server and ssh keys have been copied over."
                fi
        else
                echo "User does not have an account on $server"
        fi


done


for (( i = 1; i < $arguements_count; i++ ));
do
        server=${arguements_array[i]}
        su -c "ssh $server -o StrictHostKeyChecking=no" - $1
done
