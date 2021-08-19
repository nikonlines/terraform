FROM debian:latest

ENV USER_LOGIN="admin"
ENV USER_PASSWORD="admin"
#
ENV ROOT_PASSWORD=""
ENV ROOT_SSH_ENABLE="false"
#
ENV TERRAFORM_DIR /terraform

RUN apt-get update; \
    apt-get install -y sudo ssh vim nano mc git wget net-tools iputils-ping

WORKDIR ${TERRAFORM_DIR}

RUN apt-get update; \
    apt-get install -y gnupg software-properties-common curl; \
    curl -fsSL https://apt.releases.hashicorp.com/gpg | apt-key add -; \
#	apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"; \
    apt-add-repository "deb [$(dpkg --print-architecture)] https://apt.releases.hashicorp.com $(lsb_release -cs) main"; \
	apt-get update; \
	apt-get install terraform

COPY entrypoint.sh /
ENTRYPOINT ["/entrypoint.sh"]

VOLUME [ "${TERRAFORM_DIR}" ]

EXPOSE 22/tcp