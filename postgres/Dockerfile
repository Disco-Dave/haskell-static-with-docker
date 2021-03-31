FROM alpine:3.13

RUN echo "Installing system dependencies for ghcup, ghc, and stack" &&\
    apk --no-cache add \
        bash \
        binutils-gold \
        curl \
        g++ \
        gcc \
        gmp-dev \
        libffi-dev \
        make \
        ncurses-dev \
        perl \
        shadow \
        tar \
        xz

ARG GHCUP_VERSION=0.1.14
ARG GHCUP_SHA256SUM=e9b314d248f4d4604ce64cee1be7161c77c8940efd11986c9205779ec3b598dd

RUN echo "Downloading and installing ghcup $GHCUP_VERSION" &&\
    curl "https://downloads.haskell.org/~ghcup/$GHCUP_VERSION/x86_64-linux-ghcup-$GHCUP_VERSION" -o ghcup &&\
    if ! echo "$GHCUP_SHA256SUM  ghcup" | sha256sum -c -; then \
        echo "ghcup $GHCUP_VERSION checksum failed" >&2 &&\
        exit 1;\
    fi; \
    mv ./ghcup /usr/bin/ghcup &&\
    chmod +x /usr/bin/ghcup

ENV PATH="/.ghcup/bin:$PATH"
ENV GHCUP_INSTALL_BASE_PREFIX="/"

ARG GHC_VERSION=8.10.4
RUN echo "Downloading and installing ghc $GHC_VERSION" &&\
    ghcup install ghc --set $GHC_VERSION

ARG BUILD_DEPS=""
RUN if [ ! -z "$BUILD_DEPS" ]; then \
        echo "Installing additional build dependencies for project" &&\
        apk --no-cache add $BUILD_DEPS ; \
    fi
