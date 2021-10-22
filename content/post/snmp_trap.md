+++
banner = ""
categories = ["networking"]
date = "2021-10-22T17:18:51+08:00"
description = ""
images = []
menu = ""
tags = ["snmp"]
title = "SnmpTrap"
+++

snmp网管协议较为古老，但是在服务运维界却用的比较多，这里总结snmptrap的测试步骤。


### 测试主要依赖的工具

ubuntu 16.04, dnsmasq，snmptrapd

### 操作步骤
首先在ubuntu上搭建snmptrapd接收Server应用，用于trap消息的接收，直接通过apt install的方式即可。

其次，修改配置文件/etc/snmp/snmptrapd.conf：
![snmp configuration file](images/snmp_cfg.jpg)

配置好后可以在命令行上启用：
```
sudo snmptrapd -C -c /etc/snmp/snmptrapd.conf -f -Lo
```
#### 关于snmp应用
目前大部分用的是net-snmp，基于此应用程序作的二次开发，加入自定义的MIB，如何移植资料很丰富，本文不讨论。

正常接收到的IPv4 Trap消息，如下图示：
![snmp trap test msg](images/snmp_trap_test.jpg)

#### 使用dns域名作为Trap地址
可参考dnsmasq的设置，开启自定义DNS域名：
![snmp trap dns](images/snmp_dns_cust.jpg)
可以看到图上配置了两个不同的域名，一个是IPv4地址，另一个是IPv6地址。

#### IPv6 Trap消息的接收问题
测试发现发送的Trap没有被Snmptrap端收到，而网络又是互通的，如下图示：
![snmp trap6 unreachable](images/snmp_trap6_port_unreachable.jpg)
上图可以看出发送snmptrap后，目的地址响应的Port Unreachable，说明snmptrapd没有开启UDP6的端口监听，需要在目的服务器上将snmptrapd开启IPv6监听，方法如下：
修改/etc/snmp/snmptrapd.conf，加入一行：snmpTrapdAddr    udp:162,udp6:162，保存退出并重启snmptrapd服务：
![snmp trap dns](images/snmp_cfg_add_ipv6.jpg)
进一步确认snmptrapd正常监听IPv6的协议端口162，如下图示：
![snmp trap dns](images/snmp_trap6_port_listen_ok.jpg)

重新测试可以看到，在snmptrapd这边有正常的UDP6消息输出：
![snmp trap dns](images/snmp_trap6_pkt_ok.jpg)


