FROM rocm/pytorch

COPY stable-diffusion /diffusion
WORKDIR /diffusion
RUN conda env create -f /diffusion/environment.yaml \
    && conda init bash \
    && echo 'conda activate ldm' >> ~/.bashrc

SHELL [ "/bin/bash", "-i", "-c" ]
RUN pip3 install --upgrade torch torchvision torchaudio --extra-index-url https://download.pytorch.org/whl/rocm5.1.1
