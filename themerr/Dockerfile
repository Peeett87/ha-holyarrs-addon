ARG THEMERR_IMAGE=lizardbyte/themerr:latest
FROM ${THEMERR_IMAGE}

# Keep the upstream Themerr entrypoint and non-root user unchanged.
# The encryption key is stored in HA's persistent /ssl directory,
# outside the add-on's /config volume, as required by Themerr.
ENV THEMERR_TOKEN_KEY_FILE=/ssl/themerr-tokens.key
ENV TZ=Europe/Amsterdam
