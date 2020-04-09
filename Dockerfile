FROM ubuntu:bionic
ENV tools_dir /tools
ENV bin_dir /usr/local/bin

RUN apt update && \
        apt -y install curl \
            wget \
            python-pip \
            python3-pip \ 
            python-scipy \
            vim && \
        mkdir ${tools_dir}

RUN cd ${tools_dir} && \
  wget https://github.com/Illumina/manta/releases/download/v1.5.0/manta-1.5.0.centos6_x86_64.tar.bz2 && \
  tar -xjf manta-1.5.0.centos6_x86_64.tar.bz2 && \
  echo "cd /tools/manta-1.5.0.centos6_x86_64/bin && ./configManta.py $*" > ${bin_dir}/manta && \
    chmod u+x ${bin_dir}/manta

RUN cd ${tools_dir} && \
  wget https://github.com/Illumina/strelka/releases/download/v2.9.2/strelka-2.9.2.centos6_x86_64.tar.bz2 && \
  tar xvjf strelka-2.9.2.centos6_x86_64.tar.bz2
