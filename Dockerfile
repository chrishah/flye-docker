FROM ubuntu:20.04

MAINTAINER <christoph.hahn@uni-graz.at>

WORKDIR /usr/src

RUN apt update && apt install -y build-essential python3 git zlib1g zlib1g-dev libz-dev

RUN git clone https://github.com/fenderglass/Flye && \
	cd Flye && \
	git reset --hard 971c4e2a5e14b687b6b8499b038bcc0ba5a5e80f && \
	make

ENV PATH="${PATH}:/usr/src/Flye/bin"

#add user (not really necessary)
RUN adduser --disabled-password --gecos '' flyeuser
USER flyeuser

WORKDIR /home/flyeuser

