FROM python:3.8.5

WORKDIR /app

COPY . .

ENTRYPOINT ["python3", "main.py"]