# Pull down existing ppa repo db files etc
mkdir -p ./output/repo
rsync -azP --exclude '*.deb' ferreo@direct.pika-os.com:/srv/www/pikappa/ ./output/repo

# Remove our existing package from the repo
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% ffmpeg*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% libavcodec60*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% libavdevice60*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% libavfilter9*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% libavformat60*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% libavutil58*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% libpostproc57*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% libswresample4*)'
reprepro -V --basedir ./output/repo/ removefilter kinetic 'Package (% libswscale7*)'

# Push the updated ppa repo to the server
rsync -azP ./output/repo/ ferreo@direct.pika-os.com:/srv/www/pikappa/
