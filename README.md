# CI Project for Aggregator Tech
This project contains the CI-CD pipeline for aggregatortech

# Getting Started
These instructions will enable you to set up Jenkins master on your machine

# Prerequisites
Docker must be installed in your machine

# Starting Jenkins
## startJenkins.sh
* Stops the running container "aggregatortech-jenkins".
* Deletes the containers "aggregatortech-jenkins" and named data volume container "aggregatortech-jenkins-dv"
* Starts "aggregatortech-jenkins" with  data volume  "aggregatortech-jenkins-dv"

## startJenkinswithLatestRepo.sh
This script does the following
* Stops the running container "aggregatortech-jenkins"
* Deletes the containers "aggregatortech-jenkins" and named data volume container "aggregatortech-jenkins-dv"
* Copies the content from aggregatortech-jenkins-dv-repo and adds it in the data volume container "aggregatortech-jenkins-dv"
* Starts "aggregatortech-jenkins" with refreshed data volume  "aggregatortech-jenkins-dv"

# Stopping Jenkins
## stopJenkins.sh 
* Stops running Jenkins container "aggregatortech-jenkins"
# Sync your Jenkins master with local GIT Repo
## syncJenkinsDVWithRepo.sh
* syncs the content from Jenkins DV with the local repository
* To commit the changes to GITHub repo, one must push the changes manually
