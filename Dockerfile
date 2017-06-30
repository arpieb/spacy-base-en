FROM alpine:3.6

# Install required core OS packages
RUN apk update && \
    apk add --no-cache \
      python \
      py2-pip \
      gcc \
      alpine-sdk \
      python2-dev

# Install target spaCy package + language pack(s)
RUN pip install -U spacy==1.8.2 && \
    python -m spacy download en

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app
