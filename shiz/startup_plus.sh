systemd-machine-id-setup
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
