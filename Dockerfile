FROM maven:3-jdk-11-slim


RUN dpkg --add-architecture i386 && \
    apt update && \
    apt install -y \
      git \
      openssh-client \
      apt-transport-https \
      ca-certificates \
      curl \
      gnupg2 \
      software-properties-common \
      libc6-i386 \
      libstdc++6 libstdc++6:i386 \
      && \
    curl -fsSL https://download.docker.com/linux/debian/gpg | apt-key add - && \
    add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/debian $(lsb_release -cs) stable" && \
    apt-get update && \
    apt-get install -y --no-install-recommends docker-ce-cli libfreetype6 sudo && \
    curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
    chmod +x /usr/local/bin/docker-compose 
