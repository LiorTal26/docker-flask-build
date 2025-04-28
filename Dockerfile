# Use an official Python base image
FROM python:3.11-alpine3.16

# Set working directory inside the container
WORKDIR /app

# Copy your requirements file first (better for caching)
COPY req_docker_pip.txt .

# Install build tools and additional dependencies using apk
RUN apk update && apk add --no-cache build-base openblas-dev gfortran vim

# Upgrade pip, setuptools, and wheel
RUN pip install --upgrade pip setuptools wheel

# Install dependencies from requirements file
RUN pip install --no-cache-dir -r req_docker_pip.txt

# Copy the rest of the application
COPY . .

# Expose port 4000 for Flask
EXPOSE 5000

# Run the Flask app
CMD ["python", "flask_docker.py"]
