echo "setup ctf"
#pwntools
sudo apt-get update
sudo apt-get install -y python2.7 python-pip python-dev git libssl-dev libffi-dev build-essential
sudo pip install --upgrade pip
sudo pip install --upgrade pwntools

#radare2
git clone https://github.com/radare/radare2.git ~/
cd radare2
sh sys/install.sh
cd ~

#exiftool
sudo apt install -y exiftool 

#binwalk
sudo apt install -y binwalk

#foremost
sudo apt install -y foremost
