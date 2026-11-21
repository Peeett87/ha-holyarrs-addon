ARG THEMERR_IMAGE=lizardbyte/themerr:latest
FROM ${THEMERR_IMAGE}

USER root
COPY run-themerr.sh /usr/local/bin/run-themerr.sh
RUN chmod 755 /usr/local/bin/run-themerr.sh

ENTRYPOINT ["/usr/local/bin/run-themerr.sh"]
