#!/usr/bin/env bash

. /etc/profile
. /usr/local/bin/docker-entrypoint-functions.sh

MYUSER="${APPUSER}"
MYGID="${APPGID}"
MYUID="${APPUID}"

AutoUpgrade
ConfigureUser

if [ "${1}" == 'mtgapi' ]; then
  INSTALLDIR=/opt/mtgapi
  mkdir ${INSTALLDIR}/data
  chown ${MYUSER}:${MYUSER} ${INSTALLDIR}/data
  chmod 750 ${INSTALLDIR}/data

  RunDropletEntrypoint

  DockLog "Starting app: ${1}"
  cd ${INSTALLDIR}
  exec su-exec ${MYUSER} uwsgi --ini mtgapi.ini
else
  DockLog "Running command: ${1}"
  exec "$@"
fi


