# Use the official PostgreSQL image from Docker Hub
FROM postgres:latest

# Set environment variables for PostgreSQL database
ENV POSTGRES_USER=test
ENV POSTGRES_PASSWORD=mypassword
ENV POSTGRES_DB=data

# Copy the SQL file into the Docker container
COPY database.sql /docker-entrypoint-initdb.d/
#COPY examples.sql /docker-entrypoint-initdb.d/

# Expose the PostgreSQL port
EXPOSE 5432
