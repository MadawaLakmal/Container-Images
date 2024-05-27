FROM httpd:alpine

# Define user and group
ENV APACHE_RUN_USER=choreo
ENV APACHE_RUN_GROUP=choreo
ENV PORT=80

# Create a non-root user and group
RUN addgroup -S ${APACHE_RUN_USER} && adduser -S ${APACHE_RUN_USER} -G ${APACHE_RUN_GROUP}

# Add acl package
RUN apk update && apk add acl

# Set working directory
WORKDIR /usr/local/apache2/htdocs/

# Modify httpd.conf to use the non-root user and listen on port 8080
RUN sed -i \
        -e "s/^User daemon/User ${APACHE_RUN_USER}/" \
        -e "s/^Group daemon/Group ${APACHE_RUN_GROUP}/" \
        /usr/local/apache2/conf/httpd.conf

# Change ownership of the website directory
RUN setfacl -R -m u:${APACHE_RUN_USER}:rwx /usr/local/apache2/

# Configure Apache to run with the non-root user
USER ${APACHE_RUN_USER}

# Expose the default Apache port
EXPOSE ${PORT}

# Expose the document root as a volume
VOLUME /usr/local/apache2/htdocs

# Start Apache
CMD ["httpd", "-D", "FOREGROUND"]
