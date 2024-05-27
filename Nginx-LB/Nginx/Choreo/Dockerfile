FROM nginx:alpine

# Define user and group
ENV NGINX_RUN_USER=choreo
ENV NGINX_RUN_GROUP=choreo
ENV NGINX_RUN_USER_UID=10014
ENV PORT=80

# Create a non-root user and group
RUN addgroup -g ${NGINX_RUN_USER_UID} ${NGINX_RUN_GROUP} && \
    adduser  --disabled-password  --no-create-home --uid ${NGINX_RUN_USER_UID} --ingroup ${NGINX_RUN_GROUP} ${NGINX_RUN_USER}

# Add acl package
RUN apk update && apk add acl

# Set working directory
WORKDIR /usr/share/nginx/html

# Create necessary directories with appropriate permissions
RUN mkdir -p /var/cache/nginx/client_temp && \
    chown -R ${NGINX_RUN_USER}:${NGINX_RUN_GROUP} /var/cache/nginx && \
    touch /var/run/nginx.pid && \
    chown -R ${NGINX_RUN_USER}:${NGINX_RUN_GROUP} /var/run/nginx.pid

# Change ownership of the website directory
RUN setfacl -R -m u:${NGINX_RUN_USER}:rwx /usr/share/nginx/html

# Expose the default Nginx port
EXPOSE ${PORT}

# Expose the document root as a volume
VOLUME /usr/share/nginx/html

# Configure Nginx to run with the non-root user
USER choreo

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
