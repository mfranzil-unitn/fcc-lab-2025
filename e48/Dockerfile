FROM kindest/node:v1.32.0

RUN echo "Installing gVisor binaries ..." \
    && set -e \
    && ARCH=$(uname -m) \
    && URL=https://storage.googleapis.com/gvisor/releases/release/latest/${ARCH} \
    && curl -sSL --retry 5 --output runsc "${URL}/runsc" \
    && curl -sSL --retry 5 --output runsc.sha512 "${URL}/runsc.sha512" \
    && curl -sSL --retry 5 --output containerd-shim-runsc-v1 "${URL}/containerd-shim-runsc-v1" \
    && curl -sSL --retry 5 --output containerd-shim-runsc-v1.sha512 "${URL}/containerd-shim-runsc-v1.sha512" \
    && sha512sum -c runsc.sha512 -c containerd-shim-runsc-v1.sha512 \
    && rm -f *.sha512 \
    && chmod a+rx runsc containerd-shim-runsc-v1 \
    && mv runsc containerd-shim-runsc-v1 /usr/local/bin 
