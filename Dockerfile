FROM rust:latest

RUN apt update && \
    apt upgrade -y && \
    apt install -y gcc-arm-linux-gnueabihf && \
    rustup target add armv7-unknown-linux-gnueabihf

WORKDIR /app

ENV CARGO_TARGET_ARMV7_UNKNOWN_LINUX_GNUEABIHF_LINKER=arm-linux-gnueabihf-gcc \
    CC_armv7-unknown_linux-gnueabihf=arm-linux-gnueabihf-gcc \
    CXX_armv7-unknown_linux-gnueabihf=arm-linux-gnueabihf-g++
