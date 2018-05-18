#do we need to check if jenkins-dv exists
#if it does, do we need to delete it and create new 
mkdir stagingForJenkins
mkdir stagingForJenkins/jenkins_home
proxyHost=$1
proxyPort=$2
platform_url=$3
if [ -z "$proxyHost" ]; then
   echo "No proxy Host from cmd"
   proxyHost="www-proxy.us.oracle.com"
  
fi
if [ -z "$proxyPort" ]; then
   echo "No proxy port from cmd, use default"
   proxyPort="80"
fi
if [ -z "$platform_url" ]; then
   echo "No platform url from cmd"
   platform_url="https://aggregatortech-platform.herokuapp.com"
  
fi

echo "Proxy host is"+$proxyHost
echo "Proxy Port is"+$proxyPort
cp -r aggregatortech-jenkins-dv-repo/jenkins_home/.  stagingForJenkins/jenkins_home/.
rm -f stagingForJenkins/jenkins_home/proxy.xml
rm -f stagingForJenkins/jenkins_home/config.xml
if [ $proxyHost != "--noProxy" ] ; then
   sed "s/\${http.proxyHost}/$proxyHost/;s/\${http.proxyPort}/$proxyPort/" aggregatortech-jenkins-dv-repo/jenkins_home/proxy.xml >>  stagingForJenkins/jenkins_home/proxy.xml
   sed "s/\${http.proxyHost}/$proxyHost/;s/\${http.proxyPort}/$proxyPort/" aggregatortech-jenkins-dv-repo/jenkins_home/config.xml >>  stagingForJenkins/jenkins_home/config.xml
fi
if [ -z "$platform_url"] ; then
   sed "s/\${platform_url}/$platform_url/" stagingForJenkins/jenkins_home/config.xml >>  stagingForJenkins/jenkins_home/config.xml
fi

#create docker image
docker build jenkins2/. -t jenkins/jenkins-ci
docker cp  stagingForJenkins/jenkins_home/.  aggregatortech-jenkins-dv:/var/jenkins_home/.
echo "Stopping running container aggregatortech-jenkins"
docker stop aggregatortech-jenkins
docker container rm -f aggregatortech-jenkins
echo "Removing aggregatortech-jenkins-dv,aggregatortech-jenkins"
docker container rm -f aggregatortech-jenkins
docker container rm -f aggregatortech-jenkins-dv
echo "volume removed successfully"
docker create -v /var/jenkins_home --name aggregatortech-jenkins-dv jenkins/jenkins-ci
echo "volume recreated  successfully"

chmod -R 777 stagingForJenkins
docker cp  stagingForJenkins/jenkins_home/.  aggregatortech-jenkins-dv:/var/jenkins_home/.
echo "volume refreshed  successfully"
#rm -rf stagingForJenkins
sh startJenkins.sh $proxyHost $proxyPort

