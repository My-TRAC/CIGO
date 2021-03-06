#!/bin/bash


#export URL="kafka-connect-avor:28083"
export IP=`docker-machine ip cigo`
export URL="$IP:28083"
export MYSQL="$MYSQL_HOST"


eval $(docker-machine env cigo)

  

echo ""
echo "Adding connector to $URL/connectors"

echo ""
echo ""

#curl -X POST \
#  -H "Content-Type: application/json" \
#  --data "{ \"name\": \"cigo-jdbc-sink\", \"config\": { \"connector.class\": \"io.confluent.connect.jdbc.JdbcSinkConnector\", \"connection.url\": \"jdbc:mysql://mysql:3306/sink_table?user=root&password=confluent\", \"topics\":\"ratings\", \"auto.create\":\"true\", \"task.max\":1} }" \
#  $URL/connectors


curl -X POST -H "Content-Type: application/json" --data "{\"name\": \"cigo-jdbc-sink\", \"config\": {\"connector.class\":\"io.confluent.connect.jdbc.JdbcSinkConnector\", \"tasks.max\":\"1\", \"topics\":\"ratings, ratings2\", \"connection.url\":\"jdbc:mysql://mysql:3306/connect_test?user=root&password=confluent\", \"key.converter\":\"io.confluent.connect.avro.AvroConverter\", \"key.converter.schema.registry.url\":\"http://schema-registry:8081\", \"value.converter\":\"io.confluent.connect.avro.AvroConverter\", \"value.converter.schema.registry.url\":\"http://schema-registry:8081\", \"insert.mode\":\"insert\", \"batch.size\":\"0\", \"auto.create\":\"true\", \"pk.mode\":\"none\", \"pk.fields\":\"none\" }}" $URL/connectors



  echo ""
  echo ""
