FROM  amazonlinux
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV UCVM_SRC_PATH=/app/ucvm UCVM_INSTALL_PATH=/usr/local/opt/ucvm 

WORKDIR /app
COPY . /app

RUN yum install -y wget wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 mercurial subversion git gcc gcc-gfortran libtool autoconf automake make which tkinter

RUN yum install -y xorg-x11-apps
ENV DISPLAY host.docker.internal:0 

RUN wget --quiet https://repo.anaconda.com/archive/Anaconda2-2019.07-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /usr/local/conda && \
    rm ~/anaconda.sh && \
    ln -s /usr/local/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /usr/local/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /usr/local/conda/ -follow -type f -name '*.a' -delete && \
    find /usr/local/conda/ -follow -type f -name '*.js.map' -delete && \
    /usr/local/conda/bin/conda clean -afy

## python basemap, basemap-data-hires, matplotlib
RUN /usr/local/conda/bin/conda install -y matplotlib basemap basemap-data-hires

RUN /bin/bash ./run-build-ucvm.sh && \
    cp -f /app/ucvm/conf/ucvm_env.sh /etc/profile.d/ucvm_env.sh && \
    echo ". /etc/profile.d/ucvm_env.sh" >> ~/.bashrc && \
    echo "(cd /app/ucvm_plotting; ./unpack-dist &> unpack-dist.log) " >> ~/.bashrc && \
    echo "PS1=\"py2ucvm > \"" >> ~/.bashrc && \
    echo "cd /app/target" >> ~/.bashrc

##&& rm -rf /app/ucvm


CMD [ "/bin/bash" ]

