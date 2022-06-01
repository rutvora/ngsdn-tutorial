#!/bin/bash

make p4-build
make app-build
make restart
echo "Sleeping for 1m to let Mininet and ONOS boot"
sleep 60
make app-reload
make netcfg
echo "If no failures are shown above, we are good to go!"
echo "You need to manually do a bidirectional ping (i.e. ping h2 from h4 and then ping h4 from h2) so that both devices are discovered by the switch. The first ping from h2 to h4 will fail as h4 is not discovered till then"
echo "Then you can continue pinging either from the other and it'll work"
