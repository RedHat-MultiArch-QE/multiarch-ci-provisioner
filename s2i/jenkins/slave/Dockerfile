FROM openshift/jenkins-slave-base-centos7

# Set home to root directory for caching purposes
# Disable host key checking explicitly - see https://github.com/ansible/ansible/issues/30720
ENV HOME=/root \
    ANSIBLE_HOST_KEY_CHECKING=False \
    ANSIBLE_GATHER_TIMEOUT=25 \
    WORKON_HOME=/home/jenkins/envs

# Install all dependencies from yum
RUN yum-config-manager --add-repo=http://download.lab.eng.bos.redhat.com/beakerrepos/client/CentOS7/ && \
    yum install -y epel-release && \
    yum install -y python python-devel python-pip && \
    yum install -y beaker-common beakerlib beaker-client beaker-redhat python-beaker --nogpgcheck && \
    yum install -y krb5-workstation libvirt-devel libyaml-devel openssl-devel libffi-devel gcc && \
    yum clean all

# Install virtualenvwrapper && linchpin environment
RUN pip install virtualenvwrapper && \
    mkdir -p $WORKON_HOME && \
    source $(which virtualenvwrapper.sh) && \
    mkvirtualenv --no-site-packages provisioner && \
    workon provisioner && \
    pip install -U pip && \
    pip install -U setuptools && \
    pip install -U ansible==2.7.0 linchpin[beaker]==1.7.2 cinch==1.4.0

# Install ansible 2.8 environment
RUN yum install -y openssh && \
    source $(which virtualenvwrapper.sh) && \
    mkvirtualenv --no-site-packages ansible && \
    workon ansible && \
    pip install -U pip && \
    pip install -U setuptools && \
    pip install -U ansible==2.8.0

# Setup certificates for RedHat
RUN cd /etc/pki/ca-trust/source/anchors && \
    curl -o RedHat_CA.crt --insecure -L https://password.corp.redhat.com/cacert.crt && \
    curl -o PnTDevOps_CA.crt --insecure -L https://engineering.redhat.com/Eng-CA.crt && \
    curl -o RH-IT-Root-CA.crt --insecure -L https://password.corp.redhat.com/RH-IT-Root-CA.crt && \
    cp /etc/pki/ca-trust/source/anchors/RH-IT-Root-CA.crt /etc/beaker/RH-IT-Root-CA.crt && \
    update-ca-trust extract

# Install brew and jq for parsing json
RUN yum-config-manager --add-repo=http://download.eng.bos.redhat.com/rel-eng/RCMTOOLS/rcm-tools-rhel-7-server.repo && \
    yum install -y koji brewkoji jq && \
    yum clean all

# Set env HOME var for SSH
ENV HOME=/home/jenkins
