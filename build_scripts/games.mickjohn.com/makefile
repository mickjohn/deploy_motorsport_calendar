DIR := ${CURDIR}

WEBSOCKET_GAMES_DIR = websocket_games
WEBSOCKET_GAMES_SERVER_IMAGE = wbskt_games
WEBSOCKET_GAMES_FRONTEND_IMAGE = wbskt_server

build : websocket-games-image

###################
# WEBSOCKET GAMES #
###################

websocket-games-clone :
	git clone git@github.com:mickjohn/$(WEBSOCKET_GAMES_DIR).git || true \

websocket-games : websocket-games-clone
	make -C $(WEBSOCKET_GAMES_DIR)

websocket-games-image : websocket-games
	mv $(WEBSOCKET_GAMES_DIR)/$(WEBSOCKET_GAMES_SERVER_IMAGE).tar.zip $(CURDIR) && \
	mv $(WEBSOCKET_GAMES_DIR)/$(WEBSOCKET_GAMES_FRONTEND_IMAGE).tar.zip $(CURDIR)

#########
# ADMIN #
#########

# admin-clone : 
# 	git clone git@github.com:mickjohn/$(ADMIN_DIR).git || true

# admin : admin-clone
# 	make -C $(ADMIN_DIR)

# admin-image : admin
# 	mv $(ADMIN_DIR)/$(ADMIN_IMAGE).tar.zip $(CURDIR)

# api-clone : 
# 	git clone git@github.com:mickjohn/$(API_DIR).git || true

#######
# API #
#######

# api-clone : 
# 	git clone git@github.com:mickjohn/$(API_DIR).git || true

# api : api-clone
# 	make -C $(API_DIR)

# api-image : api
# 	mv $(API_DIR)/$(API_IMAGE).tar.zip $(CURDIR)

# clean :
# 	rm $(WEBSERVER_IMAGE).tar.zip
