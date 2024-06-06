# Use the official Python image from the Docker Hub
FROM python:3.9-alpine

# Set the working directory
WORKDIR /home/tushar/Documents

# Copy the current directory contents into the container at /app
COPY . /home/tushar/Documents


## Install any needed packages specified in requirements.txt
COPY requirements.txt .

# Upgrade pip first to avoid potential compatibility issues
RUN pip install --upgrade pip

# Install dependencies and allow the build to continue if some fail
RUN pip install --no-cache-dir -r requirements.txt || true

# Make port 8000 available to the world outside this container
EXPOSE 8000

# Define environment variable
ENV PYTHONUNBUFFERED 1

# Run the application
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]