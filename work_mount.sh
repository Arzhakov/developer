#!/bin/bash
#
#
### add following line
### <ip address>		<host name>
### to /etc/hosts
#
#
USERS=('user1' 'user2')
PASSWORDS=('password1' 'password2')
HOSTNAMES=('host1' 'host2')
DIRECTORIES=('mnt1' 'mnt2')

echo "`date` Привет!"

for i in "${!USERS[@]}"; do
	echo "parameters: ${USERS[i]}@${HOSTNAMES[i]}:/ ${DIRECTORIES[i]} with password = ${PASSWORDS[i]}"
  sudo sshfs -o password_stdin,allow_other,default_permissions "${USERS[i]}"@"${HOSTNAMES[i]}":/ "${DIRECTORIES[i]}" <<< "${PASSWORDS[i]}"
  echo " - ok, go ahead..."
done

# create symbolic link:
# sudo ln -s <actual location>_mount /usr/bin/<link>

# if sshfs command hangs on one of iterations...
#
# https://github.com/libfuse/sshfs/issues/143
# ... It was related to the authorized_keys file on the remote host... (https://unix.stackexchange.com/questions/350904/sshfs-command-does-not-return)#

### so I ran command
### ssh-copy-id user@server
### after that sshfs started working
