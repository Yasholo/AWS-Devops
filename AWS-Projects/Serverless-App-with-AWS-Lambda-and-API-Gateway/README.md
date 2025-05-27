# Serverless API with AWS Lambda and API Gateway

## Overview
This project creates a serverless API using AWS Lambda and API Gateway, demonstrating modern cloud architecture.

## What It Does
- Exposes a simple GET endpoint that returns a JSON message ("Hello from Lambda!").
- Runs without managing servers, leveraging AWS’s serverless stack.

## Features

## Prerequisites
- AWS Lambda (Free Tier)
- AWS API Gateway (Free Tier)
- Python

## How I Built It
1. **Write the Lambda Function**: Create a Python script for the Lambda function, including the bonus feature to handle query parameters, returning a JSON response.
    File: `lambda_function.py`
    ```python
        import json

        def lambda_handler(event, context):
            # Extract query parameters (if any)
            query_params = event.get("queryStringParameters", {}) or {}
            name = query_params.get("name", "Lambda")  # Default to "Lambda" if no name provided

            # Create response message
            message = f"Hello from {name}!"

            return {
                "statusCode": 200,
                "body": json.dumps(message),
                "headers": {
                    "Content-Type": "application/json"
                }
            }
    ```
    ***Notes:***
    - Handles name query parameter (e.g., ?name=DevOps returns "Hello from DevOps!").
    - Default message: "Hello from Lambda!" if no parameter.
    - Includes headers for proper API Gateway response.


2. **Deploy the Lambda Function**: Upload the function to AWS Lambda.
    
    **Steps:**
    - **AWS Console > Lambda > Create function**.
        ![img1](images/image1.png)

        - **Function name**: `MyServerlessApp`.
        - **Runtime**: Python 3.9.
        - **Execution role**: Create a new role with basic Lambda permissions (auto-generated).
        - Click **Create** function.

        ![img2](images/image2.png)
        ![img3](images/image3.png)

    - **Upload Code**:
        - In the Code tab, select Upload from > .zip file.
        - Create a `.zip`:
            - Save `lambda_function.py` in a folder.
            - Zip the folder: `zip -r lambda_function.zip lambda_function.py`.
            ![img4](images/image4.png)
            ![img5](images/image5.png)
        - Upload `lambda_function.zip`.
            ![img6](images/image6.png)
        - Set **Handler**: `lambda_function.lambda_handler`.
            ![img7](images/image7.png)
        - Click **Deploy**.
        
    - **Test the Function**:
        - **Test** tab > **Create new test event**.
        - Event name: `TestEvent`.
        - Sample event JSON:
            ```json
            {
                "queryStringParameters": {
                    "name": "DevOps"
                }
            }
            ```
        - Click **Test**.
            ![img8](images/image8.png)
        - **Expected Output**:
            ```json
            {
                "statusCode": 200,
                "body": "\"Hello from DevOps!\"",
                "headers": {
                    "Content-Type": "application/json"
                }
            }
            ```
            ![img9](images/image9.png)
        - Test without parameters (empty {}) to get "Hello from Lambda!".
            ![img10](images/image10.png)
            ![img11](images/image11.png)

    - **Verify**:
        - If the test fails, check the **Execution results** or **CloudWatch Logs** (linked in the **Monitoring** tab) for errors (e.g., syntax issues in `lambda_function.py`).

3. **Set Up API Gateway**: Linked the function to an API Gateway GET method and deployed it to a public URL.

   **Steps:**
    - **AWS Console > API Gateway > Create API**.
        ![img12](images/image12.png)
        - Choose **REST API** (not HTTP API) > **Build**.
            ![img13](images/image13.png)
        - **API name**: `MyServerlessAPI`.
        - **Endpoint Type**: Regional.
        - Click **Create API**.
            ![img14](images/image14.png)

    - **Create Resource and Method**:
        - **Actions > Create Resource**.
            ![img15](images/image15.png)
            - Resource Name: `hello`.
            - Resource Path:` /hello`.
            - Enable **CORS** (optional for browser testing).
            - Click **Create Resource**.
                ![img16](images/image16.png)


        - Select `/hello` > **Actions** > **Create Method**.
            ![img17](images/image17.png)
            - Method: **GET**.
            - Integration Type: **Lambda Function**.
            - Region: `us-east-1`.
            - Lambda Function: `MyServerlessApp`.
            - Click **Create Method**
                ![img18](images/image18.png)
                ![img19](images/image19.png)

    - **Configure Method**:
        - Click **GET** > **Integration Request**.
            ![img20](images/image20.png)
        - Check **Use Lambda Proxy integration** (enables query parameters).
        - Click **Save**.
            ![img25](images/image25.png)

    - Deploy API:
        - **Actions** > **Deploy API**.
            ![img21](images/image21.png)
        - **Deployment stage**: New Stage.
        - **Stage name**: `prod`.
        - Click `Deploy`.
            ![img22](images/image22.png)
        - Note the **Invoke URL** (e.g., https://o9xtt5zs2e.execute-api.us-east-1.amazonaws.com/prod).
            ![img23](images/image23.png)

    - **Verify**:
        - Test the URL in a browser or `curl`
            - `https://<invoke-url>/prod/hello` → "Hello from Lambda!"
                ![img24](images/image24.png)
            - `https://<invoke-url>/prod/hello?name=DevOps` → "Hello from DevOps!"
                ![img26](images/image26.png)
        
        - If it fails, check:
            - **API Gateway** > **Logs/Tracing** (enable CloudWatch Logs if needed).
            - **Lambda** > **Monitoring** > **CloudWatch Logs** for errors.

4. **Bonus: Query Parameters**
    - Already implemented in `lambda_function.py`:
        - Handles `?name=<value>` (e.g., `?name=DevOps`).
        - Defaults to "Lambda" if no name parameter.
        
    - **Test**:
        - curl `https://<invoke-url>/prod/hello?name=YourName`
        - Expected: "Hello from YourName!"
            ![img27](images/image27.png)

5. **Clean Up**
To avoid Free Tier charges:

- **Lambda**: Delete `MyServerlessApp`.
- **API Gateway**: Delete `MyServerlessAPI`.
- **IAM**: Remove the Lambda execution role if not reused.

## Outcome

## Setup Instructions
- Clone this repo.
- Upload `lambda_function.py` to a new Lambda function.
- Configure API Gateway per AWS docs and deploy.

## Demo
**Without parameters**
    ![img24](images/image24.png)

**With parameters**
    ![img26](images/image26.png)