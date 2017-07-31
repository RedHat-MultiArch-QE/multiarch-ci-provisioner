FROM openshift/jenkins-slave-base-centos7 
RUN yum install -y epel-release; yum clean all

# Setup certificates for RedHat
RUN /usr/bin/curl > RedHat_CA.crt --insecure -L https://password.corp.redhat.com/cacert.crt && \
    cat RedHat_CA.crt | /usr/bin/certutil -d sql:/etc/pki/nssdb -A -t "C,," -n RedHat_CA 

RUN /usr/bin/curl > PnTDevOps_CA.crt --insecure -L https://engineering.redhat.com/Eng-CA.crt && \
    cat PnTDevOps_CA.crt | /usr/bin/certutil -d sql:/etc/pki/nssdb -A -t "C,," -n PnTDevOps_CA 

RUN /usr/bin/curl > RH-IT-Root-CA.crt --insecure -L https://password.corp.redhat.com/RH-IT-Root-CA.crt && \
    cat RH-IT-Root-CA.crt | /usr/bin/certutil -d sql:/etc/pki/nssdb -A -t "C,," -n RH-IT-Root-CA 

RUN mkdir /etc/beaker; cp RH-IT-Root-CA.crt /etc/beaker/ ; echo > /etc/beaker
