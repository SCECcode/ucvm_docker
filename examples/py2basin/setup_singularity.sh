
## need to source this file on Singularity instance
## because haven't figure out how to make proper .bashrc in
## user space

export PS1='onSingularity >'
. /usr/local/conda/etc/profile.d/conda.sh
conda activate base
. /etc/profile.d/ucvm_env.sh

