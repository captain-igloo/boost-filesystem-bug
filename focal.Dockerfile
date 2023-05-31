FROM ubuntu:focal

COPY main.cpp /test-boost/

WORKDIR /test-boost

RUN apt update && apt install -y g++ libboost-filesystem1.71-dev libboost-filesystem1.71.0 \
    && touch /tmp/a /tmp/b /tmp/c \
    && g++ main.cpp -lboost_filesystem
