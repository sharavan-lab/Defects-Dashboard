import os
import json
import requests

def lambda_handler(event, context):
    body = json.loads(event["body"])
    
    # Jira API call
    jira_url = f"{os.environ['JIRA_URL']}/issue"
    headers = {
        "Authorization": f"Bearer {os.environ['JIRA_TOKEN']}",
        "Content-Type": "application/json"
    }
    payload = {
        "fields": {
            "project": {"key": os.environ["JIRA_PROJECT_KEY"]},
            "summary": body["summary"],
            "description": body["description"],
            "issuetype": {"name": "Task"}
        }
    }
    
    response = requests.post(jira_url, headers=headers, json=payload)
    return {
        "statusCode": 200,
        "headers": {"Access-Control-Allow-Origin": "*"},
        "body": json.dumps({"ticket_id": response.json()["key"]})
    }
