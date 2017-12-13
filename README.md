# Termux repository of X/GUI packages
This repository contains various X/GUI packages (such as **dosbox**) that can be installed to [Termux](https://github.com/termux/termux-app).

## How to enable this repository
Make sure that needed tools are installed:
```
pkg upgrade
pkg install apt-transport-https nano gnupg wget
```

Download gpg key for this repository:
```
wget https://xeffyr.github.io/termux-x-repository/pubkey.gpg
apt-key add pubkey.gpg
```

Edit your sources.list by adding a line with correct CPU architecture:
```
## For AArch64
deb [arch=all,aarch64] https://xeffyr.github.io/termux-x-repository/ termux x-gui

## For ARM
deb [arch=all,arm] https://xeffyr.github.io/termux-x-repository/ termux x-gui

## For i686
deb [arch=all,i686] https://xeffyr.github.io/termux-x-repository/ termux x-gui

## For x86_64
deb [arch=all,x86_64] https://xeffyr.github.io/termux-x-repository/ termux x-gui
```

Then update apt lists:
```
apt update
```

## Note
This repository uses Github Pages. Since they are use caching, sometimes when repository is updated you may receive errors like
'Hash Sum mismatch', '404 Not Found', 'Writing more data than expected'. Usually, the problem should gone away in ~10 minutes after
repository was updated.
