+++
banner = ""
categories = ["Programming"]
date = "2021-08-16T00:07:51+08:00"
description = ""
images = []
menu = ""
tags = ["hugo"]
title = "WebSite配置笔记"
+++

#### 如何使用VS Code编辑Markdown以及Preview

打开VSCode，按快捷键CTRL+SHIFT+P，在弹出的窗口中输出Markdown，此时会出现Preview选项：
![MarkDown Preview](images/mkdown_preview.png)

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


#### 修改评论功能

tania主题默认是采用Discuz，不太简洁，因而改用轻量级的utterances，这是由github官方支持的开源、免费评论插件，如何使用？主要有以下三点：
* 一是要安装这个功能（需要登录github然后按指导安装即可）
* 其次是配置utterances， repo针对的是你要使用的github repo，一般填网站的github repo就行，注意要带用户前缀：xxxx/xxxx
* 三是针对具体的主题进行修改，这里的tania需要放到layouts/partials/comments/provider/utterances.html，utterances.html的内容就是utterances配置完后生成的脚本，例如：
```
<script src="https://utteranc.es/client.js"
        repo="jasonvfang.github.io"
        issue-term="pathname"
        theme="boxy-light"
        crossorigin="anonymous"
        async>
</script>
```
* 最后一步，修改config.toml，将provider = "utterances"置上即可

