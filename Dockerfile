# python image
FROM python:3.10-slim

# set the working directory
WORKDIR /app

# copy and install requirements
COPY requirements.txt ./
RUN pip install -r requirements.txt

# copy rest of the application code
COPY  . .

# collect static files
# RUN python manage.py collectstatic --noinput

# Expose to port 8000
EXPOSE 8000

# start django server

CMD ["uvicorn", "test_server_django.asgi:application", "--host", "0.0.0.0", "--port", "8000"]



