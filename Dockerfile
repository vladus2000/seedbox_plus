FROM vladus2000/seedbox
MAINTAINER vladus2000 <docker@matt.land>

COPY shiz/ /home/evil/shiz/

RUN \
	/debugthis.sh && \
        /install-devel.sh && \
	pacman -Syyu --needed --noconfirm xorg-server xorg-apps xorg-drivers xfce4 vlc mpv discord tigervnc pulseaudio pulseaudio-alsa xfce4-pulseaudio-plugin xterm pavucontrol noto-fonts noto-fonts-emoji noto-fonts-extra npm && \
	su - evil -c 'yay -S --needed --noconfirm google-chrome soulseekqt' && \
	cp /home/evil/shiz/xinitrc /etc/X11/xinit/ && \
	cp /home/evil/shiz/startup_plus.sh / && \
	chmod +x startup_plus.sh && \
	mkdir -p /run/dbus

# for rutorrent (via nginx)
EXPOSE 8069
# for rtorrent
EXPOSE 49152
EXPOSE 5900

CMD /bin/bash -c /startup_plus.sh

VOLUME /config
VOLUME /downloads

