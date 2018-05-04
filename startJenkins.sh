echo "Stopping running container aggregatortech-jenkins"
docker stop aggregatortech-jenkins
docker rm  aggregatortech-jenkins
docker run -p 8080:8080 -p 50000:50000 --volumes-from aggregatortech-jenkins-dv --env JAVA_OPTS="-Dhttps.proxyHost=www-proxy.us.oracle.com -Dhttps.proxyPort=80 -Dhttp.proxyHost=www-proxy.us.oracle.com -Dhttp.proxyPort=80" --name aggregatortech-jenkins jenkins/jenkins

