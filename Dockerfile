FROM python:3.7.7-slim-stretch

WORKDIR /app

COPY requirements.txt app.py /app/
COPY static /app/static/
COPY templates /app/templates/

RUN    pip install --trusted-host pypi.python.org -r requirements.txt

EXPOSE 80

CMD ["python", "app.py"]
