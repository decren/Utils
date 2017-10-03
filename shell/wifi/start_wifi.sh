ip link set wlp2s0 up
wpa_supplicant -B -i wlp2s0 -c<(wpa_passphrase "annie" "15019229827")
dhclient wlp2s0
