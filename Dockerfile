FROM quay.io/keycloak/keycloak:26.4

WORKDIR /opt/keycloak

ENV KC_DB=postgres

RUN /opt/keycloak/bin/kc.sh build

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

CMD ["start", "--optimized"]