FROM mysql:5.7

# Set environment variables for MySQL
ENV MYSQL_DATABASE=ojt_database
ENV MYSQL_USER=user
ENV MYSQL_PASSWORD=password
ENV MYSQL_ROOT_PASSWORD=rootpassword

# When the container starts, this SQL will be executed.
COPY ojt_with-data.sql /docker-entrypoint-initdb.d/

# By default, MySQL listens on port 3306
EXPOSE 3306