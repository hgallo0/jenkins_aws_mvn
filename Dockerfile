FROM jenkins
# if we want to install via apt
USER root
RUN apt-get update && apt-get install -y awscli \
    maven && rm -rf /var/lib/apt/lists/*
RUN groupadd -g 116 docker
RUN usermod -aG docker jenkins
# drop back to the regular jenkins user - good practice
USER jenkins
