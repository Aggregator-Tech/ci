echo "Copying volume data from Jenikins Dv to local repository dir. "
mkdir stagingToRepo
mkdir stagingToRepo/jenkins_home

docker cp   aggregatortech-jenkins-dv:/var/jenkins_home/. stagingToRepo/jenkins_home/. 
#Items we dont want to copy over
rm -rf stagingToRepo/jenkins_home/proxy.xml
rm -rf stagingToRepo/jenkins_home/copy_reference_file.log
rm -rf stagingToRepo/jenkins_home/queue.xml.bak
rm -rf stagingToRepo/jenkins_home/logs
rm -rf stagingToRepo/jenkins_home/tools
rm -rf stagingToRepo/jenkins_home/.gradle
rm -rf stagingToRepo/jenkins_home/war
rm -rf stagingToRepo/jenkins_home/updates
rm -rf stagingToRepo/jenkins_home/workspace
rm -rf stagingToRepo/jenkins_home/cache
rm -rf stagingToRepo/jenkins_home/caches
rm -rf stagingToRepo/jenkins_home/jobs/*/builds
rm -rf stagingToRepo/jenkins_home/jobs/*/branches
rm -rf stagingToRepo/jenkins_home/jobs/*/indexing
rm -rf stagingToRepo/jenkins_home/jobs/*/caches
cp -r  stagingToRepo/jenkins_home/.  aggregatortech-jenkins-dv-repo/jenkins_home/. 
rm -rf stagingToRepo

echo "Local repo directory refreshed  successfully"

