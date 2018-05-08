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
proxyString = "-Dhttps.proxyHost=$proxyHost -Dhttps.proxyPort=$proxyPort -Dhttp.proxyHost=$proxyHost -Dhttp.proxyPort=$proxyPort"
if [ $proxyHost == "--noProxy" ] ; then
	proxyString=""
fi
echo "Proxy host is"+$proxyHost
echo "Proxy Port is"+$proxyPort
echo "Stopping running container aggregatortech-jenkins"
docker stop aggregatortech-jenkins
docker rm  aggregatortech-jenkins
docker run -p 8080:8080 -p 50000:50000 --volumes-from aggregatortech-jenkins-dv --env JAVA_OPTS="$proxyString" --name aggregatortech-jenkins jenkins/jenkins

