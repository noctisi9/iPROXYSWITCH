#!/bin/bash

if [ "$EUID" -ne 0 ]; then
  echo "Error: Run with sudo."
  exit 1
fi

ACTION=$1
BASHRC_FILE="/home/$SUDO_USER/.bashrc"
ENV_FILE="/etc/environment"
APT_DIR="/etc/apt/apt.conf.d"

case "$ACTION" in
  on)
    read -p "Enter Proxy IP: " IP
    read -p "Enter Proxy Port: " PORT
    URL="http://$IP:$PORT/"

    # System-wide Environment
    sed -i '/_proxy=/d' "$ENV_FILE"
    {
      echo "http_proxy=\"$URL\""
      echo "https_proxy=\"$URL\""
      echo "ftp_proxy=\"$URL\""
      echo "no_proxy=\"localhost,127.0.0.1\""
    } >> "$ENV_FILE"

    # APT Configuration (Clears all and sets new)
    rm -f "$APT_DIR"/95proxies
    echo "Acquire::http::Proxy \"$URL\";" > "$APT_DIR/95proxies"
    echo "Acquire::https::Proxy \"$URL\";" >> "$APT_DIR/95proxies"

    # Bash Environment
    sed -i '/_proxy=/d' "$BASHRC_FILE"
    {
      echo "export http_proxy=\"$URL\""
      echo "export https_proxy=\"$URL\""
      echo "export ftp_proxy=\"$URL\""
    } >> "$BASHRC_FILE"

    # Snap Configuration
    snap set system proxy.http="$URL"
    snap set system proxy.https="$URL"

    echo "Proxy enabled: $URL"
    ;;
  off)
    sed -i '/_proxy=/d' "$ENV_FILE"
    sed -i '/_proxy=/d' "$BASHRC_FILE"
    rm -f "$APT_DIR/95proxies"
    
    # Reset Snap
    snap unset system proxy.http
    snap unset system proxy.https
    
    echo "Proxy disabled."
    ;;
  *)
    echo "Usage: sudo ./proxy.sh {on|off}"
    exit 1
    ;;
esac
