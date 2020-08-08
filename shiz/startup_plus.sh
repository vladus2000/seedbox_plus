rm /home/evil/.vnc/*.log /home/evil/.vnc/*.pid /home/evil/.vnc/cor*
systemd-machine-id-setup
chsh -s /bin/bash http
/usr/sbin/sshd
dbus-daemon --system
touch /dbus.envr
chmod 666 /dbus.envr
/runevilorroot.sh 'dbus-launch > /dbus.envr'
sed -e 's/^/export /' /dbus.envr > /dbus.env 
chmod 666 /dbus.env
/runevilorroot.sh '. /dbus.env && vncserver :0' &
/loop.sh /runevilorroot.sh '. /dbus.env && /usr/bin/pulseaudio' &
/startup.sh
