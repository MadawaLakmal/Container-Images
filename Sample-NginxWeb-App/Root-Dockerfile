FROM nginx:alpine
LABEL maintainer="lakmal <madawalakmal94@gmail.com>"

WORKDIR /usr/share/nginx/html

ADD . ./

EXPOSE 80

CMD /bin/sh -c ./script.sh ; /usr/sbin/nginx -g 'daemon off;'
