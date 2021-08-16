+++
banner = ""
categories = ["programming"]
date = "2021-08-12T13:32:51+08:00"
description = ""
images = []
menu = ""
tags = ["hugo"]
title = "Hugo启用自定义IP绑定"
+++

默认hugo启用server时会绑定在localhost(127.0.0.1)上，在外网上无法通过IP访问，只能通过本机输入localhost访问，
那么如何启用Server可用于IP访问：
```

hugo server -b http://10.240.218.181 --bind="0.0.0.0" -D

```

