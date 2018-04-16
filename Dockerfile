# Dockerfile
# using debian:jessie for it's smaller size over ubuntu
FROM ubuntu:16.04

MAINTAINER delu2011@hotmail.co.uk

# Set environment variables
ENV appDir /var/www/app/current

# Run updates and install deps
RUN apt-get update

RUN apt-get install -y -q --no-install-recommends \
    apt-transport-https \
    build-essential \
    ca-certificates \
    curl \
    g++ \
    gcc \
    git \
    make \
    nginx \
    sudo \
    wget \
    git \
    && rm -rf /var/lib/apt/lists/* \
    && apt-get -y autoclean

RUN curl -sL https://deb.nodesource.com/setup_4.x | sudo -E bash -

RUN apt-get update && apt-get -y upgrade && apt-get install -y nodejs

# Set the work directory
RUN mkdir -p /var/www/app/current
WORKDIR ${appDir}

# Add our package.json and install *before* adding our application files
ADD package.json ./
RUN npm i --production


# Install pm2 so we can run our application
RUN npm i -g pm2

# Add application files
ADD . /var/www/app/current

#Expose the port
EXPOSE 4500

CMD ["pm2", "start", "processes.json", "--no-daemon"]


