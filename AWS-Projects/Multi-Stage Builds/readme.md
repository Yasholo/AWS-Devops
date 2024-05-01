# Introduction
We all know how crazy fast and lightweight and portable docker containers are! It has allowed developers to create better solutions by revolutionizing the tradition packaging and deployment of applications.

# What are Multi-Stage Docker Image Builds?
In the dynamic realm of software development and deployment, maximizing efficiency is paramount. Every moment holds significance in optimizing processes to minimize downtime and accelerate progress. Among the array of strategies available, leveraging multi-stage builds with Docker stands out as a method to enhance container image creation efficiency, ultimately reducing container size. It allows developers to create multiple build stages within a single Dockerfile.

# Multi-stage Docker builds offer several advantages:
1. Reduced Image Size: By using multiple stages, you can separate the build environment from the runtime environment. This allows you to discard unnecessary dependencies and artifacts from the final image, resulting in smaller container sizes.

2. Enhanced Security: Since the final image only contains the essential components required for runtime, the attack surface is minimized, reducing the potential vulnerabilities.

3. Faster Builds: Multi-stage builds can streamline the build process by breaking it into smaller, more manageable stages. This can result in faster build times, especially for complex projects where unnecessary steps are eliminated in subsequent stages.

4. Simplified Maintenance: With a clear separation between build and runtime environments, it’s easier to maintain and update Dockerfiles. Changes to the build environment won’t affect the final image, making it simpler to manage dependencies and updates.

5. Better Reproducibility: Multi-stage builds allow for more consistent and reproducible builds across different environments. Since each stage is isolated, the final image is less likely to be affected by variations in the build environment.

6. Optimized Development Workflow: Developers can focus on writing code without worrying about the intricacies of building and optimizing container images. Multi-stage builds automate much of the process, allowing for a smoother development workflow.

Overall, multi-stage Docker builds offer a streamlined approach to building efficient and secure container images, improving both development and deployment processes.

No more BS! Let’s dive into the hands on to see the magic of multi-stage Docker builds.
In this demo, we create a custom docker image for simple python calculator app.

First, let’s build the docker image without using the multi-stage build.

Let’s write a Dockerfile to create a container image of our Calculator application:

```
#Dockerfile

#Base Image

FROM ubuntu 
RUN apt-get update && apt-get install -y python3 python3-pip
WORKDIR /app
COPY calculator.py /app
CMD ["python3", "calculator.py"]
```

To build the Docker image from this Dockerfile, navigate to the directory containing both the Dockerfile and calculator.py, and then run the following command (“simplecalculator” is the name I want to give to my Image):

```
docker build -t simplecalculator .
```

Run the command “docker images” to see your image details


You can see our “calculator-app” image is built! [Do note the Size of the image]

Now, let’s create the same docker image using the multi-stage build!

Let’s write another Dockerfile for our multi-stage build.

```
#Dockerfile

#Base Image
FROM ubuntu AS builder
RUN apt-get update && apt-get install -y python3 python3-pip
WORKDIR /app
COPY calculator.py /app

#Here we do the magic of Multi Stage Build!

FROM ubuntu AS runtime 
COPY --from=builder /app /app
WORKDIR /app
CMD ["python3", "calculator.py"]

```

Let’s build it now:

```
docker build -t calculator-app-multistage .
```

Run the command “docker images” to see your image details


Do you see the difference!!! It’s the same application performing the same task but the normal docker build is 490mb and multistage docker build is just 77.9mb

We used an ubuntu base image here, if we use another lighter distros we can further reduce the size of our image!!!

[try to use lighter distros (e.g. alpine linux, busybox, scratch, debian slim) and see how much the size reduces]

Wasn’t it awesome! the same task but lesser storage and faster! MAGIC :)