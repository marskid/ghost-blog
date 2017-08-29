FROM ghost:1.7

LABEL io.openshift.tags ghost
LABEL io.k8s.description Blog using ghost and github storage
LABEL io.openshift.expose-services 2368/tcp:http

ENV GHOST_INSTALL /var/lib/ghost
ENV GHOST_STORAGE $GHOST_INSTALL/content.orig/adapters/storage

WORKDIR $GHOST_INSTALL

ADD config.production.json $GHOST_INSTALL

ADD ghost-github $GHOST_STORAGE/ghost-github

WORKDIR $GHOST_STORAGE/ghost-github

RUN pwd && echo "Installing ghost-github. Please wait..." && npm install --production

WORKDIR $GHOST_INSTALL

EXPOSE 2368

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["node", "current/index.js"]