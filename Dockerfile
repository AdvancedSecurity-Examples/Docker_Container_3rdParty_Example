# a really old, vulnerable nodejs base image, using Debian 8
FROM vaikas/nodejsservice

# some metadata so we can correlate the image with the source
LABEL org.opencontainers.image.source = "https://github.com/aegilops/testing-container-security"
LABEL org.opencontainers.image.path "Dockerfile"
LABEL org.opencontainers.image.title "testing-container-security"
LABEL org.opencontainers.image.description "A very old base nodejs image"
LABEL org.opencontainers.image.authors "@aegilops"
LABEL org.opencontainers.image.licenses "Copyright GitHub (C) 2023"
LABEL org.opencontainers.image.documentation https://github.com/aegilops/testing-container-security/README.md

# Runner user
RUN adduser --disabled-password --gecos "" --uid 1000 runner

# Make and set the working directory
RUN mkdir -p /test \
    && chown -R $USERNAME:$GID /test

WORKDIR /test

USER runner

# and that's it, this image doesn't really need to do anything
