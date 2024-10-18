# use of the libraries in the tasks requires python 3.10
FROM archlinux

# copy robot files to container
COPY letcode_tests letcode_tests
COPY requirements.txt .

# Update system and install firefox-esr, because regular firefox cannot be installed straightforward
RUN pacman --noconfirm -Syu firefox python-pip

# Install Python dependencies
RUN pip install --no-cache-dir --break-system-packages -r requirements.txt

