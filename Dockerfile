FROM jenkins
# if we want to install via apt
USER root

RUN apt-get update && apt-get install -y awscli \
    maven && rm -rf /var/lib/apt/lists/*
RUN groupadd -g 116 docker
RUN usermod -aG docker jenkins

COPY ./settings.xml /etc/maven/settings.xml

ENV MUSER=admin
ENV MPASSWORD=admin123

# drop back to the regular jenkins user - good practice
USER jenkins
