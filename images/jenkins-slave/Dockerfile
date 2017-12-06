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
    pip install -U linchpin==1.0.4 cinch

