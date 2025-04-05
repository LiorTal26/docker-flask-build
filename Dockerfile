# Use an official Python base image
FROM python:3.11-alpine3.16
# TEST
# Set working directory inside the container
WORKDIR /app

# Copy your requirements file first (better for caching)
COPY req_docker_pip.txt .
#test git actions
# Install build tools and additional dependencies using apk
RUN apk update && apk add --no-cache build-base openblas-dev gfortran vim

# Upgrade pip, setuptools, and wheel
RUN pip install --upgrade pip setuptools wheel
# Install dependencies from requirements file
RUN pip install --no-cache-dir -r req_docker_pip.txt
RUN apt update && apt install vim -y


# Copy the rest of the application
COPY . .

# Expose port 5000 for Flask
EXPOSE 4000

# Run the Flask app
CMD ["python", "flask_docker.py"]
