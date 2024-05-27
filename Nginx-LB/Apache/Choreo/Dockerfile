FROM httpd:alpine

# Define user and group
ENV APACHE_RUN_USER=choreouser
ENV APACHE_RUN_GROUP=choreo
ENV APACHE_RUN_USER_UID=10014
ENV PORT=80

# Create a non-root user and group
RUN addgroup -g ${APACHE_RUN_USER_UID} ${APACHE_RUN_GROUP} && \
    adduser  --disabled-password  --no-create-home --uid ${APACHE_RUN_USER_UID} --ingroup ${APACHE_RUN_GROUP} ${APACHE_RUN_USER}

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
RUN setfacl -R -m u:${APACHE_RUN_USER_UID}:rwx /usr/local/apache2/

# Expose the default Apache port
EXPOSE ${PORT}

# Expose the document root as a volume
VOLUME /usr/local/apache2/htdocs

# Configure Apache to run with the non-root user
USER 10014

# Start Apache
CMD ["httpd", "-D", "FOREGROUND"]
