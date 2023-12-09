FROM mysql:5.7

# Set environment variables for MySQL
ENV MYSQL_DATABASE=ojt_with-data
ENV MYSQL_USER=root
ENV MYSQL_PASSWORD=
ENV MYSQL_ROOT_PASSWORD=

# When the container starts, this SQL will be executed.
COPY ojt_with-data.sql /docker-entrypoint-initdb.d/

# By default, MySQL listens on port 3306
EXPOSE 3306