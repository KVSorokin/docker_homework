Create network for backend and database
docker network create --subnet 172.21.0.0/24 --gateway=172.21.0.1 --ip-range 172.21.0.0/24 --label=backend_db_net backend_db_net

Build image for backend
docker build -t back_app_upd -f Dockerfile_back .

Download and start database with credentials and network
docker run -d --name database --net backend_db_net --ip=172.21.0.2 -e POSTGRES_USER=django -e POSTGRES_PASSWORD=django  -e POSTGRES_NAME=django postgres:alpine3.14

Start backend Image
docker run -d -p 8080:8000 --name back_app_fin --net backend_db_net --ip=172.21.0.3 back_app_upd
