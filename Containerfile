FROM quay.io/opendatahub-contrib/workbench-images:vscode-datascience-c9s-py311_2023c_latest

USER root

RUN yum install -y \
  root-cling \
  gcc-c++ \
  clang \
  cmake \
  conda \
  xtensor-devel \
  mlpack-bin \
  mlpack-devel \
  armadillo \
  armadillo-devel \
  gsl-devel \
  hdf5-devel \
  boost-devel
RUN conda create --prefix /opt/app-root -y \
  && conda install --prefix /opt/app-root -c conda-forge xeus-cling xtensor-blas -y
RUN sed -i -e 's/\/\//\//g' /opt/app-root/share/jupyter/kernels/xcpp*/kernel.json
RUN pip install jupyterlab notebook
RUN jupyter kernelspec install /opt/app-root/share/jupyter/kernels/xcpp11 \
  && jupyter kernelspec install /opt/app-root/share/jupyter/kernels/xcpp14 \
  && jupyter kernelspec install /opt/app-root/share/jupyter/kernels/xcpp17

USER 1001
