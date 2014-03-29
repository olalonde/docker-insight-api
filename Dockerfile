FROM       ubuntu:precise
MAINTAINER Olivier Lalonde <olalonde@gmail.com>
RUN        echo "deb http://archive.ubuntu.com/ubuntu precise main universe" > /etc/apt/sources.list
RUN        apt-get update
RUN        apt-get upgrade -y
RUN        apt-get install -y build-essential git wget

# install bitcoind
RUN       wget https://bitcoin.org/bin/0.9.0/bitcoin-0.9.0-linux.tar.gz
RUN       tar xzf bitcoin-0.9.0-linux.tar.gz
RUN       cp /bitcoin-0.9.0-linux/bin/64/* /usr/bin/

# install node
RUN        wget http://nodejs.org/dist/v0.10.26/node-v0.10.26-linux-x64.tar.gz
RUN        tar xzf node-v0.10.26-linux-x64.tar.gz
RUN        ln -s /node-v0.10.26-linux-x64/bin/node /usr/sbin/node
RUN        ln -s /node-v0.10.26-linux-x64/bin/npm /usr/sbin/npm

# install insight-api
RUN        cd /opt && git clone https://github.com/bitpay/insight-api.git
RUN        cd /opt/insight-api/ && npm install
RUN        mkdir -p /data/bitcoin
RUN        cp /opt/insight-api/etc/bitcoind/bitcoin-livenet.conf /data/bitcoin/bitcoin.conf

ADD        start.sh start.sh

EXPOSE     3000

ENTRYPOINT [ "/bin/bash" ]
