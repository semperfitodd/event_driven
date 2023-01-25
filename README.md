# event_driven

### Build Lambda function to host serverless website

1. Build infrastructure. This makes the assumption you have terraform, aws cli/credentials correctly set up.

```
terraform init
terraform plan -out=plan.out
terraform apply plan.out
```
This will build a lambda, upload the application, and output a URL.

2. Go to lambda_function_url that is output from the terraform apply.

    a. web browser

    b. curl <lambda_function_url>
