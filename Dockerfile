FROM nginx:1.27.2


COPY default.conf.template /etc/nginx/conf.d/default.conf.template
COPY nginx.conf /etc/nginx/nginx.conf
COPY html /usr/share/nginx/html

# Annoying but needed to the port to work for the web server
CMD /bin/bash -c "envsubst '\$PORT' < /etc/nginx/conf.d/default.conf.template > /etc/nginx/conf.d/default.conf" && nginx -g 'daemon off;'

EXPOSE ${PORT}
