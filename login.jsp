<%@ page language="java" import="java.util.* , java.net.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'login.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

  </head>
  
  <body>
    <h1>用户登陆</h1>
    <hr>
    <%
    	String username = "";
		String password = "";
    	Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {

			//使用URLDecoder.decode()对编码过的cookie进行解码输出/赋值
			for (Cookie c : cookies) {
				if (c.getName().equals("username")) {
					username = URLDecoder.decode(c.getValue(),"utf-8");
				}
				if(c.getName().equals("password")){
					password = URLDecoder.decode(c.getValue(),"utf-8");
				}
			}
		}
     %>
    <form action="dologin.jsp" name="loginForm" method="post">
    	<table>
    		<tr>
    			<td>用户名：</td>
    			<td><input type="text" name="username" value="<%=username %>" /></td>
    		</tr>
    		<tr>
    			<td>密码：</td>
    			<td><input type="password" name="password" value="<%=password %>" /></td>
    		</tr>
    		<tr>
    			<td colspan="2"><input type = "checkbox" name = "isUseCookie" checked="checked" value=""/>十天内记住我的登陆状态</td>
    		</tr>
    		<tr>
    			<td colspan="2"><input type="submit" value="登陆" /></td>
    		</tr>
    	</table>
    </form>
  </body>
</html>
