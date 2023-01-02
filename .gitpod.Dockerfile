FROM gitpod/workspace-full:latest

SHELL ["/bin/bash", "--login", "-c"]

USER gitpod

RUN sudo apt-get update

# Install bazel 6.0.0
RUN sudo apt install -y apt-transport-https curl gnupg && \
    sudo curl -fsSL https://bazel.build/bazel-release.pub.gpg | gpg --dearmor >bazel-archive-keyring.gpg && \
    sudo mv bazel-archive-keyring.gpg /usr/share/keyrings && \
    echo "deb [arch=amd64 signed-by=/usr/share/keyrings/bazel-archive-keyring.gpg] https://storage.googleapis.com/bazel-apt stable jdk1.8" \
      | sudo tee /etc/apt/sources.list.d/bazel.list && \
    sudo apt update && sudo apt install -y bazel
