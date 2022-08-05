### SpringBoot 어플리케이션 컨네이너 이미지 만들기

* springboot 소스 빌드
```text
# springboot pom.xml경로에서 maven 빌드
mvnw package
```
* Dockerfile
```text
# 소스를 내부 컨테이너에 복사하여 java로 기동
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
#ARG JAR_FILE=target/demo-0.0.1-SNAPSHOT.jar

COPY ${JAR_FILE} /app.jar

RUN chown jboss:root /logs
RUN chown jboss:root /app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app.jar"]

```

* 컨테이너 이미지 빌드하고 이미지저장소에 Push

```text
# 환경변수 확인(이미지 Repository/IMAGE_NAME/TAG)
./script/env.sh
#!/bin/sh
export CONTAINER_NAME=sample-v1.1
export IMAGE_NAME=wspark83/springboot
export REGISTRY="docker.io"
export TAG=sample-v1.1

#컨테이너 이미지 빌드 및 Push
# build.sh 내용
#!/bin/sh
. ./env.sh
buildah bud --format=docker -t ${REGISTRY}/${IMAGE_NAME}:${TAG} ../
buildah login -u wspark83 -p $password ${REGISTRY}
buildah push  ${REGISTRY}/${IMAGE_NAME}:${TAG}

#build.sh 실행
$ ./build.sh

- buildah 실행안되는 경우 binary 설치 필요(podman/docker로 변경가능)
```


### k8s에서 배포하기
```text
# namespace 생성
kubectl create namespace wspark

# deployment 생성
kubectl create deployment springboot-demo --image docker.io/wspark83/springboot:sample-v1.1  -n wspark

# 외부접속용 svc nodeport 변경
kubectl expose deployment springboot-demo --port 8080 --target-port 8080 --type NodePort -n wspark

# nodeport 확인
kubectl get svc -n wspark
NAME              TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
springboot-demo   NodePort   10.101.65.210   <none>        8080:31236/TCP   2d1h


[root@wspark-kube-mas01 springboot-sample]# kubectl get svc -n wspark
NAME              TYPE       CLUSTER-IP      EXTERNAL-IP   PORT(S)          AGE
springboot-demo   NodePort   10.98.183.180   <none>        8080:31236/TCP   14d

# 서비스호출
curl 10.65.41.81:31236
hostname : springboot-demo-6b9fc99f58-7vlfr!, os : Linux!
 
```