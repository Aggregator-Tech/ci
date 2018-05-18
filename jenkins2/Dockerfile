FROM jenkins/jenkins
USER root
ENV http_proxy http://www-proxy.us.oracle.com:80/
ENV https_proxy http://www-proxy.us.oracle.com:80/
RUN apt-get update
RUN apt-get --assume-yes install netcat
ENTRYPOINT ["/usr/local/bin/jenkins.sh"]

