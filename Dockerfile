# use of the libraries in the tasks requires python 3.10
FROM python:3.10-slim-buster

# copy robot files to container
COPY letcode_tests letcode_tests
COPY requirements.txt .

# Update system and install firefox-esr, because regular firefox cannot be installed straightforward
RUN apt update && apt upgrade -y && apt install firefox-esr -y

# Install Python dependencies
RUN pip install --no-cache-dir -r requirements.txt

