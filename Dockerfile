## -*- docker-image-name: "armbuild/scw-app-phabricator:latest" -*-
FROM armbuild/scw-app-lemp:latest
MAINTAINER Scaleway <kolja.dummann@logv.ws> (@dumdidum)

# Prepare rootfs for image-builder
RUN /usr/local/sbin/builder-enter

ADD ./patches/ /

# Install packages
RUN apt-get -q update                   \
 && apt-get --force-yes -y -qq upgrade
 RUN  apt-get --force-yes install -y -q   \
	git php5 php5-mysql php5-gd php5-dev php5-curl \
	php-apc php5-cli php5-json

RUN mkdir -p /var/lib/phabricator

WORKDIR /var/lib/phabricator

RUN git clone https://github.com/phacility/libphutil.git \
	&& git clone https://github.com/phacility/arcanist.git \
	&& git clone https://github.com/phacility/phabricator.git

# Clean rootfs from image-builder

RUN /usr/local/sbin/builder-leave
