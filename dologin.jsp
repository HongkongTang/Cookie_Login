<%@ page language="java" import="java.util.*,java.net.*" contentType="text/html; charset=utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'dologin.jsp' starting page</title>
    
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
    <h1>登陆成功</h1>
    <hr>
    <br>
    <br>
    <br>
    <%
    	request.setCharacterEncoding("utf-8");
    	response.setCharacterEncoding("utf-8");
    	//首先判断用户是否选择了记住登陆状态
    	String[] isUseCookies = request.getParameterValues("isUseCookie");
    	if(isUseCookies!=null&&isUseCookies.length>0){
    		//把用户名保存到cookie对象中
    		//使用URLEncoder.encode(s, "utf-8")解决无法在cookie当中把偶你中文字符串问题
    		String username = URLEncoder.encode(request.getParameter("username"),"utf-8");
    		String password = URLEncoder.encode(request.getParameter("password"),"utf-8");
    		
    		Cookie usernameCookie = new Cookie("username",username);
    		Cookie passwordCookie = new Cookie("password",password);
    		usernameCookie.setMaxAge(864000);
    		passwordCookie.setMaxAge(864000);//设置最大生存对象为10天
    		response.addCookie(usernameCookie);
    		response.addCookie(passwordCookie);
    	}
    	else{
    	
    		Cookie[] cookies = request.getCookies();
    		if(cookies!=null&&cookies.length>0){
    		
    			for(Cookie c:cookies){
    				if(c.getName().equals("username")||c.getName().equals("password")){
    					c.setMaxAge(0);
    					response.addCookie(c);
    				}
    			}
    		}
    	}
     %>
    <a href = "users.jsp" target="_black">查看用户信息</a>
  </body>
</html>
