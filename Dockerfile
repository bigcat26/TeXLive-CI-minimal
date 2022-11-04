FROM alpine:3.16

# update the system
RUN apk update && apk upgrade
RUN apk add --no-cache wget perl python3 texlive-xetex

# get texlive from http://tug.org/texlive/acquire-netinstall.html
RUN mkdir texlive && cd texlive && wget http://mirror.ctan.org/systems/texlive/tlnet/install-tl-unx.tar.gz -O- | tar zxf - && cd *

# using installation profile http://tug.org/texlive/quickinstall.html
ADD texlive.profile texlive/
RUN cd texlive/* && ./install-tl --no-interaction --profile ../texlive.profile
RUN tlmgr init-usertree && tlmgr install xifthen ifmtarg titlesec enumitem nth ctex datetime2

ENV PATH="/usr/local/texlive/2022/bin/x86_64-linux/:$PATH"
