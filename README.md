## running this docker img using flask, pandas, env,

for env build:
change env to .env
change dockerignore to .dockerignore
then follow the steps:

# on the folder path terminal use:               
docker build -t my-env-flask-app .

docker run -d \
  --name <your_img_name> \
  --env-file .env \
  -p 5000:5000 \
  my-env-flask-app

* to see logs:
docker logs <your_img_name> -f


* you can pul this docker img:
docker pull liortal26/my-flask-app:v1.0.1

* for inspect using jq:
sudo apt install jq

docker inspect liortal26/my-flask-app:v1.0.1 | jq
