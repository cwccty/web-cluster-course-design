# 张慧莹 - 企业CI/CD与Web集群项目

本目录是《企业项目案例分析综合设计》课程设计的 JSP Web 项目源码。

## 节点规划

| 节点 | IP | 作用 |
| --- | --- | --- |
| zhanghuiying-jenkins | Jenkins容器 | 从 GitHub 拉取源码并发布 |
| zhanghuiying-nginx | 172.31.4.10 | 反向代理、负载均衡、动静分离 |
| zhanghuiying-tomcat1 | 172.31.4.11 | JSP动态节点1 |
| zhanghuiying-tomcat2 | 172.31.4.12 | JSP动态节点2 |
| zhanghuiying-redis | 172.31.4.13 | Session共享缓存 |

## 访问地址

- Nginx入口: http://154.64.231.137:18480/session.jsp
- Tomcat1直连: http://154.64.231.137:18491/session.jsp
- Tomcat2直连: http://154.64.231.137:18492/session.jsp

页面中写入学生信息：网络一班:张慧莹。
