# Follow commands below to build and run the container
#
# > docker build . -t bouncmpe/jsonmerge:latest
# > docker run -it --rm -v $(PWD):/workspaces/project bouncmpe/jsonmerge

FROM ubuntu:22.04

RUN apt-get update && export DEBIAN_FRONTEND=noninteractive \
    && apt-get -y install \
        sudo \
        git \
        build-essential \
        cmake \
        ninja-build \
        python3-all-dev \
        python3-pip \
    && ln -s /usr/bin/python3 /usr/bin/python \
    && apt-get autoremove -y && apt-get clean -y && rm -rf /var/lib/apt/lists/* 
    
RUN git clone --depth 1 https://github.com/google/googletest.git /tmp/sources \
    && mkdir -p /tmp/sources/build && cd /tmp/sources/build \
    && cmake /tmp/sources -DBUILD_SHARED_LIBS=ON \
    && make -j2 && make install \
    && cd / && rm -rf /tmp/sources
   
RUN git clone --recursive --depth 1 --branch boost-1.79.0 https://github.com/boostorg/boost.git /tmp/sources \
    && cd /tmp/sources \
    && ./bootstrap.sh --prefix=/usr/local --with-libraries=json \
    && ./b2 install \
    && cd / && rm -rf /tmp/sources

RUN ldconfig

# Add a container user (good practice)
RUN groupadd work -g 1000 \
   && useradd -ms /bin/bash bouncmpe -g 1000 -u 1000 \
   && printf "bouncmpe:bouncmpe" | chpasswd \
   && printf "bouncmpe ALL= NOPASSWD: ALL\\n" >> /etc/sudoers

USER bouncmpe
