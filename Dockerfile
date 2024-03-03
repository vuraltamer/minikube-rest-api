FROM openjdk:17-alpine

USER root

RUN apk add --no-cache kubectl

USER jenkins

WORKDIR minikube-rest-api

COPY ./build/libs/*.jar minikube-rest-api-1.0.0-plain.jar

CMD ["java", "-jar", "minikube-rest-api-1.0.0-plain.jar"]