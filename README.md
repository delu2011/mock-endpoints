# mock-endpoints
Some mock endpoints.

To build new docker image:

Edit Dockerfile as needed

Run the following docker command:

docker build -t delu2000/mock-endpoint-app .

docker login --username=delu2000

docker tag xxxxxxxxx delu2000/mock-endpoint-app:latest
where xxxxxxxxx is the docker image ID

docker push delu2000/mock-endpoint-app


K8s

minikube is an idle platfrom to test development

The following are needed to run minikube

install vagrant or xhyve

install kubectl

install minikube

To start minikube:

minikube start

NOTE: If you are using a different backend vm, pass --vm-driver=xxxx


To start a deployment, run:

kubectl create -f deployment.yaml

kubectl create -f service.yaml


To manage and view status:

kubectl get service/rs

kubectl describe service/rs


Updating

If changes in application is required, run

kubectl apply -f deployment.yaml
