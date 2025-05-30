FROM kindest/node:v1.32.0
RUN apt update && apt install -y kbuild wget && rm -rf /var/lib/apt/lists/*
RUN cd /tmp && \
    curl -o a.deb http://security.ubuntu.com/ubuntu/pool/main/l/linux/linux-headers-5.4.0-177_5.4.0-177.197_all.deb && \
    dpkg -i a.deb && \
    rm a.deb && \
    curl -o b.deb http://archive.ubuntu.com/ubuntu/pool/main/l/linux/linux-modules-5.4.0-177-generic_5.4.0-177.197_amd64.deb && \
    dpkg -i b.deb && \
    rm b.deb
RUN wget https://go.dev/dl/go1.22.3.linux-amd64.tar.gz && \
    tar -C /usr/local -xzf go1.22.3.linux-amd64.tar.gz && \
    rm go1.22.3.linux-amd64.tar.gz
RUN /usr/local/go/bin/go install github.com/falcosecurity/driverkit@latest
RUN /root/go/bin/driverkit docker --output-module /tmp/falco.ko --kernelversion=$(uname -v | cut -f 1 -d - | tr -d \#) --kernelrelease=$(uname -r) --driverversion="7.0.0" --target=debian