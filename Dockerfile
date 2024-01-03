FROM fedora

ENV TZ=America/Los_Angeles \
    LANG=C.utf8

# OS updates and install
RUN dnf upgrade -y
RUN dnf install vim git ansible -y

# Create test user and add to sudoers
RUN useradd -m tester \
    && usermod -aG wheel tester

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
