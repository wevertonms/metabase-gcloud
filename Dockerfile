FROM openjdk:8

ADD https://dl.google.com/cloudsql/cloud_sql_proxy.linux.amd64 ./cloud_sql_proxy
ADD https://downloads.metabase.com/v0.34.3/metabase.jar ./metabase.jar

RUN chmod +x ./cloud_sql_proxy

CMD ./cloud_sql_proxy -instances=$METABASE_SQL_INSTANCE=tcp:$MB_DB_PORT & java -jar ./metabase.jar
