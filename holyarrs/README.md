# HolyArrs Home Assistant add-on

Gebruikt de officiële multi-architecture image `holyarrs/holyarrs`.
De `version` in `config.yaml` is tevens de Docker-image-tag die Supervisor ophaalt.

## Automatische versiecontrole

GitHub Actions controleert dagelijks Docker Hub op de hoogste stabiele `X.Y.Z`
tag. Als die hoger is dan de versie in `config.yaml`, wordt alleen die
version-regel bijgewerkt. Daarna kan Home Assistant Supervisor de update zien
en installeren volgens zijn eigen updatecyclus.

Activeer in GitHub: Settings → Actions → General → Workflow permissions →
Read and write permissions.

Handmatig uitvoeren: Actions → Check HolyArrs Docker tags → Run workflow.

## Belangrijk vóór migratie

- Maak eerst een volledige backup van de huidige Home Assistant-installatie.
- Bewaar `holyarrs.key` apart. Deze sleutel is nodig om opgeslagen geheimen te
  ontsleutelen; HolyArrs-backups bevatten deze sleutel niet.
- Deze configuratie gebruikt `/config` als persistente HolyArrs-data.
- De huidige lokale add-on en deze repository hebben allebei slug `holyarrs`.
  Voeg deze repository niet toe en verwijder de bestaande add-on niet voordat
  de migratie van de bestaande data-opslag zorgvuldig is uitgevoerd.
- De huidige lokale configuratie moet eerst worden vergeleken met deze
  repositoryconfiguratie. Vooral de mapkoppelingen moeten overeenkomen.

## Repository toevoegen na migratie

Instellingen → Apps → App Store → ⋮ → Repositories:
`https://github.com/Peeett87/ha-holyarrs-addon`

Zet daarna automatische updates aan voor HolyArrs. De GitHub-workflow werkt
alleen het versienummer in de repository bij; Supervisor beheert de installatie.
