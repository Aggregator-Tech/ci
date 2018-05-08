echo "Copying volume data from Jenikins Dv to local repository dir. "
docker cp   aggregatortech-jenkins-dv:/var/jenkins_home/. aggregatortech-jenkins-dv-repo/jenkins_home/. 
rm -rf aggregatortech-jenkins-dv-repo/jenkins_home/logs
echo "Local repo directory refreshed  successfully"

