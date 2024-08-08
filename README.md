# kafka-connect-standalone

This repo contains the Dockerfile to repackage confluentinc/cp-server-connect-base as streamsend/kafka-connect-standalone.
The connect-standalone container has been published to docker-hub, so you do not need to build a new version if this is accessible.

This repo contains a sample docker-compose.yml that you can use to instantiate a connect-standalone container.

The dockerfile changes are:
* remove require property CONNECT_CONFIG_STORAGE_TOPIC
* remove require property CONNECT_STATUS_STORAGE_TOPIC
* remove require property CONNECT_OFFSET_STORAGE_TOPIC
* add new property CONNECT_OFFSET_STORAGE_FILE_FILENAME
* change the container executable from connect-distributed/exec to connect-standalone

The docker-compose.yml
* starts a connect-standalone container with all of the mandatory properties
* it is configured for a SASL/SSL connection (this works ootb for Confluent Cloud) - modify the SASL properties as desired
* set environment variables BOOTSTRAP_SERVERS, API_KEY and SECRET before "docker compose up"
* it contains a (commented out) example confluent-hub command to install a connect plugin while starting the container


This container is used for the file-chunk source and sink connectors; which are accompanying repos in this github account.

Please raise issues for any concerns - thank you.

