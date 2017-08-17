FROM hashicorp/terraform:0.10.2

ENV TERRAGRUNT_VERSION=0.13.0

RUN curl -sSL -o /bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_386 \
    && chmod +x /bin/terragrunt
