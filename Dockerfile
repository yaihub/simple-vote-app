FROM golang:1.15.2-buster
WORKDIR /apps
RUN apt update && \
    apt-get install -y \
        build-essential \
        ca-certificates \
        unzip \
        curl \
        vim \
        git
RUN curl -sL https://deb.nodesource.com/setup_14.x | bash - && \
    apt-get install -y nodejs
RUN curl -sL https://github.com/protocolbuffers/protobuf/releases/download/v3.12.1/protoc-3.12.1-linux-x86_64.zip -o protoc.zip && \
    unzip protoc.zip -d /usr/local && \
    rm protoc.zip 
RUN export GOPATH=/go
RUN export PATH=$PATH:$GOPATH/bin
RUN npm -g config set user root
ENV PATH=$PATH:/home/node/.npm-global/bin
RUN npm i -g @tendermint/starport

COPY . /apps

CMD starport serve