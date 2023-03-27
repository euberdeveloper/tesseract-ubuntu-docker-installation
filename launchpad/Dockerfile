# Argument used to understand the ubuntu version
ARG UBUNTU_VERSION=latest 
# Base image
FROM ubuntu:$UBUNTU_VERSION

# Update deps and install software-properties-common
RUN apt-get update -y \
        && apt-get install -y software-properties-common \
        && apt-get clean all

# Add repo and update
RUN add-apt-repository ppa:alex-p/tesseract-ocr5 \
        && apt-get update -y

# Install tesseract ocr and languages
RUN apt-get install -y tesseract-ocr \
    tesseract-ocr-ita \
    tesseract-ocr-deu \
    tesseract-ocr-fra \
    tesseract-ocr-slk \
    tesseract-ocr-ces

# List all langs
RUN tesseract --list-langs

# Copy sample file
COPY sample.png /assets/sample.png

CMD ["tesseract", "/assets/sample.png", "-", "-l", "ita"]
