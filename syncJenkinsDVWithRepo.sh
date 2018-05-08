echo "Copying volume data from Jenikins Dv to local repository dir. "
docker cp   aggregatortech-jenkins-dv:/var/jenkins_home/. aggregatortech-jenkins-dv-repo/jenkins_home/. 
rm -rf aggregatortech-jenkins-dv-repo/jenkins_home/logs
rm -rf aggregatortech-jenkins-dv-repo/jenkins_home/tools
rm -rf aggregatortech-jenkins-dv-repo/jenkins_home/.gradle
rm -rf aggregatortech-jenkins-dv-repo/jenkins_home/war

echo "Local repo directory refreshed  successfully"

