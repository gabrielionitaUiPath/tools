$password = ""
sshpass -p $password parallel-ssh -O StrictHostKeyChecking=no -o result -h pssh.txt -l root -t 100 -i -Av "ls -lah /data/imagesx/win /data/imagesx/win1"
sshpass -p $password parallel-ssh -O StrictHostKeyChecking=no -o result -h pssh.txt -l root -t 100 -i -Av "rm -r /data/imagesx/win /data/imagesx/win1"