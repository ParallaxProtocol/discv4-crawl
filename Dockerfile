FROM golang:latest

RUN apt-get update && apt-get install -y --no-install-recommends git curl jq openssh-client && \
  mkdir -p /root/.ssh && \
  ssh-keyscan github.com >> /root/.ssh/known_hosts && \
  chmod 600 /root/.ssh/known_hosts

EXPOSE 9100

WORKDIR /crawler
ADD run.sh .
CMD ["./run.sh"]
