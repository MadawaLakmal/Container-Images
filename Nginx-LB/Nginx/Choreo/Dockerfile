# Use the official Nginx Alpine image as the base image
FROM nginx:alpine

# Install required packages
RUN apk add --no-cache acl

# Create a non-root group and user with a UID between 10000-20000
RUN addgroup -S choreo && \
    adduser -D -u 10014 -G choreo choreo

# Set the working directory
WORKDIR /usr/local/apache2/htdocs/

# Create required directories and set permissions
RUN mkdir -p /var/cache/nginx/client_temp && \
    chown -R 10014:choreo /var/cache/nginx && \
    chown -R 10014:choreo /var/log/nginx && \
    chown -R 10014:choreo /etc/nginx

# Set permissions for configuration files and directories
RUN chmod -R 755 /etc/nginx/conf.d && \
    chmod 644 /etc/nginx/nginx.conf && \
    chmod -R 755 /var/cache/nginx

# Switch to the non-root user
USER 10014

# Expose the default Nginx port
EXPOSE 80

# Start Nginx
CMD ["nginx", "-g", "daemon off;"]
