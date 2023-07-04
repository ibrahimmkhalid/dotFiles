FROM ubuntu

# OS updates and install
RUN apt update -y
RUN apt upgrade -y
RUN apt install sudo vim software-properties-common language-pack-en -qq -y
RUN update-locale

# Create test user and add to sudoers
RUN useradd -m tester
RUN usermod -aG sudo tester

# Set password for the user "tester"
RUN echo 'tester:jjj' | chpasswd

# Switch testuser
USER tester
ENV HOME /home/tester
ENV USER tester

# Change working directory
WORKDIR /home/tester
CMD ["/bin/bash"]
