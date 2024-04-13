FROM ubuntu:jammy

# Labelling the image
LABEL versio="1.0"

# Update and Install necessary packages and remove unwanted
RUN apt update && \
    apt upgrade -y && \
    apt install -y apt-utils \
        curl \
        git \
        vim \
        net-tools \
        telnet \
        zip \
        python3 \
        openssl \
        python3-pip \
        groff \
        sudo && \
    apt autoremove -y

# Copy AWS cli installation script
COPY installer .

# Install aws-cli
RUN chmod a+x installer && bash ./installer

# Install azure-cli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
    
# Adding dev user and change password to 'password'
RUN adduser dev 

RUN echo 'dev:password' | chpasswd && usermod -aG sudo dev

# Set user 
USER dev

# Set home directory 
WORKDIR /home/dev

CMD ["sleep", "infinity"]
