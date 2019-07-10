FROM maven:3-jdk-8 as builder

RUN rm /dev/random && ln -s /dev/urandom /dev/random

WORKDIR /opt/opentosca/camunda
COPY . /opt/opentosca/camunda
RUN mkdir --parents /root/.m2/; mv docker/settings.xml /root/.m2/settings.xml \
	&& mvn clean install -Ptomcat,h2 -Dmaven.test.skip=true


FROM openjdk:8
LABEL maintainer "Benjamin Weder <benjamin.weder@web.de>"

ENV VERSION camunda-bpm-tomcat-7.12.0-SNAPSHOT

WORKDIR /opt/opentosca/camunda

COPY --from=builder /opt/opentosca/camunda/distro/tomcat/distro/target/${VERSION}.zip /opt/opentosca/camunda

RUN unzip ${VERSION}.zip \
	&& rm ${VERSION}.zip \
	&& chmod +x server/apache-tomcat-9.0.19/bin/catalina.sh

EXPOSE 8080

CMD ./server/apache-tomcat-9.0.19/bin/catalina.sh run