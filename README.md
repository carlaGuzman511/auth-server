# auth-server

Keycloak identity server for the organ donation app (realm `organ-donation-prod`).

## Local development

`docker-compose.yml` starts Keycloak together with an isolated local Postgres
(`postgres` service, data in the `identity-server-pgdata` volume). The database
connection is pinned in the compose file, so a local run never touches the
production Neon database.

1. Copy `.env.example` to `.env.local` and set the bootstrap admin credentials.
   Any `KC_DB_*` values in `.env.local` are ignored by the compose file.
2. Run `docker compose up --build`.
3. Open http://localhost:8080. The prod realm JSON is imported into the local DB on startup.

To reset the local database: `docker compose down -v`.

## Production

Production is deployed on Render from the `Dockerfile`. The `KC_DB_*` and
`KC_BOOTSTRAP_ADMIN_*` variables are set in the Render dashboard, never in a
file in this repository.
