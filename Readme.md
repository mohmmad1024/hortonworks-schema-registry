# Docker image for Hortonworks Schema Registry

A Docker image for running Hortonworks Schema Registry with MySQL

http://registry-project.readthedocs.io/en/latest/

## Environment Variables

### DB_USER

MySQL database user. Default registry_user

### DB_NAME

MySQL database name. Default schema_registry

### DB_USER

MySQL user. Default registry_user


### DB_PASSWORD

MySQL password. Default registry_password


### DB_HOST

MySQL user. Default localhost (needs to be provided as image does not have MySQL)


### DB_PORT

MySQL user. Default 3306

## PORT

### 9090

Registry Port

## URLs

Useful links once image is running.


### Main UI

http://localhost:9090


### Swagger UI

http://localhost:9090/api/swagger


## Example Docker Compose

```
git clone https://github.com/mohmmad1024/hortonworks-schema-registry.git
cd hortonworks-schema-registry
```
then run the docker-compose.yml example 
```
docker-compose up -d
```
or just [![Try in PWD](https://cdn.rawgit.com/play-with-docker/stacks/cff22438/assets/images/button.png)](http://play-with-docker.com?stack=https://raw.githubusercontent.com/mohmmad1024/hortonworks-schema-registry/master/docker-compose.yml)
```
/api/v1/schemaregistry/schemas/{name}/versions/latest

```