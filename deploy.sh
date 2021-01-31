docker build -t dalglish14/multi-client:latest -t  -f ./client/Dockerfile ./client
docker build -t dalglish14/multi-server:latest -t  -f ./server/Dockerfile ./server
docker build -t dalglish14/multi-worker:latest -t  -f ./worker/Dockerfile ./worker
docker push dalglish14/multi-client:latest
docker push dalglish14/multi-server:latest
docker push dalglish14/multi-worker:latest
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=dalglish14/multi-server
kubectl set image deployments/client-deployment client=dalglish14/multi-client
kubectl set image deployments/worker-deployment worker=dalglish14/multi-worker