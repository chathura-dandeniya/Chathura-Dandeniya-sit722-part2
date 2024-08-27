# Dockerfile for book_catalog microservice

# Use the official Python image as a base
FROM python:slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file into the container
COPY book_catalog/requirements.txt .

# Install any dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy only necessary files from the book_catalog directory
COPY book_catalog/main.py /app/
COPY book_catalog/config.py /app/
COPY book_catalog/db.py /app/
COPY book_catalog/models.py /app/
COPY book_catalog/schemas.py /app/

# Specify the command to run on container start
CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]