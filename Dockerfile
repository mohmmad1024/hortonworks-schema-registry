from openjdk:8u141-jdk


RUN apt-get update && \
    apt-get install -y gettext-base && \
    rm -rf /var/lib/apt/lists/* && \
    groupadd -r hortonworks && useradd --no-log-init -r -g hortonworks hortonworks && \
    mkdir -p /opt/ && \
    wget -O /opt/hortonworks-registry-0.5.1.zip https://github.com/hortonworks/registry/releases/download/v0.5.1/hortonworks-registry-0.5.1.zip && \
    unzip /opt/hortonworks-registry-0.5.1.zip -d /opt && \
    chown -R hortonworks:hortonworks /opt/hortonworks-registry-0.5.1 && \
    rm /opt/hortonworks-registry-0.5.1.zip && \
    ln -s /opt/hortonworks-registry-0.5.1 /opt/hortonworks-registry

RUN  wget -O /opt/hortonworks-registry/libs/mariadb-java-client-2.2.3.jar https://downloads.mariadb.com/Connectors/java/connector-java-2.2.3/mariadb-java-client-2.2.3.jar


WORKDIR /opt/hortonworks-registry

COPY config/registry.yaml.template /opt/hortonworks-registry/conf/registry.yaml.template
COPY entrypoint.sh /opt/hortonworks-registry/entrypoint.sh
COPY wait-for-it.sh /opt/hortonworks-registry/wait-for-it.sh

RUN chmod +x /opt/hortonworks-registry/entrypoint.sh && \
    chmod +x /opt/hortonworks-registry/wait-for-it.sh && \
    chown -R hortonworks:hortonworks /opt/hortonworks-registry-0.5.1

RUN /opt/hortonworks-registry/bootstrap/bootstrap-storage.sh check-connection; exit 0
	
ENV DB_NAME schema_registry
ENV DB_USER registry_user
ENV DB_PASSWORD registry_password
ENV DB_HOST localhost
ENV DB_PORT 3306

EXPOSE 9090

USER hortonworks

ENTRYPOINT ["./entrypoint.sh"]

CMD ["./bin/registry-server-start.sh","./conf/registry.yaml"]
