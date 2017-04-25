FROM hashicorp/terraform:0.9.3

ENV TERRAGRUNT_VERSION=0.12.8

RUN curl -sSL -o /bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_386 \
    && chmod +x /bin/terragrunt
