FROM ubuntu:jammy

# Labelling the image
LABEL versio="1.0"

# Update and Install necessary packages
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
        sudo 

COPY installer.sh .

# Install aws-cli
RUN chmod a+x installer.sh && bash ./installer.sh

# Install azure-cli
RUN curl -sL https://aka.ms/InstallAzureCLIDeb | sudo bash
    
# Adding dev user and change password to 'password'
RUN adduser dev 

RUN echo 'dev:password' | chpasswd && usermod -aG sudo dev

# Removing unwanted packages
RUN apt autoremove -y

# Set user 
USER dev

# Set home directory 
WORKDIR /home/dev

CMD ["sleep", "infinity"]