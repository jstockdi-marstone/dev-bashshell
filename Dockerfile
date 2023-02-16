FROM ubuntu:latest

RUN adduser --gecos "*" --disabled-password devuser && \
    apt-get update && \
    apt-get -y install zsh vim zip curl sudo git 

RUN adduser devuser sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN apt-get -y install python3

RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install

USER devuser
ENV COLORTERM=truecolor
ENV TERM=xterm-256color

CMD ["zsh"]
