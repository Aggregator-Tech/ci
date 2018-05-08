#do we need to check if jenkins-dv exists
#if it does, do we need to delete it and create new 
proxyHost=$1
proxyPort=$2
if [ -z "$proxyHost" ]; then
   echo "No proxy Host from cmd"
   proxyHost="www-proxy.us.oracle.com"
  
fi
if [ -z "$proxyPort" ]; then
   echo "No proxy port from cmd, use default"
   proxyPort="80"
fi
echo "Proxy host is"+$proxyHost
echo "Proxy Port is"+$proxyPort
echo "Stopping running container aggregatortech-jenkins"
docker stop aggregatortech-jenkins
docker container rm -f aggregatortech-jenkins
echo "Removing aggregatortech-jenkins-dv,aggregatortech-jenkins"
docker container rm -f aggregatortech-jenkins
docker container rm -f aggregatortech-jenkins-dv
echo "volume removed successfully"
docker create -v /var/jenkins_home --name aggregatortech-jenkins-dv jenkins/jenkins
echo "volume recreated  successfully"
rm proxy.xml
sed "s/\${http.proxyHost}/$proxyHost/;s/\${http.proxyPort}/$proxyPort/" aggregatortech-jenkins-dv-repo/jenkins_home/proxy.xml >> proxy.xml

chmod -R 777  aggregatortech-jenkins-dv-repo
docker cp  aggregatortech-jenkins-dv-repo/jenkins_home/.  aggregatortech-jenkins-dv:/var/jenkins_home/.
docker cp  proxy.xml  aggregatortech-jenkins-dv:/var/jenkins_home/.
echo "volume refreshed  successfully"
sh startJenkins.sh $proxyHost $proxyPort

