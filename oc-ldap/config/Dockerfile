ARG OC10_IMAGE
FROM owncloud/server

RUN apt -qqy update \
    && apt -qqy --no-install-recommends install \
    bash \
    make \
    git \
    && rm -rf /var/lib/apt/lists/* \
    && apt -qyy clean
