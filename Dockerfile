FROM ghost:1

LABEL Author Melvin Wang

ENV GHOST_INSTALL /var/lib/ghost
ENV GHOST_STORAGE $GHOST_INSTALL/content.orig/adapters/storage

WORKDIR $GHOST_INSTALL

ADD config.production.json $GHOST_INSTALL

ADD ghost-cloudinary-store $GHOST_STORAGE/ghost-cloudinary-store

WORKDIR $GHOST_STORAGE/ghost-cloudinary-store

RUN pwd && echo "Installing ghost-cloudinary-store. Please wait..." && npm install --production

WORKDIR $GHOST_INSTALL

EXPOSE 2368

ENTRYPOINT ["docker-entrypoint.sh"]

CMD ["node", "current/index.js"]
