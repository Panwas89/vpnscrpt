☘ SUPPORT OS ☘  
  
➽ Debian 11, 12 (recommended)   ➽ Ubuntu 20.04   

⚡️ INSTALASI ⚡️     

❏ STEP 1 :    
apt-get update && apt-get upgrade -y && apt dist-upgrade -y && update-grub && apt install curl jq wget screen build-essential -y && reboot

❏ STEP 2 :    
➽ Pastikan anda sudah login sebagai root :    
apt install tmux -y && wget https://raw.githubusercontent.com/Panwas89/vpnscrpt/main/wiki && chmod +x wiki && tmux new-session -d -s rosivpn './wiki' && tmux attach -t rosivpn

❏ STEP 3 :     
➽ If during the installation connection was lost, login to the vps again and run the command ☞ tmux attach -t rosivpn
