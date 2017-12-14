FROM openshift/jenkins-slave-base-centos7

# Set home to root directory for caching purposes
# Set kerberos cache location env variable
# Disable host key checking explicitly - see https://github.com/ansible/ansible/issues/30720
ENV HOME=/root \
    KRB5CCNAME=FILE:/root/krb5cc_0 \
    ANSIBLE_HOST_KEY_CHECKING=False

# Set WORKDIR to HOME
WORKDIR /root

# Install all dependencies from yum
RUN yum-config-manager --add-repo=http://download.lab.eng.bos.redhat.com/beakerrepos/client/CentOS7/ && \
yum upgrade -y --skip-broken && \
yum install -y epel-release && \
yum install -y python python-devel python-pip && \
yum install -y beaker-common beakerlib beaker-client beaker-redhat python-beaker --nogpgcheck && \
yum install -y krb5-workstation libvirt-devel libyaml-devel openssl-devel libffi-devel gcc && \
yum clean all

# Install all pip dependencies
RUN pip install -U pip setuptools && \
    pip install -U beaker-common beaker-client && \
    pip install -U cinch

# Install linchpin 1.5
RUN yum install git -y && \
    git clone https://github.com/CentOS-PaaS-SIG/linchpin.git && \
    cd linchpin && \
    git checkout release1.5 && \
    pip install ../linchpin && \
    pip install ../linchpin[beaker] && \
    pip install ../linchpin[krb5]

# Copy over configuration files
COPY beaker/id_rsa /home/jenkins/.ssh/id_rsa
COPY beaker/client.conf /etc/beaker/client.conf
COPY krb5/krb5.conf /etc/krb5.conf
COPY krb5/krb5.keytab /etc/krb5.keytab
COPY krb5/tenant /home/jenkins/.k5identity
COPY jenkins/username /etc/cinch/jenkins-username
COPY jenkins/password /etc/cinch/jenkins-password

# Setup certificates for RedHat
RUN cd /etc/pki/ca-trust/source/anchors && \
    curl -o RedHat_CA.crt --insecure -L https://password.corp.redhat.com/cacert.crt && \
    curl -o PnTDevOps_CA.crt --insecure -L https://engineering.redhat.com/Eng-CA.crt && \
    curl -o RH-IT-Root-CA.crt --insecure -L https://password.corp.redhat.com/RH-IT-Root-CA.crt && \
    update-ca-trust extract

# Configure beaker
RUN ktenant=$(< /home/jenkins/.k5identity); echo "KRB_PRINCIPAL = \"${ktenant}@REDHAT.COM\"" >> /etc/beaker/client.conf && \
    cp /etc/pki/ca-trust/source/anchors/RH-IT-Root-CA.crt /etc/beaker/RH-IT-Root-CA.crt

# Initialize SSH
WORKDIR /home/jenkins
RUN chmod 600 .ssh/id_rsa && \
    eval `ssh-agent -s` && \
    ssh-add .ssh/id_rsa
