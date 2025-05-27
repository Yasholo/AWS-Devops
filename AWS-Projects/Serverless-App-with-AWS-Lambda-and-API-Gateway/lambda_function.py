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