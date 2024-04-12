FROM nginx:alpine
LABEL maintainer="lakmal <madawalakmal94@gmail.com>"

# Create a non-root user "app"
RUN addgroup -S app && adduser -S app -G app

# Set the working directory to /usr/share/nginx/html
WORKDIR /usr/share/nginx/html

# Copy the application files to the container
COPY --chown=app:app . ./

# Set necessary permissions for the app user
RUN chown -R app:app /usr/share/nginx/html && \
    chmod -R 755 /usr/share/nginx/html

# Create necessary directories with appropriate permissions
RUN mkdir -p /var/cache/nginx/client_temp && \
    chown -R app:app /var/cache/nginx && \
    touch /var/run/nginx.pid && \
    chown -R app:app /var/run/nginx.pid

# Expose port 80
EXPOSE 80

# Switch to the non-root "app" user and execute the script and start nginx
USER app
CMD /bin/sh -c ./script.sh ; /usr/sbin/nginx -g 'daemon off;'
