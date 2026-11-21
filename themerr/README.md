# Themerr Home Assistant add-on

Standalone Themerr service for Jellyfin. It is not the old Jellyfin plugin.

## Ports
- `9494/tcp`: Themerr web interface
- `9495/tcp`: HTTP Jellyfin connector repository

## Persistent data
The add-on mounts its Home Assistant add-on configuration directory at `/config`.
The startup wrapper creates and preserves `/config/themerr-tokens.key`. Do not delete
this file: it encrypts saved media-server credentials.

## Connect Jellyfin
Open `http://<HOME_ASSISTANT_IP>:9494`, complete the initial setup, and add your
Jellyfin server using an address reachable from the Themerr add-on. Do not use
`localhost` for Jellyfin because it would refer to the Themerr container itself.

When the Themerr UI uses its self-signed HTTPS certificate, the connector repository
is served on port `9495`; follow the current Themerr UI instructions for installing
the connector into Jellyfin.

## Updates
The repository workflow checks Docker Hub for the latest stable `lizardbyte/themerr`
tag and builds/publishes this add-on image for amd64 and aarch64. Home Assistant
then sees the add-on version update when `themerr/config.yaml` is updated in Git.
