import json
import boto3
import os

# Initialize DynamoDB client
dynamodb = boto3.resource('dynamodb')
table = dynamodb.Table('VisitorCount') # Must match the name in main.tf

def handler(event, context):
    # 1. Update the item in DynamoDB
    # If the record doesn't exist, it initializes 'visits' at 0 and adds 1
    response = table.update_item(
        Key={'id': 'count'},
        UpdateExpression="ADD visits :inc",
        ExpressionAttributeValues={':inc': 1},
        ReturnValues="UPDATED_NEW"
    )
    
    views = response['Attributes']['visits']

    # 2. Return the response for your website
    return {
        'statusCode': 200,
        'headers': {
            'Access-Control-Allow-Origin': '*',
            'Access-Control-Allow-Headers': 'Content-Type',
            'Access-Control-Allow-Methods': 'OPTIONS,POST,GET'
        },
        'body': json.dumps({'count': int(views)})
    }