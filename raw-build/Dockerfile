# Argument used to understand the ubuntu version
ARG UBUNTU_VERSION=latest 
# Base image
FROM ubuntu:$UBUNTU_VERSION

# Fix interaction error error with tzdata
ENV DEBIAN_FRONTEND=noninteractive

# Update deps and install software-properties-common
RUN apt-get update -y

# Install dependencies and manpages
RUN apt-get install -y automake ca-certificates g++ git libtool make pkg-config libgif-dev libtiff-dev libpng-dev \
    && apt-get install -y --no-install-recommends asciidoc docbook-xsl xsltproc

# Clone the Leptonica's Github repo
RUN git clone --depth 1 --branch 1.83.1 https://github.com/DanBloomberg/leptonica.git

# Move to the root of the Leptonica's repo
WORKDIR /leptonica

# Build leptonica
RUN ./autogen.sh \
    && CFLAGS="$CFLAGS -g -O2 -fPIC" LDFLAGS="$LDFLAGS -fPIC" ./configure --disable-shared --prefix $HOME/local/leptonica \
    && make \
    && make install

WORKDIR /

# Clone the Tesseract's Github repo
RUN git clone --depth 1 --branch 5.3.1 https://github.com/tesseract-ocr/tesseract.git

# Move to the root of the Tesseract's repo
WORKDIR /tesseract

# Build tesseract
RUN ./autogen.sh \
    && PKG_CONFIG_PATH=$HOME/local/leptonica/lib/pkgconfig LIBLEPT_HEADERSDIR=$HOME/local/leptonica/include ./configure --with-extra-libraries=$HOME/local/leptonica/lib --disable-graphics --disable-static \
    && make \
    && make install \
    && ldconfig

# Clone tesseract downloader repo and move to its root
RUN git clone --depth 1 https://github.com/zdenop/tessdata_downloader

# Move to the root of the repo
WORKDIR /tesseract/tessdata_downloader

# Install Pip
RUN apt-get install -y python3-pip

# Install the python dependencies
RUN pip3 install -r requirements.txt

# Download the needed languages
RUN mkdir -p /usr/local/share/tessdata/
RUN python3 tessdata_downloader.py -r tessdata -l eng \
    && mv eng.traineddata /usr/local/share/tessdata/
RUN python3 tessdata_downloader.py -r tessdata -l ita \
    && mv ita.traineddata /usr/local/share/tessdata/ 
RUN python3 tessdata_downloader.py -r tessdata -l deu \
    && mv deu.traineddata /usr/local/share/tessdata/ 
RUN python3 tessdata_downloader.py -r tessdata -l fra \
    && mv fra.traineddata /usr/local/share/tessdata/ 
RUN python3 tessdata_downloader.py -r tessdata -l slk \
    && mv slk.traineddata /usr/local/share/tessdata/ 
RUN python3 tessdata_downloader.py -r tessdata -l ces \
    && mv ces.traineddata /usr/local/share/tessdata/

# Move to root
WORKDIR /

# List all langs
RUN tesseract --list-langs

# Copy sample file
COPY sample.png /assets/sample.png

CMD ["tesseract", "/assets/sample.png", "-", "-l", "ita"]
