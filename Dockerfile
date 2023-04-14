FROM alpine:latest

RUN apk update && \
    apk add --no-cache openssh python3 && \
    rm -rf /var/cache/apk/*

RUN mkdir /var/run/sshd && \
    mkdir /root/.ssh && \
    chmod 700 /root/.ssh && \
    touch /root/.ssh/authorized_keys && \
    chmod 600 /root/.ssh/authorized_keys

COPY my_key.pub /root/.ssh/authorized_keys

RUN sed -i 's/#PermitRootLogin prohibit-password/PermitRootLogin yes/' /etc/ssh/sshd_config && \
    sed -i 's/#PasswordAuthentication yes/PasswordAuthentication no/' /etc/ssh/sshd_config && \
    ssh-keygen -A

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]