FROM quay.io/keycloak/keycloak:26.4

WORKDIR /opt/keycloak

ENV KC_DB=postgres

COPY realms/organ-donation/organ-donation-prod-realm.json /opt/keycloak/data/import/organ-donation-prod-realm.json

RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

CMD ["start", "--optimized", "--import-realm"]