systemd-machine-id-setup
/usr/sbin/sshd
#dbus-daemon --system
touch /dbus.env
chmod 666 /dbus.env
/runevilorroot.sh 'dbus-launch > /dbus.env'
/runevilorroot.sh '. /dbus.env && vncserver :0' &
/loop.sh /runevilorroot.sh '. /dbus.env && /usr/bin/pulseaudio' &
/startup.sh
