+++
banner = ""
categories = ["howto"]
date = "2021-09-26T17:32:51+08:00"
description = ""
images = []
menu = ""
tags = ["ubuntu"]
title = "Upgrade gcc on Ubuntu 16.04"
+++

### Setup apt source
```
sudo add-apt-repository ppa:ubuntu-toolchain-r/test
sudo apt-get update
sudo apt-get install gcc-snapshot
sudo apt-get install gcc-7 g++-7
```

### Change default gcc symbol link
get into /usr/bin/ and recreate symbol links to gcc-7.

### The issue you may get during apt source setup

```
Traceback (most recent call last):       
  File "/usr/bin/apt-listchanges", line 28, in <module>
    import apt_pkg
ImportError: No module named apt_pkg
```
If you see an error like above, Then you may need workaround this:

```
cd /usr/lib/python3/dist-packages
sudo cp apt_pkg.cpython-36m-x86_64-linux-gnu.so apt_pkg.so
```


