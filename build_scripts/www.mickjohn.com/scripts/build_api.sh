##############
# Api Server #
##############

PASSWORD="$1"

if [ -f "motorsport_calendar_api" ]; then
  echo "motorsport_calendar_api directory already exists. Not cloning..."
  echo "running git pull to update..."
  cd motorsport_calendar_api
  git pull
else
  echo "Cloning motorsport_calendar_api"
  git clone --depth 1 -b master https://github.com/mickjohn/motorsport_calendar_api.git
  cd motorsport_calendar_api
fi

echo "Building motorsport_calendar_api"
cargo build --release

echo "Building database"
mkdir sqlite
DATABASE_URL=sqlite/ms_api.db diesel database setup

echo "Adding admin user to database"
HASHED_PASS=$(echo -n "${PASSWORD}" | ./target/release/bcrypt_helper --gen)
echo ''
echo ${HASHED_PASS}
echo "INSERT INTO users(user_name, hashed_password) VALUES (\"mickjohn\", \"${HASHED_PASS}\");" | sqlite3 sqlite/ms_api.db

# cp /home/mick/Documents/Programs/rust/motorsport_calendar_projects/motorsport_calendar_api/sqlite/ms_api.db sqlite/ms_api.db

echo "[sudo] Deleting msc_api_data docker volume if it exists"
sudo docker volume rm msc_api_data

echo "[sudo] Creating msc_api_data docker volume"
sudo docker volume create msc_api_data

echo "[sudo] Adding database to volume"
sudo cp sqlite/ms_api.db /var/lib/docker/volumes/msc_api_data/ms_api.db

echo "[sudo] Removing msc_api docker image if it exists"
sudo docker image rm msc_api

echo "[sudo] Building docker image"
sudo docker build -t msc_api .

echo "[sudo] Saving docker image to msc_api.tar"
sudo docker save msc_api --output msc_api.tar

echo "[sudo] chown'ing msc_api.tar to mick:mick"
sudo chown mick:mick msc_api.tar

echo "zipping up image"
zip ../msc_api.tar.zip msc_api.tar

echo "Motorsport calendar api docker image has been built!!"
cd ..
