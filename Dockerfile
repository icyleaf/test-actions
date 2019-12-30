FROM icyleafcn/alpine:latest

ARG BUILD_DATE
ARG VCS_REF
ARG HUGO_VERSION=0.55.6-r0
ARG HUGO_HIGHLIGHT=yes

LABEL com.icyleaf.docker.build-date=$BUILD_DATE \
      com.icyleaf.docker.vcs-ref=$VCS_REF \
      com.icyleaf.docker.version=$HUGO_VERSION \
      com.icyleaf.docker.name="Hugo" \
      com.icyleaf.docker.description="Hugo for Docker" \
      com.icyleaf.docker.maintaner="icyleaf <icyleaf.cn@gmail.com>" \
      com.icyleaf.docker.schema-version="1.0"

RUN set -ex && \
    apk --update --no-cache add hugo=${HUGO_VERSION} && \
    [ "${HUGO_HIGHLIGHT}" == "yes" ] && apk add py-pygments && \
    hugo version

WORKDIR /site
VOLUME /site

EXPOSE 1313
