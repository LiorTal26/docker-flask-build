# Use an official Python base image
FROM python:3.11-slim
# TEST
# Set working directory inside the container
WORKDIR /app

# Copy your requirements file first (better for caching)
COPY req_docker_pip.txt .

# Install dependencies from requirements file
RUN pip install --no-cache-dir -r req_docker_pip.txt
RUN apt update && apt install vim -y
#RUN apt install python3-dotenv

# Copy the rest of the application
COPY . .

# Expose port 5000 for Flask
EXPOSE 4000

# Run the Flask app
CMD ["python", "flask_docker.py"]
