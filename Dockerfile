FROM public.ecr.aws/spacelift/runner-terraform:latest

USER root

RUN apk -U upgrade && apk add --no-cache \
    ruby \
    ruby-dev \
    ruby-bundler

COPY scripts/erber.rb /usr/local/bin/erber.rb
RUN chmod a+x /usr/local/bin/erber.rb

USER spacelift
