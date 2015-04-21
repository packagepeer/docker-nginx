FROM nginx:1.7
MAINTAINER Javier Jerónimo <jjeronimo@packagepeer.com>

# HowTo build:
#     sudo docker build --tag=packagepeer/nginx:7 .

# HowTo run:
#     sudo docker run \
#             --name nginx \
#             --link artifactory:artifactory \
#             --link consul:consul \
#             -p 443:443 \
#             -v ...nginx.combined.crt:/etc/pki/tls/certs/nginx.combined.crt \
#             -v ...nginx.key:/etc/pki/tls/private/nginx.key \
#             -v ...passwd:/etc/nginx/passwd
#             -e SERVER_NAME=... \
#             -d packagepeer/nginx

# ################################################################################ Setup
ADD etc/nginx/sites-enabled/ssl /etc/nginx/sites-enabled/ssl

ADD pkgp-run.sh /pkgp-run.sh
RUN chmod u+x /pkgp-run.sh


# ################################################################################ Entry point
CMD ["/pkgp-run.sh"]
