sudo iptables -F;
sudo service docker restart;
oc cluster up --public-hostname=10.8.173.196 --routing-suffix=10.8.173.196.xip.io;
