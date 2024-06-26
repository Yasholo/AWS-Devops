# AWS-Continuous-Integration-Continuous-Deployment-Demo
<img src="readme/CI-flowchart.png" />

## Set Up GitHub Repository

The first step in our CI journey is to set up a GitHub repository to store our Python application's source code. 

If you already have a repository, feel free to skip this step. Otherwise, let's create a new repository on GitHub by following these steps:

- Go to github.com and sign in to your account.
- Click on the "+" button in the top-right corner and select "New repository."
- Give your repository a name and an optional description.
- Choose the appropriate visibility option based on your needs.
- Initialize the repository with a README file.
- Click on the "Create repository" button to create your new GitHub repository.

Great! Now that we have our repository set up.

Next Step is to push you Python application in the github repository. (You can search online, how to push your code to a github repository.)

Now we are all set with our github, we can move on to the next step.

## (Optional) Create an AWS IAM user for the practice of this project.

You can follow these articles:  
- [Creating-Iam-User-Medium](https://medium.com/@Yasholo/creating-an-iam-user-in-aws-207ce765d579)
Tho its not mandatory to create a seprate IAM user to use aws, you can use the root user aswell. 
- [Creating-Iam-User-LinkedIn](https://www.linkedin.com/pulse/creating-iam-user-aws-yash-kumar-qrwhc/?trackingId=5jqj1hMdTkyPzoPjgfvWLQ%3D%3D)



<!-- But it is a good practice to not use the root user as you might end up messing some important or basic AWS settings.

Also you can controll all the permission for the IAM user account from the root account easily.

Steps:
- Login to your AWS root account.
- Go to Identity and Access Management (IAM).
- IAM Dashboard will open up 
<img src="readme/IAM dashboard.png" />

- Click on User >> Create User 
- Enter your desired user name, check the access to AWS managent console option, choose a console password (either auto generated or custom), then click next.
<img src="readme/Iam-user.png" />

- In set permission, select 'Attach Policies directly' (or other options if you know about them ) >> Select 'AdministratorAccess' (You can select specific policy aswell for better security and control, but for now we will go with admin access) and then click on next.
<img src="readme/Policies.png" />

- Review your settings and then click on create user
<img src="readme/review.png" />

- User created! Now download the .csv file it will contain ur security credentials.
<img src="csv.png" /> -->

- Now lets login to this IAM user and get started!

## Configure AWS CodeBuild

In this step, we'll configure AWS CodeBuild to build our Python application based on the specifications we define. CodeBuild will take care of building and packaging our application for deployment. Follow these steps:

- In the AWS Management Console, navigate to the AWS CodeBuild service.
- Click on the "Create build project" button.

<img src="readme/codebuild.png" />

- Provide a name for your build project.

<img src="readme/buildname.png" />

- For the source provider, choose "Github".

<img src="readme/sourcegit1.png" />

- Now we need to connect our aws account to github.

<img src="readme/sourcegit2.png" />

- After connecting to github u can see all your personal repositories. Select the repository that contains you python application.

<img src="readme/sourcegit3.png" />

- Select the pipeline you created in the previous step.
- Configure the build environment, such as the operating system, runtime, and compute resources required for your Python application.

<img src="readme/environment.png" />

- In additional configuration of environment enable the flag for elevated docker build image privilages. Let rest configurations as it is.

<img src="readme/addEnvironment.png" />

- We need to write build commands but for that we would need some sensitive information like usernames and passwords. So to use them without exposing it to others we are going to use "AWS Systems Manager".
- Go to Systems Manager (you can search for it in the search bar) 
- In the system manager on the left hand side index search for "parameter store" and click on it.

<img src="readme/systemmanager.png" />

- Click on "Create Parameter" 
- Now we need to create parameters. These paramteres are docker credentials. We need 3 parameters for this project, Docker username, docker password, docker registry url. Follow a convetional naming system so that it is easy to recall what the parameter is for. Also select type are SecureString.

<img src="readme/addparameter.png" />
<img src="readme/3parameters.png" />

- Remember to add the AWS Systems Manager service role in your codebuild service role group, without this step the codebuild won't be able to communicate with systems manager.

<img src="readme/policyssm.png" />

- Now Specify the build commands, such as installing dependencies and running tests. Customize this based on your application's requirements. (refer the image below for help)

<img src="readme/buildspec.png" />

- For this project as we are pushing on Dockerhub we don't need it but, You can set up the artifacts configuration to generate the build output required for deployment.


- Review the build project settings and click on the "Create build project" button to create your AWS CodeBuild project.

- Yay! You did it! With AWS CodeBuild all set up, we're now ready to witness the magic of continuous integration in action.

<img src="readme/startbuild.png" />
<img src="readme/succeed.png" />

- Let me show you that our Project actually worked... Remember we have specified in our buildspec file to push our application on docker hub. Let's go to docker hub and check out if it worked. 

<img src="readme/Output.png" text="Yes It Did!" />

- So, Now you know how to make your own AWS Codebuild project Kudos to you!  Now go use this tool to make exciting CI projects!

## Configure AWS CodeDeploy
<img src="readme/CICD.png" />

In this step, we'll configure AWS CodeDeploy.
- In the AWS Management Console, navigate to the AWS CodeDeploy service. Then Click on Create Application.

<img src="readme/Codedeploy.png" />

- Give the name of the application and select compute platform. 

<img src="readme/deployapp.png" />

- Now to deploy this app we need an ec2 instance. So lets create one! Go to EC2 instances, Launch instance, select the required settings like name, image, instance type (use t2.micro for free tier), Key pair, network settings (make sure public ip is enabled, and u can use the default vpc), and then create on Launch instance.

<img src="readme/ec2.png" />

- We need to create a tag for this instance which will be used by aws codedeploy (because there can be multiple instances and tags help in identifying a instance with particular key-value pair easily.)
<img src="readme/tag1.png" />
<img src="readme/tag2.png" />

- Now we need to install an agent in this EC2 instance. 
    - Login to EC2
    - you can follow the following documentation: [Installing CodeDeploy agent for ubuntu server](https://docs.aws.amazon.com/codedeploy/latest/userguide/codedeploy-agent-operations-install-ubuntu.html)
    
    - Here is a history of commands I used.
    <img src="readme/agent.png" />

- Now its time to give our EC2 instance some permissions so that it can communicate to aws CodeDeploy and vice-versa. To do that we will create an IAM role and grant our ec2 instace with this role.

- Go to IAM >> Roles >> Create role >> select "EC2" in use case >> click next >> select 'AmazonEC2FullAccess' >>  next >> Give Role name >> click create role. (Similarly create one more role for use case: "CodeDeploy")
<img src="readme/deployrole.png" />
<img src="readme/deployrole2.png" />
<img src="readme/ec2-codedeploy-role.png" />

- Your role has been created now lets assign it to our ec2 instance. 
    Click on Instance >> Actions >> Security >> Modify IAM Role >> Choose you IAM role from dropdown  list >> click "Update IAM Role"

- Once you have updated IAM Role, go to ur instance terminal and restart the service. {sudo systemctl restart codedeploy-agent}

- Now in CodeDeploy we need to create deployment group to establish connect with ec2. 
    Click on "Create Deployment Group" >> enter name for the group >> select service role (with usecase as codedeploy)>> Deployment type: In-place >> Environment config: Amazon EC2 Instance >> select key-value pair >> disable loadbalancer for now >> click on "create deployment group" 
<img src="readme/deploymentgrp.png" />
<img src="readme/deploymentgrp2.png" />
<img src="readme/deploymentgrp3.png" />

- Now, a final task! We need to create deployment. Go to your CodeDeploy application, and in the "Deployments" section click on "Create deployment" button.

<img src="readme/deployments.png" />

- Select the deployment group that we just created.
- In revision type, select Github (If your github account is created you would see you github name alias, If not connected, write you github username in the input field and then click on "connect to github" and follow the steps, your account will connect!)
- Now select the repository which contains you python flask app and other required files (use the same repo as used for CodeBuild.) give its latest commit ID.

<img src="readme/deployments2.png" />

- Other settings you can modify if you want to and then click on "Create deployment" button.

<img src="readme/deployments3.png" />

- If you see that the deployment fails on the first step. (This fail is due to the ec2 instance not running and thus code deploy agent not running on the instance.)

<img src="readme/deployments4.png" />

To solve this fail, make sure your instance in running and in the instance the code deploy agent is up!

- Now click on 'Retry deployment' button.
- This time the deployment will fail on the 'Beforeinstall" step. 

The reason for this is that we need one "appspec.yaml" file, which if you look at the github repository is available but it is not at the root of the repository. (i.e yasholo/AWS-Devops) [I have used a repository which has multiple repositories and our sample app has many parent repositories. You can avoid it by initialising a new github repository which contains only the required files and has appspec.yml at the root]

<img src="readme/deployments5.png" />

- Let's fix this issue. I am linking my [github repo](https://github.com/Yasholo/AWS-Devops.git) for your reference. 

- All you need to do is create an appspec.yml file at the root of the repository and two bash scripts (start_container.sh and stop_container.sh). 

<img src="readme/deployments6.png" />

(make sure to put the start_container.sh and stop_container.sh in new scripts repository. )

<img src="readme/scripts.png" />

- You can refer to these files to get an idea about what we need to do in these scripts. (We are basically pulling our docker image from the docker hub which we created in our codebuild project, and the we are running the container in daemon mode.)

<img src="readme/deployments7.png" />
<img src="readme/deployments8.png" />
<img src="readme/deployments9.png" />

- Before we rerun our deployment, make sure you have docker installed on your ec2 instance(sudo apt install docker.io -y), we can put that command in the appspec.yml file aswell but lets do it manually for now.

- Now we are all set! Let's retry new deployment with a new(latest) commit ID and hit "Create deployment". (if this doesn't works you can create a new deployment group and then create deployment [I did the same!])

<img src="readme/deployments10.png" />

- Your deployment should succeed now!

<img src="readme/deployments11.png" />

The point of all this deployment was to take our code from docker hub and deploy it on our EC2 instance. As our deployment have succeeded we should have a docker container running on our instance with the same name as we gave it while CodeBuild. Also we should be able to access our webpage on localhost:port 5000 or from the public IP of the instance. Now, let's check if the magic happend!

- Go to your EC2 instance and run "sudo docker ps"

<img src="readme/deployments12.png" />

Great! our docker container is up and running!

Congratulations! You have learned to use CodeDeploy pretty well! Give yourself a pat on the back!.


## Create an AWS CodePipeline

<img src="readme/CICDpipeline.png" >

In this step, we'll create an AWS CodePipeline to automate the continuous integration process for our Python application. AWS CodePipeline will orchestrate the flow of changes from our GitHub repository to the deployment of our application. Let's go ahead and set it up:

This is a flow chart for our pipeline:

<img src="readme/CICD.png">

### Pipeline uses AWS CodeBuild to build our Python application based on the specifications we define. We will push this application on docker hub. There is nothing you need to do manually just setup the Codebuild and it will take care of building and packaging our application for deployment. Then, the Pipeline configure CodeDeploy to take our code from docker hub and deploy the simple-python-flask application on the EC2 instance. I have done both CodeBuild and CodeDeploy projects individually, but AWS Pipeline combines all of it and automates all the stuff! And whenever we make an update to our Github repo the Pipelines roll back automatically!

- Go to the AWS Management Console and navigate to the AWS CodePipeline service.

<img src="readme/Pipeline1.png" />

- Click on the "Create pipeline" button.

<img src="readme/Pipeline2.png" />

- Provide a name for your pipeline and click on the "Next" button. (We will leave the rest settings as it is for now)

<img src="readme/Pipeline3.png" />

- For the source stage, select "GitHub" as the source provider. (Github (Version 2) is recommended for better security)

<img src="readme/Pipeline4.png" />

- Connect your GitHub account to AWS CodePipeline

<img src="readme/Pipeline5.png" />
<img src="readme/Pipeline6.png" />
<img src="readme/Pipeline7.png" />
<img src="readme/Pipeline8.png" />
<img src="readme/Pipeline9.png" />
<img src="readme/Pipeline10.png" />
<img src="readme/Pipeline11.png" />
<img src="readme/Pipeline12.png" />

- Select your repository.
- Choose the branch you want to use for your pipeline.

<img src="readme/Pipeline13.png" />

- In Trigger type, choose "No filter" for now. Then click on Next.

<img src="readme/Pipeline14.png" />


- In the build stage, Select "Skip build stage" since you're using a pre-existing CodeBuild project.

<img src="readme/Pipeline15.png" />

- [Create a new CodeBuild project](https://www.linkedin.com/pulse/configuring-aws-codebuild-build-our-application-pushing-yash-kumar-rbr2c/) (Make sure to do neccessary changes in your buildspec file.) by clicking on the "Create project" button.

<img src="readme/Buildspecupdate.png" />

- Configure the CodeBuild project with the necessary settings for your Python application, such as the build environment,  build commands, and artifacts.
- Save the CodeBuild project and go back to CodePipeline.
- Or if you have an already built codebuild, use it from the dropdown list. Then, click Next.

<img src="readme/Pipeline16.png" />

- Continue configuring the pipeline stages, such as deploying your application using AWS Elastic Beanstalk or any other suitable deployment option.
- We are choosing AWS CodeDeploy for now.
- You can refer this article to create [CodeDeploy application](https://www.linkedin.com/pulse/configuring-aws-codedeploy-yash-kumar-qqfhf/?trackingId=Qpt5LoA%2FQceV3l3q3Ot0Sw%3D%3D)
 
<img src="readme/Pipeline17.png" />
<img src="readme/Pipeline18.png" />

- Review the pipeline configuration and click on the "Create pipeline" button to create your AWS CodePipeline.

<img src="readme/Pipeline19.png" />

- Awesome job! We now have our pipeline ready to roll.

- Your pipeline is successfully created and as you can see all stages have passed!

<img src="readme/Pipeline20.png" />
<img src="readme/final1.png">
<img src="readme/final2.png">
<img src="readme/final3.png">

### [Note: There can be multiple instances when your pipeline fails! Don't dishearten yourself, keep trying and you will succedd! I myself donno how many times I failed when I was working on this project, there was a problem with my codedepploy stage and it took me days to solve it! I got frustrated too but I knew I could solve it so I kept trying :) Just don't give up]

## Tips: 
- Make sure your EC2 instance is up and running.
- Inside EC2 make sure CodeDeploy agent is running.
- AWS Pipeline usese S3 to store artifacts, make sure EC2, CodeDeploy, CodeBuild, CodePipeline all have access to S3 (Use IAM roles to do it).
- Your Buildspec and Appspec file should be properly written. 
- Try to use a fresh Github repository for your project for minimum errors and ease with dealing with file paths.
- If you still face any problem feel free to [contact me](https://www.linkedin.com/in/yasholo), I will try my best to help you solve your errors :)
- Do Close the port on which you are are running your application before trying to re-run it. (You can add a command in the script to close the port automatically)

## Trigger the Pipeline

In this final step, we'll trigger the Pipeline by making a change to our GitHub repository. Let's see how it works:

- Go to your GitHub repository and make a change to your Python application's source code. It could be a bug fix, a new feature, or any other change you want to introduce.
- Commit and push your changes to the branch configured in your AWS CodePipeline.
- Head over to the AWS CodePipeline console and navigate to your pipeline.
- You should see the pipeline automatically kick off as soon as it detects the changes in your repository.
- Sit back and relax while AWS CodePipeline takes care of the rest. It will fetch the latest code, trigger the build process with AWS CodeBuild, and deploy the application if you configured the deployment stage.

# HURRAY! YOU DID IT! WE DID IT!
