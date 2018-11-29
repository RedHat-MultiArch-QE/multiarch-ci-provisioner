#!/bin/bash
cd "$(dirname "${BASH_SOURCE[0]}")"
work_dir=$(pwd)
root_dir=$(realpath "$(pwd)/..")

plugin_version=2.4

mkdir tmp
cd tmp
curl -sSO http://apache.mirrors.lucidnetworks.net/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz
curl -sSO https://www.apache.org/dist/maven/maven-3/3.5.3/binaries/apache-maven-3.5.3-bin.tar.gz.asc
curl https://www.apache.org/dist/maven/KEYS | gpg --import &> /dev/null
gpg --verify apache-maven-3.5.3-bin.tar.gz.asc apache-maven-3.5.3-bin.tar.gz
sudo tar xzvf apache-maven-3.5.3-bin.tar.gz -C /opt
export PATH=$PATH:/opt/apache-maven-3.5.3/bin

git clone --depth 1 --branch validating-string-parameter-$plugin_version https://github.com/jenkinsci/validating-string-parameter-plugin
cd validating-string-parameter-plugin
mvn clean compile hpi:hpi
mkdir -p $root_dir/utils/plugins
cp target/validating-string-parameter.hpi $root_dir/utils/plugins/validating-string-parameter-$plugin_version.hpi
cd $work_dir
rm -rf tmp
