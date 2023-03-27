# Argument used to understand the ubuntu version
ARG UBUNTU_VERSION=latest 
# Base image
FROM ubuntu:$UBUNTU_VERSION

# Update deps and install lsb-release
RUN apt-get update \
        && apt-get install -y apt-transport-https lsb-release \
        && apt-get clean all

# Install repo
RUN echo "deb https://notesalexp.org/tesseract-ocr5/$(lsb_release -cs)/ $(lsb_release -cs) main" | tee /etc/apt/sources.list.d/notesalexp.list > /dev/null
# Install keys
RUN apt-get update -oAcquire::AllowInsecureRepositories=true; exit 0 \
        && apt-get install notesalexp-keyring -oAcquire::AllowInsecureRepositories=true; exit 0 \
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
