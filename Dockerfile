FROM debian:latest

RUN apt update && apt upgrade -y

RUN apt install -y git cmake build-essential libz-dev libssl-dev libbz2-dev libpng-dev libusb-dev

RUN git clone https://github.com/malus-security/xpwn.git

WORKDIR /xpwn

RUN git checkout testing

RUN mkdir builddir

WORKDIR /xpwn/builddir

RUN cmake ..
RUN make

WORKDIR /

ENTRYPOINT [ "/xpwn/builddir/ipsw-patch/xpwntool" ]