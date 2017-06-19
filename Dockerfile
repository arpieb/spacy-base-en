FROM base/archlinux

# Install required core OS packages
RUN pacman -Syu --noconfirm python python-pip python-virtualenv gcc

# Set the working directory to /app
WORKDIR /app

# Copy the current directory contents into the container at /app
ADD . /app

# Set up virtualenv
RUN virtualenv .env; source .env/bin/activate

# Install target spaCy package + language pack(s)
RUN pip install -U spacy==1.8.2; python -m spacy download en
