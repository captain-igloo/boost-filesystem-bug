FROM ubuntu:jammy

COPY main.cpp /test-boost/

WORKDIR /test-boost

RUN apt update && apt install -y g++ libboost-filesystem1.74-dev libboost-filesystem1.74.0 \
    && touch /tmp/a /tmp/b /tmp/c \
    && g++ main.cpp -lboost_filesystem
