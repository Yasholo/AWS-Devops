# Installing Jenkins on Linux systems

Jenkins is an open-source automation server used primarily for continuous integration and continuous delivery (CI/CD) pipelines. It allows developers to automate the building, testing, and deployment of software projects.


Jenkins installers are available for several Linux distributions.

- Debian/Ubuntu
- Fedora
- Red Hat/Alma/Rocky

## Prerequisites

Minimum hardware requirements:

- 256 MB of RAM

- 1 GB of drive space (although 10 GB is a recommended minimum if running Jenkins as a Docker container)

Recommended hardware configuration for a small team:

- 4 GB+ of RAM
- 50 GB+ of drive space

Software requirements:
- Linux OS (offcourse) 
- Java should be installed ([Java Requirements](https://www.jenkins.io/doc/book/platform-information/support-policy-java/))

## Install Java
Jenkins requires Java to run, yet not all Linux distributions include Java by default. Additionally, [not all Java versions are compatible with Jenkins](https://www.jenkins.io/doc/book/platform-information/support-policy-java/).

1. Update Your System (ubuntu/debian in this case): Before installing any new software, it's a good practice to ensure your system is up to date. You can do this by running:
```
sudo apt update
sudo apt upgrade
```
2. Install Default Java Runtime: You can install the default Java Runtime Environment (JRE), which is suitable for running Java applications, using the following command:
```
sudo apt install default-jre
```
3. Verify Installation: After installation, you can verify that Java is installed correctly by checking the version:
```
java --version
```
This command should display the installed Java version. If it does, then Java is successfully installed on your system.


## Install Jenkins
You can install jenkins using the supported package manager for you OS (apt for ubuntu/debian, dnf for fedora, yum for Red Hat) or by setting up the repo. 

1. Update Your System (ubuntu/debian in this case): Before installing any new software, it's a good practice to ensure your system is up to date. You can do this by running:
```
sudo apt update
sudo apt upgrade
```
2. Install Java: Jenkins requires Java to run. You can install Java using the following command:
```
sudo apt install default-jre
```
3. Add Jenkins Repository: You'll need to add the Jenkins repository to your system to install it. This involves adding the repository key and then adding the repository itself:
```
wget -q -O - https://pkg.jenkins.io/debian-stable/jenkins.io.key | sudo apt-key add -
```
Next, add the Jenkins repository to your system:
```
sudo sh -c 'echo deb http://pkg.jenkins.io/debian-stable binary/ > /etc/apt/sources.list.d/jenkins.list'
```
4. Install Jenkins: Now that you've added the repository, you can install Jenkins using apt:
```
sudo apt update
sudo apt install jenkins
```
5. Start Jenkins: Once installed, you can start Jenkins using the following command:
```
sudo systemctl start jenkins
```
6. Enable Jenkins: To ensure Jenkins starts automatically when your system boots, run:
```
sudo systemctl enable jenkins
```
7. Access Jenkins: Jenkins should now be running on your server. You can access it by opening a web browser and navigating to 
```
http://your_server_ip_or_domain:8080
```
Follow the on-screen instructions to complete the setup.
