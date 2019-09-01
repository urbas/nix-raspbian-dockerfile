FROM buildpack-deps:buster-curl

ARG NIX_VERSION
ENV NIX_VERSION 2.2.2

RUN wget https://github.com/NixOS/nix/archive/${NIX_VERSION}.tar.gz
RUN tar -xf ${NIX_VERSION}.tar.gz
RUN rm ${NIX_VERSION}.tar.gz

RUN apt-get update

RUN apt-get install -y --no-install-recommends \
		autoconf

RUN apt-get install -y --no-install-recommends \
		automake

RUN apt-get install -y --no-install-recommends \
		libtool

RUN apt-get install -y --no-install-recommends \
		gettext

RUN apt-get install -y --no-install-recommends \
		intltool

RUN apt-get install -y --no-install-recommends \
		autoconf-archive

RUN apt-get install -y --no-install-recommends \
		build-essential

RUN apt-get install -y --no-install-recommends \
		bison flex libxml2 jq

RUN apt-get install -y --no-install-recommends \
		brotli

RUN apt-get install -y --no-install-recommends \
		openssl

RUN apt-get install -y --no-install-recommends \
		bzip2

RUN apt-get install -y --no-install-recommends \
		liblzma-dev

RUN apt-get install -y --no-install-recommends \
		sqlite

RUN rm -rf /var/lib/apt/lists/*

WORKDIR /nix-${NIX_VERSION}

# RUN autoupdate
RUN autoreconf --install --force --verbose
# RUN ./bootstrap.sh

CMD "/bin/bash"