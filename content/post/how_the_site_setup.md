+++
banner = ""
categories = ["Programming"]
date = "2021-08-16T00:07:51+08:00"
description = ""
images = []
menu = ""
tags = ["hugo"]
title = "网站配置总结"
+++

#### 如何使用VS Code编辑Markdown以及Preview

打开VSCode，按快捷键CTRL+SHIFT+P，在弹出的窗口中输出Markdown，此时会出现Preview选项：

![MarkDown Preview](/images/mkdown_preview.png)

由此，后续blog文档的输出均采用VSCode编写。

#### Hugo生成器版本
```
~$ hugo version
hugo v0.87.0-B0C541E4+extended linux/amd64 BuildDate=2021-08-03T10:57:28Z VendorInfo=gohugoio
```

#### 主题

来回尝试了多个主题，发现hugo-tania这个很简洁，并且默认支持了评论功能，非常方便，另外，很非常喜欢它这种清爽的风格，果断采用。


#### 配置文件

采用config.toml的方式进行配置，主要配置参考[这里](https://themes.gohugo.io/themes/hugo-tania/#menu)。
