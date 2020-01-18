DIR := ${CURDIR}

WEBSOCKET_GAMES_DIR = websocket_games
WEBSOCKET_GAMES_SERVER_IMAGE = wbskt_games
WEBSOCKET_GAMES_FRONTEND_IMAGE = wbskt_server

build : websocket-games-image

###################
# WEBSOCKET GAMES #
###################

websocket-games-clone :
	if [ -d $(WEBSOCKET_GAMES_DIR) ] ;then \
		cd $(WEBSOCKET_GAMES_DIR) && git pull; \
		else \
		git clone git@github.com:mickjohn/$(WEBSOCKET_GAMES_DIR).git; \
	fi;

websocket-games : websocket-games-clone
	make -C $(WEBSOCKET_GAMES_DIR)

websocket-games-image : websocket-games
	mv $(WEBSOCKET_GAMES_DIR)/$(WEBSOCKET_GAMES_SERVER_IMAGE).tar.zip $(CURDIR) && \
	mv $(WEBSOCKET_GAMES_DIR)/$(WEBSOCKET_GAMES_FRONTEND_IMAGE).tar.zip $(CURDIR)

