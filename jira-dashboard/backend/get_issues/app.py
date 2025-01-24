import json
import boto3

def lambda_handler(event, context):
    dynamodb = boto3.resource('dynamodb')
    table = dynamodb.Table(os.environ['ISSUES_TABLE'])
    
    # Fetch all issues (simplified for demo)
    response = table.scan()
    return {
        'statusCode': 200,
        'headers': {'Access-Control-Allow-Origin': '*'},
        'body': json.dumps(response['Items'])
    }
