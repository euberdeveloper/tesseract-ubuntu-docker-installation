# Argument used to understand the ubuntu version
ARG UBUNTU_VERSION=latest 
# Base image
FROM ubuntu:$UBUNTU_VERSION

# Fix interaction error error with tzdata
ENV DEBIAN_FRONTEND=noninteractive

# Update deps and install software-properties-common
RUN apt-get update -y

# Install dependencies and manpages
RUN apt-get install -y ca-certificates automake g++ git libtool make pkg-config \
    && apt-get install -y --no-install-recommends asciidoc docbook-xsl xsltproc

# Clone the Github repo
RUN git clone --depth 1 --branch 1.83.1 https://github.com/DanBloomberg/leptonica.git

# Move to the root of the repo
WORKDIR /leptonica

# Build leptonica
RUN ./autogen.sh \
    && CFLAGS="$CFLAGS -g -O2 -fPIC" LDFLAGS="$LDFLAGS -fPIC" ./configure --disable-shared \
    && make
