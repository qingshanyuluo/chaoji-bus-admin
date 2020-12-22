#!/bin/bash

npm run build

host="mrbus.net"
username="root"
password=""

echo 'copy to server'

/usr/bin/expect <<EOF
    set time 30

    spawn ssh $username@$host
    expect {
        "*yes/no" { send "yes\r"; exp_continue }
        "*password:" { send "$password\r" }
    }
    expect -re ".*\[\$#\]"
    send "rm -rf ~/nginx/*\r"
    expect -re ".*\[\$#\]"
    send "exit\r"
EOF

/usr/bin/expect <<EOF
    spawn scp -r ./dist/ root@mrbus.net:~/nginx/
    expect {
        "*yes/no" { send "yes\r"; exp_continue }
        "*password:" { send "$password\r" }
    }
    expect eof
EOF
