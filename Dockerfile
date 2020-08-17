FROM python:3.7-alpine
LABEL maintainer="starling1715@gmail.com"

ENV PYTHONUNBUFFERED 1

RUN mkdir /app
WORKDIR /app

#testing for development process
# COPY ./app /app

# RUN adduser -D user
# USER user

COPY requirements.txt requirements.txt
RUN pip install -r requirements.txt

EXPOSE 8000
EXPOSE 5678
# ENTRYPOINT [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]
