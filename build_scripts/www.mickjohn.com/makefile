DIR := ${CURDIR}

WEBSERVER_DIR = motorsport_calendar_webserver
WEBSERVER_IMAGE = msc_web

ADMIN_DIR = motorsport_calendar_admin_pages
ADMIN_IMAGE = msc_adm

API_DIR = motorsport_calendar_api
API_IMAGE = msc_api

build : webserver-image admin-image api-image

#############
# WEBSERVER #
#############

webserver-clone :
	git clone git@github.com:mickjohn/$(WEBSERVER_DIR).git || true \

webserver : webserver-clone
	make -C $(WEBSERVER_DIR)

webserver-image : webserver
	mv $(WEBSERVER_DIR)/$(WEBSERVER_IMAGE).tar.zip $(CURDIR)

#########
# ADMIN #
#########

admin-clone : 
	git clone git@github.com:mickjohn/$(ADMIN_DIR).git || true

admin : admin-clone
	make -C $(ADMIN_DIR)

admin-image : admin
	mv $(ADMIN_DIR)/$(ADMIN_IMAGE).tar.zip $(CURDIR)

api-clone : 
	git clone git@github.com:mickjohn/$(API_DIR).git || true

#######
# API #
#######

api-clone : 
	git clone git@github.com:mickjohn/$(API_DIR).git || true

api : api-clone
	make -C $(API_DIR)

api-image : api
	mv $(API_DIR)/$(API_IMAGE).tar.zip $(CURDIR)

clean :
	rm $(WEBSERVER_IMAGE).tar.zip
