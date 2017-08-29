#bash

sudo iptables -F;
sudo service docker restart;
sudo oc cluster up --public-hostname=10.8.174.97 --routing-suffix=10.8.174.97.xip.io;

