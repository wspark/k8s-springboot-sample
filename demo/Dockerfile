FROM wspark83/springboot:openjdk8-custom

# maintainer
LABEL maintainer="jjomacson@gmail.com"
# timezone setting
ENV TZ=Asia/Seoul
# root user
USER root
# for application log
RUN mkdir -p /logs
# maven
ARG JAR_FILE=target/demo-0.0.1-SNAPSHOT.jar

COPY ${JAR_FILE} /app.jar

RUN chown jboss:root /logs
RUN chown jboss:root /app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app.jar"
