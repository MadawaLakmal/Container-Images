FROM ubuntu:jammy

# Labelling the image
LABEL versio="x86"

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
        sudo 

# Install aws-cli
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    bash ./aws/install && \
    rm -rf aws*

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
