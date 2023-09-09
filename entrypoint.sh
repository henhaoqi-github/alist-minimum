#!/bin/bash

chown -R ${PUID}:${PGID} /myapp/alist/

umask ${UMASK}

exec su-exec ${PUID}:${PGID} ./alist server --no-prefix