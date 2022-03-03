FROM debian
RUN apt-get update
RUN apt install gcc gdb gcc-multilib nano -y
COPY lab22.s .
RUN gcc -m32 lab22.s -o lab2s
CMD ./lab2s
