docker build -t shred86/p1-keycloak:latest -t shred86/p1-keycloak:$SHA -f ./p1-image/Dockerfile ./p1-image

docker push shred86/p1-keycloak:latest
docker push shred86/p1-keycloak:$SHA

kubectl apply -f k8s
kubectl set image deployments/p1-keycloak server=shred86/p1-keycloak:$SHA
