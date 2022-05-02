# Create UCVM model Docker Image based on Centos-8 also available at USC CARC
FROM centos:8

LABEL "maintainer"="Philip Maechling <maechlin@usc.edu>" "appname"="ucvm"
#
# Setup path for installation of ucvm into /app/bin
#
ENV UCVM_SRC_PATH=/app/src UCVM_INSTALL_PATH=/app/ucvm LD_LIBRARY_PATH=/app/ucvm/lib/euclid3/lib:/app/ucvm/lib/proj-5/lib:/app/ucvm/model/cvms/lib:/app/ucvm/model/cvms5/lib:/app/ucvm/model/cvmh1511/lib:/app/ucvm/model/cvmsi/lib:/app/ucvm/model/wfcvm/lib
ENV PYTHONPATH=/app/ucvm/utilities/pycvm
ENV PATH="/app/ucvm/bin:/usr/bin/python2:/usr/bin/python3:${PATH}"
#
RUN yum clean all && yum -y update && yum -y\
 groupinstall "Development Tools" && yum -y\
 install yum-utils gcc-gfortran gcc-c++ fftw-devel which python3

#
# Link python3 so install scripts invoke python3
#
RUN ln -s /usr/bin/python3 /usr/bin/python

WORKDIR /app
COPY ucvm/ ./src
COPY get_largefile_inputs.txt ./src/largefiles/.

# Install largefiles
WORKDIR /app/src/largefiles
RUN ./get_largefiles.py < ./get_largefile_inputs.txt
RUN ./stage_largefiles.py
WORKDIR /app/src
COPY setup_inputs.txt ./setup_inputs.txt
RUN ./ucvm_setup.py -a -d < setup_inputs.txt
#
# Remove the src directories to save space
#
WORKDIR /app
RUN rm -rf src
#
# Make sure all files are globally readable
#
WORKDIR /app
RUN chmod -R og+r ucvm
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
# Add metadata to dockerfile using labels
LABEL org.label-schema.build-date="20211201"
LABEL org.label-schema.license="BSD 3-Clause"
LABEL org.scec.project="SCEC Unified Community Velocity Model"
LABEL org.scec.responsible_person="Philip Maechling"
LABEL org.scec.primary_contact="maechlin@usc.edu"
LABEL version="ucvm_sif"
#
# start as command line terminal
#
CMD ["/bin/bash"]
