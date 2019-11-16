FROM debian:latest
MAINTAINER addy90

ENV DEBIAN_FRONTEND noninteractive
ENV TERM xterm

RUN apt-get update && \
    apt-get install -y apt-utils sudo && \
    apt-get install -y libcurl4-openssl-dev libboost-regex-dev libjsoncpp-dev \
    librhash-dev libtinyxml2-dev libhtmlcxx-dev libboost-system-dev \
    libboost-filesystem-dev libboost-program-options-dev libboost-date-time-dev \
    libboost-iostreams-dev libssl-dev zlib1g-dev && \
    apt-get install -y build-essential help2man cmake pkg-config git && \
    cd /tmp && \
    git clone https://github.com/Sude-/lgogdownloader.git && \
    cd lgogdownloader && \
    mkdir build && \
    cd build && \
    cmake .. -DCMAKE_INSTALL_PREFIX=/usr -DCMAKE_BUILD_TYPE=Release && \
    make && \
    make install && \
    cd /tmp && \
    rm -rf lgogdownloader && \
    apt-get purge -y build-essential help2man cmake pkg-config git && \
    apt-get autoremove --purge -y && \
    apt-get clean && \
    adduser --system --shell /bin/bash --home /home/user --uid 99 --ingroup users user && \
    sudo -u user echo "umask 0000" > /home/user/.bashrc && \
    sudo -u user mkdir /home/user/downloads

VOLUME ["/home/user/.cache/lgogdownloader", "/home/user/.config/lgogdownloader", "/home/user/downloads"]
