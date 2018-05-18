FROM jenkins/jenkins
USER root
ENV http_proxy http://www-proxy.us.oracle.com:80/
ENV https_proxy http://www-proxy.us.oracle.com:80/
RUN apt-get update
RUN apt-get --assume-yes install netcat
COPY plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN /usr/local/bin/install-plugins.sh < /usr/share/jenkins/ref/plugins.txt
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]

