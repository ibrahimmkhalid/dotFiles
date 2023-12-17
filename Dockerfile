FROM ubuntu

ENV TZ=US/Pacific \
    DEBIAN_FRONTEND=noninteractive
# OS updates and install
RUN apt update -y
RUN apt upgrade -y
RUN apt install sudo vim software-properties-common language-pack-en -qq -y
RUN apt install git ansible -qq -y
RUN update-locale
RUN apt install make gawk wget curl ranger htop libfuse2 ripgrep gcc g++ unzip neofetch tldr lldb entr fzf xsel xclip python3 python-is-python3 python3-pip build-essential python3-venv ansible -y

# Create test user and add to sudoers
RUN useradd -m tester
RUN usermod -aG sudo tester

# Set password for the user "tester"
RUN echo 'tester:jjj' | chpasswd

# Add local files
ADD . /home/tester/.dotfiles
RUN chown -R tester:tester /home/tester


# Switch testuser
USER tester
ENV HOME /home/tester
ENV USER tester

# Change working directory
WORKDIR /home/tester/.dotfiles
CMD ["/bin/bash"]
