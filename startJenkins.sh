#do we need to check if jenkins-dv exists
#if it does, do we need to delete it and create new 
docker volume rm jenkins-dv
docker create -v /var/jenkins_home --name jenkins-dv jenkins 
docker run -p 8080:8080 -p 50000:50000 --volumes-from jenkins2-dv --env JAVA_OPTS="-Dhttps.proxyHost=www-proxy.us.oracle.com -Dhttps.proxyPort=80 -Dhttp.proxyHost=www-proxy.us.oracle.com -Dhttp.proxyPort=80" jenkins

