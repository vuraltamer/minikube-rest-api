FROM openjdk:17-alpine

USER root

# Install necessary tools to download kubectl
RUN apt-get update && \
    apt-get install -y apt-transport-https ca-certificates curl gnupg2 software-properties-common && \
    curl -fsSL https://packages.cloud.google.com/apt/doc/apt-key.gpg | apt-key add - && \
    echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | tee -a /etc/apt/sources.list.d/kubernetes.list && \
    apt-get update && \
    apt-get install -y kubectl

USER jenkins

WORKDIR minikube-rest-api

COPY ./build/libs/*.jar minikube-rest-api-1.0.0-plain.jar

CMD ["java", "-jar", "minikube-rest-api-1.0.0-plain.jar"]