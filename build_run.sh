docker build -t flask-nginx-app .
#docker run -p 80:80 flask-nginx-app
docker run -p 127.0.0.1:2000:80 flask-nginx-app
