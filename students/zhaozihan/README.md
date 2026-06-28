# 赵梓涵 - 企业CI/CD与Web集群项目

本目录是《企业项目案例分析综合设计》课程设计的 JSP Web 项目源码。

## 节点规划

| 节点 | IP | 作用 |
| --- | --- | --- |
| zhaozihan-jenkins | Jenkins容器 | 从 GitHub 拉取源码并发布 |
| zhaozihan-nginx | 172.31.5.10 | 反向代理、负载均衡、动静分离 |
| zhaozihan-tomcat1 | 172.31.5.11 | JSP动态节点1 |
| zhaozihan-tomcat2 | 172.31.5.12 | JSP动态节点2 |
| zhaozihan-redis | 172.31.5.13 | Session共享缓存 |

## 访问地址

- Nginx入口: http://154.64.231.137:18580/session.jsp
- Tomcat1直连: http://154.64.231.137:18591/session.jsp
- Tomcat2直连: http://154.64.231.137:18592/session.jsp

页面中写入学生信息：网络一班:赵梓涵。
