##############
# Web Server #
##############
echo "Cloning motorsport_calendar_admin_pages"
git clone --depth 1 -b master https://github.com/mickjohn/motorsport_calendar_admin_pages.git

cd motorsport_calendar_admin_pages
echo "Building motorsport_calendar_admin_pages (This may take a while)"
cargo build --release &> /dev/null

echo "[sudo] Removing msc_adm docker image if it exists"
sudo docker image rm msc_adm &> /dev/null

echo "[sudo] Building docker image"
sudo docker build -t msc_adm .

echo "[sudo] Saving docker image to msc_adm.tar"
sudo docker save msc_adm --output msc_adm.tar

echo "[sudo] chown'ing msc_adm.tar to mick:mick"
sudo chown mick:mick msc_adm.tar

echo "zipping up image"
zip ../msc_adm.tar.zip msc_adm.tar

echo "Motorsport calendar admin_pages docker image has been built!!"
cd ..
