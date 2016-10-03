# docker-images [![Build Status](https://travis-ci.org/trademachines/docker-images.svg?branch=master)](https://travis-ci.org/trademachines/docker-images)

# Images

## eyaml-kms
An image with [hiera-eyaml](https://github.com/TomPoulton/hiera-eyaml/) and the [hiera-eyaml-kms](https://github.com/adenot/hiera-eyaml-kms) plugin installed to be able to encrypt data locally.

Simply add an alias like ``alias eyaml-kms='docker run -it --rm -e "AWS_ACCESS_KEY_ID" -e "AWS_SECRET_ACCESS_KEY" trademachines/eyaml-kms:2.1'`` and then run it with ``eyaml-kms encrypt --encrypt-method=kms --kms-key-id=alias/my-key --kms-aws-region=eu-west-1 -s 'some string to decrypt'``
