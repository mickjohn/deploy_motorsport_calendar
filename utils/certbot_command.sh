certbot certonly \
	-d www.mickjohn.com \
	-d games.mickjohn.com \
	-d admin.mickjohn.com \
	-d mickjohn.com \
  -m EMAIL GOES HERE
	--agree-tos \
	--standalone \
  --expand \
	-n

