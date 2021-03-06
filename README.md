# CI Project for Aggregator Tech
This project contains the CI-CD pipeline for aggregatortech

# Getting Started
* These instructions will enable you to set up Jenkins master on your machine.
* If you are setting it up for the first time, use startJenkinswithLatestRepo.sh script decribed below
* If you don't have privileges, you might have to run these scripts using #sudo privs
* These scripts assumes the proxy details in the first version . will need to remove them and make configurable


# Prerequisites
Docker must be installed in your machine
Must be in ci directory when executing these commands


# Starting Jenkins
## startJenkinswithLatestRepo.sh
This script does the following
* Stops the running container "aggregatortech-jenkins" if any
* Deletes the containers "aggregatortech-jenkins" and named data volume container "aggregatortech-jenkins-dv" if any
* creates a new data volume container "aggregatortech-jenkins-dv"
* Copies the content from aggregatortech-jenkins-dv-repo and adds it in the data volume container "aggregatortech-jenkins-dv" 
* Starts "aggregatortech-jenkins" with refreshed data volume  "aggregatortech-jenkins-dv"

## startJenkins.sh
* Stops the running container "aggregatortech-jenkins".
* Deletes the containers "aggregatortech-jenkins" and named data volume container "aggregatortech-jenkins-dv"
* Starts "aggregatortech-jenkins" with  data volume  "aggregatortech-jenkins-dv"


# Stopping Jenkins
## stopJenkins.sh 
* Stops running Jenkins container "aggregatortech-jenkins"
# Sync your Jenkins master with local GIT Repo
## syncJenkinsDVWithRepo.sh
* syncs the content from Jenkins DV with the local repository
* To commit the changes to GITHub repo, one must push the changes manually

# Troubleshooting
 ## Permission denied errors
   * Try running your commands using sudo on Linux
   
 ## Get https://registry-1.docker.io/v2/: net/http: request canceled while waiting for connection (Client.Timeout exceeded while awaiting headers)
    * This is due to proxy configurations in your environment
    * Edit/Create the file/etc/systemd/system/docker.service.d/https-proxy.conf

    [Service]
    Environment="HTTPS_PROXY=https://www-proxy.yourcompany.com:80/"

    Restart docker after deamon reload,

    $ sudo systemctl daemon-reload
    $ sudo systemctl restart docker
