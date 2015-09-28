#!/bin/bash -i

# The following are documented (and stolen from) here:
#   http://redsymbol.net/articles/unofficial-bash-strict-mode/
#
# In case that link dies, here's the simple version:
# 1) -e means if there's an error, stop execution.
# 2) -u means if we reference an undefined variable, blow up.
# 3) -o pipefail means that if a step in a pipe fails, the whole pipe fails, which in combination with 1) means
#    that the script as a whole fails.

set -euo pipefail

sudo apt-get update -y

sudo apt-get -y install default-jdk maven vim zookeeper zookeeperd redis-server \
    python-software-properties python-pip python tree

sudo pip install redis

echo "Storm..."
# TODO maybe make this use the best mirror always?
sudo mkdir /opt/storm
cd /opt/storm
sudo wget http://it.apache.contactlab.it/storm/apache-storm-0.9.5/apache-storm-0.9.5.tar.gz
sudo tar xvzf apache-storm-0.9.5.tar.gz
sudo rm apache-storm-0.9.5.tar.gz
sudo chmod +x /opt/storm/apache-storm-0.9.5/bin/storm
sudo ln -s /opt/storm/apache-storm-0.9.5/bin/storm /usr/bin/storm
