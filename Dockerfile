FROM python:3.11-slim

RUN apt-get update && apt-get install -y nginx && apt-get clean

WORKDIR /app

COPY app.py requirements.txt ./
COPY nginx.conf /etc/nginx/sites-available/default

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 80

CMD service nginx start && gunicorn -w 4 -b 127.0.0.1:8000 app:app
