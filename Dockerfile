FROM ubuntu:14.04
MAINTAINER Javier Jerónimo <jjeronimo@packagepeer.com>

# HowTo build:
#     sudo docker build --tag=packagepeer/nginx:7 .

# HowTo run:
#     sudo docker run \
#             --name nginx \
#             --link ...:artifactory \
#             --link ...:consul \
#             --link ...:shipyard \
#             -p 443:443 \
#             -v ...nginx.combined.crt:/etc/nginx/nginx.combined.crt \
#             -v ...nginx.key:/etc/nginx/nginx.key \
#             -v ...passwd:/etc/nginx/passwd
#             -d packagepeer/nginx

# ################################################################################ Setup
RUN \
  apt-get update && \
  apt-get install -y nginx-core  && \
  rm -rf /var/lib/apt/lists/* && \
  echo "\ndaemon off;" >> /etc/nginx/nginx.conf && \
  chown -R www-data:www-data /var/lib/nginx

WORKDIR /etc/nginx

RUN mkdir -p /var/log/nginx/

RUN rm /etc/nginx/sites-enabled/default


ADD etc/nginx/sites-enabled/ssl /etc/nginx/sites-enabled/ssl

EXPOSE 443

# ################################################################################ Entry point

CMD nginx
