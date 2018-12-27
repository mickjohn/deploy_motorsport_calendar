#!/bin/bash

echo "Building docker images for red_or_black websocker server & red_or_black frontend"
echo "\t Deleting red_or_black_server.tar.zip"
rm red_or_black_server.tar.zip
echo "\t Deleting red_or_black_web.tar.zip"
rm red_or_black_web.tar.zip


##########
# Server #
##########
echo "Removing red_or_black directory if it exists"
rm -rf red_or_black

echo "Cloning red_or_black"
git clone --depth 1 -b master https://github.com/mickjohn/red_or_black.git

cd red_or_black
echo "Building red_or_black"
cargo build --release

echo "[sudo] Removing red_or_black docker image if it exists"
sudo docker image rm red_or_black_server

echo "[sudo] Building docker image"
sudo docker build -t red_or_black_server .

echo "[sudo] Saving docker image to red_or_black_server.tar"
sudo docker save red_or_black_server --output red_or_black_server.tar

echo "[sudo] chown'ing red_or_black_server.tar to mick:mick"
sudo chown mick:mick red_or_black_server.tar

echo "zipping up image"
zip ../red_or_black_server.tar.zip red_or_black_server.tar

echo "Red or Black docker image has been built!!"
cd ..

############
# Frontend #
############
echo "Removing red_or_black_frontend directory if it exists"
rm -rf red_or_black_frontend

echo "Cloning red_or_black_frontend"
git clone --depth 1 -b master https://github.com/mickjohn/red_or_black_frontend.git

cd red_or_black_frontend
npm install
gulp

echo "[sudo] Removing red_or_black_web docker image if it exists"
sudo docker image rm red_or_black_web

echo "[sudo] Building docker image"
sudo docker build -t red_or_black_web .

echo "[sudo] Saving docker image to red_or_black_web.tar"
sudo docker save red_or_black_web --output red_or_black_web.tar

echo "[sudo] chown'ing red_or_black_web.tar to mick:mick"
sudo chown mick:mick red_or_black_web.tar

echo "zipping up image"
zip ../red_or_black_web.tar.zip red_or_black_web.tar

echo "Frontend docker image has been built!!"
cd ..

echo "Cleaning up"
rm -rf red_or_black
rm -rf red_or_black_frontend

echo "All done!"
