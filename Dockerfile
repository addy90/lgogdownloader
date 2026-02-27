# build with: docker build -t lgogdownloader .

FROM debian:13 AS build
LABEL org.opencontainers.image.authors="addy90"

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm

RUN apt-get update && \
    apt-get install -y build-essential cmake ninja-build man-db pkg-config ninja-build git

RUN apt-get install -y libcurl4-openssl-dev libboost-regex-dev libjsoncpp-dev librhash-dev libtinyxml2-dev libtidy-dev \
                       libboost-system-dev libboost-filesystem-dev libboost-program-options-dev libboost-date-time-dev \
                       libboost-iostreams-dev zlib1g-dev

RUN mkdir /app && cd /app && \
    git clone https://github.com/Sude-/lgogdownloader.git && cd lgogdownloader && \
    cmake -B build -DCMAKE_INSTALL_PREFIX=/app/run -DCMAKE_BUILD_TYPE=Release && \
    cmake --build build --parallel $(nproc) --target install

FROM debian:13 AS run

COPY --from=build /app/run /usr

ENV DEBIAN_FRONTEND=noninteractive
ENV TERM=xterm

# extracted via apt-cache depends <libpackage-dev>
RUN apt-get update && \
    apt-get install -y libcurl4t64 libboost-regex1.83.0 libjsoncpp26 librhash1 libtinyxml2-11 libtidy58 \
                       libboost-system1.83.0 libboost-filesystem1.83.0 libboost-program-options1.83.0 libboost-date-time1.83.0 \
                       libboost-iostreams1.83.0 zlib1g

RUN apt-get install -y man-db adduser && \
    mandb && \
    adduser --system --shell /bin/bash --home /home/user --uid 99 --ingroup users user

USER user

WORKDIR /home/user

RUN echo "umask 0000" > .bashrc && mkdir downloads

VOLUME ["/home/user/.cache/lgogdownloader", "/home/user/.config/lgogdownloader", "/home/user/downloads"]

ENTRYPOINT ["/bin/bash"]
