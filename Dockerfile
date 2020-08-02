FROM vladus2000/seedbox
MAINTAINER vladus2000 <docker@matt.land>

COPY shiz/ /home/evil/shiz/

RUN \
	/debug_this.sh && \
	pacman -S --needed --noconfirm xorg-server xorg-apps xorg-drivers xfce4 vlc discord google-chrome tigervnc pulseaudio pulseaudio-alsa && \
	cp /shiz/xinitrc /etc/X11/xinit/ && \
	mkdir /run/dbus

# for rutorrent (via nginx)
EXPOSE 8069
# for rtorrent
EXPOSE 49152

CMD /bin/bash -c /startup_plus.sh

VOLUME /config
VOLUME /downloads
