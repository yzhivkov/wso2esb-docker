ARG BASE_IMAGE
FROM ${BASE_IMAGE}

ARG ESB_VERSION=${VERSION:-5.0.0}

RUN echo "Downloading and installing ESB version: ${ESB_VERSION}"
RUN wget --no-verbose -P /opt https://wso2-stratos.s3.amazonaws.com/wso2esb-${ESB_VERSION}.zip && \
    apt-get update && \
    apt-get install -y zip && \
    apt-get clean && \
    unzip /opt/wso2esb-${ESB_VERSION}.zip -d /opt && \
    rm /opt/wso2esb-${ESB_VERSION}.zip

ENV WSO2_SERVER_HOME=/opt/wso2esb-${ESB_VERSION}

EXPOSE 9443 9763 8243 8280
WORKDIR ${WSO2_SERVER_HOME}
ENTRYPOINT ["bin/wso2server.sh"]

