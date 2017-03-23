FROM sdhibit/rpi-raspbian

MAINTAINER Jay MOULIN <jaymoulin@gmail.com>

RUN apt-get update && apt-get install python3-pip libav-tools build-essential -y && \
	pip3 install watchdog gmusicapi bs4 && apt-get clean && apt-get autoremove -y

WORKDIR /root
ADD ./daemon.sh /root/daemon.sh
ADD ./google-music-manager/upload-daemon.py /root/daemon.py
ADD ./google-music-manager/auth.py /root/auth.py
RUN chmod +x /root/daemon.py
RUN chmod +x /root/daemon.sh
RUN chmod +x /root/auth.py

VOLUME /media/library

CMD ["/root/daemon.sh"]
