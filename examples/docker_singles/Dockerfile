# Create UCVM model docker image
FROM amazonlinux
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8
LABEL "maintainer"="Philip Maechling <maechlin@usc.edu>" "appname"="ucvm"
#
# Setup path for installation of ucvm into /app/bin
#
ENV UCVM_SRC_PATH=/app/src UCVM_INSTALL_PATH=/app/ucvm LD_LIBRARY_PATH=/app/ucvm/lib/euclid3/lib:/app/ucvm/lib/proj-5/lib:/app/ucvm/model/cvms/lib:/app/ucvm/model/cvms5/lib:/app/ucvm/model/cvmh1511/lib:/app/ucvm/model/cvmsi/lib:/app/ucvm/model/wfcvm/lib
ENV PYTHONPATH=/app/ucvm/utilities/pycvm
ENV PATH="/app/ucvm/bin:${PATH}"
#
RUN yum install -y make autoconf automake autotools-dev libtool gzip bzip2 gcc gcc-gfortran gcc-c++ which python2 pip
#
WORKDIR /app
COPY ucvm/ ./src
# An external script has posted the correct .gz model file in the largefiles dir
# Install largefiles
WORKDIR /app/src/largefiles
RUN ./stage_large_files.py
WORKDIR /app/src
COPY setup_inputs.txt ./setup_inputs.txt
RUN ./ucvm_setup.py -a -d < setup_inputs.txt
#
# Remove the src directories to save space
#
WORKDIR /app
RUN rm -rf src
#
# Define file input/output mounted disk
#
VOLUME /app/target
#
# Setup user with test input files
#
WORKDIR /app
COPY test_latlons.txt ./test_latlons.txt
COPY basic_query.txt ./basic_query.txt
COPY make_mesh.py ./make_mesh.py
#
# Define directory that will be mounted and used for file input/output
#
WORKDIR /app/target
COPY test_latlons.txt ./test_latlons.txt
COPY basic_query.txt ./basic_query.txt
#
#
# Load the ucvm_plotting library
#
#WORKDIR /app/src
#COPY ucvm_plotting ./plotting
#WORKDIR /app/src/plotting
#RUN yum install -y python-matplotlib
#RUN yum install -y python-basemap
#RUN yum install -y basemap-data-hires.noarch
#RUN ./unpack-dist
#
# start as command line terminal
#
CMD ["/bin/bash"]
