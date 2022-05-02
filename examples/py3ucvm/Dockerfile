FROM  amazonlinux

## continuumio/anaconda3

ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV UCVM_SRC_PATH=/app/UCVM UCVM_INSTALL_PATH=/usr/local/opt/ucvm 
ENV CFLAGS="-g -O0"

WORKDIR /app
COPY . /app

RUN yum install -y wget wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 mercurial subversion git gcc gcc-gfortran libtool autoconf automake make which valgrind

RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2020.07-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /usr/local/opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /usr/local/opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /usr/local/opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /usr/local/opt/conda/ -follow -type f -name '*.a' -delete && \
    find /usr/local/opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /usr/local/opt/conda/bin/conda clean -afy

RUN /bin/bash /app/run-build-UCVM.sh && \
    cp -f /app/UCVM/conf/ucvm_env.sh /etc/profile.d/ucvm_env.sh && \
    echo ". /etc/profile.d/ucvm_env.sh" >> ~/.bashrc && \
    echo "cd /app/target" >> ~/.bashrc && \
    rm -rf UCVM

CMD [ "/bin/bash" ]
