# using archlinux because it is lightweight and easy to install latest neovim
FROM archlinux

# copy robot files and dependencies recipe to container
COPY letcode_tests letcode_tests
COPY requirements.txt .

# update system and install firefox and pip
RUN pacman --noconfirm -Syu firefox python-pip

# Install project dependencies
RUN pip install --no-cache-dir --break-system-packages -r requirements.txt

