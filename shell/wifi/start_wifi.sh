ip link set wlp2s0 up
wpa_supplicant -B -i wlp2s0 -c<(wpa_passphrase "wifi_name" "wifi_password")
dhclient wlp2s0
