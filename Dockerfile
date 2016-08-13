FROM lsiobase/xenial
MAINTAINER sparklyballs

# environment settings
ARG DEBIAN_FRONTEND="noninteractive"
ENV LANG="en_US.UTF-8" \
LANGUAGE="en_US:en"

# Set the locale
RUN \
 locale-gen en_US.UTF-8

# install packages
RUN \
 apt-get update && \
 apt-get install -y \
	bsdmainutils \
	bzip2 \
	mailutils \
	postfix \
	python \
	tmux \
	wget && \

# cleanup
 apt-get clean && \
 rm -rf \
	/var/lib/apt/lists/* \
	/var/tmp/*

# add local files
COPY root/ /

# ports and volumes
EXPOSE 9987/udp 30033 10011 41144
VOLUME /config
