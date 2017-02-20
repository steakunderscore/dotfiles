FROM ubuntu
ENV foo /bar
WORKDIR ${foo}   # WORKDIR /bar
RUN apt-get update
RUN apt-get install curl ruby2.0 wget git -y
RUN adduser --disabled-password --gecos '' foo
USER foo
RUN HOME=/home/foo FRESH_LOCAL_SOURCE=steakunderscore/dotfiles bash -c "`curl -sL get.freshshell.com`"
RUN fresh
