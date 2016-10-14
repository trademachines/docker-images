FROM hashicorp/terraform:0.7.4

ENV SPOTINST_TERRAFORM_VERSION=0.7.4
ENV TERRAGRUNT_VERSION=0.1.1
ENV TERRAFORM_PROVIDERS_PATH=/etc/terraform/providers

RUN mkdir -p ${TERRAFORM_PROVIDERS_PATH} \
    && curl -sSL -o ${TERRAFORM_PROVIDERS_PATH}/terraform-provider-spotinst https://s3.amazonaws.com/spotinst-terraform/v${SPOTINST_TERRAFORM_VERSION}/linux_amd64/terraform-provider-spotinst \
    && chmod +x ${TERRAFORM_PROVIDERS_PATH}/terraform-provider-spotinst \
    && echo "providers { spotinst = \"${TERRAFORM_PROVIDERS_PATH}/terraform-provider-spotinst\" }" > ~/.terraformrc \
    && curl -sSL -o /bin/terragrunt https://github.com/gruntwork-io/terragrunt/releases/download/v${TERRAGRUNT_VERSION}/terragrunt_linux_386 \
    && chmod +x /bin/terragrunt
