FROM ubuntu:jammy
LABEL description="Valgrind and Clion Docker"

RUN apt-get -y update && apt-get -y upgrade \
  && apt-get -y install vim build-essential cmake make clang gcc valgrind libxext-dev libbsd-dev xorg gdb zip unzip wget curl pip python3-setuptools \
  && apt-get clean && rm -rf /var/lib/apt/lists/* && rm -rf /tmp/*

RUN wget -q https://download.jetbrains.com/cpp/CLion-2023.1.3.tar.gz&& \
    tar xfz CLion-2023.1.3.tar.gz -C /opt && \
    rm CLion-2023.1.3.tar.gz

# Set CLion PATH
ENV PATH="/opt/clion-2023.1.3/bin:${PATH}"  



# Export Display for XServer Forwarding [In case of WSL + MLX]
RUN echo "export DISPLAY=host.docker.internal:0.0" >> /root/.bashrc && echo "export DISPLAY=host.docker.internal:0.0" >> /root/.zshrc



WORKDIR /PlayHere

LABEL originsource="Dale Furneaux <opinfosec>" \
  version="3.0.2"
LABEL reversedby="Abir Abbas <uknowwho>" \
    version="1.0.0"
