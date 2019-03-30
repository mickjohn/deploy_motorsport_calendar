#!/bin/bash
# requirements
#  - docker
#  - sqlite3
#  - diesel cli

# Check permissions
sudo docker image list &> /dev/null

# if [[ "$?" != "0" ]]; then
#   echo "Need elevated permissions to run this script"
#   echo "Run script with sudo"
#   exit 1
# fi

echo "Add 'mickohn' admin user to DB? Y/N"
PASSWORD=""
read add_user
if [[ $add_user = [Yy][Ee][Ss] ]] || [[ $add_user = [Yy] ]]; then
  echo -n "Enter admin password:"
  read -s PASSWORD
fi

dirs="motorsport_calendar_webserver motorsport_calendar_api motorsport_calendar_admin_pages"

echo "Building docker images for motorsport calendar webserver, motorsport calendar API & admin pages"
echo "Removing existing built artefacts"
rm msc_api.tar.zip msc_web.tar.zip &> /dev/null

# echo "Removing existing directories"
# for dir in $dirs; do
#   rm -rf "$dir"
# done

./scripts/build_web.sh
./scripts/build_api.sh "$PASSWORD"
./scripts/build_admin.sh

chown mick:mick msc_*.tar.zip

# pwd
# echo "Cleaning up directories"
# for dir in $dirs; do
#   rm -rf "$dir"
# done

echo "All done!!!"
