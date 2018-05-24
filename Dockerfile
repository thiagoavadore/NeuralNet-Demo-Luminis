FROM jupyter/scipy-notebook

MAINTAINER Thiago de Faria {thiagoavadore@gmail.com}

USER $NB_USER

# TensorFlow
RUN conda install -c conda-forge tensorflow -y && \
    conda install -c conda-forge numpy keras nltk gensim -y

# Reinforcement Learning packages
RUN pip install gym==0.9.4

# Keras Kontrib
RUN pip install git+https://www.github.com/keras-team/keras-contrib.git
