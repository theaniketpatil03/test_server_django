# python image
FROM python:3.10-slim

# Set the working directory
WORKDIR /app

# Copy and install requirements
COPY requirements.txt ./

# Install system dependencies
RUN apt-get update && \
    apt-get install -y \
    libpq-dev \ 
    python3-dev \
    build-essential \
    --no-install-recommends && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Python dependencies
RUN pip install -r requirements.txt

# Copy rest of the application code
COPY . .

# Collect static files (if needed)
# RUN python manage.py collectstatic --noinput

# Expose port 8000
EXPOSE 8000

# Start Django server
CMD ["uvicorn", "test_server_django.asgi:application", "--host", "0.0.0.0", "--port", "8000"]
