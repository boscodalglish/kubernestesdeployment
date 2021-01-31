docker build -t dalglish14/multi-client:latest -t dalglish14/multi-client$SHA -f ./client/Dockerfile ./client
docker build -t dalglish14/multi-server:latest -t dalglish14/multi-server$SHA -f ./server/Dockerfile ./server
docker build -t dalglish14/multi-worker:latest -t dalglish14/multi-worker$SHA -f ./worker/Dockerfile ./worker
docker push dalglish14/multi-client:latest
docker push dalglish14/multi-client:$SHA
docker push dalglish14/multi-server:latest
docker push dalglish14/multi-server:$SHA
docker push dalglish14/multi-worker:latest
docker push dalglish14/multi-worker:$SHA
kubectl apply -f k8s
kubectl set image deployments/server-deployment server=dalglish14/multi-server:$SHA
kubectl set image deployments/client-deployment client=dalglish14/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=dalglish14/multi-worker:$SHA