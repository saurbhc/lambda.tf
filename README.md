# lambda.tf

## Initial Setup:
1. Install [terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
2. Install [awscli](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)
3. Setup [aws configure](https://docs.aws.amazon.com/cli/latest/userguide/cli-chap-configure.html)
4. (Optional) Install [jq](https://stedolan.github.io/jq/download/)

## Execution & Invocation Steps (dev):
1. Change directory to `tf/dev/` - where deployment needs to happen
    ```bash
    cd tf/dev/
    ```
2. Initialize terraform
    ```bash
    terraform init
    ```
3. Apply terraform
    ```bash
    terraform apply -auto-approve
    ```
4. Invoke AWS Lambda(s) on your terminal
    - ```bash
      aws lambda invoke --region=eu-west-1 --function-name=Hello /dev/stdout | jq
      ```
    - ```bash
      aws lambda invoke --region=eu-west-1 --function-name=Hi /dev/stdout | jq
      ```
    - ```bash
      aws lambda invoke --region=eu-west-1 --function-name=Ciao-dev /dev/stdout | jq
      ```
5. Hit API Endpoint
    - ```bash
      curl "$(terraform output -raw base_url)/hello"
      ```
    - ```bash
      curl "$(terraform output -raw base_url)/hi"
      ```
    - ```bash
      curl "$(terraform output -raw base_url)/ciao"
      ```

## Execution & Invocation Steps (prod):
1. Change directory to `tf/prod/` - where deployment needs to happen
    ```bash
    cd tf/prod/
    ```
2. Initialize terraform
    ```bash
    terraform init
    ```
3. Apply terraform
    ```bash
    terraform apply -auto-approve
    ```
4. Invoke AWS Lambda(s) on your terminal
    - ```bash
      aws lambda invoke --region=eu-west-1 --function-name=Ciao /dev/stdout | jq
      ```
5. Hit API Endpoint
    - ```bash
      curl "$(terraform output -raw base_url)/ciao"
      ```
