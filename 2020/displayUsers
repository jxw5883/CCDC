#!/usr/bin/env bash 

#petr's solution is much better/faster, since this needs to parse auth.log + make a new file to output from 
#author - eugene ryoo 
#displays current users + last two added and deleted users from auth.log 

echo current users: 
command w 
echo -----------

echo new users:
command sudo grep useradd /var/log/auth.log | grep "new user" > log.txt 
tail -n 2 log.txt 
echo ----------

echo deleted users: 
command sudo grep userdel /var/log/auth.log | grep "delete user" > log.txt 
tail -n 2  log.txt 
echo -----------

