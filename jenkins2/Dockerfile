FROM jenkins/jenkins
USER root
ENV http_proxy http://www-proxy.us.oracle.com:80/
ENV https_proxy http://www-proxy.us.oracle.com:80/
RUN apt-get update
RUN apt-get --assume-yes install netcat
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
#RUN curl -fsSLO https://get.docker.com/builds/Linux/x86_64/docker-17.04.0-ce.tgz \
 # && tar xzvf docker-17.04.0-ce.tgz \
  #&& mv docker/docker /usr/local/bin \
  #&& rm -r docker docker-17.04.0-ce.tgz
#RUN apt-get install -y locales
#RUN locale-gen en_US.UTF-8
#ENV LANG='en_US.UTF-8' LANGUAGE='en_US:en' LC_ALL='en_US.UTF-8'
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]

