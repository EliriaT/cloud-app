# Getting Started

### Running the Application

```
./gradlew bootRun
```

Open [http://localhost:8080](http://localhost:8080) in your browser.

### Building the Application

```
./gradlew bootJar
```

### Running the Application as a Docker Container

```
...
java -jar ./build/libs/tech-challenge-0.0.1-SNAPSHOT.jar
```

### Requirements

1. This project should be made to run as a Docker image.
2. Docker image should be published to a Docker registry.
3. Docker image should be deployed to a Kubernetes cluster.
4. Kubernetes cluster should be running on a cloud provider.
5. Kubernetes cluster should be accessible from the internet.
6. Kubernetes cluster should be able to scale the application.
7. Kubernetes cluster should be able to update the application without downtime.
8. Kubernetes cluster should be able to rollback the application to a previous version.
9. Kubernetes cluster should be able to monitor the application.
10. Kubernetes cluster should be able to autoscale the application based on the load.

### Additional
1. Application logs should be stored in a centralised logging system (Loki, Kibana, etc.)
2. Application should be able to send metrics to a monitoring system.
3. Database should be running on a separate container.
4. Storage should be mounted to the database container.

### Commands

1. Building the docker image:

   `docker build -t cloud-app .`
2. Running the container:

   `docker run -it -p 8080:8080 cloud-app`
3. Push do docker hub registry:

   `docker push eliriat/cloud-app:tagname`
4. Applying the Kubernetes deployment configuration:

   `kubectl apply -f k8s/deployment.yaml`
5. Applying the Kubernetes service configuration:

   `kubectl apply -f k8s/service.yaml`
6. Rolling update the deployment:

   `kubectl set image deployment/cloud-app cloud-app=eliriat/cloud-app:newtag`

Just useful commands

   - `kubectl describe pod/service {name}`
   - `kubectl get pods/deployments/services/nodes -o wide --watch`
   - `kubectl get all`
   - `kubectl logs {pod-name}`
   - `kubectl exec -it {pod-name} -- /bin/sh`
   - `kubectl delete deployment {deployment-name}`
   - `kubectl delete -f {file-name}`
   - `kubectl get replicaset`
   - `kubectl delete -f {file-name}`
   - `minikube service cloud-app-service`
   - `kubectl create namespace {namespace-name}`
     minikube addons enable ingress
