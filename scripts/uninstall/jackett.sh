#!/bin/bash
#
# Licensed under GNU General Public License v3.0 GPL-3 (in short)
#
#   You may copy, distribute and modify the software as long as you track
#   changes/dates in source files. Any modifications to our software
#   including (via compiler) GPL-licensed code must also be made available
#   under the GPL along with build & install instructions.
#
#################################################################################

#stop and remove docker container
docker stop $USER-jackett
docker rm $USER-jackett
#remove config and Organizr tab
rm -rf $DOCKER_CONFIG/jackett
sqlite3 $DOCKER_CONFIG/organizr/www/users.db "delete from tabs where url is 'https://$DOCKER_HOSTNAME/$USER/jackett/';"
docker restart $USER-organizr
