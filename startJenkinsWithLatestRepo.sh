#do we need to check if jenkins-dv exists
#if it does, do we need to delete it and create new 
mkdir stagingForJenkins
mkdir stagingForJenkins/jenkins_home
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
cp -r aggregatortech-jenkins-dv-repo/jenkins_home/.  stagingForJenkins/jenkins_home/.
rm -f stagingForJenkins/jenkins_home/proxy.xml
if [ $proxyHost != "--noProxy" ] ; then
sed "s/\${http.proxyHost}/$proxyHost/;s/\${http.proxyPort}/$proxyPort/" aggregatortech-jenkins-dv-repo/jenkins_home/proxy.xml >>  stagingForJenkins/jenkins_home/proxy.xml
fi
#create docker image
#docker build jenkins2/.
docker cp  stagingForJenkins/jenkins_home/.  aggregatortech-jenkins-dv1:/var/jenkins_home/.
echo "Stopping running container aggregatortech-jenkins"
docker stop aggregatortech-jenkins
docker container rm -f aggregatortech-jenkins
echo "Removing aggregatortech-jenkins-dv,aggregatortech-jenkins"
docker container rm -f aggregatortech-jenkins
docker container rm -f aggregatortech-jenkins-dv1
echo "volume removed successfully"
docker create -v /var/jenkins_home --name aggregatortech-jenkins-dv1 jenkins/jenkins
echo "volume recreated  successfully"

chmod -R 777 stagingForJenkins
docker cp  stagingForJenkins/jenkins_home/.  aggregatortech-jenkins-dv1:/var/jenkins_home/.
echo "volume refreshed  successfully"
rm -rf stagingForJenkins
sh startJenkins.sh $proxyHost $proxyPort

