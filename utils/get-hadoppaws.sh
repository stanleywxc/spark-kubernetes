#!/bin/bash

HADOOP_VER=3.2.1
AWS_SDK_VER=1.11.792

curl https://repo1.maven.org/maven2/org/apache/hadoop/hadoop-aws/${HADOOP_VER}/hadoop-aws-${HADOOP_VER}.jar -o ./hadoop-aws-${HADOOP_VER}.jar
curl https://repo1.maven.org/maven2/org/apache/httpcomponents/httpclient/4.5.3/httpclient-4.5.3.jar -o ./httpclient-4.5.3.jar
curl https://repo1.maven.org/maven2/joda-time/joda-time/2.9.9/joda-time-2.9.9.jar -o ./joda-time-2.9.9.jar

curl https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-core/${AWS_SDK_VER}/aws-java-sdk-core-${AWS_SDK_VER}.jar -o ./aws-java-sdk-core-${AWS_SDK_VER}.jar
curl https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk/${AWS_SDK_VER}/aws-java-sdk-${AWS_SDK_VER}.jar -o ./aws-java-sdk-${AWS_SDK_VER}.jar
curl https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-kms/${AWS_SDK_VER}/aws-java-sdk-kms-${AWS_SDK_VER}.jar -o ./aws-java-sdk-kms-${AWS_SDK_VER}.jar
curl https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-s3/${AWS_SDK_VER}/aws-java-sdk-s3-${AWS_SDK_VER}.jar -o ./aws-java-sdk-s3-${AWS_SDK_VER}.jar
curl https://repo1.maven.org/maven2/com/amazonaws/aws-java-sdk-dynamodb/${AWS_SDK_VER}/aws-java-sdk-dynamodb-${AWS_SDK_VER}.jar -o ./aws-java-sdk-dynamodb-${AWS_SDK_VER}.jar