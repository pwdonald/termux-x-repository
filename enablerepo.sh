#!/data/data/com.termux/files/usr/bin/sh

PREFIX=/data/data/com.termux/files/usr

if [ -z "${TMPDIR}" ]; then
    TMPDIR="${PREFIX}/tmp"
fi

if [ ! -e "${TMPDIR}" ]; then
    mkdir -p "${TMPDIR}"
fi

apt update
apt upgrade -y
apt install -y apt-transport-https gnupg wget
wget -O "${TMPDIR}/pubkey.gpg" https://xeffyr.github.io/termux-x-repository/pubkey.gpg
apt-key add "${TMPDIR}/pubkey.gpg"
rm -f "${TMPDIR}/pubkey.gpg"

## Prevent duplicate entries in sources.list
sed -i '/https:\/\/xeffyr.github.io\/termux-x-repository/d' "${PREFIX}/etc/apt/sources.list"

ARCHITECTURE=$(uname -m)
if [ -z "${ARCHITECTURE}" ]; then
    echo "[!] Failed to determine your architecture."
    echo "    Use instructions provided in README.md file."
    exit 1
fi
echo "deb [arch=all,${ARCHITECTURE}] https://xeffyr.github.io/termux-x-repository/ termux x-gui" >> "${PREFIX}/etc/apt/sources.list"

apt update
