def hi(event, context) -> dict:
    result = "Hi!!"

    return {
        'statusCode' : 200,
        'body': result
    }