echo "Copying volume data from Jenikins Dv to local repository dir. "
mkdir staging
mkdir staging/jenkins_home

docker cp   aggregatortech-jenkins-dv:/var/jenkins_home/. staging/jenkins_home/. 
#Items we dont want to copy over
rm -rf staging/jenkins_home/proxy.xml
rm -rf staging/jenkins_home/logs
rm -rf staging/jenkins_home/tools
rm -rf staging/jenkins_home/.gradle
rm -rf staging/jenkins_home/war
cp -r  staging/jenkins_home/.  aggregatortech-jenkins-dv-repo/jenkins_home/. 
#rm -rf staging

echo "Local repo directory refreshed  successfully"

