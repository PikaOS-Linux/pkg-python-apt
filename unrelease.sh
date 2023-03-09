# Pull down existing ppa repo db files etc
mkdir -p ./output/repo
rsync -azP --exclude '*.deb' ferreo@direct.pika-os.com:/srv/www/pikappa/ ./output/repo

# Remove our existing package from the repo
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% python-apt*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% python3-apt*)'

# Push the updated ppa repo to the server
rsync -azP ./output/repo/ ferreo@direct.pika-os.com:/srv/www/pikappa/
