import os
import json
import requests
import boto3

def lambda_handler(event, context):
    # Fetch issues from Jira
    jira_url = os.environ['JIRA_URL']
    headers = {"Authorization": f"Bearer {os.environ['JIRA_TOKEN']}"}
    params = {"jql": "project = YOUR_PROJECT", "maxResults": 100}

    response = requests.get(jira_url, headers=headers, params=params)
    issues = response.json()["issues"]

    # Save to DynamoDB
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['ISSUES_TABLE'])
    
    with table.batch_writer() as batch:
        for issue in issues:
            batch.put_item(Item={
                "IssueID": issue["id"],
                "Title": issue["fields"]["summary"],
                "Status": issue["fields"]["status"]["name"],
                "Severity": issue["fields"]["priority"]["name"],
                "CreatedDate": issue["fields"]["created"]
            })
    
    return {"statusCode": 200}
