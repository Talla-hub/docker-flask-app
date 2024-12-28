FROM ubuntu

# Set working directory inside the container
WORKDIR /app

# Copy application files into the container
COPY requirements.txt /app/
COPY . /app/

# Install necessary dependencies
RUN apt-get update && \
    apt-get install -y python3 python3-pip && \
    pip install --no-cache-dir -r requirements.txt

# Expose the Flask application port
EXPOSE 5000

# Command to run your Flask application
ENTRYPOINT ["python3"]
CMD ["-m", "gunicorn", "-w", "4", "-b", "0.0.0.0:5000", "project:app"]
