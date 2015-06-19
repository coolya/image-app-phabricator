DOCKER_NAMESPACE =	dumdidum/image-app-phabricator
NAME =			scw-app-phabricator
VERSION =		0.0.1
VERSION_ALIASES =	0.0.1 latest
TITLE =			Phabricator Image
DESCRIPTION =		A none exit Tor relay
SOURCE_URL =		https://github.com/coolya/image-app-phabricator


## Image tools  (https://github.com/scaleway/image-tools)
all:	docker-rules.mk
docker-rules.mk:
	wget -qO - http://j.mp/scw-builder | bash
-include docker-rules.mk
## Below you can add custom Makefile commands and overrides