FROM mysql:5.7

# Set environment variables for MySQL
ENV MYSQL_DATABASE=ojt_with-data
ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes

# When the container starts, this SQL will be executed.
COPY ojt_with-data.sql /docker-entrypoint-initdb.d/

# By default, MySQL listens on port 3306
EXPOSE 3306