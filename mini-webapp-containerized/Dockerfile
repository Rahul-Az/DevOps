# Use official Python image
FROM python:3.11-slim

# Set work directory
WORKDIR /app

# Copy app files
COPY requirements.txt .
RUN pip install -r requirements.txt

COPY . .

# Expose port
EXPOSE 5000

# Run the app
CMD ["python", "app.py"]
