FROM public.ecr.aws/spacelift/runner-terraform:latest

USER root

RUN apk -U upgrade && apk add --no-cache \
    ruby \
    ruby-dev \
    ruby-bundler

USER spacelift
