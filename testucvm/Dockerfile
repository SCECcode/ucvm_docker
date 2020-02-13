FROM  amazonlinux
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
ENV UCVM_SRC_PATH=/app/UCVMC UCVM_INSTALL_PATH=/usr/local/opt/ucvm LD_LIBRARY_PATH=/usr/local/opt/ucvm/lib/euclid3/lib:/usr/local/opt/ucvm/lib/proj-5/lib:/usr/local/opt/ucvm/model/cvms/lib:/usr/local/opt/ucvm/model/cvms5/lib:/usr/local/opt/ucvm/model/cvmh1511/lib

WORKDIR /app
COPY . /app

RUN yum install -y wget wget bzip2 ca-certificates libglib2.0-0 libxext6 libsm6 libxrender1 mercurial subversion git gcc gcc-gfortran libtool autoconf automake make which

#RUN wget --quiet https://repo.anaconda.com/archive/Anaconda3-2019.10-Linux-x86_64.sh -O ~/anaconda.sh && \
RUN wget --quiet https://repo.anaconda.com/archive/Anaconda2-2019.07-Linux-x86_64.sh -O ~/anaconda.sh && \
    /bin/bash ~/anaconda.sh -b -p /usr/local/opt/conda && \
    rm ~/anaconda.sh && \
    ln -s /usr/local/opt/conda/etc/profile.d/conda.sh /etc/profile.d/conda.sh && \
    echo ". /usr/local/opt/conda/etc/profile.d/conda.sh" >> ~/.bashrc && \
    echo "conda activate base" >> ~/.bashrc && \
    find /usr/local/opt/conda/ -follow -type f -name '*.a' -delete && \
    find /usr/local/opt/conda/ -follow -type f -name '*.js.map' -delete && \
    /usr/local/opt/conda/bin/conda clean -afy

## python basemap, basemap-data-hires, matplotlib
RUN /usr/local/opt/conda/bin/conda install -y matplotlib basemap basemap-data-hires

RUN /bin/bash /app/run-build-UCVMC.sh && \
    cp -f /app/UCVMC/conf/ucvm_bash.sh /etc/profile.d/ucvm_bash.sh && \
    echo ". /etc/profile.d/ucvm_bash.sh" >> ~/.bashrc && \
    echo "cd /app/target" >> ~/.bashrc

#    echo "cd /app/target" >> ~/.bashrc && \
#    rm -rf UCVMC

CMD [ "/bin/bash" ]
