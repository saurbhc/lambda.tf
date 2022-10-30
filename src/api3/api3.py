def ciao(event, context) -> dict:
    result = "Ciao!!"

    return {
        'statusCode' : 200,
        'body': result
    }