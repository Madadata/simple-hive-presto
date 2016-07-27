FROM java

ADD https://mirrors.ocf.berkeley.edu/apache/hadoop/common/stable/hadoop-2.7.2.tar.gz /tmp/
ADD https://mirrors.ocf.berkeley.edu/apache/hive/stable/apache-hive-1.2.1-bin.tar.gz /tmp/
ADD https://repo1.maven.org/maven2/com/facebook/presto/presto-server/0.150/presto-server-0.150.tar.gz /tmp/

RUN tar xvf /tmp/hadoop-2.7.2.tar.gz -C /opt && \
    tar xvf /tmp/apache-hive-1.2.1-bin.tar.gz -C /opt && \
    tar xvf /tmp/presto-server-0.150.tar.gz -C /opt && \
    rm tmp/*.tar.gz

ENV HADOOP_HOME /opt/hadoop-2.7.2
ENV HIVE_HOME /opt/apache-hive-1.2.1-bin
ENV PRESTO_HOME /opt/presto-server-0.150

WORKDIR $HIVE_HOME

CMD ["./bin/hiveserver2"]
