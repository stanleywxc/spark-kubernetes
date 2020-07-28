FROM openjdk:8-jdk-alpine

RUN apk add --no-cache curl tar bash procps python

ARG hadoop_ver=3.2.1
ARG spark_ver=2.4.5
ARG aws_sdk_ver=1.11.792
ARG scala_ver=2.11.12
ARG maven_repo=https://repo1.maven.org/maven2

RUN mkdir -p /opt && \
    cd /opt && \
    curl -k https://downloads.lightbend.com/scala/${scala_ver}/scala-${scala_ver}.tgz | \
        tar -zx && \
    ln -s scala-${scala_ver} scala && \
    echo scala ${scala_ver} installed in /opt

RUN mkdir -p /opt && \
    cd /opt && \
    curl http://apache.mirrors.hoobly.com/hadoop/common/hadoop-${hadoop_ver}/hadoop-${hadoop_ver}.tar.gz | \
        tar -zx && \
    ln -s hadoop-${hadoop_ver} hadoop && \
    echo Hadoop ${hadoop_ver} installed in /opt

RUN mkdir -p /opt && \
    cd /opt && \
    curl https://archive.apache.org/dist/spark/spark-${spark_ver}/spark-${spark_ver}-bin-without-hadoop.tgz | \
        tar -zx && \
    ln -s spark-${spark_ver}-bin-without-hadoop spark && \
    echo Spark ${spark_ver} installed in /opt

ENV SCALA_HOME=/opt/scala
ENV PATH=$PATH:$SCALA_HOME/bin
ENV SPARK_HOME=/opt/spark
ENV PATH=$PATH:$SPARK_HOME/bin
ENV HADOOP_HOME=/opt/hadoop
ENV PATH=$PATH:$HADOOP_HOME/bin
ENV LD_LIBRARY_PATH=$HADOOP_HOME/lib/native

RUN curl ${maven_repo}/org/apache/hadoop/hadoop-aws/${hadoop_ver}/hadoop-aws-${hadoop_ver}.jar -o /opt/spark/jars/hadoop-aws-${hadoop_ver}.jar

RUN curl ${maven_repo}/org/apache/httpcomponents/httpclient/4.5.12/httpclient-4.5.12.jar -o /opt/spark/jars/httpclient-4.5.12.jar

RUN curl ${maven_repo}/joda-time/joda-time/2.9.9/joda-time-2.9.9.jar -o /opt/spark/jars/joda-time-2.9.9.jar

RUN curl ${maven_repo}/com/amazonaws/aws-java-sdk-core/${aws_sdk_ver}/aws-java-sdk-core-${aws_sdk_ver}.jar -o /opt/spark/jars/aws-java-sdk-core-${aws_sdk_ver}.jar
RUN curl ${maven_repo}/com/amazonaws/aws-java-sdk/${aws_sdk_ver}/aws-java-sdk-${aws_sdk_ver}.jar -o /opt/spark/jars/aws-java-sdk-${aws_sdk_ver}.jar
RUN curl ${maven_repo}/com/amazonaws/aws-java-sdk-kms/${aws_sdk_ver}/aws-java-sdk-kms-${aws_sdk_ver}.jar -o /opt/spark/jars/aws-java-sdk-kms-${aws_sdk_ver}.jar
RUN curl ${maven_repo}/com/amazonaws/aws-java-sdk-s3/${aws_sdk_ver}/aws-java-sdk-s3-${aws_sdk_ver}.jar -o /opt/spark/jars/aws-java-sdk-s3-${aws_sdk_ver}.jar
RUN curl ${maven_repo}/com/amazonaws/aws-java-sdk-dynamodb/${aws_sdk_ver}/aws-java-sdk-dynamodb-${aws_sdk_ver}.jar -o /opt/spark/jars/aws-java-sdk-dynamodb-${aws_sdk_ver}.jar

RUN curl ${maven_repo}/org/slf4j/slf4j-api/1.7.29/slf4j-api-1.7.29.jar -o /opt/spark/jars/slf4j-api-1.7.29.jar
RUN curl ${maven_repo}/org/slf4j/slf4j-log4j12/1.7.29/slf4j-log4j12-1.7.29.jar -o /opt/spark/jars/slf4j-log4j12-1.7.29.jar

ADD start-common.sh start-worker start-master /
ADD core-site.xml /opt/spark/conf/core-site.xml
ADD spark-defaults.conf /opt/spark/conf/spark-defaults.conf
ADD spark-env.sh /opt/spark/conf/spark-env.sh
ENV PATH $PATH:/opt/spark/bin

