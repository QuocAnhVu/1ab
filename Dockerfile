FROM nvidia/cuda:12.1.0-cudnn8-runtime-ubi9

# Install some basic utilities.
RUN dnf update -y; dnf install -y \
  ca-certificates \
  sudo \
  git \
  bzip2 \
  # Anaconda depndencies
  libXcomposite \
  libXcursor \
  libXi \
  libXtst \
  libXrandr \
  alsa-lib \
  mesa-libEGL \
  libXdamage \
  mesa-libGL \
  libXScrnSaver

# Create a non-root user and switch to it.
RUN adduser --shell /bin/bash user
RUN echo "user ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/90-user
USER user

# All users can use /home/user as their home directory.
ENV HOME=/home/user
RUN mkdir $HOME/.cache $HOME/.config $HOME/.local $HOME/.local/share \
  && chmod -R 777 $HOME

# Install Anaconda
COPY Anaconda3*.sh anaconda3.sh
RUN bash anaconda3.sh -b -p $HOME/.local/share/anaconda3
ENV PATH=$HOME/.local/share/anaconda3/bin:$PATH
RUN eval "$(conda shell.bash hook)"

# Create a working directory.
RUN mkdir $HOME/ws
WORKDIR $HOME/ws

# Install additional pockages
ENV HF_HOME=/home/user/ws/.cache/huggingface
RUN conda install --yes pytorch torchvision torchaudio pytorch-cuda=12.1 -c pytorch -c nvidia
RUN conda install --yes transformers datasets -c conda-forge -c huggingface
