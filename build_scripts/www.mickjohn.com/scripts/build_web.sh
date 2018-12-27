##############
# Web Server #
##############
echo "Cloning motorsport_calendar_webserver"
git clone --depth 1 -b master https://github.com/mickjohn/motorsport_calendar_webserver.git

cd motorsport_calendar_webserver
echo "Building motorsport_calendar_webserver (This may take a while)"
cargo build --release &> /dev/null

echo "[sudo] Removing msc_web docker image if it exists"
sudo docker image rm msc_web &> /dev/null

echo "[sudo] Building docker image"
sudo docker build -t msc_web .

echo "[sudo] Saving docker image to msc_web.tar"
sudo docker save msc_web --output msc_web.tar

echo "[sudo] chown'ing msc_web.tar to mick:mick"
sudo chown mick:mick msc_web.tar

echo "zipping up image"
zip ../msc_web.tar.zip msc_web.tar

echo "Motorsport calendar webserver docker image has been built!!"
cd ..
