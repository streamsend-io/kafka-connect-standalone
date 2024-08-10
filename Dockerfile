FROM confluentinc/cp-server-connect-base:7.6.2

RUN FCONFIG=/etc/confluent/docker/configure  \
 && FLAUNCH=/etc/confluent/docker/launch \
 && sed -i "s/dub ensure CONNECT_CONFIG_STORAGE_TOPIC/dub ensure CONNECT_OFFSET_STORAGE_FILE_FILENAME/g" "${FCONFIG}" \
 && sed -i "s/dub ensure CONNECT_STATUS_STORAGE_TOPIC/#dub ensure CONNECT_STATUS_STORAGE_TOPIC/g" "${FCONFIG}" \
 && sed -i "s/dub ensure CONNECT_OFFSET_STORAGE_TOPIC/#dub ensure CONNECT_OFFSET_STORAGE_TOPIC/g" "${FCONFIG}" \
 && sed -i "s/exec connect-distributed/exec connect-standalone/g" "${FLAUNCH}"

