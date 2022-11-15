echo "Criando as imagens..."

docker build -t fsfabio/projeto-backend:1.0 backend/.
docker build -t fsfabio/projeto-database:1.0 database/.

echo "Realizando push das imagens..."

docker push fsfabio/projeto-backend:1.0
docker push fsfabio/projeto-database:1.0

echo "Criando serviços no cluster Kubernetes..."

kubectl apply -f ./services.yml

echo "Criando os deployments..."

kubectl apply -f ./deployment.yml