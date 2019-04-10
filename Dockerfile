FROM busybox as build

ARG VERSION
ENV FILE hugo_extended_${VERSION}_Linux-64bit.tar.gz
WORKDIR /tmp/
RUN wget -O hugo.tgz https://github.com/gohugoio/hugo/releases/download/v${VERSION}/${FILE}
RUN tar xvzf hugo.tgz
RUN chmod +x /tmp/hugo


FROM gcr.io/distroless/static
COPY --from=build /tmp/hugo /usr/local/bin/hugo
CMD ["hugo"]
