# Base image is ubuntu linux
# TODO: look into switching to alpine (smaller but more complex to manage)
FROM ubuntu:24.04

# Installing requirements to get and extract prebuilt binaries
RUN apt-get update && apt-get install -y \
  cmake               `# my prefferred cpp build system` \
  git-all             `# version control` \
  libgtest-dev        `#cpp unit test framework` \
  libgmock-dev        `#cpp unit test mock framework` \
  # The stable, default llvm packages
  clang-format clang-tidy clang-tools clang clangd \
  libc++-dev libc++1 libc++abi-dev libc++abi1 \
  libclang-dev libclang1 liblldb-dev libllvm-ocaml-dev \
  libomp-dev libomp5 lld lldb llvm-dev llvm-runtime llvm \
  python3-clang \
  && rm -rf /var/lib/apt/lists/*

# Create/set working directory to name of project, then copy repo root over
WORKDIR /root/cmaketemplate/
COPY . .

# Download public key for github.com
RUN mkdir -p -m 0600 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts

# Start the container with a bash shell
CMD [ “/bin/bash” ]
