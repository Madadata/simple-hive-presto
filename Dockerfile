FROM java:jre-alpine

MAINTAINER Jiayu Liu <etareduce@gmail.com>

ENV DEBIAN_FRONTEND noninteractive

ENV PRESTO_VERSION 0.160

RUN set -x \
    && apk add --no-cache --update --virtual .presto-deps \
        python \
    && python -V \
    && apk del .presto-deps \
    && wget -O /tmp/presto.tar.gz http://repo1.maven.org/maven2/com/facebook/presto/presto-server/$PRESTO_VERSION/presto-server-$PRESTO_VERSION.tar.gz \
    && mkdir -p /opt/presto \
    && tar -zxvf /tmp/presto.tar.gz -C /opt/presto \
    && rm /tmp/presto.tar.gz

ENV PRESTO_HOME /opt/presto/presto-server-$PRESTO_VERSION

COPY etc/ $PRESTO_HOME/etc/

EXPOSE 8080

WORKDIR $PRESTO_HOME

CMD ["bin/launcher", "run"]
