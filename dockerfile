# Use official Python runtime as base image
FROM python:3.11-slim

# Set working directory in container
WORKDIR /app

# Copy application files from current directory to container
COPY . /app/

# Install dependencies from requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Expose port (adjust based on your application)
EXPOSE 8000

# Set the command to run the application
CMD ["python", "app.py"]
