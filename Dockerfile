FROM debian
RUN apt-get update
RUN apt install gcc gdb gcc-multilib nano -y
COPY lab22.s .
COPY lab22.c .
RUN gcc -m32 -no-pie lab22.s -o lab2s
RUN gcc lab22.c -o lab2c
CMD ./lab2s && ./lab2c
