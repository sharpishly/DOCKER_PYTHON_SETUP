FROM python:3.11-slim

RUN apt-get update && apt-get install -y nginx && apt-get clean

WORKDIR /app

COPY app.py requirements.txt ./
COPY nginx.conf /etc/nginx/sites-available/default
RUN ln -sf /etc/nginx/sites-available/default /etc/nginx/sites-enabled/default

RUN pip install --no-cache-dir -r requirements.txt

EXPOSE 80

CMD bash -c "nginx && gunicorn -w 4 -b 127.0.0.1:8000 app:app"
