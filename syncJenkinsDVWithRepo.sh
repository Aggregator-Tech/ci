echo "Copying volume data from Jenikins Dv to local repository dir. "
docker cp  aggregatortech-jenkins-dv:/var aggregatortech-jenkins-dv-repo/jenkins_home  
echo "Local repo directory refreshed  successfully"

