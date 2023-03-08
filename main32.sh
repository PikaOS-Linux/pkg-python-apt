# Add dependent repositories
sudo dpkg --add-architecture i386
wget -q -O - https://ppa.pika-os.com/key.gpg | sudo apt-key add -
add-apt-repository https://ppa.pika-os.com
add-apt-repository ppa:pikaos/pika
add-apt-repository ppa:kubuntu-ppa/backports
# Clone Upstream
cd ./python-apt

# Get build deps
ln -fs /usr/share/zoneinfo/America/New_York /etc/localtime
DEBIAN_FRONTEND=noninteractive apt-get install -y tzdata
apt-get install build-essential -y
apt-get install crossbuild-essential-i386 lib32gcc-11-dev -y
apt-get build-dep ./ -y -a i386
apt-get install apt apt-utils python3-all  python3-all-dev python3-all-dbg python3-sphinx apt  apt-utils dh-python libapt-pkg-dev python3-all python3-all-dev python3-all-dbg python3-distutils python3-distutils-extra python3-setuptools python3-sphinx pycodestyle pyflakes3 -y
apt-get install python3-all:i386 python3-all-dev:i386 python3-all-dbg:i386 apt:i386 apt-utils:i386 libapt-pkg-dev:i386 python3-all:i386 python3-all-dev:i386 python3-all-dbg:i386 -y
# Build package
dpkg-buildpackage -a i386

# Move the debs to output
cd ../
mkdir -p ./output
mv ./*.deb ./output/

