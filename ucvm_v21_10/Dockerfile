# Create UCVM model Docker Image based on Centos-8 also available at USC CARC
FROM centos:8
ENV LANG=C.UTF-8 LC_ALL=C.UTF-8

# Define these parameters to support building and deploying on EC2 so user is not root
ARG USER_ID=5000
ARG GROUP_ID=200

LABEL "maintainer"="Philip Maechling <maechlin@usc.edu>" "appname"="ucvm"
#
# Setup path for installation of ucvm into /app/bin
#
ENV UCVM_SRC_PATH=/app/src UCVM_INSTALL_PATH=/app/ucvm LD_LIBRARY_PATH=/app/ucvm/lib/euclid3/lib:/app/ucvm/lib/proj-5/lib:/app/ucvm/model/cvms/lib:/app/ucvm/model/cvms5/lib:/app/ucvm/model/cvmh1511/lib:/app/ucvm/model/cvmsi/lib:/app/ucvm/model/wfcvm/lib
ENV PYTHONPATH=/app/ucvm/utilities/pycvm
ENV PATH="/app/ucvm/bin:/usr/bin/python3:${PATH}"
#
RUN yum clean all
RUN yum -y update
RUN yum -y groupinstall "Development Tools"
RUN yum -y install yum-utils gcc-gfortran gcc-c++ fftw-devel which python3 python2
#
# Link python3
# RUN ln -s /usr/bin/python3 /usr/bin/python
# Setup Owners
# Documents say this groupadd is needed when you build on linux, but not on Mac
RUN groupadd --gid $GROUP_ID scec
RUN useradd -ms /bin/bash -G scec --uid $USER_ID ucvm
USER ucvm

WORKDIR /app
COPY --chown=ucvm:scec ucvm/ ./src
# An external script has posted the correct .gz model file in the largefiles dir
# Install largefiles
WORKDIR /app/src/largefiles
#RUN ./get_largefiles.py
#RUN ./check_largefiles.py
RUN ./stage_largefiles.py
WORKDIR /app/src
COPY --chown=ucvm:scec setup_inputs.txt ./setup_inputs.txt
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
COPY --chown=ucvm:scec test_latlons.txt ./test_latlons.txt
COPY --chown=ucvm:scec basic_query.txt ./basic_query.txt
COPY --chown=ucvm:scec make_mesh.py ./make_mesh.py
#
# Define directory that will be mounted and used for file input/output
#
WORKDIR /app/target
COPY --chown=ucvm:scec test_latlons.txt ./test_latlons.txt
COPY --chown=ucvm:scec basic_query.txt ./basic_query.txt
#
#
# Add metadata to dockerfile using labels
LABEL org.label-schema.build-date="20210912"
LABEL org.label-schema.license="BSD 3-Clause"
LABEL org.scec.project="SCEC Unified Community Velocity Model"
LABEL org.scec.responsible_person="Philip Maechling"
LABEL org.scec.primary_contact="maechlin@usc.edu"
LABEL version="ucvm_v21_10_09120154"
#
# start as command line terminal
#
CMD ["/bin/bash"]
