# CI/CD Pipeline with GitHub Actions and AWS ECS

## Overview
This project automates deployment of a Python Flask app to AWS ECS (Fargate) using GitHub Actions, showcasing CI/CD, containerization, and cloud orchestration.

## What It Does
- Deploys a "Hello, DevOps!" Flask app to ECS whenever code is pushed to the `main` branch.
- Uses Docker, ECR for container storage, and GitHub Actions for CI/CD.

## How I Built It
1. **App Development**: 
    - **Create A Simple App**: Write a Python Flask app (e.g., “Hello, World!”)
        ```python
        from flask import Flask
        app = Flask(__name__)
        @app.route('/')
        def hello():
            return "Hello, DevOps!"
        if __name__ == "__main__":
            app.run(host="0.0.0.0", port=5000)
        ```

    - **Dockerized it**: Add a Dockerfile.
        ```dockerfile
        FROM python:3.9-slim
        WORKDIR /app
        COPY . .
        RUN pip install flask
        CMD ["python", "app.py"]
        EXPOSE 5000(`Dockerfile`).
        ```

2. **AWS Setup**: Created an ECR repo (`my-flask-app`), an ECS cluster (`my-ecs-cluster`), a task definition (`my-flask-task`), and a service (`my-flask-service`) in Fargate.
3. **CI/CD Pipeline**: Configured `.github/workflows/deploy.yml` to build, push to ECR, and update ECS on push.
4. **Testing**: Pushed to GitHub, watched the pipeline run, and accessed the app at `http://<ECS-public-IP>:5000`.

## Tools Used
- AWS ECS (Fargate, Free Tier)
- AWS ECR (Free Tier)
- Docker
- GitHub Actions
- Python (Flask)

## Setup Instructions
- Clone this repo.
- Set up ECR, ECS cluster, task definition, and service in AWS (Fargate, port 5000).
- Add AWS credentials to GitHub Secrets (`AWS_ACCESS_KEY_ID`, `AWS_SECRET_ACCESS_KEY`).
- Update `deploy.yml` with your ECR URI and ECS details.
- Push to `main` to trigger deployment.
- Test at the ECS task’s public IP.

## Demo
[Insert ECS public IP or screenshot, e.g., `http://54.321.98.76:5000`]