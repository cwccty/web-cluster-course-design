# 企业CI/CD与Web集群课程设计

本仓库用于《企业项目案例分析综合设计》课程设计，主题为“设计企业CI/CD与Web集群项目”。

Jenkins 从本 GitHub 仓库拉取 JSP/Maven 项目源码，执行构建后将 `ROOT.war` 发布到 Tomcat1 和 Tomcat2，
再通过 Nginx 统一入口访问 `session.jsp`，用于验证负载均衡、动静分离和集群访问结果。
