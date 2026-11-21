# Themerr Home Assistant add-on

This is the standalone Themerr application, not the retired Jellyfin plugin.
It uses the official upstream image as its base and preserves the upstream
entrypoint and non-root runtime user.

## Ports
- `9494/tcp`: Themerr web interface (HTTPS; locally generated certificate)
- `9495/tcp`: Jellyfin connector repository (HTTP)

## Persistent storage and encryption key
- Themerr application data/database: `/config` (Home Assistant add-on config).
- Credential encryption key: `/ssl/themerr-tokens.key` (Home Assistant SSL
  directory, mounted read-only into the add-on). This is deliberately outside
  `/config`, as required by the official Themerr Docker documentation.

Before connecting Jellyfin, create the key once from the Home Assistant Terminal
(add-on) or another shell that can write to HA's `/ssl` directory:

```sh
python3 -c 'import base64, os; print(base64.urlsafe_b64encode(os.urandom(32)).decode())' > /ssl/themerr-tokens.key
chmod 600 /ssl/themerr-tokens.key
```

Never regenerate or delete this key after connecting Jellyfin. Back it up securely.

## First start
1. Create the key above.
2. Install and start the add-on.
3. Open `https://<HOME_ASSISTANT_IP>:9494` and complete Themerr's initial setup.
4. In Themerr, add the Jellyfin server using an address reachable from the add-on.
   Do not use `localhost` for Jellyfin.
5. Create a Jellyfin API key in Jellyfin Dashboard > Advanced > API Keys.
6. Set the Themerr address on the Jellyfin server card to
   `http://<HOME_ASSISTANT_IP>:9495` when Jellyfin needs the HTTP connector
   repository. Follow the connector installation status shown by Themerr.

Enable Theme songs in each Jellyfin client under user settings > Display > Library.

## Updates
GitHub Actions checks for new stable upstream Docker tags daily, builds amd64
and arm64 add-on images, publishes `latest` and version tags to GHCR, and updates
this add-on's version in `config.yaml`. Home Assistant then detects the version
change as an add-on update. GHCR package visibility must be set to Public for
Home Assistant to pull the image without registry credentials.
