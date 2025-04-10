FROM ubuntu:latest
LABEL authors="debas"

ENTRYPOINT ["top", "-b"]