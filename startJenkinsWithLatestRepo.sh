#do we need to check if jenkins-dv exists
#if it does, do we need to delete it and create new 
echo "Stopping running container aggregatortech-jenkins"
docker stop aggregatortech-jenkins
docker container rm -f aggregatortech-jenkins
echo "Removing aggregatortech-jenkins-dv,aggregatortech-jenkins"
docker container rm -f aggregatortech-jenkins
docker container rm -f aggregatortech-jenkins-dv
echo "volume removed successfully"
docker create -v /var/jenkins_home --name aggregatortech-jenkins-dv jenkins/jenkins
echo "volume recreated  successfully"
chmod -R 777  aggregatortech-jenkins-dv-repo
docker cp  aggregatortech-jenkins-dv-repo/jenkins_home/.  aggregatortech-jenkins-dv:/var/jenkins_home/.
echo "volume refreshed  successfully"
docker run -p 8080:8080 -p 50000:50000 --volumes-from aggregatortech-jenkins-dv --env JAVA_OPTS="-Dhttps.proxyHost=www-proxy.us.oracle.com -Dhttps.proxyPort=80 -Dhttp.proxyHost=www-proxy.us.oracle.com -Dhttp.proxyPort=80" --name aggregatortech-jenkins jenkins/jenkins

