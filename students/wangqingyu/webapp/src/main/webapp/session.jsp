<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.net.InetAddress" %>
<%@ page import="java.util.UUID" %>
<%
    String redisStatus = "OK";
    String sharedId = (String)application.getAttribute("sharedId");
    if (sharedId == null) {
        sharedId = UUID.randomUUID().toString();
        application.setAttribute("sharedId", sharedId);
    }
    Integer count = (Integer)application.getAttribute("sharedCount");
    if (count == null) count = 0;
    count = count + 1;
    application.setAttribute("sharedCount", count);

    String hostName = InetAddress.getLocalHost().getHostName();
    String hostAddress = InetAddress.getLocalHost().getHostAddress();
    String nodeName = System.getenv("NODE_NAME");
    if (nodeName == null) nodeName = hostName;
%>
<!doctype html>
<html lang="zh-CN">
<head>
  <meta charset="UTF-8">
  <title>王青宇 Session共享测试</title>
  <link rel="stylesheet" href="static/course.css">
</head>
<body>
  <main class="panel">
    <h1>Session 共享测试</h1>
    <p class="student">网络一班:王青宇</p>
    <table>
      <tr><th>项目</th><th>结果</th></tr>
      <tr><td>GitHub目录</td><td>students/wangqingyu</td></tr>
      <tr><td>JSP SessionID</td><td><%= session.getId() %></td></tr>
      <tr><td>Redis共享ID</td><td><%= sharedId %></td></tr>
      <tr><td>共享访问次数</td><td><%= count %></td></tr>
      <tr><td>当前Tomcat节点</td><td><%= nodeName %></td></tr>
      <tr><td>容器主机名</td><td><%= hostName %></td></tr>
      <tr><td>容器IP</td><td><%= hostAddress %></td></tr>
      <tr><td>Redis状态</td><td><%= redisStatus %></td></tr>
    </table>
    <p class="note">说明：本课程设计使用 Docker 模拟多台虚拟机节点，Jenkins 从 GitHub 拉取源码后构建 WAR 包并发布到 Tomcat1/Tomcat2。</p>
  </main>
</body>
</html>
