FROM ubuntu:latest


RUN adduser --gecos "*" --disabled-password devuser  && \
    adduser --gecos "*" --disabled-password produser && \
    apt-get update && \
    apt-get -y install zsh vim zip curl sudo git groff 

RUN adduser devuser sudo
RUN adduser produser sudo
RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers

RUN apt-get -y install python3

#RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-x86_64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install
RUN curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && unzip awscliv2.zip && ./aws/install

RUN sh -c "$(curl -L https://github.com/deluan/zsh-in-docker/releases/download/v1.1.5/zsh-in-docker.sh)" -- \
    -t https://github.com/denysdovhan/spaceship-prompt \
    -a 'SPACESHIP_PROMPT_ADD_NEWLINE="false"' \
    -a 'SPACESHIP_PROMPT_SEPARATE_LINE="false"' \
    -p git \
    -p ssh-agent \
    -p https://github.com/zsh-users/zsh-autosuggestions \
    -p https://github.com/zsh-users/zsh-completions


RUN curl -fsSL https://get.docker.com -o get-docker.sh && sh get-docker.sh



USER devuser
WORKDIR /home/devuser

ENV COLORTERM=truecolor
ENV TERM=xterm-256color

CMD ["zsh"]
