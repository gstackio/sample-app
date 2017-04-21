FROM busybox:ubuntu-14.04

ENTRYPOINT ["/sample-app"]

COPY sample-app /sample-app
RUN chmod a+x /sample-app