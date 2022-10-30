def hello(event, context) -> dict:
    result = "Hello!!"

    return {
        'statusCode' : 200,
        'body': result
    }
