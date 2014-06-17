FROM dockerfile/haproxy

# consul install
RUN apt-get -y install unzip
ADD https://dl.bintray.com/mitchellh/consul/0.3.0_linux_amd64.zip /tmp/consul.zip
RUN cd /usr/local/sbin && unzip /tmp/consul.zip

# confd install
ADD https://github.com/kelseyhightower/confd/releases/download/v0.4.1/confd-0.4.1-linux-amd64 /usr/local/bin/confd
RUN chmod +x /usr/local/bin/confd

# supervisord install
RUN \
  apt-get install -y supervisor && \
  sed -i 's/^\(\[supervisord\]\)$/\1\nnodaemon=true/' /etc/supervisor/supervisord.conf

# Define mountable directories.
VOLUME ["/etc/supervisor/conf.d"]

# Define working directory.
WORKDIR /etc/supervisor/conf.d

# Define default command.
CMD ["supervisord", "-c", "/etc/supervisor/supervisord.conf"]

#CMD /usr/local/sbin/consul agent -bootstrap -server -data-dir=/tmp/consul -client=0.0.0.0
#EXPOSE 8400 8500 8600/udp
