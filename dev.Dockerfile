FROM debian:12 AS base

# Install build dependencies
RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends \
    build-essential \
    cmake \
    git \
    curl \
    wget \
    zlib1g-dev \
    libmariadb-dev \
    libboost-all-dev \
    libtinyxml-dev \
    ca-certificates \
    g++ \
    gdb \
    libutfcpp-dev \
    mariadb-client \
    passwd \
    && apt-get clean && rm -rf /var/lib/apt/lists/*

ENV MYSQL_INCLUDE_DIR="/usr/include/mariadb"
ENV MYSQL_LIBRARIES="/usr/lib/x86_64-linux-gnu/libmariadbclient.so"

# Create necessary directories
RUN mkdir -p /src/build /app /app/logs /app/server_cache /app/image_cache

# Set working directory
WORKDIR /src/build
