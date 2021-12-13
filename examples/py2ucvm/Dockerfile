FROM  amazonlinux
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV UCVM_SRC_PATH=/app/ucvm UCVM_INSTALL_PATH=/usr/local/opt/ucvm 

WORKDIR /app
COPY . /app

RUN yum install -y wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 mercurial subversion git gcc gcc-gfortran libtool autoconf automake make which tkinter

RUN yum install -y xorg-x11-apps
ENV DISPLAY host.docker.internal:0 

RUN mkdir -p /app/target && \
    echo "echo 'running with .bashrc..' " >> ~/.bashrc && \
    echo "export PS1='py2ucvm >'" >> ~/.bashrc
 
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

RUN ./run-build-ucvm.sh && \
    /bin/cp -f /app/ucvm/conf/ucvm_env.sh /etc/profile.d/ucvm_env.sh && \
    echo ". /etc/profile.d/ucvm_env.sh" >> ~/.bashrc && \
    . ~/.bashrc && \
    ./run-build-ucvm_plotting.sh

RUN /bin/cp run_plotting.sh /app/target && \
    /bin/cp run_query.sh /app/target && \
    /bin/rm -rf /app/ucvm && \
    /bin/chmod -R og+r /usr/local/opt/ucvm

CMD [ "/bin/bash" ]
