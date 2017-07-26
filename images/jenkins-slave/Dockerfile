FROM openshift/jenkins-slave-base-centos7 
RUN yum install -y epel-release wget; yum clean all

# Setup certificates for RedHat
RUN /usr/bin/wget -O RedHat_CA.crt --no-check-certificate https://password.corp.redhat.com/cacert.crt && \
    cat RedHat_CA.crt | /usr/bin/certutil -d sql:/etc/pki/nssdb -A -t "C,," -n RedHat_CA 

RUN /usr/bin/wget -O PnTDevOps_CA.crt --no-check-certificate http://engineering.redhat.com/Eng-CA.crt && \
    cat PnTDevOps_CA.crt | /usr/bin/certutil -d sql:/etc/pki/nssdb -A -t "C,," -n PnTDevOps_CA 

RUN /usr/bin/wget -O RH-IT-Root-CA.crt --no-check-certificate https://password.corp.redhat.com/RH-IT-Root-CA.crt && \
    cat RH-IT-Root-CA.crt | /usr/bin/certutil -d sql:/etc/pki/nssdb -A -t "C,," -n RH-IT-Root-CA 

