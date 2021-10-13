FROM python

WORKDIR /app

COPY . .

ENTRYPOINT ["python", "cgi.py"]