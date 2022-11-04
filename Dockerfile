
FROM nginx
COPY nginx/nginx.conf /etc/nginx/nginx.conf

FROM python:3.8
ADD /src /code
WORKDIR /code
RUN pip install -r requirements.txt
CMD python app.py