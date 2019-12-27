FROM icyleafcn/alpine:latest
LABEL maintainer="icyleaf <icyleaf.cn@gmail.com>"

ENV HUGO_VERSION 0.55.6-r0
ARG HUGO_HIGHLIGHT=yes

RUN set -ex && \
    apk --update --no-cache add hugo=${HUGO_VERSION} && \
    [ "${HUGO_HIGHLIGHT}" == "yes" ] && apk add py-pygments && \
    hugo version

WORKDIR /site
VOLUME /site

EXPOSE 1313
