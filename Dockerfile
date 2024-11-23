
FROM python:3.9-slim

WORKDIR /app

COPY . /app

RUN pip install --no-cache-dir flask

EXPOSE 8080

ENV FLASK_APP=app.py

CMD ["python", "app.py", "--host=0.0.0.0", "--port=8080"]

