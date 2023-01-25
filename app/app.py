import json


def lambda_handler(event, context):
    html = """
    <html>
        <head>
            <style>
                h1 {
                    font-size: 100px;
                    color: red;
                }
            </style>
        </head>
        <body>
            <h1>Todd's Serverless Webpage.</h1>
        </body>
    </html>
    """

    return {
        "statusCode": 200,
        "headers": {
            "Content-Type": "text/html"
        },
        "body": html
    }
