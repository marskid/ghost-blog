FROM ghost:1.7

ENV GHOST_INSTALL /var/lib/ghost
ENV GHOST_STORAGE $GHOST_INSTALL/content/adapters/storage

WORKDIR $GHOST_INSTALL

ADD config.production.json $GHOST_INSTALL

ADD ghost-github $GHOST_STORAGE/ghost-github

EXPOSE 2368

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["node", "current/index.js"]